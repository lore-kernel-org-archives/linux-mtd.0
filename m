Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6ECC47089
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Dec 2022 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX7xAbjW+vztRvXQYQc4h03EDqNVzqOMgCXuC8/Qs8M=; b=WuHIcSzH/U38PZ
	9k7JueyZ4R4Dt4aw74uQ/6Uurgd4p7OzsMl+GQwz+LFL4402OG5tNfThfjofbgu5tcACsKatsiLuq
	h6KzEF+y2hf8NYTo7oFW29PGd6vjrsHFDh0r22s0KKrQA3PayjjULN8qQa4oGWtvV3L2WEftlzx+P
	uhQFO7yf6/jvEadB0fpOrrAiIWKYamezzi2/J8CiNhFsaBmyTfxiIw1bm1y+xyYvPoBMsIKWTSysw
	rjTF9tGTG5VAZ2mCVaRDoNqDvaRxsNTgc78YSFWpyPnv0U5CuVhJzMYIKtYq2XmlX/Mn0vt/ufhrM
	DJnR0O85gJlh38DTUeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rMM-00GvCy-AC; Wed, 07 Dec 2022 10:09:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rM5-00Guvm-FZ; Wed, 07 Dec 2022 10:08:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D0296602BCA;
	Wed,  7 Dec 2022 10:08:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670407721;
	bh=AyR0RJnVKrrqQBm9hFiiBr7ZIDDoQirRHSbrqdL6UgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lt1ouqtzvN/cuiyAwGqv8hAf7z0yOZ7kKLfaiI2zvDgg+xHD+3X9XYLh4CPC+tpeE
	 VhrqNI5+jpml1H8zckoIDyzdcqhFTgeSKuQxKVbtMMZOJ1poRgLRvY0Pgp1PtKd44e
	 URFvFOQWTsc99dYvNbtT5MFbJcqH3/HYxxZaseaihah8pgMfxy5QD8Bo6fpBLClyM9
	 F298s/We7GqPdmqjnLOpHPmWcjMMy3tCTGUjKdw/rF8yMeP8OcNFi525DTelWSPp0C
	 qDH4/2Vqi0afKEOssANEbUKPrr/V+WKYSOpb7f9n5RUlKJMsORCAfAKfwhMejfodD5
	 0Me9nh+W+yTYg==
Message-ID: <ff2931b5-948f-f013-056d-b0a78d7272d6@collabora.com>
Date: Wed, 7 Dec 2022 11:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/9] spi: mtk-snfi: Add optional nfi_hclk which needed
 for MT7986
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-4-xiangsheng.hou@mediatek.com>
 <ef2e6859-56e1-bbf0-dbde-44ea3d7d2f3f@collabora.com>
 <4db35ac3914e444b754f9075141fd69e07e7c858.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4db35ac3914e444b754f9075141fd69e07e7c858.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_020845_670598_595005F3 
X-CRM114-Status: GOOD (  18.34  )
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

SWwgMDcvMTIvMjIgMDI6NDIsIFhpYW5nc2hlbmcgSG91ICjkvq/npaXog5wpIGhhIHNjcml0dG86
Cj4gSGkgQW5nZWxvLAo+IAo+IE9uIE1vbiwgMjAyMi0xMi0wNSBhdCAxNToyMSArMDEwMCwgQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4+IElsIDA1LzEyLzIyIDA3OjU3LCBYaWFu
Z3NoZW5nIEhvdSBoYSBzY3JpdHRvOgo+Pj4gQWRkIG9wdGlvbmFsIG5maV9oY2xrIHdoaWNoIG5l
ZWRlZCBmb3IgTVQ3OTg2Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW5nc2hlbmcgSG91IDx4
aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5jb20+Cj4+Cj4+IElzIHRoZXJlIGFueSBvcGVyYXRpb24g
Zm9yIHdoaWNoIHlvdSBuZWVkIE5GSV9IQ0xLIGVuYWJsZWQsIGJ1dCBhdAo+PiB0aGUgc2FtZSB0
aW1lCj4+IFBBRF9DTEsgYW5kL29yIE5GSV9DTEsgY2FuIGJlIGRpc2FibGVkPwo+IAo+IE5vLCBm
b3IgdGhlIG5ldyBJUCBkZXNpZ24gb24gTVQ3OTg2LCB3aWxsIG5lZWQgdGhlCj4gUEFEX0NMSy9O
RklfQ0xLL05GSV9IQ0xLIGVuYWJsZWQgYXQgdGhlIHNhbWUgdGltZS4KPiAKPj4gSWYgTkZJX0hD
TEsgYW5kIE5GSV9DTEsgbXVzdCBhbHdheXMgYmUgT04gYXQgdGhlIHNhbWUgdGltZSwgYWRkaW5n
Cj4+IHRoaXMgY2xvY2sgdG8KPj4gc3BpLW10ay1zbmZpLmMgaXMgKm5vdCogYW4gb3B0aW1hbCB3
YXkgb2YgZG9pbmcgdGhpbmdzOiB5b3UgY2FuLCBhdAo+PiB0aGlzIHBvaW50LAo+PiBzZXQgTkZJ
X0hDTEsgYXMgcGFyZW50IG9mIE5GSV9DTEsgaW4gdGhlIE1UNzk4NiBjbG9jayBkcml2ZXIgaW5z
dGVhZCwKPj4gd2l0aG91dAo+PiBtYWtpbmcgYW55IGFkZGl0aW9uIHRvIHRoaXMgZHJpdmVyIGF0
IGFsbC4KPiAKPiBGb3Igc29tZSBJQywgdGhlcmUgbWF5IGhhdmUgb25seSBORklfQ0xLL1BBRF9D
TEssIGFuZCBoYXZlIG5vIE5GSV9IQ0xLLAo+IHRoaXMgcmVseSBvbiBJQyBkZXNpZ24uCj4gCgpJ
J3ZlIGp1c3QgY2hlY2tlZCBjbGstbXQ3OTg2LWluZnJhY2ZnIGFuZCB3ZSBjYW4ndCByZXBhcmVu
dCBORkkxX0NLLCBub3IgU1BJTkZJMV9DSwphcyB0aGV5IGhhdmUgeHh4eF9zZWwgcGFyZW50cyBh
bHJlYWR5LCB3aGljaCBhcmUgbm90IGNvbW1vbiB3aXRoIHRoZSBIQ0suCgpZb3UncmUgcmlnaHQs
IHRoZSBhZGRpdGlvbiBvZiB0aGUgbmZpX2hjbGsgY2xvY2sgaXMgbmVlZGVkLCB3aGljaCBtZWFu
cyB0aGF0IGZvcgp0aGlzIGNvbW1pdCwgeW91IGdldCBteQoKClJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPgoKClAuUy46IFRoYW5rcyBmb3IgY2xhcmlmeWluZyEKClJlZ2FyZHMsCkFuZ2VsbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
