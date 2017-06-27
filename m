Received: from mx.eurodcs.com ([89.110.144.168])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPoDf-0002YY-W3
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 10:59:46 +0000
Received: from SecMailGW01.goerlitz.int (unknown [80.150.72.244])
 by mx.eurodcs.com (Postfix) with ESMTPS id 62C9080354
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 12:59:20 +0200 (CEST)
Received: from SecMailGW01.goerlitz.int (localhost [127.0.0.1])
 by SecMailGW01.goerlitz.int (Postfix) with ESMTP id 6102D1157B9
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 13:05:09 +0200 (CEST)
Received: from GOEMAIL-Server2.goerlitz.int (goemail-server2.goerlitz.int
 [172.16.0.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by SecMailGW01.goerlitz.int (Postfix) with ESMTPS id 5C7B81157B6
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 13:05:09 +0200 (CEST)
From: Stelling Carsten <Carsten.Stelling@goerlitz.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBI bitrot checking and scrubbing
Date: Tue, 27 Jun 2017 10:59:19 +0000
Message-ID: <AE0F02A50174E945B94BE6AC0B7199D81A593D0E@GOEMAIL-Server2.goerlitz.int>
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

SGksDQoNCkkgZm91bmQgUmljaGFyZOKAmXMgcGF0Y2hlcyBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMTUtQXByaWwvMDU4Njc3Lmh0bWwgb3INCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxNS1Ob3ZlbWJlci8w
NjMxMjIuaHRtbCwgYnV0IGNhbid0IGlkZW50aWZ5IGFueQ0Kb2YgdGhlIGNvZGUgaW4gbmV3ZXIg
a2VybmVsIHZlcnNpb25zIChlLmcuIDQuOSBvciA0LjExKS4NCkkgd29uZGVyLCBpZiB1YmloZWFs
dGhkIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxNS1O
b3ZlbWJlci8wNjMxMjguaHRtbA0Kd2FzIG5ldmVyIHJlbGVhc2VkIHdpdGggbXRkLXV0aWxzIChh
Y3R1YWxseSAxLjUuMikuIFBvc3NpYmx5LCBJIGhhdmUgbWlzc2VkIHNvbWUgaW5mb3JtYXRpb24g
b24NCnRoaXMgdG9waWMuDQpJcyB0aGVyZSBhY3R1YWxseSBhIGNvbXBhcmFibGUgbWVjaGFuaXNt
IGluIFVCSSwgSSBoYXZlbuKAmXQgZm91bmQgeWV0Pw0KTGlrZSB3ZWFyIGxldmVsbGluZywgcmVh
ZGluZyBhbmQgc2NydWJiaW5nIChpZiBuZWNlc3NhcnkpICphbGwqIFBFQuKAmXMgZnJvbSB0aW1l
IHRvIHRpbWUgaXMgYW4NCmVzc2VudGlhbCB0YXNrIHRvIGVuc3VyZSBkdXJhYmlsaXR5IG9mIGlu
Zm9ybWF0aW9uLiBFc3BlY2lhbGx5LCBmb3IgUEVC4oCZcyB3aGljaCBhcmUgbm90IGFjY2Vzc2Vk
DQpmcmVxdWVudGx5LiBXaXRoIEZhc3RtYXAgZW5hYmxlZCwgb25lIGNhbid0IHJlbHkgb24gY3lj
bGljIHJlYm9vdHMsIGJlY2F1c2Ugbm90IGFsbCBVQkkNClZJRC9FQyBoZWFkZXJzIGFyZSByZWFk
IGF0IGJvb3QgdGltZS4NClJlZ2FyZGluZyBiaXRyb3QgY2hlY2tpbmcsIGEgbG90IG9mIGVmZm9y
dCB3YXMgbWFkZSBieSBzZXZlcmFsIGNvbnRyaWJ1dG9ycywgYnV0IEkgY2FuJ3QgZmluZA0KdGhl
aXIgd29yayBpbiBtYWlubGluZSBrZXJuZWwgZHJpdmVyIGNvZGUuIEhhdmUgSSBvdmVybG9va2Vk
IHNvbWV0aGluZz8NCkFueSBoaW50cyBvciBzdWdnZXN0aW9ucyBhcmUgZ3JlYXRseSBhcHByZWNp
YXRlZC4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KUmVnYXJkcywNCkNhcnN0ZW4NCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiBDYXJzdGVuIFN0ZWxsaW5nDQpG
JkUgSGFyZHdhcmUgLyBSJkQgSGFyZHdhcmUNCg0KR8OWUkxJVFogQWt0aWVuZ2VzZWxsc2NoYWZ0
IHwgQXVndXN0LVRoeXNzZW4tU3RyYcOfZSAzMiB8IEQtNTYwNzAgS29ibGVueg0KVDogKzQ5LTI2
MS05Mjg1LTMzNiB8IE06ICB8IEY6ICs0OS0yNjEtOTI4NS0xOTANCk1haWwgdG86IENhcnN0ZW4u
U3RlbGxpbmdAZ29lcmxpdHouY29tIHwgd3d3LmdvZXJsaXR6LmNvbQ0KDQpWb3JzdGFuZCB8IEV4
ZWN1dGl2ZSBCb2FyZDogSsO2cmcgRmlnZ2UNClZvcnNpdHplbmRlciBkZXMgQXVmc2ljaHRzcmF0
ZXMgfCBDaGFpcm1hbiBvZiB0aGUgc3VwZXJ2aXNvcnkgYm9hcmQ6IE5vcmJlcnQgV2FnbmVyDQpS
ZWdpc3RlcmdlcmljaHQgfCBDb3VydCBvZiByZWdpc3RyYXRpb246IEFtdHNnZXJpY2h0IEtvYmxl
bnogSFJCIDUzNDYNClNpdHogZGVyIEdlc2VsbHNjaGFmdCB8IFJlZ2lzdGVyZWQgb2ZmaWNlOiBL
b2JsZW56DQpNZW1iZXIgb2YgdGhlIElEUy1Hcm91cA0KDQpJbW1lciB1cC10by1kYXRlIG1pdCB1
bnNlcmVtIE5ld3NsZXR0ZXIhIEhpZXIgZ2VodCdzIHp1ciBBbm1lbGR1bmc6IHd3dy5nb2VybGl0
ei5jb20vbmV3c2xldHRlcg0KDQo=
