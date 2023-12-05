Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F03C4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 12:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiDZLKWSGe3ohHZpsCVr4WthPMDd70dQC03rG/eZdLI=; b=SVaMJzfM0V1nGq
	FeB6PLelFayIVXQbNjpCAywoCgQYhftJRsyoV7g7kkJygLkFRbJCZG7rG/RKEKU8XdrgcnZKFo0ca
	LSQE1TjiC6x/iOVVwnQ+NtYILlz2BBc5h78Vdpb7SThShpMHKxNVi5EpP56wUQu1VWVSYHLb1pD2m
	3xVk4ONXhbdy6rE+hmJWqc7BnwZVONBwRzPYm2MUkFBPtjBVU93b3MHM3cU0a9Wu7tJ08+BkDVYrw
	eEYym2roR+nv9C8vvFx/QttKKbtTbpCaTUVz5S4g5ynPJY79N4jyXE4MQ4I6YNIY/OZtrNzRPmavP
	ztbwrmuwTAeSuAA6xD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUSr-007Mpy-08;
	Tue, 05 Dec 2023 12:23:49 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUSo-007MpQ-10
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 12:23:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rAUSa-0007bF-0j;
	Tue, 05 Dec 2023 12:23:33 +0000
Date: Tue, 5 Dec 2023 12:23:27 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Ryder W <rydercoding@hotmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] ubi: don't decrease ubi->ref_count on detach error
Message-ID: <ZW8WP3SB-EARFVW_@makrotopia.org>
References: <MEYP282MB31647F3434E6BD0178F32CDEBF85A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <f7e5075e-232c-7e37-348d-71300b10dac8@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7e5075e-232c-7e37-348d-71300b10dac8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_042346_344762_9715966C 
X-CRM114-Status: GOOD (  21.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgMDUsIDIwMjMgYXQgMDU6MDE6MzZQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDIzLzEyLzUgMTY6MTEsIFJ5ZGVyIFcg5YaZ6YGTOgo+ID4gPiA+IEZpeGVz
OiBjZGZhNzg4YWNkMTMgKCJVQkk6IHByZXBhcmUgYXR0YWNoIGFuZCBkZXRhY2ggZnVuY3Rpb25z
IikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbCBhdCBtYWtyb3Rv
cGlhLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwg
NiArKystLS0KPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9i
dWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiA+ID4gPiBpbmRleCA3ZDRmZjExOTNk
YjZmLi5mNDc5ODdlZTlhMzFiIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9i
dWlsZC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiA+ID4gPiBAQCAt
MTA5OSwxNiArMTA5OSwxNiBAQCBpbnQgdWJpX2RldGFjaF9tdGRfZGV2KGludCB1YmlfbnVtLCBp
bnQgYW55d2F5KQo+ID4gPiA+ICAgCXNwaW5fbG9jaygmdWJpX2RldmljZXNfbG9jayk7Cj4gPiA+
ID4gICAJcHV0X2RldmljZSgmdWJpLT5kZXYpOwo+ID4gPiA+IC0JdWJpLT5yZWZfY291bnQgLT0g
MTsKPiA+ID4gPiAtCWlmICh1YmktPnJlZl9jb3VudCkgewo+ID4gPiA+ICsJaWYgKHViaS0+cmVm
X2NvdW50ID4gMSkgewo+ID4gPiA+ICAgCQlpZiAoIWFueXdheSkgewo+ID4gPiA+ICAgCQkJc3Bp
bl91bmxvY2soJnViaV9kZXZpY2VzX2xvY2spOwo+ID4gPiA+ICAgCQkJcmV0dXJuIC1FQlVTWTsK
PiA+ID4gPiAgIAkJfQo+ID4gPiA+ICAgCQkvKiBUaGlzIG1heSBvbmx5IGhhcHBlbiBpZiB0aGVy
ZSBpcyBhIGJ1ZyAqLwo+ID4gPiA+ICAgCQl1YmlfZXJyKHViaSwgIiVzIHJlZmVyZW5jZSBjb3Vu
dCAlZCwgZGVzdHJveSBhbnl3YXkiLAo+ID4gPiA+IC0JCQl1YmktPnViaV9uYW1lLCB1YmktPnJl
Zl9jb3VudCk7Cj4gPiA+ID4gKwkJCXViaS0+dWJpX25hbWUsIHViaS0+cmVmX2NvdW50IC0gMSk7
Cj4gPiA+ID4gICAJfQo+ID4gPiA+ICsJdWJpLT5yZWZfY291bnQgLT0gMTsKPiA+ID4gPiAgIAl1
YmlfZGV2aWNlc1t1YmlfbnVtXSA9IE5VTEw7Cj4gPiA+ID4gICAJc3Bpbl91bmxvY2soJnViaV9k
ZXZpY2VzX2xvY2spOwo+ID4gCj4gPiBJbiB0aGUgbGFzdCBjb2RlIG9mIHViaV9kZXRhY2hfbXRk
X2RldiwgdGhlIGxpbmUgInViaS0+cmVmX2NvdW50IC09IDEiIGFmdGVyIHRoZSBsaW5lICJwdXRf
ZGV2aWNlKCZ1YmktPmRldikiIGlzIGp1c3QgdG8gZGVjcmVhc2UgdWJpLT5yZWZfY291bnQsIHdo
aWNoIGlzIGluY3JlYXNlZCBmcm9tIGNhbGxpbmcgcHV0X2RldmljZS4gSSBkb24ndCB1bmRlcnN0
YW5kIHdoeSBpdCBzaG91bGQgYmUgbW92ZWQgYWZ0ZXIgdGhlIHNhbml0eSBjaGVjayBvZiB1Ymkt
PnJlZl9jb3VudC4gSXQgbWF5IGludHJvZHVjZSBzb21lIG1vcmUgY3JpdGljYWwgYnVnLgo+ID4g
Cj4gPiAKPiAKPiBUaGFua3MgZm9yIHJlbWluZGluZywgeW91IGFyZSByaWdodC4gSSB0aGluayBJ
IG1pc3NlZCB0aGUgY29kZSBvZgo+ICd1YmktPnJlZl9jb3VudCcgaW5jcmVhc2luZyBpbiB1Ymlf
Z2V0X2RldmljZSwgc28gZGVjcmVhc2luZyB0aGUKPiAndWJpLT5yZWZfY291bnQnIHVuY29uZGl0
aW9uYWxseSBpcyByaWdodC4gSW4gbW9zdCBjYXNlcywgdGhlCj4gJ3ViaS0+cmVmX2NvdW50JyBp
cyB6ZXJvKHVubGVzcyB1YmlmcyBpcyBtb3VudGVkKS4KClNvcnJ5IGZvciB0aGUgbm9pc2UsIEkg
YWdyZWUsIHRoZSBjdXJyZW50IGNvZGUgaXMgY29ycmVjdCBhbmQgcmVmX2NvdW50CmluZGVlZCBu
ZWVkcyB0byBiZSBkZWNyZWFzZWQgdW5jb25kaXRpb25hbGx5IGFzIGl0IGhhcyBqdXN0IGJlZW4K
aW5jcmVhc2VkIGJ5IGNhbGxpbmcgdWJpX2dldF9kZXZpY2UoKSBpbiB0aGUgbGluZXMgYWJvdmUu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
