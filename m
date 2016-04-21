Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atFge-00058q-L9
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 14:34:33 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-02.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1atFgI-00019s-Ou from Marian_Rotariu@mentor.com
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 07:34:10 -0700
From: "Rotariu, Marian" <Marian_Rotariu@mentor.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC] mtd-utils: add support for erase regions
Date: Thu, 21 Apr 2016 14:34:09 +0000
Message-ID: <B0B1E520541A1D4A94F18E49CE1ED63F084CA2DD@EU-MBX-01.mgc.mentorg.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGVsbG8gYWxsLAoKRm9yIHRoZSBtb21lbnQsIG10ZC11dGlscyBkb2VzIG5vdCB0YWtlIGludG8g
Y29uc2lkZXJhdGlvbiBlcmFzZQpyZWdpb25zLCBhbHJlYWR5IHVzZWQgaW4gc29tZSBtdGQga2Vy
bmVsIGRyaXZlcnMuIFRoZSBvbmx5IHB1cnBvc2UgZm9yCnRoZSBpb2N0bChNRU1HRVRSRUdJT05J
TkZPKSBpcyBmb3IgZGVidWdnaW5nIG9yIGZvciBkdW1waW5nIG10ZCBpbmZvLgoKSW4gb25lIG9m
IHRoZSBTb0MgdGhhdCBJIHVzZSwgdGhlcmUgaXMgYSBmbGFzaCB3aXRoIG11bHRpcGxlIHNlY3Rv
cgpzaXplcyAoNEtCLzY0S0IpIGFuZCBJIG1hcHBlZCBtdWx0aXBsZSBjb25maWcgZGF0YSBpbiB0
aGUgYXJlYSB3aXRoIDRLQgpzaXplcyBmb3IgZmluZXIgZ3JhbnVsYXJpdHkuIFVuZm9ydHVuYXRl
bHksIEkgY2Fubm90IHVzZSBmbGFzaF9lcmFzZSBvcgphbnkgb3RoZXIgbXRkLXV0aWxzIHRvb2wg
dG8gZXJhc2UgNEstc2VjdG9ycyB3aGVyZSB0aGUgZGF0YSByZXNpZGVzCmJlY2F1c2UgdGhlIG10
ZCBlcmFzZXNpemUgaXMgNjRLQiAodGhlICJtYWpvciIvZGVmYXVsdCBlcmFzZSBzaXplIGZvcgp0
aGUgZGV2aWNlKS4gVGhlcmVmb3JlLCBldmVyeSB0aW1lIEkgd2FudCB0byBjaGFuZ2Ugc29tZXRo
aW5nIHNtYWxsIEkKaGF2ZSB0byBkZWxldGUgYW4gZW50aXJlIDY0S0Igc3BhY2UgYW5kIHJld3Jp
dGUgdGhlIG5lY2Vzc2FyeSBzZWN0b3JzLiAKCkkgY3JlYXRlZCBzb21lIHBhdGNoZXMgdGhhdCBh
ZGQgc3VwcG9ydCBmb3IgZXJhc2UgcmVnaW9ucyBpbiBtdGQtdXRpbHMKYW5kIEkgdGhvdWdodCBv
ZiBzaGFyaW5nIHRoZW0gaGVyZS4gQXJlIHRoZXNlIG1vZGlmaWNhdGlvbnMgb2YgaW50ZXJlc3QK
Zm9yIHRoZSB1cHN0cmVhbSBtdGQtdXRpbHM/CgpCZXN0IFJlZ2FyZHMsCk1hcmlhbiBSb3Rhcml1
Cg==
