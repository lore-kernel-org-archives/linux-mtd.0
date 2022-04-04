Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A332C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 10:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agcJMIjqsvGPkUxTUPrLEAmET+sYc9oKJMYuVkNGUmE=; b=A/K+91pvcfjNUH
	5jgYyXnb8qRyBkFp44Tdpl3K7LiCpni8PgQNQ05qc1P0nIjrx3qmqqpGZtnNLkfcA7KufeIXKjYDd
	CcweIueF4weeo93IxokVO9Q8mlSuFQK4RRs8ckU8tBFnpcqBYZaiCA++sJ9rXVgWepIXY0KgV0qwD
	rclL6RQtqvVuwAMLhKXHgfdFfwpsCUx2NwiNb4ZEKZ3CJX/3+lK1EekSohnCoaJvys/3HJ3n+n8MI
	ZYU0aApf0ryoQcLMFAI8CZgElvxp6a5gnIfeT/KQRnWbyTHo+HJ5rG2vuHirUgNd0AmWaVgL6BWw3
	i/ir2spKvJLd4PiGYlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbKMG-00Ed1i-SY; Mon, 04 Apr 2022 10:54:52 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbKLw-00Ecna-Am; Mon, 04 Apr 2022 10:54:33 +0000
Received: by mail-io1-xd30.google.com with SMTP id g21so10652114iom.13;
 Mon, 04 Apr 2022 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rE17aokLscUeZldWdcl+4+hAX8YeB4QD9pUd4GrjIM=;
 b=TtY+/cMcXBcL8IdYOINrQltPY2JNCPfd2Awm3ZptGepcymCrJ3HbII3+X/9Ys3fHuv
 4iCZx4zOnwwrvLnGrZ3sSBV5UeUQRXeGFGiaYmn9YqpxCGlzhG1eRkzW0TxfS5Jm/hM4
 zINrPwRZM7x3FcLUgaHacw3Oz4YJWellZsVpIAyIq8BUnJbGlyraFuEymXpU7UfYdD7r
 +ZDMMIurR+tpkRsVxx2Vac/rQeWxgpYJJTomab6ShmerwgPvcH57JqOw+IjympgRYdgr
 eUsU/pdzW9runBz+psuMNZO6RCjSu8ygZaeOOqn/wggHyW8mamGNKvJKczPXMDuKt85v
 5+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rE17aokLscUeZldWdcl+4+hAX8YeB4QD9pUd4GrjIM=;
 b=1+0gxegzxfif13VqzID8z8FAwxO7GmISfc6ZSEPobySMDHuVi5jB7vkeg3zqdbcq+L
 V3iHNcr3hyiuzCJF3AxOPY/w0NqpEl7kjmYp/SfvLOHhSChCyWoFtSyZ0kuKhxPhg6Vy
 3jG0KOCqTuHHFIC2WNxhWcdPLl/KpT0eUE11EVehPH7z9x79I/u6wyL/QX1gmLF0QrUU
 KUiAHtqIeFmxxVpPFNSkoOMpcLVwOC3xcyUr26Y0TV8wqj5VK6Y6nh0g2o5QF4rk2HdX
 XbTWELS7tGPI7vdtzzffH/U5v0GiK2aQfy4xctdGnrUAQXQ+dydYGW/gPfOdu8P9s12B
 I9YA==
X-Gm-Message-State: AOAM532t0tH0YDqFwFNBu3dxjPB7+gJKssccTJ9HSuM8hodIEJbMkD1Q
 sR/SQGg0J9wlnlCRKL0AXCsJDcX+dg3Ctmbi1ig=
X-Google-Smtp-Source: ABdhPJy6dWkX7SvStDXsR6rYoheGmMRXvU/7VnD9jCFC5zDIQw6Mmc9tyZgib54eWMjb5UYf/h7INW0fl0bt4WedkxE=
X-Received: by 2002:a05:6638:d16:b0:323:63cd:c144 with SMTP id
 q22-20020a0566380d1600b0032363cdc144mr11635735jaj.76.1649069668361; Mon, 04
 Apr 2022 03:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220404040153.1509966-1-gch981213@gmail.com>
 <20220404040153.1509966-3-gch981213@gmail.com>
 <20220404095937.20089db7@xps13>
 <CAJsYDVK6ya7FR90CtAjbpbF-_+c0GVnsKsN=1wYaoBFx=ysUtQ@mail.gmail.com>
 <20220404122824.63a1c857@xps13>
In-Reply-To: <20220404122824.63a1c857@xps13>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 4 Apr 2022 18:54:17 +0800
Message-ID: <CAJsYDVJXH0MUB2wPydzqFgF8Y82HsUY7FLu1duCOCyVO-oXZqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] spi: add driver for MTK SPI NAND Flash Interface
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, 
 Florian Fainelli <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_035432_393852_357DDE5C 
X-CRM114-Status: GOOD (  36.95  )
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

On Mon, Apr 4, 2022 at 6:28 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> [...]
> > > > +
> > > > +     // This driver ignores any ECC capability configured by user or
> > > > +     // requested by the nand chip because the BootROM and MTK bootloader
> > > > +     // expects the page format to be the exact one as calculated in
> > > > +     // setup_pagefmt.
> > >
> > > I don't like this :)
> > >
> > > I understand that the boot partition might have specific constraints,
> > > but other partitions (or if we don't use the NAND to boot?) should
> > > probably be usable with other ECC schemes.
> >
> > In this controller, the ECC step size is fixed and it can only change
> > ECC strength.
>
> That's fine.
>
> > The calculated ECC correction capability is the max
> > possible one supported by the controller.
> > I still want the default behavior to match the boot partition
> > requirement,
>
> That is okay, but that does not mean you can only support this one.
>
> > because we can't just tell end-users to customize
> > their dts by taking apart their device and figure out which flash
> > is used.
>
> They don't have to do so. In theory they should not request anything,
> the core would take care of all of that. But they can request specific
> values by using the DT and you must follow them in the driver.
>
> On his side the core is responsible of telling you which strength
> should be used otherwise and the driver is expected to use it.

The core provided ecc strength may be smaller than the
calculated one. e.g. A nand chip may only have a requirement
of 8/512bits ECC. But if it has a 2k+128 pagesize, this
controller can do 12/512bits ECC and the bootrom expects the
latter.

> You should take the user requirements first. If there are no
> user inputs, you should in theory look at the device's requirements.

I'll take the user requirements if there is one. If there isn't, I'll
follow the calculated strength instead of the device requirement
so that user doesn't have to specify a custom strength in dt.

> [...]
> > > > +static struct nand_ecc_engine_ops mtk_snfi_ecc_engine_ops = {
> > > > +     .init_ctx = mtk_snand_ecc_init_ctx,
> > > > +     .prepare_io_req = mtk_snand_ecc_prepare_io_req,
> > > > +     .finish_io_req = mtk_snand_ecc_finish_io_req,
> > >
> > > I believe you need to take care of the bounce buffer in the exit path?
> >
> > No. The buffer should be left there for non-ecc spi-mem operations.
>
> AFAIR you initialize the buffer in the ECC part, so if it must be used
> without ECC you should probably allocate it for the SPI controller.

I did. the setup_pagefmt is called once with the minimal page+oob size
in probe.

> In
> any way, you need to free that memory at some point (when removing the
> driver).

I was using the devm api for this allocation so kernel should take
care of that.

I'll change the DMA to use streamed API in the next version to avoid
an extra memory copy in reading, and the allocated buffer will be
freed in remove().

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
