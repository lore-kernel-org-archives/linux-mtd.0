Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F36EC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuCIEoV1fjv2+mKPvqkXpBDRtYk/P4/OcE9LToWoIS8=; b=pQY0YgNdScWiY1KjHiZmZAfp0l
	T6gM0CFll9fWqguuZtmGWIz69x9apVV9GhQSiWFdWDyI3pjnNhN0/MbJ8vyVLvh2ePg1AswJbkoHp
	EqfeB/ntsms2Erba4QrNsJXoiswx/s3hd+okSwoyuwUP5e4NG9AJIj+RBWANn3zEqGLDn7QQHdmE9
	x8iGn5USXLi/WAp6VEqBRuE436vkxWIov/QZBiaNsdScIfRZUsE4W2Y3JUTSvWz38e8o5JYsX62A6
	8LzxL7kJRazNFkJxKsJ5cUAq6eY/uIw0GwaVwpcgkq1nQCvspdgTfxJqhNVivksKTbtOQ42HFSNU9
	AWJa5P0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM231-006AB2-0Y;
	Wed, 19 Jul 2023 07:56:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM22x-006A8y-11
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 07:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vwy+Rk+DpWgKqRl/5W9li4fim9nVcS+KSVDMqOOga0w=; b=TSAXVd3VdCISkwDcblH1k164D/
	P0ALjf91FnlbM9M6j7O2HGK5Wpi0ssLmju/hPhi4XGVmJwF4F/SJih2fGts0jPe84Z6HAO2OJFZc3
	fcFC+godjxfgXpVxaeuR4oU0TM5pmx6D7LTBfwswJ10txWVRqxR9+58RnCxu5XyEWR1pDhcDs6oEW
	dg8irQKBAryUr9nvxbrLuNUoSdOXkEfL0XWsnvuuo9X78oND/4jPePSY83njIrrUgAGwEg0Pvt3ZU
	hXcImwNH3+P5ubT/iOFuN8RQdZEL6CUMCxTdoEYmpGNvkv3mzSu10f1xQVofOPPy1KpdOaP+VAio+
	SZGXsmjw==;
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLeA4-00BDOz-25
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 06:26:18 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C07D23C3;
	Tue, 18 Jul 2023 08:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689661539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwy+Rk+DpWgKqRl/5W9li4fim9nVcS+KSVDMqOOga0w=;
	b=ZFlYDESTV91bDpjpp/nK4NchulbycORk27MdDVBlJYrImYDMQzO2LmWhfX9jveUYMvi+EZ
	/hoPhwCsC9r6JH60O1UT2Un4xvhfiR66BznPTLZm/tjfVdtQtWKmEaIE3OceRqPoUlrh+N
	Kyb/UsbP45UCgllP2HCzY1VouJ/0uN+4v/BiWNpdOzBFabBlYyWtNgHmvYIEWf4hSQPykG
	ae9lPqXmd2FFFotC3p3qvyyPuw8deil5/guhRGKFtgEybwzP1SzKidgLiWCJ0xxVj6IefX
	/TrnE9bVQKjbD/0GrSNEJD7n16e8oExEGD2RFaFbfnoWf9ah/bitQnJVjF4eTQ==
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 08:25:39 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
In-Reply-To: <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org>
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
 <0525440a652854a2a575256cd07d3559@walle.cc>
 <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org>
