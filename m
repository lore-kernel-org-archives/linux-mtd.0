Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD9C46CD3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1psq45HcFzGK8wTYT/fSj/X1kt4URrSE0kuvL18uBAQ=; b=Mog7wNfOpgiMzj
	lTSOp1q1MEcX2x/4QMU3CHNTdG4qkSOwkjcEQpABUKNqDAC3YP2VU3LbiaoBSwx0Ru7enesISb0fY
	/yDwbOmrI+mviJi2KK0ecbIOrLGr0/RnKIMWehm2GS+Fyt8tgcepZh3bPcIwyPjlzwisO2cjtsY19
	QwkQHfHnLbbmM+H6GjidP0xLUHFtWETDuU5uti+nqUfGEbQUhcPH0AobeqdkIILptpPVV7N1jVNpc
	TB0m1avdBAxkDVnArr7w2UzR8AG+3515MGYRfz7FVn7I7vkA7og979jGyPGhJu9q2YiQY+6eK1XN0
	Gl3BDFN8tolB3MdyoKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqrh-00GOG7-13;
	Wed, 20 Dec 2023 07:19:37 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqrd-00GOF3-0G;
	Wed, 20 Dec 2023 07:19:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB40D240003;
	Wed, 20 Dec 2023 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703056767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6fzl6vcO4Hv/XujG9Dw3Folx8t279iaf7fTJn0KvN8=;
	b=hiMCouBwpjTDotM2nWPy4MfCqL59dT0H4ebnMP4Wh99CZIvg5xa8mCUGrn/d5LI6eRQAIX
	ir/6d8YLTlLQAFv2T6USU0WnkFWRkEDY7oE/2dpeXvueyhjIEsdJcPXYojokq4jnNvcu/B
	GE0jb4PceNrrxwakYSszdrR/RvF0kV6Qg7FqnEj3M3IHlafqoOBioPjMw5a146+AN5AWHS
	cKz7pFHemYRdjEWo7+fq3vBWL1ix+wLsy6PoNf422Md0FbUyzavzb3+/DL6js4YHt866XY
	6L/s3Ts5bSFWE7/Dpt4voAPef9a7pFYa3nnsnyJrxoBhGkS1A2j04qHBg2DyAA==
Date: Wed, 20 Dec 2023 08:19:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 4/5] nvmem: u-boot-env: improve coding style
Message-ID: <20231220081924.39b96ec4@xps-13>
In-Reply-To: <20231219174025.15228-4-zajec5@gmail.com>
References: <20231219174025.15228-1-zajec5@gmail.com>
	<20231219174025.15228-4-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_231933_278420_808ED321 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE5IERlYyAyMDIzIDE4
OjQwOjI0ICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gMS4gUHJlZmVyIGt6YWxsb2MoKSBvdmVyIGtjYWxsb2MoKQo+ICAgIFNlZSBtZW1vcnkt
YWxsb2NhdGlvbi5yc3Qgd2hpY2ggc2F5czogInRvIGJlIG9uIHRoZSBzYWZlIHNpZGUgaXQncwo+
ICAgIGJlc3QgdG8gdXNlIHJvdXRpbmVzIHRoYXQgc2V0IG1lbW9yeSB0byB6ZXJvLCBsaWtlIGt6
YWxsb2MoKSIKPiAyLiBEcm9wIGRldl9lcnIoKSBmb3IgdV9ib290X2Vudl9hZGRfY2VsbHMoKSBm
YWlsCj4gICAgSXQgY2FuIGZhaWwgb25seSBvbiAtRU5PTUVNLiBXZSBkb24ndCB3YW50IHRvIHBy
aW50IGVycm9yIHRoZW4uCj4gMy4gQWRkIGV4dHJhICJjcmMzMl9hZGRyIiB2YXJpYWJsZQo+ICAg
IEl0IG1ha2VzIGNvZGUgcmVhZGluZyBoZWFkZXIncyBjcmMzMiBlYXNpZXIgdG8gdW5kZXJzdGFu
ZCAvIHJldmlldy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+CgpMb29rcyBtdWNoIG5pY2VyIDopCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
