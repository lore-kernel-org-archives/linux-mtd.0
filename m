Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E545C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDpCULA7RRPxzXRlQv4uaPsNaDFRlE1wfY9UNYN6pbY=; b=3hb245gVA+KYbj
	H+jK0CbUlISG0UbAZRtzjhvpo2/IMZpa3ex9u7rbDo1xQChF2LOiO5inaPpZovKi1pBC4C43pH5KQ
	vUXj4BuktvF17wRzcd903msHO7ZlyyUt7xYjKSy4qfR/asf6exW+0K2VJ2vj82VBPDKfuJ72o6hMF
	a14cvcEvvQLwjgD2qDNv8gBdq2/FnAMSSiY2OPGdTu3aglTt7BzT4PTj5OPRUodRyzB7yYphhDMhY
	S3rfPEQcJE1WSydTDKquLPBxZ32zW2H82TonUh4feNpVcJwJLD1ccCl3dfwabeCdM0VIwBp/E416z
	3uQ1FkEVP1ENxWxzTjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSaG-0097mM-I7; Tue, 22 Feb 2022 10:39:52 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSaC-0097j6-Ig
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 10:39:50 +0000
Received: by mail-vk1-f169.google.com with SMTP id k9so3534967vki.4
 for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2022 02:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qyGyBDnJ7ed79Jt+fCdZ4lhHfeabojxBlr+Z2wBlxFo=;
 b=mQEwlCPD/nDEmrooZckdZBAODRr46UaLxYl2zFhGBr2TE1XHWNqP8QTjwKb+eaCLTn
 cUSwVVK6cyJqyT2KtaXhNdZDdit9y1XjdtEIairGExUErb2p/s+tD1pgDJNViHx2O0sK
 5PZQkIpLBIemCjaEdynI5aeynyFUdwH6I7TAMCn4nIliLzXJB0j0dZMgUFQuUQznh1DP
 PhKduqlMnjzKn4cSdM9ox84oONFIrCx9BTmgmyfhPHX3/SEvQjdQMQyPapK01MGrSb+m
 2y6LQd4ZBTx6Vn/o/S3AhB4nQSFZvHXOr4UN9QvGmuQ9q8HQuTTVS4XN1RRs18KchsxP
 CK2w==
X-Gm-Message-State: AOAM531f9iAS/JChaSx8ztQ9QRnUmGtYPvvlqjBDs+Wz7HYN4dlHXzLH
 MgQkwA3tjdXcWOVCQ2l1ELbEfCOXXfCnVQ==
X-Google-Smtp-Source: ABdhPJx3X9Oz8pUdSFo1ZrzkIH58NY0fbeMmbBAVOSkRevsYA/jZ+7GAz2p7qnFIDaNs8AOV5cdmeQ==
X-Received: by 2002:a1f:6ec5:0:b0:31e:30a7:5518 with SMTP id
 j188-20020a1f6ec5000000b0031e30a75518mr9911758vkc.15.1645526385966; 
 Tue, 22 Feb 2022 02:39:45 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id l187sm9208581vke.6.2022.02.22.02.39.45
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 02:39:45 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id n142so10130633vkf.5
 for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2022 02:39:45 -0800 (PST)
X-Received: by 2002:a05:6122:8c7:b0:32d:7e3:96c8 with SMTP id
 7-20020a05612208c700b0032d07e396c8mr10270146vkg.7.1645526385162; Tue, 22 Feb
 2022 02:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
 <20211216111654.238086-15-miquel.raynal@bootlin.com>
In-Reply-To: <20211216111654.238086-15-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 11:39:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJHAx4HptRRqfhe74mkfm+-oKp0qtd9Ns7Moh5omWehg@mail.gmail.com>
Message-ID: <CAMuHMdXJHAx4HptRRqfhe74mkfm+-oKp0qtd9Ns7Moh5omWehg@mail.gmail.com>
Subject: Re: [PATCH v6 14/28] mtd: nand: mxic-ecc: Add Macronix external ECC
 engine support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, 
 Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_023948_651674_ABE60DEC 
X-CRM114-Status: GOOD (  25.11  )
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

On Thu, Dec 16, 2021 at 12:48 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Some SPI-NAND chips do not support on-die ECC. For these chips,
> correction must apply on the SPI controller end. In order to avoid
> doing all the calculations by software, Macronix provides a specific
> engine that can offload the intensive work.
>
> Add Macronix ECC engine support, this engine can work in conjunction
> with a SPI controller and a raw NAND controller, it can be pipelined
> or external and supports linear and syndrome layouts.
>
> Right now the simplest configuration is supported: SPI controller
> external and linear ECC engine.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -46,6 +46,12 @@ config MTD_NAND_ECC_SW_BCH
>           ECC codes. They are used with NAND devices requiring more than 1 bit
>           of error correction.
>
> +config MTD_NAND_ECC_MXIC
> +       bool "Macronix external hardware ECC engine"
> +       select MTD_NAND_ECC
> +       help
> +         This enables support for the hardware ECC engine from Macronix.

I guess this is a licensable IP core, which can appear anywhere, so
we don't have a proper platform dependency to add here?

> +
>  endmenu
>
>  endmenu

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
