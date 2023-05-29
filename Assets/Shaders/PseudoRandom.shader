﻿Shader "Unlit/Zero2Shaders/PseudoRandom"
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            float random(float2 v)
            {
                return frac(sin(dot(v.yx, float2(12.9898, 85.847))) * 47475.73562);
            }

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                //use random as color
                return float4(random(i.uv * _Time), random(i.uv * _Time), random(i.uv * _Time), random(i.uv * _Time));
            }
            ENDCG
        }
    }
}
