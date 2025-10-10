Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903DCAC5BB
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRci0DXOaZTxXIyir/tUIsn6bssVjS3+xjsnb8lG3ao=; b=SsPCgAvfj83zX5
	ItMUvKJdR0pCtU9Mqsx1alfJq/1xWAqkL2m47TCUhMiNABv8HcBzlBn4D19W7G5bIYFWnAWgXiFzT
	tMQhkHkH/6Yo1H18KGAOv8boNYWZZ3+9a+XpKcic/NMBPrIHxwvTxtwBsOnffepNZYQBURkzPVbbi
	NG54km0lj5HAP6KZpsPpcHFZWxCFWdWu0ZvIMZFUFksNY9vUIAQQWKIh90vIUf+7mnkkTkIxzELTj
	iYZsr7y/v82teunkIEDg326c6maR238624SVUgJo2W4NDni30sqGS7HIf3Vy4vUvc8Qc/bNZEZXFP
	zxrdvf5TLmYK44sVRldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ADN-00000008FLj-48GN;
	Fri, 10 Oct 2025 10:19:09 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ADL-00000008FKH-1hs5
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 10:19:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4628C08CCB;
	Fri, 10 Oct 2025 10:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F0A460667;
	Fri, 10 Oct 2025 10:19:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A517D102F220F;
	Fri, 10 Oct 2025 12:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6nMxZyzrduqra3rZXm40NnFrsNOonRPZCrd4Yv86yAk=;
	b=s2SQuA9T0Zh50gLxJQEHVyB7KWdmyxNtuvUNc6eZipNm+ayFViPOyhuYlf3eNhGcqm41ZV
	BBH1gbazPsn41Bb8Y5KbnCIuwt7cEm2Ul8RSrJngxr+sSZHLekGU/0UBgEyDNiHuKWvpI9
	vFVJWps2kudIyHLCMDb3ov13c8pLWJmArGcKk193kO8io6v6JnOB60waxbT9M4Nv4i80Cj
	GHenGF/eCzfKdbKNzPOnuzHjd2ssfKrGkklY3ceBlz9vIXRf9dDiWqwXVRXx6Zs0gGvs2m
	+cTvGadpeS46ysgBy41KBsHM5uNJ67TguV3VKYp/xnsoSAZtk2/LH3gLoEphKA==
Message-ID: <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
Date: Fri, 10 Oct 2025 12:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-3-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_031907_634491_9B4E9CF9 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMTAvMTAvMjAyNSDDoCAxMDo0OSwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdMKgOgo+
IE9uIDEwLzEwLzIwMjUgMTA6NDAsIFJpY2hhcmQgR2Vub3VkIHdyb3RlOgo+PiArCj4+ICAgcHJv
cGVydGllczoKPj4gICAgIGNvbXBhdGlibGU6Cj4+ICAgICAgIGVudW06Cj4+ICAgICAgICAgLSBh
bGx3aW5uZXIsc3VuNGktYTEwLW5hbmQKPj4gICAgICAgICAtIGFsbHdpbm5lcixzdW44aS1hMjMt
bmFuZC1jb250cm9sbGVyCj4+ICsgICAgICAtIGFsbHdpbm5lcixzdW41MGktaDYxNi1uYW5kLWNv
bnRyb2xsZXIKPiAKPiAKPiBBbHNvOgo+IDEuIG1pc3NpbmcgbmV3IGxpbmUgLSB3aHkgZGlkIHlv
dSByZW1vdmUgaXQ/Cj4gMi4gS2VlcCBleGlzdGluZyBzdW54aSBwcmVmZXJyZWQgb3JkZXIgb2Yg
ZW50cmllcy4gSW4gb3RoZXIgcGxhdGZvcm1zIGl0Cj4gaXMgYWxwaGFudW1lcmljYWwsIG5vdCBu
YXR1cmFsLiBJbiBjYXNlIHN1bnhpIHVzZXMgc29tZXRoaW5nIGVsc2UsIGp1c3QKPiBiZSBzdXJl
IHlvdSB1c2Ugc3VueGkgb3JkZXIuCm9rLCBtYWtlIHNlbnMKClRoYW5rcyEKCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgoKCi0tIApSaWNoYXJkIEdlbm91ZCwgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
