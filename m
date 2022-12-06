Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAEAC352A1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJmoSwFTkZzwqRMeEG7lT5Oy1AqK4SJLqzw6mlxQZtw=; b=O30wNP8fchFHeE
	u0mFvKl8i4R8U7vXX/FQG5W+DGiddkWz/skkmCvBXkVA/JAA+POq5x31LWes81LvVKh7DUsYE6v6s
	EWxk3nMuYnqmBM0EtQW5i0bY4ahIZUfpEBDhIOD/TF4HLdG4HP6kaNsX697SSvQEboh/aT1go56s8
	yE57OtkfMxGM3DaN9L8r+pCuWozFB9hw///rzkRZkBd0hfQ6DeaXBEBcUERVQM04/FKYH0W1sxAHb
	/o61x/JGi5MhtaB0QFrxkqnahwe3wF7NyB+Rtc6BD/+thQYRw0/kXhpiFvoNvw+G528jyat4B9L5+
	Sozf9aMHiS7istZd4M5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2V0X-006onZ-Rh; Tue, 06 Dec 2022 10:17:01 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2V0M-006olR-VW; Tue, 06 Dec 2022 10:16:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DDC140003;
	Tue,  6 Dec 2022 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670321806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ons113hSb6tX+xTERA8DOW/78mOwkkaZ9ZxNswFoU4A=;
	b=Iln7tYOPNg+p89W844U31Y67FURDYoEdysuuQiq0vnbir2dudWkJaF0UHMR+BvYVtGr8Pq
	hz5JPvc0CHX7H6dfdq1XDDJ2hAGzZEjzpyaDCxaNfqppjCO1XUKrd5ez6y5+LDCGHCznhF
	kmvPd4Y/gZLjaXJR0k2wmLmRLt2YG3o2Cm4LauyGUIZ7PoN3XsAnwhQzRRsIzgpRNZ/lo3
	hmBRx5O+2Lv/dGVdkJFTnDPxM0O0ELs6+8q0aAK9VruaEVW63iwILlplJ069gNS2KcOeWC
	rnmQ0i7w2plhVfbLSgp66W/CI9yi8+qBlK0bQ2k6GIjuOPK29E6BlCtlUapPhg==
Date: Tue, 6 Dec 2022 11:16:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <20221206111643.1af08a9b@xps-13>
In-Reply-To: <Y45BZs7dZokgz83I@francesco-nb.int.toradex.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
	<0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
	<20221205185859.433d6cbf@xps-13>
	<f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
	<20221205191828.3072d872@xps-13>
	<29260d63-3240-6660-b002-cd00dc051574@denx.de>
	<Y45BZs7dZokgz83I@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_021651_500940_B9B638A1 
