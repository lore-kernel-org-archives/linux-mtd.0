Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C4EC77B7A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0X5LD5jcc0+nw3g5JsrNsXT5IAc8MwGK4EyVW5vKE3w=; b=oLQ+aSxsXe+H1eK8Cq2/AKGUZ/
	wuCXCJClXiYQi2oIGSRg5uLMSEUXEqDrD+rU/WQXAaccJjpxKscyiOUE3h4n2Fp/Q/XAZFctKVoY3
	vxaPRNa+YxTLXLWNWJQTmz3MVUlfZo6KgnWsp1NvSh0d8Mc1mTS1jCg6N0MZZLIPDvmE0GnQQ8vCf
	NQxsZVXoeL1KuSdfgdJkmzURFafPVLczFjDQh66OwHSpL12MJaJ37KwpzGIJd2E/4Tn/cUGQlR4mI
	Hk5B8dImmW1zPY9P0mWrvsFGEtZBNe/iaTD1VCFDnh15oKVs/GxGwjLvjL1RzN/2DuaPw0j1EQ8Ku
	V5EDAXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poROP-00H0CT-1b;
	Mon, 17 Apr 2023 16:07:49 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poROK-00H0AD-2U
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 16:07:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F33EA64551BD;
	Mon, 17 Apr 2023 18:07:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id n1W0Qrtyq6yM; Mon, 17 Apr 2023 18:07:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 913E76431C58;
	Mon, 17 Apr 2023 18:07:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ln_Xl0bMsm8o; Mon, 17 Apr 2023 18:07:37 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3DEF464551BD;
	Mon, 17 Apr 2023 18:07:37 +0200 (CEST)
Date: Mon, 17 Apr 2023 18:07:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: George Kennedy <george.kennedy@oracle.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	eorge kennedy <eorge.kennedy@oracle.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	syzkaller <syzkaller@googlegroups.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	harshit m mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>
Message-ID: <1791587113.113210.1681747656999.JavaMail.zimbra@nod.at>
In-Reply-To: <20230417160102.lw6n7bdxwrlkluwj@pengutronix.de>
References: <ae901608-0580-010a-26e3-99d0b704b88b@oracle.com> <20230417160102.lw6n7bdxwrlkluwj@pengutronix.de>
Subject: Re: [Regression] Cannot overwrite VID header offset any more [Was:
 [PATCH] ubi: ensure that VID header offset + VID header size <= alloc,
 size]
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Cannot overwrite VID header offset any more [Was: [PATCH] ubi: ensure that VID header offset + VID header size <= alloc, size]
Thread-Index: QZS7NxF6po442+3+qhw1upzn2ik3iw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090745_136571_115F11FC 
X-CRM114-Status: GOOD (  12.50  )
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

VXdlLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlV3ZSBLbGVpbmUt
S8O2bmlnIiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IFRoaXMgcGF0Y2ggaXMg
aW4gbWFpbmxpbmUgYXMgMWI0MmIxYTM2ZmM5NDZmMGQ3MDg4NDI1YjkwZDQ5MWI0MjU3Y2EzZSwK
PiBhbmQgYmFja3BvcnRlZCB0byB2YXJpb3VzIHN0YWJsZSByZWxlYXNlcy4KPiAKPiBGb3IgbWUg
dGhpcyBicmVha3MKPiAKPgl1YmlhdHRhY2ggLW0gMCAtTyAyMDQ4Cj4gCj4gSSB0aGluayB0aGUg
Y2hlY2sKPiAKPgl1YmktPnZpZF9oZHJfb2Zmc2V0ICsgVUJJX1ZJRF9IRFJfU0laRSA+IHViaS0+
dmlkX2hkcl9hbHNpemUKPiAKPiBpcyB3cm9uZy4gV2l0aG91dCAtTyBwYXNzZWQgdG8gdWJpYXR0
YWNoIChhbmQgZHluYW1pYyBkZWJ1ZyBlbmFibGVkKSBJCj4gZ2V0Ogo+IAo+IFsgNTI5NC45MzY3
NjJdIFVCSSBEQkcgZ2VuIChwaWQgOTYxOSk6IHNpemVvZihzdHJ1Y3QgdWJpX2FpbmZfcGViKSA1
Ngo+IFsgNTI5NC45MzY3NjldIFVCSSBEQkcgZ2VuIChwaWQgOTYxOSk6IHNpemVvZihzdHJ1Y3Qg
dWJpX3dsX2VudHJ5KSAzMgo+IFsgNTI5NC45MzY3NzRdIFVCSSBEQkcgZ2VuIChwaWQgOTYxOSk6
IG1pbl9pb19zaXplICAgICAgMjA0OAo+IFsgNTI5NC45MzY3NzldIFVCSSBEQkcgZ2VuIChwaWQg
OTYxOSk6IG1heF93cml0ZV9zaXplICAgMjA0OAo+IFsgNTI5NC45MzY3ODNdIFVCSSBEQkcgZ2Vu
IChwaWQgOTYxOSk6IGhkcnNfbWluX2lvX3NpemUgNTEyCj4gWyA1Mjk0LjkzNjc4N10gVUJJIERC
RyBnZW4gKHBpZCA5NjE5KTogZWNfaGRyX2Fsc2l6ZSAgICA1MTIKPiBbIDUyOTQuOTM2NzkxXSBV
QkkgREJHIGdlbiAocGlkIDk2MTkpOiB2aWRfaGRyX2Fsc2l6ZSAgIDUxMgo+IFsgNTI5NC45MzY3
OTZdIFVCSSBEQkcgZ2VuIChwaWQgOTYxOSk6IHZpZF9oZHJfb2Zmc2V0ICAgNTEyCj4gWyA1Mjk0
LjkzNjgwMF0gVUJJIERCRyBnZW4gKHBpZCA5NjE5KTogdmlkX2hkcl9hbG9mZnNldCA1MTIKPiBb
IDUyOTQuOTM2ODA0XSBVQkkgREJHIGdlbiAocGlkIDk2MTkpOiB2aWRfaGRyX3NoaWZ0ICAgIDAK
PiBbIDUyOTQuOTM2ODA4XSBVQkkgREJHIGdlbiAocGlkIDk2MTkpOiBsZWJfc3RhcnQgICAgICAg
IDIwNDgKPiBbIDUyOTQuOTM2ODEyXSBVQkkgREJHIGdlbiAocGlkIDk2MTkpOiBtYXhfZXJyb25l
b3VzICAgIDQwOQo+IAo+IFNvIHRoZSBjaGVjayB3b3VsZCBvbmx5IHBhc3MgZm9yIHZpZF9oZHJf
b2Zmc2V0IDw9IDUxMiAtCj4gVUJJX1ZJRF9IRFJfU0laRTsgbm90ZSB0aGF0IGV2ZW4gc3BlY2lm
eWluZyB0aGUgZGVmYXVsdCB2YWx1ZSA1MTIgKGkuZS4KPiAKPgl1YmlhdHRhY2ggLW0gMCAtTyA1
MTIKPiAKPiApIGZhaWxzIHRoZSBjaGVjay4KPiAKPiBBIGxlc3Mgc3Ryb25nIGNoZWNrIHdvdWxk
IGJlOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMv
bXRkL3ViaS9idWlsZC5jCj4gaW5kZXggMDkwNGViNDBjOTVmLi42OWMyOGE4NjI0MzAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiArKysgYi9kcml2ZXJzL210ZC91Ymkv
YnVpbGQuYwo+IEBAIC02NjYsOCArNjY2LDggQEAgc3RhdGljIGludCBpb19pbml0KHN0cnVjdCB1
YmlfZGV2aWNlICp1YmksIGludAo+IG1heF9iZWJfcGVyMTAyNCkKPiAJdWJpLT5lY19oZHJfYWxz
aXplID0gQUxJR04oVUJJX0VDX0hEUl9TSVpFLCB1YmktPmhkcnNfbWluX2lvX3NpemUpOwo+IAl1
YmktPnZpZF9oZHJfYWxzaXplID0gQUxJR04oVUJJX1ZJRF9IRFJfU0laRSwgdWJpLT5oZHJzX21p
bl9pb19zaXplKTsKPiAKPiAtCWlmICh1YmktPnZpZF9oZHJfb2Zmc2V0ICYmICgodWJpLT52aWRf
aGRyX29mZnNldCArIFVCSV9WSURfSERSX1NJWkUpID4KPiAtCSAgICB1YmktPnZpZF9oZHJfYWxz
aXplKSkgewo+ICsJaWYgKHViaS0+dmlkX2hkcl9vZmZzZXQgJiYKPiArCSAgICB1YmktPnZpZF9o
ZHJfb2Zmc2V0ICsgVUJJX1ZJRF9IRFJfU0laRSA+IHViaS0+cGViX3NpemUpIHsKPiAJCXViaV9l
cnIodWJpLCAiVklEIGhlYWRlciBvZmZzZXQgJWQgdG9vIGxhcmdlLiIsIHViaS0+dmlkX2hkcl9v
ZmZzZXQpOwo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4gCX0KPiAKPiBCdXQgSSdtIHVuc3VyZSBpZiB0
aGlzIHdvdWxkIGJlIHRvbyBsYXg/IQoKQXMgd3JpdHRlbiBvbiBJUkMsIDFlMDIwZTFiOTZhZiAo
InViaTogRml4IGZhaWx1cmUgYXR0YWNoaW5nIHdoZW4gdmlkX2hkciBvZmZzZXQgZXF1YWxzIHRv
IChzdWIpcGFnZSBzaXplIikgaXMgc3VwcG9zZWQgdG8gZml4IHRoYXQKYW5kIG9uIGl0J3Mgd2F5
IGludG8gc3RhYmxlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
