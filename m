Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC34CED275
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUIYsZf4kHTG+PSTHvT9CM4gtjILyAkDqHRFOipFbns=; b=MrAepcHW2CfX95
	lnXtzTwqbdr7yWgGLe9XQzaLpmE9d89VNcXweZjbjFBTGC4y/csqBWAmE/JDGVoDlSWljipLcfyaM
	4tv2LIKHOx17K2SrLWUXuvU9NV7j+1IrlpNW+5XtduvjXl69rk2pmwQsOemsQw2BZU4U0gk4ir0Tx
	GbvtMpCUnxSpB7j1whCctn5j+Hsj7v8mxTEu2j4KD+tD43JXErw+VQEczBcPKE8krh8TZO94dShXz
	fyiaOE11O+G+s9oMmymTuxXv+VuyHAE/BUDwfif1ixIK0n1hPdq4gOKpieiiw/nv025bQTN6aDSrT
	y+glZAs2njUJaZaz3skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4lO-00000004oi6-2RkK;
	Tue, 08 Oct 2024 07:36:10 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4hn-00000004nlP-1xYm
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 07:32:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9FD424000A;
	Tue,  8 Oct 2024 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728372745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMV6An73zWGNbP4wMviaeQrPLseS4yc6JgZURDMbAiQ=;
	b=QPfiROUlRXLQ0DoPgqOBMumEFKVmVIlhxRDDfbLK26zZzdu4aSHOFNV++wjLibgU/sPn8H
	AmxrY66dJtCsBZfhv+3TK+tGE6Wozw2HIHldptQS07ZAvlwAAK3Gusu8WIJdxxQr5n6jt7
	1nvTNS+1QKeaObbjvJ45sELO1Ueb3wDRTRLBWbBjAv7Nu+SiphBZRyPwKjL4q62o0rkchz
	ja7xYzIMcFvQj9p8SORwyCatyDwdaS/XiUPOiLn304LVQrHmRnbn2Pb7R+PEd5qIQW7dvc
	v3DcMfbWL4xX3llvEtqCMKV7w0p1q4auxC1DB2mHzP3W/xBHuR+a+rKMYRXicQ==
Date: Tue, 8 Oct 2024 09:32:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Switch back to struct platform_driver::remove()
Message-ID: <20241008093223.52ed3f79@xps-13>
In-Reply-To: <20241007205803.444994-10-u.kleine-koenig@baylibre.com>
References: <20241007205803.444994-10-u.kleine-koenig@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003227_678961_EDDDEAD4 
X-CRM114-Status: GOOD (  14.97  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbSB3cm90ZSBvbiBNb24sICA3IE9j
dCAyMDI0IDIyOjU4OjA3ICswMjAwOgoKPiBBZnRlciBjb21taXQgMGVkYjU1NWE2NWQxICgicGxh
dGZvcm06IE1ha2UgcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmUoKQo+IHJldHVybiB2b2lkIikgLnJl
bW92ZSgpIGlzIChhZ2FpbikgdGhlIHJpZ2h0IGNhbGxiYWNrIHRvIGltcGxlbWVudCBmb3IKPiBw
bGF0Zm9ybSBkcml2ZXJzLgo+IAo+IENvbnZlcnQgYWxsIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cg
ZHJpdmVycy9tdGQgdG8gdXNlIC5yZW1vdmUoKSwgd2l0aAo+IHRoZSBldmVudHVhbCBnb2FsIHRv
IGRyb3Agc3RydWN0IHBsYXRmb3JtX2RyaXZlcjo6cmVtb3ZlX25ldygpLiBBcwo+IC5yZW1vdmUo
KSBhbmQgLnJlbW92ZV9uZXcoKSBoYXZlIHRoZSBzYW1lIHByb3RvdHlwZXMsIGNvbnZlcnNpb24g
aXMgZG9uZQo+IGJ5IGp1c3QgY2hhbmdpbmcgdGhlIHN0cnVjdHVyZSBtZW1iZXIgbmFtZSBpbiB0
aGUgZHJpdmVyIGluaXRpYWxpemVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+IC0tLQo+IEhlbGxvLAo+IAo+IGdp
dmVuIHRoZSBzaW1wbGljaXR5IG9mIHRoZSBpbmRpdmlkdWFsIGNoYW5nZXMgSSBkbyB0aGlzIGFs
bCBpbiBhIHNpbmdsZQo+IHBhdGNoLiBJIHlvdSBkb24ndCBhZ3JlZSwgcGxlYXNlIHRlbGwgYW5k
IEkgd2lsbCBoYXBwaWx5IHNwbGl0IGl0Lgo+IAo+IEl0J3MgYmFzZWQgb24gRnJpZGF5J3MgbmV4
dCwgZmVlbCBmcmVlIHRvIGRyb3AgY2hhbmdlcyB0aGF0IHJlc3VsdCBpbiBhCj4gY29uZmxpY3Qg
d2hlbiB5b3UgY29tZSBhcm91bmQgdG8gYXBwbHkgdGhpcy4gSSdsbCBjYXJlIGZvciB0aGUgZmFs
bG91dAo+IGF0IGEgbGF0ZXIgdGltZSB0aGVuLiAoSGF2aW5nIHNhaWQgdGhhdCwgaWYgeW91IHVz
ZSBiNCBhbSAtMyBhbmQgZ2l0IGFtCj4gLTMsIHRoZXJlIHNob3VsZCBiZSBoYXJkbHkgYW55IGNv
bmZsaWN0LikKPiAKPiBOb3RlIEkgZGlkbid0IENjOiBhbGwgdGhlIGluZGl2aWR1YWwgZHJpdmVy
IG1haW50YWluZXJzIHRvIG5vdCB0cmlnZ2VyCj4gc2VuZGluZyBsaW1pdHMgYW5kIHNwYW0gZmls
dGVycy4KCkZpbmUgYnkgbWUsIEknbGwgdGFrZSBpdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
