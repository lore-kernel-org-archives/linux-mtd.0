Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F4FC25B4F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l19HQNVVhGMr4yDn64nv3Va4gRlq/Di/KQeZk+w3bsg=; b=qWrwJ2pKTRK0Xg
	GB66nyG/2pw2pTJrreePIXnLwqoLb/1XcxpBWvR849H2lTuD4QWsV4adMdkk2k+ez3FU8DmCBuwtE
	3nBqKgC+b9odNxbW8zVJXZP9MYOyOsSm4txaUuirVY6+iQ/Egp20r1dgwoFukddP8KCgXJZssUgUH
	M3djm/VuUw6K4t/nUNUseOtuvzu5qjmtgI3EJpuxWwOYcRxrZbOqkExo/CdlE2bIDPHTZoA4Rqai3
	KTDK8rxzK0ofoShrepKAkeeHu6sPKgLP0ADV2Iz0VR5nhZCCVtZt+mNH/Fs/ddPNXDuZsoSVE8u+X
	Ul0x8xtU3FSeY8bCfbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yxx-00000007a7y-0pOW;
	Mon, 06 May 2024 14:05:17 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yxt-00000007a6X-40TM
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 14:05:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4419E1C000A;
	Mon,  6 May 2024 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715004310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqe5Un0HeW18+qURGomHX4p3gETxbxF+O84t4VWCEXI=;
	b=LbxT8B8UGgimlG77fyOla4trAVaDHKpcAWVJDzLiM5voFwxfV9jLCO4FVI4ICH3DN1LhCc
	j7FbB///Y+11B9mXj8CCgsnvSfWK5pAFTqZ7dQIqoAAc1PGxYDZYx2mQ6YgrBNqQwMKLWe
	mY5OD1MTX7wgxbQGXUwChFZSIlyXYqr2oWeN0WyDm4W/WcVis6okqtXoJozt+WCMeb9ypC
	k14L0S06hZpzoK43SefFwUxdd5IcwAgjY+Cu1nObqAX0CcQXw4WRZ1bYZryh3+0rkYpsTY
	P4NJPvkWsuY+C3MaHNMgWDM1aLtoo/ARvS3RX/1YA/5bHG6pED73mfQpS4SblQ==
Date: Mon, 6 May 2024 16:05:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: nand: mxc_nand: support software ECC
Message-ID: <20240506160508.6c60d50f@xps-13>
In-Reply-To: <20240417-mtd-nand-mxc-nand-exec-op-v1-3-d12564fe54e9@pengutronix.de>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
	<20240417-mtd-nand-mxc-nand-exec-op-v1-3-d12564fe54e9@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_070514_271997_7E4664AF 
