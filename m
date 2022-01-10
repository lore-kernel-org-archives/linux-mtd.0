Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8036C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4VYaj97v3j20mTD37/pbFS1Zxm3JySKpGOwxe2el7U=; b=x3ZrSjeS3UVs7T
	LsMq+tDOEpHHNdWuB4rF3RkzFTJjGN5FUvYa+3Qv2fgr2bAN+W575jV9FcdJNno3Ge9Jb5pocbpEw
	e9f11w+XgvuQCF181CE6P6Ttq/L4J1kDaOlsywz78JgaRBJJyr8c//h3ZZJHSagIoYIWX5bjVN0Ea
	bUgHxvOxAXj1/spXGd3D4HA3AOun1wQoW+7UPEY7BVkTqqZhJgrhBz/vaQtg5tVng0GWeNMxxzbwJ
	4a+j4t5u2Fvjt9V6a/9pdwE+Arf8hAYDpO73hLGsxBiBEE1zpg0QqNieNfBBmR05FD+FwqgB7A2yX
	8EMUNx+NmhfDGJpzzMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6uWW-00BVE5-6k; Mon, 10 Jan 2022 13:15:44 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6uWT-00BVDC-3T
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 13:15:42 +0000
Received: by mail-ua1-f44.google.com with SMTP id y4so23363018uad.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2022 05:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCLij+M4QbVKhJoSmDxvaDdqsjBqOrzTtN9IFLbiL0I=;
 b=0c2LmNnow7vPbMBXDG+83vQIptmdUSrPJngsGjtPk9uXAXBT7Nyh6XlGmB2v1VViQQ
 KWz6JJ9DNK+FM1vpF3vH4i7EcpLG2LS0CoIicL6hZq/WOzGt9tnyqlLw8CLTaLK4WYB4
 V81PAUxjpEzXHQqEfq4VfKgpLzNmPMCPqApCSpYMV3YAPWMW6RDeb9xF73M4j/VGLqTq
 Fwpaqz5kzjyAGyjHR0MKRR8anCF3ojs6t32vMTLv3JW9q8HUt0LRpF8V4n1fF4njrh0p
 bjDHJSUFJ0UJp9x3LcMMa4xUUaqibF/N9cxd0mFsyE+cQkskT5dEQdiNMTb9UCu1aWB2
 ULIg==
X-Gm-Message-State: AOAM532mCMnvr/ED9wHni7WBGVUV0QRAzRgsOOS9vCyzPFb2zaJEhbRV
 r2fuoyJFGNSe5OsFZMYEuK9bNQpzuW8lvg==
X-Google-Smtp-Source: ABdhPJz+Mvdg3Z7ErjreI2j0nWKsXc24mJy0xnHXkSUrWsCDO/YlIMYY4ehwqhcNumxJ4xDJdM1irQ==
X-Received: by 2002:ab0:698c:: with SMTP id t12mr26741757uaq.142.1641820539180; 
 Mon, 10 Jan 2022 05:15:39 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id g43sm3834726uae.2.2022.01.10.05.15.38
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:15:38 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id m15so8944609uap.6
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2022 05:15:38 -0800 (PST)
X-Received: by 2002:a67:c81c:: with SMTP id u28mr24708091vsk.38.1641820538248; 
 Mon, 10 Jan 2022 05:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
In-Reply-To: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 14:15:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
Message-ID: <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and debugging
 purposes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_051541_174279_87F92D79 
X-CRM114-Status: GOOD (  31.48  )
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

On Thu, Nov 18, 2021 at 12:47 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> When developping NAND controller drivers or when debugging filesystem
> corruptions, it is quite common to need hacking locally into the
> MTD/NAND core in order to get access to the content of the bad
> blocks. Instead of having multiple implementations out there let's
> provide a simple yet effective specific MTD-wide debugfs entry to fully
> disable these checks on purpose.
>
> A warning is added to inform the user when this mode gets enabled.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch, which is now commit 67b967ddd93d0ed5 ("mtd:
Introduce an expert mode for forensics and debugging purposes")
in mtd/next.

> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -2365,6 +2365,14 @@ static struct backing_dev_info * __init mtd_bdi_init(const char *name)
>         return ret ? ERR_PTR(ret) : bdi;
>  }
>
> +char *mtd_expert_analysis_warning =

const

> +       "Bad block checks have been entirely disabled.\n"
> +       "This is only reserved for post-mortem forensics and debug purposes.\n"
> +       "Never enable this mode if you do not know what you are doing!\n";
> +EXPORT_SYMBOL_GPL(mtd_expert_analysis_warning);

Shouldn't this depend on CONFIG_DEBUG_FS?

> +bool mtd_expert_analysis_mode;
> +EXPORT_SYMBOL_GPL(mtd_expert_analysis_mode);

Do you really need to export these two symbols?

> +
>  static struct proc_dir_entry *proc_mtd;
>
>  static int __init init_mtd(void)
=
> --- a/drivers/mtd/nand/core.c
> +++ b/drivers/mtd/nand/core.c
> @@ -21,6 +21,9 @@
>   */
>  bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos)
>  {
> +       if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
> +               return 0;
> +
>         if (nanddev_bbt_is_initialized(nand)) {
>                 unsigned int entry;
>                 int status;
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3d6c6e880520..b3a9bc08b4bb 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -321,6 +321,9 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
>         if (nand_region_is_secured(chip, ofs, mtd->erasesize))
>                 return -EIO;
>
> +       if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
> +               return 0;
> +
>         if (chip->legacy.block_bad)
>                 return chip->legacy.block_bad(chip, ofs);
>
> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index b7ad030225f8..ab630af3a309 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -1455,6 +1455,9 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
>         pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
>                  (unsigned int)offs, block, res);
>
> +       if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
> +               return 0;
> +

These are all the same.

What about letting drivers/mtd/mtdcore.c export a simple function
mtd_check_expert_analysis_mode() that calls the WARN_ONCE(...) if
CONFIG_DEBUG_FS=y, else providing a dummy?
The backtrace will identify the caller anyway.

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
