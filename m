Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6708C433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nac/xrIX4WwLE7LQYalkjREB6ueW4chthXC3Gres1IE=; b=SgcKmOZndS8Tgt
	FL1oXpUlHo6BdDhuoTIXkhdD9vUPGXfeQ9ZOUWX5U5JQfHJylmNxMpBabweFoMZjBewVWO/jW2IAv
	NGRgi5tC6JkN7zrBbBJMj0u25fXS5wq1+Wye+07dsbbXInjFtH2WBRddAGx06aGg3ym7T/LgXa5kc
	lbQKoRAuC7iWdq2tTArdlnLY+XVvvJj6Typ3chcLKE+Lafq3dPNu2VZoFQnhIcbGHthETXi6Aw9uz
	3MWHlnnB2P2r981AtCOWmwuWJk80QgA+W1VzNBaqAPlrV0sti26MsQv0GOImnfPno/FznmXE/tsXn
	0woFqNKX9DYz0Ox+Fgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2Qa-00Bkvw-IM; Sun, 03 Apr 2022 15:46:08 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2QO-00BkuE-Dp; Sun, 03 Apr 2022 15:45:57 +0000
Received: by mail-io1-xd2e.google.com with SMTP id p22so8569508iod.2;
 Sun, 03 Apr 2022 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pGyUTVKMo02GKY33McJFWCWUIseC1H085Y7lLhijdJc=;
 b=JJ49hrhhVCU0Gm4xCQ9lxBgLf18xe1UJ+WIknacd4WCSYkq9OE+B9VSOCHU/aapJ42
 PErCF4OxA2tknmH61SbcGBcBz9PY2jJ8WsPBzzijTA3Oeadw+u5uWnWyLO4Z+kPQp8mJ
 Dnqfw854vABsmSSuhmzZm4boVh56jQAqt/T0rO+/E0NRfGIDD7SbUorHRsWIDxiWMXb1
 tOWjF6Yy0K31uQ5XfNp2Y6eN+cqV2EbdIcdfIvMw9VxcS5zBS33xAHRXAHWd2uV4hl1p
 /bvsYK7MGOl0tzu8cyPK4MN5OaShYICYs7ZN7PFc0XZd7QsS/9/yHHAxSQz6F229znE0
 K2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pGyUTVKMo02GKY33McJFWCWUIseC1H085Y7lLhijdJc=;
 b=NFc6AOh5P4l3ZnWA9SUbdbRKhlNjl0HOnpdbjhCUhaUa4uUEoI2NAKBueTeog2dz9w
 nuKWbkHKj3TWV0IpHW8bXEgDwnygq44APkUVYntyc7Vy9YX9WbamTSmY/ngkjebtdkQC
 kMmDRmoDzGMrGnh+TIu3HiAcKprbNja0a9W4DMUugH9RFQepuUyced/GtM6ZFLD3O+8T
 1A0gUcUGG/ox4qeDNwZb4ItEu12geNbWa0NGh7MWYMyJLZzrmMWsH6c2h7nIgu3xmq7S
 f4RuRcev3Fx/fDfJLqgkgugCQJPjPygz0YQQDHuVgqUrs2L3hzjwn/VqqNckpmuT0k4Q
 NmkA==
X-Gm-Message-State: AOAM5331P9jqycAmbVixNoVlxz38AF6rIMSIeg0Umfd7f2pXsWA60Zqh
 5WTDP0r4Gy++ts0mCn1CRlkH2bV4wKpOBzpHpXg=
X-Google-Smtp-Source: ABdhPJxVtmRE6+JACUKYpv+v9aTat7WMhYxwZcAH/zg3oa+UdFpdX0n4dR/yutCA3MbI52TRFosqYTW1JwrmFtaBlgM=
X-Received: by 2002:a5e:9302:0:b0:648:c246:291 with SMTP id
 k2-20020a5e9302000000b00648c2460291mr3633567iom.88.1649000755209; Sun, 03 Apr
 2022 08:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220403131154.1267887-1-gch981213@gmail.com>
 <20220403131154.1267887-4-gch981213@gmail.com>
 <817dda10-39db-adfc-376d-a3d5e037937e@linaro.org>
In-Reply-To: <817dda10-39db-adfc-376d-a3d5e037937e@linaro.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 3 Apr 2022 23:45:44 +0800
Message-ID: <CAJsYDVKYsz7c2yVe7TmPu_7kvBDXTih4+cceLsay2YJm21YntA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: spi: add binding doc for spi-mtk-snfi
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-spi@lists.infradead.org, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, 
 Florian Fainelli <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, 
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_084556_519002_139A0ED3 
X-CRM114-Status: GOOD (  11.79  )
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

Hi!

On Sun, Apr 3, 2022 at 11:37 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> [...]
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7622-snand
> > +      - mediatek,mt7629-snand
>
> One blank line, please.

I'll fix this in the next version.

>
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +
> > +  interrupts:
> > +    items:
> > +      - description: NFI interrupt
> > +
> > +  clocks:
> > +    items:
> > +      - description: clock used for the controller
> > +      - description: clock used for the SPI bus
> > +
> > +  clock-names:
> > +    items:
> > +      - const: nfi_clk
> > +      - const: pad_clk
> > +
> > +  ecc-engine:
>
> The nand-chip.yaml defines a nand-ecc-engine, so how about using that
> one? I know mtk-nand.txt uses ecc-engine, but for new schema better to
> use properties from existing YAML.

The ecc-engine code is shared between mtk_nand.c and this driver, and
the property name is defined in the shared part. I left it as-is so that
existing dt for mtk_nand doesn't break.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