X-CRM114-Status: GOOD (  19.38  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBXZWQsIDE3IEFwciAy
MDI0IDA5OjEzOjMwICswMjAwOgoKPiBUbyBzdXBwb3J0IHNvZnR3YXJlIEVDQyB3ZSBzdGlsbCBu
ZWVkIHRoZSBkcml2ZXIgcHJvdmlkZWQgcmVhZF9vb2IsCj4gcmVhZF9wYWdlX3JhdyBhbmQgd3Jp
dGVfcGFnZV9yYXcgb3BzLCBzbyBzZXQgdGhlbSB1bmNvbmRpdGlvbmFsbHkKPiBubyBtYXR0ZXIg
d2hpY2ggZW5naW5lX3R5cGUgd2UgdXNlLiBUaGUgT09CIGxheW91dCBvbiB0aGUgb3RoZXIgaGFu
ZAo+IHJlcHJlc2VudHMgdGhlIGxheW91dCB0aGUgaS5NWCBFQ0MgaGFyZHdhcmUgdXNlcywgc28g
c2V0IHRoaXMgb25seQo+IHdoZW4gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVCBpcyBpbiB1
c2UuCj4gCj4gV2l0aCB0aGVzZSBjaGFuZ2VzIHRoZSBkcml2ZXIgY2FuIGJlIHVzZWQgd2l0aCBz
b2Z0d2FyZSBCQ0ggRUNDIHdoaWNoCj4gaXMgdXNlZnVsIGZvciBOQU5EIGNoaXBzIHRoYXQgcmVx
dWlyZSBhIHN0cm9uZ2VyIEVDQyB0aGFuIHRoZSBpLk1YCj4gaGFyZHdhcmUgc3VwcG9ydHMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+
IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jIHwgOSArKysrKy0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhjX25hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L214Y19uYW5kLmMKPiBpbmRleCBmYzcwYzY1ZGVhMjY4Li5mNDRjMTMwZGNhMThkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L214Y19uYW5kLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jCj4gQEAgLTEzOTQsMTUgKzEzOTQsMTYgQEAgc3Rh
dGljIGludCBteGNuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJY2hp
cC0+ZWNjLmJ5dGVzID0gaG9zdC0+ZGV2dHlwZV9kYXRhLT5lY2NieXRlczsKPiAgCWhvc3QtPmVj
Y3NpemUgPSBob3N0LT5kZXZ0eXBlX2RhdGEtPmVjY3NpemU7Cj4gIAljaGlwLT5lY2Muc2l6ZSA9
IDUxMjsKPiAtCW10ZF9zZXRfb29ibGF5b3V0KG10ZCwgaG9zdC0+ZGV2dHlwZV9kYXRhLT5vb2Js
YXlvdXQpOwo+ICsKPiArCWNoaXAtPmVjYy5yZWFkX29vYiA9IG14Y19uYW5kX3JlYWRfb29iOwo+
ICsJY2hpcC0+ZWNjLnJlYWRfcGFnZV9yYXcgPSBteGNfbmFuZF9yZWFkX3BhZ2VfcmF3Owo+ICsJ
Y2hpcC0+ZWNjLndyaXRlX3BhZ2VfcmF3ID0gbXhjX25hbmRfd3JpdGVfcGFnZV9yYXc7Cj4gIAo+
ICAJc3dpdGNoIChjaGlwLT5lY2MuZW5naW5lX3R5cGUpIHsKPiAgCWNhc2UgTkFORF9FQ0NfRU5H
SU5FX1RZUEVfT05fSE9TVDoKPiArCQltdGRfc2V0X29vYmxheW91dChtdGQsIGhvc3QtPmRldnR5
cGVfZGF0YS0+b29ibGF5b3V0KTsKPiAgCQljaGlwLT5lY2MucmVhZF9wYWdlID0gbXhjX25hbmRf
cmVhZF9wYWdlOwo+IC0JCWNoaXAtPmVjYy5yZWFkX3BhZ2VfcmF3ID0gbXhjX25hbmRfcmVhZF9w
YWdlX3JhdzsKPiAtCQljaGlwLT5lY2MucmVhZF9vb2IgPSBteGNfbmFuZF9yZWFkX29vYjsKPiAg
CQljaGlwLT5lY2Mud3JpdGVfcGFnZSA9IG14Y19uYW5kX3dyaXRlX3BhZ2VfZWNjOwo+IC0JCWNo
aXAtPmVjYy53cml0ZV9wYWdlX3JhdyA9IG14Y19uYW5kX3dyaXRlX3BhZ2VfcmF3Owo+ICAJCWNo
aXAtPmVjYy53cml0ZV9vb2IgPSBteGNfbmFuZF93cml0ZV9vb2I7Cj4gIAkJYnJlYWs7CgpZb3Ug
YWxzbyBuZWVkIHRvIGRpc2FibGUgdGhlIEVDQyBlbmdpbmUgYnkgZGVmYXVsdCAoYW5kIHRoZW4g
eW91J3JlCmZyZWUgdG8gdXNlIHRoZSByYXcgcGFnZSBoZWxwZXJzKS4KCkkgdGhvdWdodCBwYXRj
aCA0IHdhcyBuZWVkZWQgZm9yIHRoaXMgcGF0Y2ggdG8gd29yaywgZG8geW91IGNvbmZpcm0/Ck90
aGVyd2lzZSB3aXRoIHRoZSBsaXR0bGUgY2hhbmdlIHJlcXVlc3RlZCBJIG1pZ2h0IGFsc28gbWVy
Z2UgdGhpcyBvbmUuCgpUaGFua3MsIE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
