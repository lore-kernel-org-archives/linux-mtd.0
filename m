Return-Path: <SRS0=teGx=DS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CA5C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 20:43:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1716F20578
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 20:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2+HS79j8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1716F20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/46+V4tCBRunZG7VTdpQEmektO2fYNgKR7tn90Hwyw4=; b=2+HS79j83nUMzJTu22NsRhzED
	IqUxMFqR4E6e0VS9GBsjrd4ciM+gMVA9ue/RCRYNlEDnlSW3pGZewrcWZp0y+evs4gKeCVo1iltYJ
	GD3gnv5hrn1cGZGNi5CrcW8yU97Rrz2/QSXK0y1CneTnCEG5fLN0pzhSqdvmBSa1DWmGkzZykzdGl
	X6CA4FygqqJ6edh6SXuzWsMLL7g58r+HPuMg3+wA7f87EHNcavncMyVTQaT8BT8srytzdNaidicQY
	fmC3voxzXHP3usTKuNIVmrxxKTO5s8jUZmBBpuu3fTHIDuzlYy7RMlRihXsU0poTDF1CWQKeadfdt
	8OBpp2DNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRiAk-0007WG-0p; Sun, 11 Oct 2020 20:42:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRiAh-0007VD-Pm
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2020 20:42:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DEC3E608311C;
 Sun, 11 Oct 2020 22:42:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id l-qZw7CJwsIk; Sun, 11 Oct 2020 22:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 611176125F28;
 Sun, 11 Oct 2020 22:42:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fB8BDwdG-NZ9; Sun, 11 Oct 2020 22:42:21 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 43538608311C;
 Sun, 11 Oct 2020 22:42:21 +0200 (CEST)
