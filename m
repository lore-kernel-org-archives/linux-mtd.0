Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E96C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29B461241
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C29B461241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYmlSqhiBFE+oXzAggie3qfYSpQe9PYzsapsyY75brI=; b=0BQj4OLiZEzrNg
	hSi/VE1xwnzjYq57cVHi9dFhD93jD5L7ULKKwNYTAPzWY5ki+oD9uBSWRX3IjNga6NJo67z20MA0H
	pgFToxzJu75k87ijZY59vTHszOnRnLluswII3QC8AdXWXDofkSdkZ3YdYdkADcvVLZj7KcVMcdw9+
	2DxgKSZIUYzp3Tb/NCpyDXNB79GVxZ+zUCF24JohyPDytlDz3eZHoGOjHmk6yI8DLOjzf+mKPTpRM
	jL2dIPHLngpnz60vzGQuYS4DX4nJ87b0FIOfuUGkrVpnFLV/yY2BjKm9ubp8Yv1pM3hMtY4fFV7CU
	TsZdixhDEJhO2BiCzYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo0Ph-00A0sy-Hx; Fri, 19 Nov 2021 09:42:33 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo0Pe-00A0sC-Jo; Fri, 19 Nov 2021 09:42:32 +0000
Received: by mail-vk1-f170.google.com with SMTP id q21so5551254vkn.2;
 Fri, 19 Nov 2021 01:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kctW9Zk6L95r7ERn3VUjwJRtDaEfXk5crM2DrX9uDGM=;
 b=AqEn0JGmZchBMyrCk+79qLXBKEFpItt7TacIeu2ALJIW1cZzbWwZ8GmgAVWoBWIfnF
 O7gmMHUaTMYxEE3D9aVLLt8wE6XOOhn8jbOdFvRI4eWH9ezrG7HA8eyr0SYqwoqrx9da
 8rGe9g+dzDspOpcitdaE88WylbZPJ6TLYMzhq+TWRc0kCvWjSkjCY/FBpXit5VPuiKux
 xidOnOGa4pMyz9N4SPU/hjI2ipRsSaWNsA51n3u90j/jwedXYyMHqyjwUoFBnJgZ8+kh
 BuAc5s0tdYtSBeIEaRUa8Xw1eO8ZtebKCxg+HwhvJe0RD/FUJPT1ZqBst/RCzb/W7FuK
 WzIQ==
X-Gm-Message-State: AOAM532w3J5F/pEI7WIl9i6AlYoPs/alAuqWCVhd9jTbIkP5zWFeCn4X
 b+/vP3Two8N24Gsab/acHDqKQc2i2iZluQ==
X-Google-Smtp-Source: ABdhPJx74oy9T4wegnWEysHGiXHVfHMFLktC7bNg7jkGdVZTsTb7+fEF2WTdjfublEfllCHIpBwFFg==
X-Received: by 2002:a1f:20c2:: with SMTP id
 g185mr112967366vkg.25.1637314948745; 
 Fri, 19 Nov 2021 01:42:28 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id i24sm1335564vkk.5.2021.11.19.01.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:42:28 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id t13so19974614uad.9;
 Fri, 19 Nov 2021 01:42:28 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr47040755uaq.114.1637314947944; 
 Fri, 19 Nov 2021 01:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-3-miquel.raynal@bootlin.com>
 <CAMuHMdUTj_kHV6=fMJ=CjiHjBSi_TrnrjeT0BdaHkONHPxwnQA@mail.gmail.com>
 <20211119102340.05f2f3e4@xps13>
In-Reply-To: <20211119102340.05f2f3e4@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Nov 2021 10:42:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa41F-E_0Gfw0S25NEyuDMDzDVUEWknw4nVCNm4mG7eQ@mail.gmail.com>
Message-ID: <CAMuHMdVa41F-E_0Gfw0S25NEyuDMDzDVUEWknw4nVCNm4mG7eQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, 
 Milan Stevanovic <milan.stevanovic@se.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Gareth Williams <gareth.williams.jx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_014230_678523_66940C8B 
X-CRM114-Status: GOOD (  38.13  )
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

Hi Miquel,

