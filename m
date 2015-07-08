Received: from mx.eurodcs.com ([89.110.144.168])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCu4u-0006rh-9Z
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 18:28:17 +0000
Received: from goemail-server.goerlitz.int (unknown [217.146.148.195])
 by mx.eurodcs.com (Postfix) with ESMTPSA id 6A2C181297
 for <linux-mtd@lists.infradead.org>; Wed,  8 Jul 2015 20:27:50 +0200 (CEST)
From: Stelling Carsten <Carsten.Stelling@goerlitz.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 8 Jul 2015 20:27:44 +0200
Subject: Reading from UBI volume character device did not work.
Message-ID: <02855DE82B1CA94A9115CCD637A13256CF6CC4EF02@goemail-server>
Content-Language: de-DE
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

SGVsbG8sDQoNCkknbSB0cnlpbmcgdG8gcmVhZCBmcm9tIGEgVUJJIHZvbHVtZSB1c2luZyB0aGUg
Y2hhcmFjdGVyIGRldmljZSAvZGV2L3ViaTIsDQpidXQgcmVhZCBhbHdheXMgcmV0dXJucyAwLiBN
eSBrZXJuZWwgdmVyc2lvbiBpcyAzLjE0LjMxIChubyB1YmlibG9jaykuDQoNCmZkID0gb3Blbigi
L2Rldi91YmkyIiwgT19SRE9OTFkpOw0KcmVhZChmZCwgYnVmZmVyLCBjb3VudCk7DQoNCkkgc2V0
IGNvdW50IHRvIGRpZmZlcmVudCB2YWx1ZXMsIGVzcGVjaWFsbHkgdG8gbWluX2lvX3NpemUgPSAy
MDQ4LCBidXQgd2l0aG91dCBzdWNjZXNzLg0KUmVhZGluZyBmcm9tIHRoZSB1bmRlcmx5aW5nIE1U
RCBkZXZpY2UgIi9kZXYvbXRkOCIgc3VjY2VlZHMuDQpXaGF0IGRpZCBJIG1pc3M/DQoNCk15IHRh
c2sgaXMsIGFzIHN1Z2dlc3RlZCBieSB0aGUgVUJJRlMgZG9jdW1lbnRhdGlvbiwgdG8gd3JpdGUg
YSB1c2Vyc3BhY2UgZGFlbW9uDQpvbiB0b3Agb2YgVUJJLCB0aGF0IHJlYWRzIGFsbCBMRUJzIGFu
ZCBhc3NvY2lhdGVkIFBFQnMgaW4gdGhlIGJhY2tncm91bmQsIHRvIGxldCBVQkkNCmhhbmRsZSBy
YXJlbHkgYWNjZXNzZWQgcGFnZXMgd2l0aCBhY2N1bXVsYXRlZCBiaXQtZmxpcHMuDQoNCllvdXIg
aGVscCBpcyB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZWQuDQoNClRoYW5rcywNCg0KQ2Fyc3Rlbg0KDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogQ2Fyc3RlbiBTdGVsbGlu
Zw0KRiZFIEhhcmR3YXJlIC8gUiZEIEhhcmR3YXJlDQoNCkfDllJMSVRaIEFrdGllbmdlc2VsbHNj
aGFmdCB8IEF1Z3VzdC1UaHlzc2VuLVN0cmHDn2UgMzIgfCBELTU2MDcwIEtvYmxlbnoNClQ6ICs0
OS0yNjEtOTI4NS0zMzYgfCBNOiAgfCBGOiArNDktMjYxLTkyODUtMTkwDQpNYWlsIHRvOiBDYXJz
dGVuLlN0ZWxsaW5nQGdvZXJsaXR6LmNvbSB8IHd3dy5nb2VybGl0ei5jb20NCg0KVm9yc3RhbmQg
fCBFeGVjdXRpdmUgQm9hcmQ6IERpcGwuLUluZy4gTm9yYmVydCBCYXJ0c2NoLCBKw7ZyZyBGaWdn
ZQ0KVm9yc2l0emVuZGVyIGRlcyBBdWZzaWNodHNyYXRlcyB8IENoYWlybWFuIG9mIHRoZSBzdXBl
cnZpc29yeSBib2FyZDogTm9yYmVydCBXYWduZXINClJlZ2lzdGVyZ2VyaWNodCB8IENvdXJ0IG9m
IHJlZ2lzdHJhdGlvbjogQW10c2dlcmljaHQgS29ibGVueiBIUkIgNTM0Ng0KU2l0eiBkZXIgR2Vz
ZWxsc2NoYWZ0IHwgUmVnaXN0ZXJlZCBvZmZpY2U6IEtvYmxlbnoNCkltbWVyIHVwLXRvLWRhdGUg
bWl0IHVuc2VyZW0gTmV3c2xldHRlciEgSGllciBnZWh0J3MgenVyIEFubWVsZHVuZzogd3d3Lmdv
ZXJsaXR6LmNvbS9uZXdzbGV0dGVyDQpNZW1iZXIgb2YgdGhlIElEUy1Hcm91cA0KDQo=