Date: Sun, 11 Oct 2020 22:42:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <2085985092.185629.1602448941236.JavaMail.zimbra@nod.at>
In-Reply-To: <6755a43e-1fec-4a5f-760d-44ac834787aa@ti.com>
References: <6755a43e-1fec-4a5f-760d-44ac834787aa@ti.com>
Subject: Re: [GIT PULL] CFI and HyperFlash changes for v5.10-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: CFI and HyperFlash changes for v5.10-rc1
Thread-Index: WAy/9aqKm8arMliutm9PqUcRPRxX1w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_164224_047674_C8A034D7 
X-CRM114-Status: GOOD (  12.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VmlnbmVzaCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJWaWduZXNo
IFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPgo+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+IEND
OiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiVHVkb3IgQW1i
YXJ1cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4KPiBHZXNlbmRldDogRnJlaXRhZywg
OS4gT2t0b2JlciAyMDIwIDEzOjQzOjM2Cj4gQmV0cmVmZjogW0dJVCBQVUxMXSBDRkkgYW5kIEh5
cGVyRmxhc2ggY2hhbmdlcyBmb3IgdjUuMTAtcmMxCgo+IEhpICBNaXF1ZWwsIFJpY2hhcmQsCj4g
Cj4gSGVyZSBpcyB0aGUgQ0ZJIGFuZCBIeXBlckZsYXNoIHJlbGF0ZWQgUFIgZm9yIHY1LjEwLXJj
MS4gVGhhbmtzIQo+IAo+IFJlZ2FyZHMKPiBWaWduZXNoCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCBiYTRmMTg0ZTEyNmI3NTFkMWJmZmFkNTg5N2YyNjMxMDhiZWZjNzgw
Ogo+IAo+ICBMaW51eCA1LjktcmM2ICgyMDIwLTA5LTIwIDE2OjMzOjU1IC0wNzAwKQoKRGlkIHlv
dSBiYXNlIHlvdXIgcGF0Y2hlcyBvbiBwdXJwb3NlIG9uIC1yYzY/Cm10ZC9uZXh0IGlzIGJhc2Vk
IG9uIC1yYzIuCk5vdCBhIGJpZyBkZWFsLCBidXQgY2FuIGNhdXNlIGNvbmZ1c2lvbi4KCj4gYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gIGdpdEBnaXRvbGl0ZS5r
ZXJuZWwub3JnOnB1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvY2Zp
L2Zvci01LjEwCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDVkZTE1YjYxMGY3
ODVmMGUxODhmZWZiNzA3ZjBiMTlkZTE1Njk2OGE6Cj4gCj4gIG10ZDogaHlwZXJidXM6IGFkZCBS
ZW5lc2FzIFJQQy1JRiBkcml2ZXIgKDIwMjAtMTAtMDYgMTI6MzY6MjEgKzA1MzApCj4gCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+IEh5cGVyQnVzIGNoYW5nZXMKPiAKPiAqIERNQSBzdXBwb3J0IGZvciBUSSdzIEFNNjU0
IEh5cGVyQnVzIGNvbnRyb2xsZXIgZHJpdmVyLgo+ICogSHlwZXJCdXMgZnJvbnRlbmQgZHJpdmVy
IGZvciBSZW5lc2FzIFJQQy1JRiBkcml2ZXIuCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFNlcmdlaSBTaHR5bHlv
diAoMSk6Cj4gICAgICBtdGQ6IGh5cGVyYnVzOiBhZGQgUmVuZXNhcyBSUEMtSUYgZHJpdmVyCj4g
Cj4gVmlnbmVzaCBSYWdoYXZlbmRyYSAoNCk6Cj4gICAgICBtdGQ6IGh5cGVyYnVzOiBQcm92aWRl
IHBlciBkZXZpY2UgcHJpdmF0ZSBwb2ludGVyCj4gICAgICBtdGQ6IGh5cGVyYnVzOiBoYm1jLWFt
NjU0OiBGaXggZGlyZWN0IG1hcHBpbmcgc2V0dXAgZmxhc2ggYWNjZXNzCj4gICAgICBtdGQ6IGh5
cGVyYnVzOiBoYm1jLWFtNjU0OiBEcm9wIHBtX3J1bnRpbWUqIGNhbGxzIGZyb20gcHJvYmUKPiAg
ICAgIG10ZDogaHlwZXJidXM6IGhibWMtYW02NTQ6IEFkZCBETUEgc3VwcG9ydCBmb3IgcmVhZHMK
CjVkZTE1YjYxMGY3OCAoIm10ZDogaHlwZXJidXM6IGFkZCBSZW5lc2FzIFJQQy1JRiBkcml2ZXIi
KSBkb2VzIG5vdCBidWlsZCBoZXJlCndpdGggQ09ORklHX0NPTVBJTEVfVEVTVCBiZWNhdXNlIHRo
ZSBkcml2ZXIgbmVlZHMgZnVuY3Rpb25zIGZyb20gQ09ORklHX1JFTkVTQVNfUlBDSUYKd2hpY2gg
aXMgb25seSBidWlsZGFibGUgZm9yIENPTkZJR19BUkNIX1JFTkVTQVMuCgpycGMtaWYuYzooLnRl
eHQrMHgyMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJwY2lmX2Rpc2FibGVfcnBtJwpsZDog
ZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9oYl9wcmVw
YXJlX3JlYWQnOgpycGMtaWYuYzooLnRleHQrMHhkNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YHJwY2lmX3ByZXBhcmUnCmxkOiBkcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYubzogaW4gZnVu
Y3Rpb24gYHJwY2lmX2hiX3JlYWQxNic6CnJwYy1pZi5jOigudGV4dCsweDE3MCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYHJwY2lmX21hbnVhbF94ZmVyJwpsZDogZHJpdmVycy9tdGQvaHlwZXJi
dXMvcnBjLWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9oYl9wcm9iZSc6CnJwYy1pZi5jOigudGV4
dCsweDFkNSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJwY2lmX3N3X2luaXQnCmxkOiBycGMt
aWYuYzooLnRleHQrMHgxZTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9lbmFibGVf
cnBtJwpsZDogcnBjLWlmLmM6KC50ZXh0KzB4MWYxKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
cnBjaWZfaHdfaW5pdCcKbGQ6IHJwYy1pZi5jOigudGV4dCsweDIzZik6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYHJwY2lmX2Rpc2FibGVfcnBtJwpsZDogZHJpdmVycy9tdGQvaHlwZXJidXMvcnBj
LWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9oYl93cml0ZTE2JzoKcnBjLWlmLmM6KC50ZXh0KzB4
MmU1KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcnBjaWZfcHJlcGFyZScKbGQ6IHJwYy1pZi5j
OigudGV4dCsweDJlZCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJwY2lmX21hbnVhbF94ZmVy
JwpsZDogZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9o
Yl9jb3B5X2Zyb20nOgpycGMtaWYuYzooLnRleHQrMHgxMmUpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBycGNpZl9kaXJtYXBfcmVhZCcKClRoaXMgc2hvdWxkIGRvIHRoZSB0cmljaywgcGxlYXNl
IGRvdWJsZSBjaGVjazoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L0tjb25maWcgYi9kcml2
ZXJzL21lbW9yeS9LY29uZmlnCmluZGV4IDJjNzllOTVkZDQ4Ni4uNzk0NzQwNjM2YmM0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL21lbW9yeS9LY29uZmlnCisrKyBiL2RyaXZlcnMvbWVtb3J5L0tjb25m
aWcKQEAgLTE4MSw3ICsxODEsNyBAQCBjb25maWcgUEwzNTNfU01DCiAKIGNvbmZpZyBSRU5FU0FT
X1JQQ0lGCiAJdHJpc3RhdGUgIlJlbmVzYXMgUlBDLUlGIGRyaXZlciIKLQlkZXBlbmRzIG9uIEFS
Q0hfUkVORVNBUworCWRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVAogCXNl
bGVjdCBSRUdNQVBfTU1JTwogCWhlbHAKIAkgIFRoaXMgc3VwcG9ydHMgUmVuZXNhcyBSLUNhciBH
ZW4zIFJQQy1JRiB3aGljaCBwcm92aWRlcyBlaXRoZXIgU1BJCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9oeXBlcmJ1cy9LY29uZmlnIGIvZHJpdmVycy9tdGQvaHlwZXJidXMvS2NvbmZpZwppbmRl
eCAzNWIzYWI0YzhiOTQuLjQ2YzdlNDA3ZTM3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvaHlw
ZXJidXMvS2NvbmZpZworKysgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9LY29uZmlnCkBAIC0yNCw3
ICsyNCw3IEBAIGNvbmZpZyBIQk1DX0FNNjU0CiAKIGNvbmZpZyBSUENJRl9IWVBFUkJVUwogCXRy
aXN0YXRlICJSZW5lc2FzIFJQQy1JRiBIeXBlckJ1cyBkcml2ZXIiCi0JZGVwZW5kcyBvbiBSRU5F
U0FTX1JQQ0lGIHx8IENPTVBJTEVfVEVTVAorCWRlcGVuZHMgb24gUkVORVNBU19SUENJRgogCWRl
cGVuZHMgb24gTVREX0NGSV9CRV9CWVRFX1NXQVAKIAloZWxwCiAJICBUaGlzIG9wdGlvbiBpbmNs
dWRlcyBSZW5lc2FzIFJQQy1JRiBIeXBlckJ1cyBzdXBwb3J0LgoKQW55d2F5LCBwdWxsZWQuIDot
KQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
