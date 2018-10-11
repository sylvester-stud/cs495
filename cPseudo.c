int testb(int a, int b) {
	int eax = a;
	int edx = eax * -668203060;
	eax++;
	eax *= b;
	unsigned int ecxU = 1039577924 + eax;
	eax = b;
	eax *= ecxU;
	edx += eax;
	eax = a;
	edx *= eax;
	int ecx = b;
	eax = a;
	eax *= 2027837521;
	ecx -= eax;
	eax = a;
	unsigned int ebxU = eax + eax;
	eax = b;
	eax += ebxU;
	int ebx = eax;
	eax = b;
	eax += ebx;
	eax += 1357278678;
	eax *= ecx;
	if (edx > eax) {
		eax = a;
		edx = eax * 820626909;
		eax = a;
		eax += edx;
	} else {
		eax = a;
		eax = -eax;
		edx = eax;
		eax = a;
		edx -= eax;
		eax = edx;
		eax += 1374624060;
	}
	return eax;
}
