Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326EC0018C
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JewQfMg18iW7SotwY98QCYGmHS4RhBJkiZUImfsMlkM=; b=jWyLAtlr1iZU0z
	DJZCgXt5r+EHqY6omegxfIQqK+8FOPjprB8qWEv9Uj7FZWTpI4MhvJVTGr9WyOSGpkoSgpujs9PnJ
	O8YQ1jS2DmxE3byPu0h+S/ju7T0cSsPdTkqyQlR/FFi8Oy4YEmHwcPUA0ksOuZR+47A0D2iInTKGd
	Ycn3g4uFDp+UExOh87WGtg+g60K+c0Thu8uqQEuZWxIagEirfi7AH79SYXph2QyCRreFFa19yE47t
	/FisCjkkQopqWKxenUxVnFIpiVGyv+xwtjpbGFj7Wh5SCvC318+JZOHtN1RBXpRFuyhdSpNUeuw0x
	DQ2lyHdWyH0OfGjsZTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd7-0041JF-0A;
	Wed, 08 Nov 2023 14:34:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd3-0041GR-2I
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 14:34:03 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso9463785e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 06:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454037; x=1700058837; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcULZ9PGcbiz4pOSYdWqK1KBS4j8l5GIDZ+NaSWycPw=;
        b=aw9Jws80Avxf+2tnZxApMXskPkP5bfB0nBPHiUvQUVRDKKWf3qgNdBr7dXWEVkRl8d
         ZM8h/xEfmhXnntajj4sWQKRWKNKYhzv6xukeEzBU24ez2Vm1DPiJmD3x4d3Uyu2/oght
         aI0al1quTkjqF0XcXoP0DdjDR8+bOBwmmxltfXweMIxgW4c/McLr5Wi5jnhos/AVIDMl
         CIClqTPP+ZepdRSOcyjprPRBYgk4e5is4Zq9IiWvpJUODgcrKz8uDCe7De115N96gamn
         NNsXgjpqZVY3hBltpPINh/1xRpBM1XOGhjsTXCk4GUkikfM9A7uQKmRi0VxKWJai1TyW
         8OWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454037; x=1700058837;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcULZ9PGcbiz4pOSYdWqK1KBS4j8l5GIDZ+NaSWycPw=;
        b=WbxUYFPGq61MhC7gy+T6hKca3B3Su+GYi5y8NoyIt3sS0MIL5y/of1D2xNtertsyzd
         SIK/7F2ouktk/ol3iDYMqi7RpaYZmS5+MFzDGk+Jm8bJWgVRompZaA9Xh3dyktcuMtjV
         Ih10Kr6hPoR3IvmhtJs5waR0hOb+oUbeLZh6AVdt8lJ+hZlfNxeF6mEfvO+O5ozPgt7W
         gY+I1JOoZG7y9oqg0zp1IMqo1Pj7goIohDsGiT6E1inxgHshu5oxPgeuoltnD/Xo7qJy
         fHWK/NVRRWl5tl+HXYhfwD26qTW7wnonk18dgKK8O70t2/L6b/V5x/0ad33H2pHW2Ulk
         2i8A==
X-Gm-Message-State: AOJu0YypNhCceLaVOgn4No3CFyj78RkqHl6GX7eeckpso5kld6EhNdz0
	Gi1zOSe4ckrGLoUu7h2UpiWoSg==
X-Google-Smtp-Source: AGHT+IHfdWgUd7peX98jM5hIRx+rFXqSbrGst/IoGRVbU4s1SKmlHEwnM062t9jx1mAFjSR1p5D80Q==
X-Received: by 2002:a05:6512:31d0:b0:509:2b81:fc40 with SMTP id j16-20020a05651231d000b005092b81fc40mr1835669lfe.9.1699454037158;
        Wed, 08 Nov 2023 06:33:57 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:33:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] Fix polarity and bindings for GPIO-based NAND drivers
Date: Wed, 08 Nov 2023 15:33:48 +0100
Message-Id: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEycS2UC/x2MQQqAIBAAvyJ7bkGtoPpKdDBdaw+ZKEQg/j3pO
 DAzBTIlpgyLKJDo4cx3aKA6AfY04SBk1xi01L1SckTPL14cMwYTHNpZ0e4m6c3goTUxURP+37r
 V+gEN+7w/XwAAAA==
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Howard Harte <hharte@magicandroidapps.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063401_765381_BA13F1C1 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The AMD Delta and generic GPIO-based NAND drivers are using GPIO lines
extensively to communicate with a raw NAND flash.

Some confusion has crept into the naming leading to the two drivers using
inversed semantics differently for pins with the same name.

Fix the situation by naming the pins consistently without any inversion
names (such as nce for a negative active chip enable).

Fix up all in-tree users.

Next rewrite the device tree bindings in YAML schema, and fix up the
single in-tree DTS file (MIPS) to use the new bindings where each signal
is specified explicitly instead of an array with some "blanks" for unused
lines.

Last clean up the GPIO NAND driver to drop use of board file provided
data as no boards using this remain, and use device properties removing
the explicit reliance on device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (6):
      mtd: rawnand: ams-delta/gpio: Unify polarity
      dt-bindings: mtd: Rewrite gpio-control-nand in schema
      MIPS: NI 169445: Fix NAND GPIOs
      mtd: rawnand: gpio: Use device properties
      mtd: rawnand: gpio: Support standard nand width
      mtd: rawnand: gpio: Rename file

 .../devicetree/bindings/mtd/gpio-control-nand.txt  |  47 ------
 .../devicetree/bindings/mtd/gpio-control-nand.yaml | 168 +++++++++++++++++++++
 Documentation/devicetree/bindings/mtd/mtd.yaml     |   2 +-
 arch/arm/mach-omap1/board-ams-delta.c              |   8 +-
 arch/mips/boot/dts/ni/169445.dts                   |  13 +-
 drivers/mtd/nand/raw/Makefile                      |   2 +-
 drivers/mtd/nand/raw/ams-delta.c                   |  60 ++++----
 drivers/mtd/nand/raw/{gpio.c => nand-gpio.c}       | 120 +++++----------
 8 files changed, 251 insertions(+), 169 deletions(-)
---
base-commit: be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
change-id: 20231105-fix-mips-nand-c91ebd80fa4f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
