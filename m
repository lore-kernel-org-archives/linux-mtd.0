Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D52C3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQkyH7UeHHcZTHTPdX/jfMCFy6fliQeTX0uzOYjnqJM=; b=k5i8yCNnS4A/QA
	lmYOgL8Ut4iOWLyUIxc8IdWQufS0AbSqBSBjbmpotigpjcx+q/KHanfVqzSQQQNXvdRpmNzXFno97
	ucMNwR+4qki42d+fun5Ew7xISoo7APfKOwOTMm5aHXGAUo/2orMArY5BSCCFKPx3s35V0sIV7Rm2K
	bpUqKbPH7quR7awbgu2YIpw3cSBZ5l5ORjpzOUy2wSk3dtSAUr1N/6ajh0JEmccJyHR4hzjQPLPxJ
	nuCcZw00r2eIqxDGCasMTGyv7Y10yhwD1d8WnpguHdPsO92JPIsGbcTrnO60UdQByy0BNudMaZL99
	uVQzK+a7bUwJIbsKtsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWvk-0000000AZOs-2UDH;
	Wed, 10 Jul 2024 13:00:20 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWvR-0000000AZHj-0ECj
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 13:00:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso61556921fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2024 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616398; x=1721221198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=k9GxeekJN/OHGieQMozZ/klZ/pjX1/rXuxt2rEK+XDJXpwGZS3zL0JXjs2BLxO9Y+P
         TnVwOx7suUGrTiKN37DQ3p2F3+Xzz867vMg78txp+w7+znjsG+9AGjFk5f4t98bqIE7F
         JJh16xZ0Wu13NuCMofknFiIrOM0873mKRHUtEmBdBzIhJaVJgbHLqVaJzbFsqS3o4Y/J
         twy0CwkSEa/TMjRXlNgObW+D3CDUHu/d9F+I9JPj/lT1CCzMdM+K7n12PHcJa80BEsHH
         fJ+My4W3urEKFzRk4oEu06Q3buSIT65PNMmW+FKd1aeARqzJNAhdMcLADCvVXLV8apTp
         8eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616398; x=1721221198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=PUhZD6vwzGE2t+BP/E23ORLPwCeXsmB2XclMK8oj7u5uMBzz+JpByhm4VSbdx/wy+w
         nUFwimVBDJO2r8W400ir0UfQz5oQblsRFuUC7JZ/0/4IIDgB7km2JcobWJSKzAP1elXP
         V54clOxhqRMw+U66MD31qK27JaM31cXqQcvP+uTWtuPRjpy7XLbpTg+MS7GhVf4W9wbK
         4sCFnV286U728sJDlGBV0SZDhGwy2ZQ8iShh3vjErwqiY5zxyzKTNi1kVcjeNch5Rozg
         VXGoNui96+Dz2AoS73nhJjUa3ZVDg5DnomZJshfCtiwIVUAaWYgSqL7usO06kfpBa4DX
         0Jjg==
X-Forwarded-Encrypted: i=1; AJvYcCVKR5IIvZwYRe6o1++xl9mdgKvikrTdDycRYXTvwVTz5ACaDIU/QIjU4hP9WMG2R6kfudAgNDtNIahQm4MTlEL4k4AoQOTQqPb2wteIZw==
X-Gm-Message-State: AOJu0YywMKwBeKmwabZfiYmDQrwJX10WdyLLB3xuM6MUKemfrpWtoVmB
	fL2hjzDIYTMur3OJaJK2PPkWglSzCwShUApxnTSPXcVzVJ7KJRExrpTUWpoU9UzI1xwugFChM8P
	QTjWgWxwiYtuvIuYuGet+LWXOuauCvJbm1+J2+Iov64QfEPGP
X-Google-Smtp-Source: AGHT+IH/j0tB3q6Oob0h+dYBea8dzUqqOODjZONtdFvf3j/P6dPoyQJkhUenc2mYLdwUqlwO12I2J5bpi1srvsWqmLs=
X-Received: by 2002:a2e:b046:0:b0:2ee:83f7:8b32 with SMTP id
 38308e7fff4ca-2eeb30dc45amr34980521fa.21.1720616398404; Wed, 10 Jul 2024
 05:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de> <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 14:59:47 +0200
Message-ID: <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_060001_303299_D7AD5BFC 
X-CRM114-Status: GOOD (  13.66  )
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

T24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgMjo0OeKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMSwgMjAyNCwgYXQgMTU6NTMsIE1hcmNvIEZl
bHNjaCB3cm90ZToKPiA+IFRoZSBFRVBST01fQVQyNCBLY29uZmlnIHN5bWJvbCBpcyBtYXJrZWQg
YXMgZGVwcmVjYXRlZC4gTWFrZSB1c2Ugb2YgdGhlCj4gPiBuZXcgS2NvbmZpZyBzeW1ib2wgdG8g
c2VsZWN0IHRoZSBJMkMgRUVQUk9NIGRyaXZlciBzdXBwb3J0Lgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiAtLS0KPiA+ICBh
cmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcgICB8IDIgKy0KPiA+ICBhcmNoL2Fy
bS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcgICB8IDIgKy0KPiA+ICBhcmNoL2FybS9jb25m
aWdzL2F0OTFfZHRfZGVmY29uZmlnICAgICB8IDIgKy0KPiA+ICBhcmNoL2FybS9jb25maWdzL2F4
bTU1eHhfZGVmY29uZmlnICAgICB8IDIgKy0KPiA+ICBhcmNoL2FybS9jb25maWdzL2RhdmluY2lf
YWxsX2RlZmNvbmZpZyB8IDIgKy0KPiA+ICBhcmNoL2FybS9jb25maWdzL2lteF92NF92NV9kZWZj
b25maWcgICB8IDIgKy0KPiA+ICBhcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25maWcg
ICB8IDIgKy0KPiA+ICBhcmNoL2FybS9jb25maWdzL2l4cDR4eF9kZWZjb25maWcgICAgICB8IDIg
Ky0KPiA+ICBhcmNoL2FybS9jb25maWdzL2tleXN0b25lX2RlZmNvbmZpZyAgICB8IDIgKy0KPiA+
ICBhcmNoL2FybS9jb25maWdzL2xwYzE4eHhfZGVmY29uZmlnICAgICB8IDIgKy0KPgo+IEFwcGxp
ZWQgdG8gc29jL2RlZmNvbmZpZywgdGhhbmtzCj4KPiAgICBBcm5kCgpObyEgV2h5PyBUaGlzIGlz
IHN0aWxsIGJlaW5nIGRpc2N1c3NlZCBhbmQgaXQncyBub3QgY2xlYXIgaXQgd2lsbCBldmVuCm1h
a2UgaXQgdXBzdHJlYW0uCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
