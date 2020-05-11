{
    name = "03 - Algorithmic drawing - Linear",

    options =
    {
        USE_COLOR = { true },
        SELECTION_MODE = { true },
    },

    properties =
    {
    },

    pass =
    {
        base = "Surface",

        blendMode = "disabled",
        depthWrite = true,
        depthFunc = "lessEqual",
        renderQueue = "solid",
        colorMask = {"rgba"},
        cullFace = "back",

        vertex =
        [[
            void vertex(inout Vertex v, out Input o)
            {
                    v.position += vec3(0.0, 0.0, 0.0);
            }
        ]],

        surface =
        [[
            uniform vec4 screenParams;
            
            void surface(in Input IN, inout SurfaceOutput o)
            {
                o.emissive = 1.0;
                vec4 add_20 = ((vec4((gl_FragCoord.xy * screenParams.zw).r, (gl_FragCoord.xy * screenParams.zw).r, (gl_FragCoord.xy * screenParams.zw).r, (gl_FragCoord.xy * screenParams.zw).r) * (1.0 - (smoothstep(((gl_FragCoord.xy * screenParams.zw).r - 0.02), (gl_FragCoord.xy * screenParams.zw).r, (gl_FragCoord.xy * screenParams.zw).g) - smoothstep((gl_FragCoord.xy * screenParams.zw).r, ((gl_FragCoord.xy * screenParams.zw).r + 0.02), (gl_FragCoord.xy * screenParams.zw).g)))) + (vec4(0.0, 1.0, 5.9605e-08, 1.0) * (smoothstep(((gl_FragCoord.xy * screenParams.zw).r - 0.02), (gl_FragCoord.xy * screenParams.zw).r, (gl_FragCoord.xy * screenParams.zw).g) - smoothstep((gl_FragCoord.xy * screenParams.zw).r, ((gl_FragCoord.xy * screenParams.zw).r + 0.02), (gl_FragCoord.xy * screenParams.zw).g))));
                o.diffuse = add_20.rgb;
                o.emission = vec3(0.0, 0.0, 0.0);
                o.opacity = 1.0;
                if (o.opacity < 0.0) discard;
            }
        ]]
    }
}
