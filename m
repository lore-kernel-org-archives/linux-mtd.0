Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64E2C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KNV9xT1M5fDYkTj+rAYCYYafTmjUV+wgqBK+sGo2pQ=; b=40gP3ditC7QV3G
	rbDhqdD2pnyyU2Jxq+JiAVcNXY3vZ+1FLGgOrSCGzvqSjoGcSrmO0+W8uGjWl4t89elrb9qoKThoB
	BHBz6s4ERGqFvJWDiKTikOjTqhJQGCYmapqmNMFBmMP4sRy1l0yZpYLvdVUT1GcknxvGxRwF51LPa
	/2NIDsgQ8mQ7rQGgacdkYtD8I/6aeNGR187HRYmLeYT4gpf+EZgJtmyhdNec2XF69jzpPAmBBYBgh
	YpTnUh+CzKyFtREqOeefs+0k7k8wXeSJZ8cgUvdxRGUsE4WP1hX4+A80W7Ut9MslzbTjc7bqMmnAl
	Uz4xhDR2uZFbP2E7OESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKY5L-000000082hJ-0TOH;
	Fri, 21 Jun 2024 06:49:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKY5G-000000082gX-3S2M
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 06:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718952558; x=1750488558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ofIaO25cvMoHiEwlbr15WgWS4pevjTp+4wBTNnE0AQ4=;
  b=ildtduokDQhaoOycKspSBhV7PVEXgzbjMiiq+2hYSSa3Lc4wsdPgI33X
   iqmn9Rw6hDz6h8U+t6jH+1NGiUERjhMdg3VwbdnNrjcSR9gRcGXgMdJDc
   qyEtjTHqCgaWTclGdf/YGZjvF6NVe2i1Q9V3hiXz3AXZxLVqPMIkf7l1C
   JCSA44FTLmYDGotPBq3v8ZaM6LnXZx5iL/hoU/swhTEh3IRuCQP3VmJnm
   bsH+HzcBdB6bKd40pxj8zZBnOnA8wc7qsp9VKwcxq6WmoyhhrNNMYSa2x
   ZoUvsldKn1MJ3IzFWuxh8TnolCYI518Y4a8N+FxTggSC7nEpM7O2T2X06
   Q==;
X-CSE-ConnectionGUID: QuE0I6vzSzGK02TNZixP0A==
X-CSE-MsgGUID: KW30Qy6mQ7qWIxEmSjiHsg==
X-IronPort-AV: E=Sophos;i="6.08,253,1712613600"; 
   d="scan'208";a="37513105"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jun 2024 08:49:14 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17D46167716;
	Fri, 21 Jun 2024 08:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718952550;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ofIaO25cvMoHiEwlbr15WgWS4pevjTp+4wBTNnE0AQ4=;
	b=DS7PaVGfnx1mrywqJiDc+ZfAVB+TnBsIILY4g7ygauuN/DJ6jKjuAESovdhwVjM6FSDWVM
	SkkP6tb9yLnQgIONZmWIGQ2HS7OmbyaXrSVsOsaQqQ71DIyOMZD3zjBx4V/iTvB74ETgbV
	yu4e/xmWDk7Em2uwEleeFCIS1KCgrzTvqUZahOGOI6UrFCCmI9XSZEBt0strVnOP6N6CmV
	aYns+24tq5Z7OgEEGT0wztkZCIlBk2hnMXqF9QPJj+7r8LXBXPqwhbCFNAQnxItE33zmqk
	zl7sM6N+L0URTBmDAEEPT59oW2v4SxvZ3E8dt0KWNWnp0DTyIRRY+BDA2NZegg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Thorsten Scherer <t.scherer@eckelmann.de>, Marek Vasut <marex@denx.de>, Imre Kaloz <kaloz@openwrt.org>, Andrew Lunn <andrew@lunn.ch>, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM devices
Date: Fri, 21 Jun 2024 08:49:09 +0200
Message-ID: <23574950.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240604074231.1874972-1-mwalle@kernel.org>
References: <20240604074231.1874972-1-mwalle@kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_234919_558828_F3A71B6C 
X-CRM114-Status: GOOD (  28.40  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi everyone,

sorry for being late to the party. I just noticed this discussion while
reading [1].

Am Dienstag, 4. Juni 2024, 09:42:31 CEST schrieb Michael Walle:
> These devices are more like an AT25 compatible EEPROM instead of
> flashes. Like an EEPROM the user doesn't need to explicitly erase the
> memory, nor are there sectors or pages. Thus, instead of the SPI-NOR
> (flash) driver, one should instead use the at25 EEPROM driver.
> =

> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Cc: Thorsten Scherer <t.scherer@eckelmann.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Flavio Suligoi <f.suligoi@asem.it>
> ---
> The referenced binding only supports the true AT25 compatible EEPROMs
> where you have to specify additional properties like size and page size
> or cypress FRAM devices where all the properties are discovered by the
> driver. I don't have the actual hardware, therefore I can't work on a
> proper driver and binding. But I really want to deprecate the use of
> these EEPROM like devices in SPI-NOR. So as a first step, mark the
> devices in the DT bindings as deprecated.
> =

> There are three in-tree users of this. I hope I've CCed all the relevant
> people. With the switch to the at25 driver also comes a user-space
> facing change: there is no more MTD device. Instead there is an "eeprom"
> file in /sys now, just like for every other EEPROM.
> =

> Marek already expressed, that the sps1 dts can likely be removed
> altogether. I'd like to hear from the other board DTS maintainers if
> they seem some problems moving to the EEPROM interface - or maybe that
> device isn't used at all anyway. So in the end, we can hopefully move
> all the users over to the at25 driver.

So instead of spi-nor you want to use at25 for this MRAM devices?
AFAICS at25 is a spi only driver, but spi-nor is a spi-mem driver. So I am
wondering if at25 driver is capable of using QSPI hosts.
Everspin EMxxLXB devices are capable of running in xSPI modes.
Regarding QSPI (DSPI/OSPI as well) I assumed spi-nor is a given, but maybe
I am completely wrong here. Maybe someone could clarify this.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-kernel/20240405100104.480779-1-f.suligoi@=
asem.it/

> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/D=
ocumentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6e3afb42926e..2dccb6b049ea 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -21,7 +21,6 @@ properties:
>                (m25p(40|80|16|32|64|128)|\
>                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
>                atmel,at25df(321a|641|081a)|\
> -              everspin,mr25h(10|40|128|256)|\
>                (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635=
e)|\
>                (mxicy|macronix),mx25u(4033|4035)|\
>                (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> @@ -42,6 +41,14 @@ properties:
>                - spansion,s25fs512s
>            - const: jedec,spi-nor
>        - const: jedec,spi-nor
> +
> +      # Deprecated bindings
> +      - items:
> +          - pattern: "^everspin,mr25h(10|40|128|256)$"
> +          - const: jedec,spi-nor
> +        description:
> +          Deprecated binding, use Documentation/devicetree/bindings/eepr=
om/at25.yaml.
> +        deprecated: true
>      description:
>        SPI NOR flashes compatible with the JEDEC SFDP standard or which m=
ay be
>        identified with the READ ID opcode (0x9F) do not deserve a specific
> =



-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
