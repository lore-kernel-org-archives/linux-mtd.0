Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C9CF6497
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acJw4vsbIbrUdpde7uoWt8PTd1ImeYMmO9KEkU5fPxg=; b=5DRPGdCO+8U8/x
	9p5ZHpdY8Oy8VvO6xrZxgNo043ifxPaVVB9920ALr/ItnEuE9V6Z74OG21VKb2k40uw35/k9O29bt
	9Fi52B+PcKPHlo9SWPY8jku6kMRZtsBqwEIZY3MrxSnfFG2X9Zf5eiXBIVgJKvaqBl8XuGRTNTDku
	bWo/YRqJ0wEJI7JP+QrpxEFxVv81PLy1/hXrAPYNgGrickL9IBjr2MIXMqVVAZ8OYteled0md8UM1
	wJl3CjCnRbLkVS3VIswNnzpZsKXnerJrprQvHia1DvFyQDY+xPl84vIkDO9GrkOa0iL8uPAr6vxB5
	mZAFFC/wpfsJpGA3d+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCcg-0000000GUxZ-05FH;
	Mon, 30 Sep 2024 09:23:18 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCYq-0000000GU5U-2S9T;
	Mon, 30 Sep 2024 09:19:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E4A62000F;
	Mon, 30 Sep 2024 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727687957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08CqMCR40QeByk4ty6nskGAarldWWiP1HXvLuo/jmq8=;
	b=aryuuA522t22D8cTiaR7wOrrrGfDITc/83JLG7Jb/SzmS/GFsmyD7kPvEqzaqvtRZ8JhTh
	DqvJ9QEo9K3e69VI9MQzf5f7FArwYHbcNVyeVG+DR6qkPaV9N6OytyFv6MUqJu1Rk6a41Q
	pjJMF0s8zolKg0F6Nkfaudp+au93S7qmnwUEtp/yLsAXPUN1FE1V76z7Eqn8sqxJgeUc0r
	Uk8TAT0Y0oeEplXvLsoUieX6TaC95JvVNjj3QP/S9jE4akg/aMvrGhoIrhND4RdKknlP1s
	ImKyhYXYuGirdnUn6QiePxg5j62zCSjKN5QPRf117LZiWPzRkWg9Dzi5pGtqtA==
Date: Mon, 30 Sep 2024 11:19:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
Message-ID: <20240930111914.4b412581@xps-13>
In-Reply-To: <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
	<20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_021920_802871_5685507A 
X-CRM114-Status: GOOD (  13.68  )
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

SGksCgpwZW5nLmZhbkBvc3MubnhwLmNvbSB3cm90ZSBvbiBNb24sIDMwIFNlcCAyMDI0IDE3OjIy
OjI1ICswODAwOgoKPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPiAKPiBTUEkg
Tk9SIGZsYXNoZXMgbmVlZHMgcG93ZXIgc3VwcGx5IHRvIHdvcmsgcHJvcGVybHkuIFRoZSBwb3dl
ciBzdXBwbHkKPiBtYXliZSBzb2Z0d2FyZSBjb250cm9sbGFibGUgcGVyIGJvYXJkIGRlc2lnbi4g
U28gYWRkIHRoZSBzdXBwb3J0Cj4gZm9yIGFuIHZjYy1zdXBwbHkgcmVndWxhdG9yLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXggOWQ2ZTg1YmYyMjdiLi41MjQ5YzhiMTM5
MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICNpbmNsdWRlIDxs
aW51eC9tdGQvc3BpLW5vci5oPgo+ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29u
c3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2tfc3RhY2suaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3NpemVzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gQEAgLTM0NjIs
NiArMzQ2MywxMCBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0
IGNoYXIgKm5hbWUsCj4gIAlpZiAoIW5vci0+Ym91bmNlYnVmKQo+ICAJCXJldHVybiAtRU5PTUVN
Owo+ICAKPiArCXJldCA9IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGUoZGV2LCAidmNjIik7CgoJ
CQkJCV9vcHRpb25hbCA/Cgo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiAgCXJl
dCA9IHNwaV9ub3JfaHdfcmVzZXQobm9yKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsK
PiAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
