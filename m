Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC08C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gc5kpFfsSrupIA+CpNVJOC8dRPvararoX+vj3XII7nU=; b=el1PNCbVgVAniT
	/mho9vHg4dlhxNrkwSQ9kRiP32nu4/5iCbv5c5U9BoS/UlfP2j4VY2CqjXArDgZ4keMaEq46D9kyi
	otkW0k/2jpoww8kG0s8610dBszc7O1b7v23c/ulowFj/fNpZMnaBqyXN08bdynjSh205BsBK74/iF
	zLYjuaU452KB2/P8JU3TgWciwgK9fsMjLOx9JpdGDyMebK9ozSVF3/gAbo2756gny5LMqnzLWBDJj
	ypguM4Ip9fQsrzBYMEPPe6eB6b9zxqn7Mul0kYNOEuBnZpgOHrtkJgwyLz+SgB35o3V8+Ec2w4EOb
	UrdpYmxrqGW+e0IhlH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2d3-00FJa9-52; Thu, 27 Jan 2022 11:07:49 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2cz-00FJYv-EN
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 11:07:46 +0000
Received: by mail-ua1-f50.google.com with SMTP id b37so3963964uad.12
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 03:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s4FnC9f8le6cLCb61Ozfn4Eq0RvD8VFjvqbCAB5Qp/E=;
 b=WYm+PeWwIzai+VRv4E4MQtU2RIYsP+mopCTeIv0vRucVIo87TD92FDT6H3krQwF90i
 xPRjEfTk1uZqcNsx19MhP4Z/vxEINohRWrdpuVeP9s9ZS45IMJBsO7l40lpP+piZR21J
 LtehOXAsougSbvk/Rd/Ysuo76IkKFoLlPnR+/91f8bavwygPa+u3KS+o0w9ND0AwC7q3
 drsytpvMc5Bcqj8Xaqf5p6HMrUqI1j7K7OELUN+s6ZW6u2ZLDRgXwBZt+EwZFlRctgO2
 YvhYGn9FCHy0ivfmUV6ZWn+vJRWFk0LNEsiDVQt3sMf280F+dGtiPiof3MRtYv0jIvJ2
 P0UQ==
X-Gm-Message-State: AOAM532Vpsp9iPufdDPiTn4fQbGBtsSxKAvBXfjTuYen4ISlb5rEaHjw
 nYvEIdMIVtvYAUfYDpDXQ732jSRKiiK9uQ==
X-Google-Smtp-Source: ABdhPJy7Smo2baOwijtfYgRvSVx8dS8j3Pua44T7H60o+/YX9G5vs80cbPwTy6jX7nHGTg3SdAjj6Q==
X-Received: by 2002:a67:c885:: with SMTP id v5mr1321188vsk.39.1643281663835;
 Thu, 27 Jan 2022 03:07:43 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id 128sm493319vsz.4.2022.01.27.03.07.43
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 03:07:43 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id l14so347907vko.12
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 03:07:43 -0800 (PST)
X-Received: by 2002:a1f:5d84:: with SMTP id r126mr1179693vkb.33.1643281663036; 
 Thu, 27 Jan 2022 03:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
 <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
 <20220127114647.0ec44ced@xps13>
In-Reply-To: <20220127114647.0ec44ced@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jan 2022 12:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW0hKqk8aGiNy1Pd50aTu_rb_ewdiV9GXTkPJOm=zA+HA@mail.gmail.com>
Message-ID: <CAMuHMdW0hKqk8aGiNy1Pd50aTu_rb_ewdiV9GXTkPJOm=zA+HA@mail.gmail.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and debugging
 purposes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030745_516952_898B4B35 
X-CRM114-Status: GOOD (  41.69  )
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

On Thu, Jan 27, 2022 at 11:46 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Mon, 10 Jan 2022 14:15:27 +0100:
> > On Thu, Nov 18, 2021 at 12:47 PM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > When developping NAND controller drivers or when debugging filesystem
> > > corruptions, it is quite common to need hacking locally into the
> > > MTD/NAND core in order to get access to the content of the bad
> > > blocks. Instead of having multiple implementations out there let's
> > > provide a simple yet effective specific MTD-wide debugfs entry to fully
> > > disable these checks on purpose.
> > >
> > > A warning is added to inform the user when this mode gets enabled.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > Thanks for your patch, which is now commit 67b967ddd93d0ed5 ("mtd:
> > Introduce an expert mode for forensics and debugging purposes")
> > in mtd/next.
> >
> > > --- a/drivers/mtd/mtdcore.c
> > > +++ b/drivers/mtd/mtdcore.c
> > > @@ -2365,6 +2365,14 @@ static struct backing_dev_info * __init mtd_bdi_init(const char *name)
> > >         return ret ? ERR_PTR(ret) : bdi;
> > >  }
> > >
> > > +char *mtd_expert_analysis_warning =
> >
> > const
> >
> > > +       "Bad block checks have been entirely disabled.\n"
> > > +       "This is only reserved for post-mortem forensics and debug purposes.\n"
> > > +       "Never enable this mode if you do not know what you are doing!\n";
> > > +EXPORT_SYMBOL_GPL(mtd_expert_analysis_warning);
> >
> > Shouldn't this depend on CONFIG_DEBUG_FS?
> >
> > > +bool mtd_expert_analysis_mode;
> > > +EXPORT_SYMBOL_GPL(mtd_expert_analysis_mode);
> >
> > Do you really need to export these two symbols?
> >
> > > +
> > >  static struct proc_dir_entry *proc_mtd;
> > >
> > >  static int __init init_mtd(void)
> > =
> > > --- a/drivers/mtd/nand/core.c
> > > +++ b/drivers/mtd/nand/core.c
> > > @@ -21,6 +21,9 @@
> > >   */
> > >  bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos)
> > >  {
> > > +       if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
> > > +               return 0;
> > > +
> > >         if (nanddev_bbt_is_initialized(nand)) {
> > >                 unsigned int entry;
> > >                 int status;
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > index 3d6c6e880520..b3a9bc08b4bb 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -321,6 +321,9 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
> > >         if (nand_region_is_secured(chip, ofs, mtd->erasesize))
> > >                 return -EIO;
> > >
> > > +       if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
> > > +               return 0;
> > > +
> > >         if (chip->legacy.block_bad)
> > >                 return chip->legacy.block_bad(chip, ofs);
> > >
> > > diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> > > index b7ad030225f8..ab630af3a309 100644
> > > --- a/drivers/mtd/nand/raw/nand_bbt.c
> > > +++ b/drivers/mtd/nand/raw/nand_bbt.c
> > > @@ -1455,6 +1455,9 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
> > >         pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
> > >                  (unsigned int)offs, block, res);
> > >
> > > +       if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
> > > +               return 0;
> > > +
> >
> > These are all the same.
> >
> > What about letting drivers/mtd/mtdcore.c export a simple function
> > mtd_check_expert_analysis_mode() that calls the WARN_ONCE(...) if
> > CONFIG_DEBUG_FS=y, else providing a dummy?
> > The backtrace will identify the caller anyway.
>
> I took the time to address your comments. You're right a single exported
> function is better.
>
> However I don't see the need for a CONFIG_DEBUG_FS check here, if unset
> the boolean will stay false forever, I believe we don't need to bother
> with it.

If CONFIG_DEBUG_FS=n, there is no need for the code or the export,
so the check can become a dummy.

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
