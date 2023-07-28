Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4C3C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8ae2iGe4idCav71oBnP+UkvWypaz0kmedjZhDoljbI=; b=0x2mC2xkylCGWi
	PZLNez7tM7/iJtNUSPLvHmAfyb7CqJ4mBQah2TjCFbVnXZXO0/UmS/vtx7koPqkWlxodSz6DdtEG/
	njLGU/D22PKCsGKnVG25ps/jB5btQe5BSzdomjzBpjOTNka/b2bBZY+PNG5FpTdmJKFPtVe1TC/H+
	bk9FCokxgS/c5O6RONsSa/RnTPx3Bp/5/PspUqEk5LiVbIN8FDVE3ogtIDDHGXEC1SYe34uLizlC6
	yLnLRHQr9ti3dnAtkjk0OgecsFBkNDH7WNvRlFsfdK5zMvEDUsaQurVnbRwuu3Qkzvw5a4ZRk6gpv
	yX4Y91LAXWsLQNTUWOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPxq-00419d-2A;
	Fri, 28 Jul 2023 16:05:14 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPxl-00418O-0Y;
	Fri, 28 Jul 2023 16:05:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47AE9FF802;
	Fri, 28 Jul 2023 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690560303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOwouwDm/Kasz+cImp4ZpLSYmghBWaSXArlXLO1rpH0=;
	b=ljouRWt14CzNxKdUZLfGcvVcD/MG5DdymZazb90A1RiBoJhkZfx33QMCamA/nq64KgQViJ
	5j94ziGUbCxvMyciw8LIg6YwFQkSf7yHDnrs3zIfxUjdSzdBKykEKG0kWvz/aV8i05xP78
	mqj89PddP7bz5a6JA8nBI8sawR22k7xKkRbiJMjIfLhDef/HPbnKzJyS+UFodCJ+DT53ZN
	A4VJB+/3Z1hacM8uhegA536VPmo5HTtstM9AcUBZ8j7k+5ooOrDw8+C3Kc1ufE3I2crSNT
	VFHW+ZQvhNQgc6+HqrnlnydP17EiBNygti/FGEhzRdi0EfCxPi4SUnCrthjHlQ==
Date: Fri, 28 Jul 2023 18:04:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Varshini Rajendran
 <varshini.rajendran@microchip.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
 ulf.hansson@linaro.org, tudor.ambarus@linaro.org, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, p.zabel@pengutronix.de,
 olivia@selenic.com, a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
 linux@armlinux.org.uk, durai.manickamkr@microchip.com, andrew@lunn.ch,
 jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
 alexandre.torgue@st.com, gregory.clement@bootlin.com, arnd@arndb.de,
 rientjes@google.com, deller@gmx.de, 42.hyeyoo@gmail.com, vbabka@suse.cz,
 mripard@kernel.org, mihai.sain@microchip.com,
 codrin.ciubotariu@microchip.com, eugen.hristev@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Message-ID: <20230728180443.55363550@xps-13>
In-Reply-To: <20230728-floss-stark-889158f968ea@spud>
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
	<c0792cfd-db4f-7153-0775-824912277908@linaro.org>
	<20230728-floss-stark-889158f968ea@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_090509_503366_ADF04ED8 
X-CRM114-Status: GOOD (  19.86  )
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

SGkgQ29ub3IsCgpjb25vckBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMjggSnVsIDIwMjMgMTY6
NTA6MjQgKzAxMDA6Cgo+IE9uIEZyaSwgSnVsIDI4LCAyMDIzIGF0IDAxOjMyOjEyUE0gKzAyMDAs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBPbiAyOC8wNy8yMDIzIDEyOjIyLCBWYXJz
aGluaSBSYWplbmRyYW4gd3JvdGU6ICAKPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBw
b3J0IGZvciB0aGUgbmV3IFNvQyBmYW1pbHkgLSBzYW05eDcuCj4gPiA+ICAtIFRoZSBkZXZpY2Ug
dHJlZSwgY29uZmlncyBhbmQgZHJpdmVycyBhcmUgYWRkZWQKPiA+ID4gIC0gQ2xvY2sgZHJpdmVy
IGZvciBzYW05eDcgaXMgYWRkZWQKPiA+ID4gIC0gU3VwcG9ydCBmb3IgYmFzaWMgcGVyaXBoZXJh
bHMgaXMgYWRkZWQKPiA+ID4gIC0gVGFyZ2V0IGJvYXJkIFNBTTlYNzUgQ3VyaW9zaXR5IGlzIGFk
ZGVkCj4gPiA+ICAgCj4gPiAKPiA+IFlvdXIgdGhyZWFkaW5nIGlzIGFic29sdXRlbHkgYnJva2Vu
IG1ha2luZyBpdCBkaWZmaWN1bHQgdG8gcmV2aWV3IGFuZCBhcHBseS4gIAo+IAo+IEkgaGFkIGEg
Y2hhdCB3aXRoIFZhcnNoaW5pIHRvZGF5LCB0aGV5IHdlcmUgdHJ5aW5nIHRvIGF2b2lkIHNlbmRp
bmcgdGhlCj4gcGF0Y2hlcyB0byBhIG1hc3NpdmUgQ0MgbGlzdCwgYnV0IGRpZG4ndCBzZXQgYW55
IGluLXJlcGx5LXRvIGhlYWRlci4KPiBGb3IgdGhlIG5leHQgc3VibWlzc2lvbiB3aG9sZSBzZXJp
ZXMgY291bGQgYmUgc2VudCB0byB0aGUgYmluZGluZyAmCj4gcGxhdGZvcm0gbWFpbnRhaW5lcnMg
YW5kIHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMgYWRkaXRpb25hbGx5IHRvIHRoZWlyCj4gcmVzcGVj
dGl2ZSBsaXN0cy9tYWludGFpbmVycy4gRG9lcyB0aGF0IHNvdW5kIG9rYXkgdG8geW91LCBvciBk
byB5b3UKPiB0aGluayBpdCBzaG91bGQgYmUgYnJva2VuIHVwPwoKSSB1c3VhbGx5IHByZWZlciBy
ZWNlaXZpbmcgdGhlIGR0LWJpbmRpbmdzICphbmQqIHRoZSBkcml2ZXIgY2hhbmdlcywgc28KSSBj
YW4gZ2l2ZSBteSBmZWVkYmFjayBvbiB0aGUgZGVzY3JpcHRpb24gc2lkZSwgYXMgd2VsbCBhcyBs
b29raW5nIGF0CnRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgc2VlIGlmIHRoYXQgcmVhbGx5IG1hdGNo
ZXMgd2hhdCB3YXMgZGlzY3Vzc2VkCndpdGggeW91IDopCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