X-CRM114-Status: GOOD (  24.70  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gTW9uLCA1IERlYyAy
MDIyIDIwOjA3OjE4ICswMTAwOgoKPiBPbiBNb24sIERlYyAwNSwgMjAyMiBhdCAwNzo1MjowOFBN
ICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiA+IE9uIDEyLzUvMjIgMTk6MTgsIE1pcXVlbCBS
YXluYWwgd3JvdGU6ICAKPiA+ID4gbWFyZXhAZGVueC5kZSB3cm90ZSBvbiBNb24sIDUgRGVjIDIw
MjIgMTk6MDc6MTQgKzAxMDA6ICAKPiA+ID4gPiBPbiAxMi81LzIyIDE4OjU4LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOiAgCj4gPiA+ID4gPiAsIGl0J3Mgbm90Cj4gPiA+ID4gPiBjb21wbGV4IHRvIGRv
LCB0aGVyZSBhcmUgcGxlbnR5IG9mIGV4YW1wbGVzLiBUaGlzIHdvdWxkIGJlIElNSE8gYQo+ID4g
PiA+ID4gYmV0dGVyIHN0ZXAgYWhlYWQgcmF0aGVyIHRoYW4ganVzdCBhIGNlbGwgY2hhbmdlLiBB
bnl3YXksIEkgZG9uJ3QgbWluZAo+ID4gPiA+ID4gcmV2ZXJ0aW5nIHRoaXMgb25jZSB3ZSd2ZSBz
b3J0ZWQgdGhpcyBtZXNzIG91dCBhbmQgZml4ZWQgVS1Cb290LiAgCj4gPiA+ID4gCj4gPiA+ID4g
V29uJ3Qgd2Ugc3RpbGwgaGF2ZSBpc3N1ZXMgd2l0aCBvbGRlciBib290bG9hZGVyIHZlcnNpb25z
IHdoaWNoCj4gPiA+ID4gcGFzdGUgcGFydGl0aW9ucyBkaXJlY3RseSBpbnRvIHRoaXMgJmdwbWkg
e30gbm9kZSwgYW5kIHdoaWNoIG5lZWRzCj4gPiA+ID4gdG8gYmUgZml4ZWQgdXAgaW4gdGhlIHBh
cnNlciBpbiB0aGUgZW5kID8gIAo+ID4gPiAKPiA+ID4gSSBiZWxpZXZlIGZkdF9maXh1cF9tdGRw
YXJ0cygpIHNob3VsZCBiZSBraWxsZWQsIHNvIHdlIHNob3VsZCBubyBsb25nZXIKPiA+ID4gaGF2
ZSB0aGlzIHByb2JsZW0uICAKPiA+IAo+ID4gVGhlIGZkdF9maXh1cF9tdGRwYXJ0cyBpcyBVLUJv
b3QgY29kZS4gSWYgY29udGVtcG9yYXJ5IExpbnV4IGtlcm5lbCBpcwo+ID4gYm9vdGVkIHdpdGgg
YW5jaWVudCBVLUJvb3QsIHRoZW4geW91IHdvdWxkIHN0aWxsIGdldCBkZWZlY3RpdmUgRFQgcGFz
c2VkIHRvCj4gPiBMaW51eCwgYW5kIHRoYXQgc2hvdWxkIGJlIGZpeGVkIHVwIGJ5IExpbnV4LiBS
ZW1vdmluZyBmZHRfZml4dXBfbXRkcGFydHMoKQo+ID4gZnJvbSBjdXJyZW50IG1haW5saW5lIFUt
Qm9vdCB3b24ndCBzb2x2ZSB0aGlzIHByb2JsZW0uCj4gPiAKPiA+IEkgdGhpbmsgdGhpcyBpcyBh
bHNvIHdoYXQgRnJhbmNlc2NvIGlzIHRyeWluZyB0byBjb252ZXkgKHBsZWFzZSBjb3JyZWN0IG1l
Cj4gPiBpZiBJJ20gd3JvbmcpLiAgCgpJZiB3ZSBjYW4gZ2V0IHJpZCBvZiBmZHRfZml4dXBfbXRk
cGFydHMoKSwgaXQgbWVhbnMgc29tZW9uZSBoYXMgdG8KY3JlYXRlIHRoZSBwYXJ0aXRpb25zLiBJ
IGd1ZXNzIHRoZSBlYXN5IHdheSB3b3VsZCBiZSB0byBqdXN0IHByb3ZpZGUKbXRkcGFydHMgdG8g
TGludXggbGlrZSBhbGwgdGhlIG90aGVyIGJvYXJkcyBhbmQgbGV0IExpbnV4IGRlYWwgd2l0aCBp
dC4KVGhlbiB3ZSBjYW4ganVzdCBhc3N1bWUgaW4gTGludXggdGhhdCBwZXJoYXBzIGlmIHRoZSBw
YXJ0aXRpb25zIGFyZQppbnZhbGlkICgjc2l6ZS1jZWxsIGlzIHdyb25nPykgdGhlbiB3ZSBzaG91
bGQganVzdCBzdG9wIHRoZWlyIGNyZWF0aW9uCmFuZCBmYWxsYmFjayB0byBhbm90aGVyIG1lY2hh
bmlzbSBpbnN0ZWFkIG9mIGZhaWxpbmcgZW50aXJlbHkuIFRoaXMgd2F5Cm5vIG5lZWQgZm9yIGhh
Y2tpc2ggY2hhbmdlcyBpbiB0aGUgcGFyc2VycyBhbmQgY29tcGF0aWJpbGl0eSBpcyBzdGlsbAp2
YWxpZCB3aXRoIG9sZCBVLUJvb3QgKGlmIG10ZHBhcnRzIHdhcyBwcm92aWRlZCBvbiB0aGUgY21k
bGluZSwgdG8gYmUKY2hlY2tlZCkuIE90aGVyd2lzZSB3ZSdsbCBoYXZlIHRvIGRlYWwgd2l0aCBp
dCBpbiBMaW51eCwgdGhhdCdzIGEgcGl0eS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