On Fri, Nov 19, 2021 at 10:23 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:55:53 +0100:
> > On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > Introduce Renesas RZ/N1x NAND controller driver which supports:
> > > - All ONFI timing modes
> > > - Different configurations of its internal ECC controller
> > > - On-die (not tested) and software ECC support
> > > - Several chips (not tested)
> > > - Subpage accesses
> > > - DMA and PIO
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > --- /dev/null
> > > +++ b/drivers/mtd/nand/raw/rzn1-nand-controller.c
> >
> > > +static int rzn1_read_subpage_hw_ecc(struct nand_chip *chip, u32 req_offset,
> > > +                                   u32 req_len, u8 *bufpoi, int page)
> > > +{
> > > +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> > > +       struct mtd_info *mtd = nand_to_mtd(chip);
> > > +       struct rzn1_nand_chip *rzn1_nand = to_rzn1_nand(chip);
> > > +       unsigned int cs = to_nfc_cs(rzn1_nand);
> > > +       unsigned int page_off = round_down(req_offset, chip->ecc.size);
> > > +       unsigned int real_len = round_up(req_offset + req_len - page_off,
> > > +                                        chip->ecc.size);
> > > +       unsigned int start_chunk = page_off / chip->ecc.size;
> > > +       unsigned int nchunks = real_len / chip->ecc.size;
> > > +       unsigned int ecc_off = 2 + (start_chunk * chip->ecc.bytes);
> > > +       struct rzn1_op rop = {
> > > +               .command = COMMAND_INPUT_SEL_AHBS | COMMAND_0(NAND_CMD_READ0) |
> > > +                          COMMAND_2(NAND_CMD_READSTART) | COMMAND_FIFO_SEL |
> > > +                          COMMAND_SEQ_READ_PAGE,
> > > +               .addr0_row = page,
> > > +               .addr0_col = page_off,
> > > +               .len = real_len,
> > > +               .ecc_offset = ECC_OFFSET(mtd->writesize + ecc_off),
> > > +       };
> > > +       unsigned int max_bitflips = 0;
> > > +       u32 ecc_stat;
> > > +       int bf, ret, i;
> >
> > unsigned int i
>
> Strangely I'm used to always set my loop indexes as signed integers,
> but I'll happily change that everywhere in the driver before
> re-submitting.

It depends.  Some of the upper bounds are signed, as dictated by some
field in a struct.

> > > +static int rzn1_nfc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct rzn1_nfc *nfc;
> > > +       int irq, ret;
> > > +
> > > +       nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> > > +       if (!nfc)
> > > +               return -ENOMEM;
> > > +
> > > +       nfc->dev = &pdev->dev;
> > > +       nand_controller_init(&nfc->controller);
> > > +       nfc->controller.ops = &rzn1_nfc_ops;
> > > +       INIT_LIST_HEAD(&nfc->chips);
> > > +       init_completion(&nfc->complete);
> > > +
> > > +       nfc->regs = devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(nfc->regs))
> > > +               return PTR_ERR(nfc->regs);
> > > +
> > > +       rzn1_nfc_dis_interrupts(nfc);
> > > +       irq = platform_get_irq(pdev, 0);
> >
> > platform_get_irq_optional()
> >
> > > +       if (irq < 0) {
> >
> > What if this is a real error, or -EPROBE_DEFER?
>
> If it's a real error I believe we should still fallback to polling? Or
> do you prefer to only use polling on a fixed condition?

It's debatable: in this case, you have the option to fallback to polling if
it is a real error, in other drivers you haven't.  If it fails for real here,
it will probably fail for real in other drivers, too.

> > > +       {} /* sentinel */
> > > +};
> > > +MODULE_DEVICE_TABLE(of, nfc_id_table);
> > > +
> > > +static struct platform_driver rzn1_nfc_driver = {
> > > +       .driver = {
> > > +               .name   = "renesas-nfc",
> >
> > Perhaps s/nfc/nandc/ everywhere, to avoid confusion with the other nfc?
>
> There are many NAND controller drivers that are abbreviated with nfc
> because it's short and easy to write while still precise, but I have no
> issue rewording nfc into nandc if you prefer.

My main worry is that we ever get a "renesas-nfc" driver for Near
Field Communication.  Both drivers will have the same name, which
will still work with DT (board files are dead), but the output from
dev_*() may be confusing.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
