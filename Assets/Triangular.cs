using UnityEngine;
using System.Collections.Generic;

// ... existing code ... 

void Start()
{
    for (int i = 0; i < sampleCount; i++)
    {
        float r = Random.value;
        float x = TriangularDistribution(a, b, c, r);
        samples.Add(x);
    }

    // ... existing code ...
} 