Message-ID: <e642ff27fd0bc0f1f0e293972145f680@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_072616_925187_DC169156 
X-CRM114-Status: GOOD (  21.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgo+Pj4gd2hpbGUgaGVyZSB0cnksIHVzaW5nIElORk8gd2l0aCBJTkZPKDB4ZWY0MDE4LCAw
LCAwLCAwKSwgdGhvc2UKPj4+IHBhcmFtZXRlcnMgc2hhbGwgYmUgZGlzY292ZXJlZCBhdCBydW4t
dGltZSwgc28gd2UgcHJlcGFyZSB0byBnZXQgcmlkIAo+Pj4gb2YKPj4+IGV4cGxpY2l0bHkgc2V0
dGluZyB0aGVtIHNvb25lciBvciBsYXRlci4KPj4gCj4+IFRoaXMgaXMgYW4gZW50cnkgbWF0Y2hp
bmcgdmFyaW91cyBmbGFzaCBmYW1pbGllcyBmcm9tIFdpbmJvbmQsIHNlZSBteQo+PiByZXBseSBp
biB2MS4gSSdtIG5vdCBzdXJlIHdlIHNob3VsZCByZW1vdmUgdGhlc2UgYXMgd2UgY291bGQgYnJl
YWsgdGhlCj4+IG9sZGVyIG9uZXMsIHdoaWNoIG1pZ2h0IG9yIG1pZ2h0IG5vdCBoYXZlIFNGRFAg
dGFibGVzLiBXZSBkb24ndCBrbm93Lgo+IAo+IEknZCB0YWtlIHRoZSByaXNrIGFuZCBicmVhayB0
aGUgb2xkZXIgb25lcyBpZiB0aGVyZSBhcmUgc29tZSB0aGF0IGRvbid0Cj4gZGVmaW5lIFNGRFAg
aW5kZWVkLCBqdXN0IHRvIGhhbmRsZSB0aGUgY29uZmxpY3QgcHJvcGVybHkuIFdlIGNhbid0Cj4g
ZW5jb3VyYWdlIGNvZGUgYmFzZWQgb24gYXNzdW1wdGlvbnMgb3RoZXJ3aXNlIHdlJ2xsIGdldCBi
YWNrIHRvIHRoZQo+IGtub3R0ZWQgc3BpLW5vciBjb2RlIHRoYXQgd2UgdHJpZWQgdG8gdW50aWUg
aW4gdGhlIGxhc3QgeWVhcnMuCgpXYWl0IGEgbWludXRlLCBub3cgSSdtIHRoZSBtb3JlIGNvbnNl
cnZhdGl2ZSBvbmUgb2YgdGhlIGJvdGggb2YKdXM/ICg6CgpKb2tlcyBhc2lkZSwgYmFzaWNhbGx5
IHlvdSBhcmUgc2F5aW5nIHRoYXQgaWYgdGhlcmUgYXJlIHR3byBmbGFzaGVzCndpdGggdGhlIHNh
bWUgaWQsIG9uZSBzdXBwb3J0cyBKRURFQyBvbmUgZG9lc24ndCwgd2UgY2FuIGJyYWtlIHRoZQps
YXR0ZXIgb25lLgoKPj4+PiAtwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLKSB9
LAo+PiAKPj4gVGh1cywgSSdkIGFsc28ga2VlcCB0aGlzIG9uZS4KPj4gCj4gCj4gS2VlcGluZyB0
aGlzIG9uZSBkb2VzIG5vdCBoYXZlIHRoZSBlZmZlY3QgdGhhdCB5b3Ugd2FudCBhcyBTRUNUXzRL
IGlzCj4gdXNlZCBpbiBzcGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKSB3aGljaCBpcyBub3Qg
Y2FsbGVkIHdoZW4KPiBQQVJTRV9TRkRQIGlzIHNldCwgd2hpY2ggbWFrZXMgcGVyZmVjdGx5IHNl
bnNlLiBMZXQncyBkcm9wIHRoaXMgYW5kIGlmCj4gYnVncyB3aWxsIGJlIHJlcG9ydGVkLCBJIGNv
bW1pdCBJJ2xsIGZpeCB0aGVtIGluIHRoZSBzYW1lIHJlbGVhc2UgCj4gY3ljbGUuCgpNaGgsIEkg
c2hvdWxkIGhhdmUgYmVlbiBtb3JlIGN1cmlvdXMgdG8gd2h5IExpbnVzIG5lZWRlZCB0aGUgUEFS
U0VfU0ZEUApmbGFnIGluIHRoZSBmaXJzdCBwbGFjZS4gVGFraW5nIGEgY2xvc2VyIGxvb2ssIHRo
YXQgaXMgYmVjYXVzZSBpbiB0aGUKbGVnYWN5IGJlaGF2aW9yLCB0aGUgU0ZEUCBpcyBvbmx5IHJl
YWQgaWYgdGhlIGNoaXAgc3VwcG9ydHMgZHVhbCBvcgpxdWFkIHJlYWQgKHdoYXRldmVyIHRoZSBy
YXRpb25hbGUgd2FzIGZvciB0aGF0KS4KCkFsc28sIGlmIFBBUlNFX1NGRFAgaXMgc2V0LCBub25l
IG9mIHRoZSBub19zZmRwX2ZsYWdzIGFyZSBldmVyIGhhbmRsZWQuCklmIHRoZSBjaGlwIGRvZXNu
J3Qgc3VwcG9ydCB0aGUgU0ZEUCBpcyB3aWxsIGp1c3QgZmFpbCBwcm9iaW5nLgoKQXMgSSdtIHJl
YWRpbmcgdGhlIGNvZGUgcmlnaHQgbm93LCBmb3IgdGhlIG5ldyBiZWhhdmlvcgppdCBpcyBlaXRo
ZXIKICAqIGV4cGVjdCB0aGUgZmxhc2ggc3VwcG9ydHMgU0ZEUCwgaWYgbm90LCBwcm9iZSBmYWls
cwogICogZXhwZWN0IHRoZSBmbGFzaCB0byBkb24ndCBzdXBwb3J0IFNGRFAsIG5vIFNGRFAgaXMg
ZXZlciByZWFkIGF0IGFsbAoKU2hvdWxkbid0IHdlIGhhbmRsZSB0aGUgdGhpcmQgY2FzZSBpbiB0
aGUgbmV3IGJlaGF2aW9yLCB0b286CiAgKiBzdGFydCB3aXRoIHRoZSBzdGF0aWMgZGF0YSB3ZSBo
YXZlIGFuZCB0cnkgcmVhZGluZyBTRkRQIHRvIAphbWVuZC9jb3JyZWN0IGl0LgoKSWYgbm90LCB3
aWxsIHlvdSBhY2NlcHQgYnJlYWthZ2UgZm9yIGZ1dHVyZSBmbGFzaGVzLCB0b28/IExvb2tpbmcg
YXQgCndpbmJvbmQuYwpmb3IgZXhhbXBsZSwgSSBndWVzcyBhbGwgY2hpcHMgd2l0aCAweGVmNDAu
LiAweGVmNTAuLiBhbmQgMHhlZjYwLi4gCnN1cHBvcnRzClNGRFAgbm93YWRheXMgYW5kIG1vc3Qg
b2YgdGhlbSBvbmx5IGhhdmUgU0VDVF80SyBzZXQuCgo+IElmIGJvdGggb2YgeW91IGFncmVlLCBJ
J2xsIGFtZW5kIExpbnVzJ3MgdjQgcGF0Y2ggd2hlbiBhcHBseWluZy4KClNvIGl0IHdvdWxkIGJl
IHRoZSBmaXJzdCBjaGlwIHdpdGhvdXQgZmxhZ3MgYXQgYWxsPyBUaGVuIHdlIGNvdWxkCmRyb3Ag
dGhlIGVudHJ5IGVudGlyZWx5IDopIEFuZCBpZiB3ZSBkbyB0aGlzLCB0aGVuIHdlIHNob3VsZCBh
bHNvCmRyb3AgYWxsIHRoZSBvdGhlciBlbnRyaWVzIGZvciB0aGUgbmV3ZXIgd2luYm9uZCBmbGFz
aGVzLgoKSWYgeW91IGRlY2lkZSB0byBicmVhayBvbGRlciBmbGFzaGVzLCB0aGVuIEknZCBwcmVm
ZXIgdG8gYWxzbyBkcm9wCnRoZSBuX3NlY3RvcnMgYW5kIHNlY3Rvcl9zaXplLCBpLmUuIElORk8o
MHhlZi4uLi4sIDAsIDAsIDApLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
