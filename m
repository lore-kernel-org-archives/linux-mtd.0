Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4553FC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 03:49:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14322206B8
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 03:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dx/Hc6bx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="wWUfN3MJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14322206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6aVxQCpJl0Wcn41TmNyydmMyPV7l9Qh9kqNummg1mw=; b=Dx/Hc6bxMfdMzt
	V2W3f439gDHC/Ld82C8yLQl12iWgbCTfIXf+C4TumAuvKACLmxQp96TZ/AgWwjLiVbZ2nnQsZSAZY
	z93XKEC8rkuipjIKk3OROeSRmuG7GKe9MwvmhUb6fkWSUDwVQpwf4eHFxV34uqhMEDGHh9iPk1rOp
	7kHmChC+5qCun/43MgLeQ7vOz/0hclfTNdwege7fAjOjb64aP1pErlbKVPLaoCJOtz4TG/UNo7Hc8
	pV5NKQAqCUV6Ukpt0g89QEJtRL9MhlMqPcOLC2fHOGMxCBpB+JB42gbxvs1asRhuf687fddA5a4zt
	mHEhtphgRSRBk2XJ1X1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBAQ7-0003Og-HC; Tue, 02 Apr 2019 03:49:07 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBAQ4-0003OG-1g
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 03:49:05 +0000
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x323mjOE029329
 for <linux-mtd@lists.infradead.org>; Tue, 2 Apr 2019 12:48:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x323mjOE029329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1554176926;
 bh=orflN0K2hlD4VebMkeM0h3skXVyarEcudonJ2InpyeQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wWUfN3MJ5etjm+3TwxUMCcz4cUDJnsg7T51D2OPSZXlplbevPi844sDE04NR743Iu
 Yk1iHwh+HlZYuOmYGZuTHP16DXmRQNp9em71mVSSWhb0aikCSzo3PMp8wy6Z0m2Gn7
 N+1ojW0wGNV8U+RNXk46DGKvHGcl5zMfjLY+26w6rzTFqem8Up00OhiYCdxuNZICuf
 vs2IHvMtggS3GZkxZlAt867wSIugFBES+8lZtGTr74x11QgKu4LbF5wYffLjeHmD2I
 9ctY/JExCAKnJpOn27N0T4YviObuWzMeRdIzL+JfiOhz7YG66734z9ozfBnmdpa8Jb
 3eB4nc54CEXdw==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id g187so6902984vsc.8
 for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2019 20:48:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVKhieMukyI9Dj1O5p/a7Wq+ebf0bW8zQQ2m9ZzqtmcBlucR2x+
 J1CnnVWw4us8XWhxHtn5WJzj8h1mAqg5RoKVMCM=
X-Google-Smtp-Source: APXvYqwWuInBXXjUhRCFto8+gyjWnl7GfGN7EmaObVgvGZmikt5N18U3q5qmdhH70Xg7lfJTaQhBEXJb1p/siMpa1JU=
X-Received: by 2002:a67:fbcc:: with SMTP id o12mr27098495vsr.60.1554176925253; 
 Mon, 01 Apr 2019 20:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
 <1553844501-7119-2-git-send-email-yamada.masahiro@socionext.com>
 <20190330152323.71734cb8@collabora.com> <20190401191419.0431882e@xps13>
In-Reply-To: <20190401191419.0431882e@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 2 Apr 2019 12:48:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_tum_v5QwxDbz3Cmb4LwJ1BSY0mPTzzE3nc6SOE-Bng@mail.gmail.com>
Message-ID: <CAK7LNAT_tum_v5QwxDbz3Cmb4LwJ1BSY0mPTzzE3nc6SOE-Bng@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] mtd: rawnand: denali: use nand_chip pointer more
 for internal functions
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_204904_417211_3030079F 
X-CRM114-Status: GOOD (  23.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 2, 2019 at 2:14 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Masahiro,
>
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sat, 30 Mar
> 2019 15:23:23 +0100:
>
> > On Fri, 29 Mar 2019 16:28:13 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > > With the recent refactoring, the NAND driver hooks now take a pointer
> > > to nand_chip. Add to_denali() in order to convert (struct nand_chip *)
> > > to (struct denali_nand_info *) directly. It is more useful than the
> > > current mtd_to_denali().
> > >
> > > I changed some helper functions to take (struct nand_chip *). This will
> > > avoid pointer conversion back and forth, and ease further development.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  drivers/mtd/nand/raw/denali.c | 57 ++++++++++++++++++++++++-------------------
> > >  1 file changed, 32 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> > > index 24aeafc..4ac1314 100644
> > > --- a/drivers/mtd/nand/raw/denali.c
> > > +++ b/drivers/mtd/nand/raw/denali.c
> > > @@ -47,6 +47,11 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
> > >     return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
> > >  }
> > >
> > > +static struct denali_nand_info *to_denali(struct nand_chip *chip)
> > > +{
> > > +   return container_of(chip, struct denali_nand_info, nand);
> > > +}
> > > +
> > >  /*
> > >   * Direct Addressing - the slave address forms the control information (command
> > >   * type, bank, block, and page address).  The slave data is the actual data to
> > > @@ -282,12 +287,12 @@ static void denali_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
> > >     denali->host_write(denali, DENALI_BANK(denali) | type, dat);
> > >  }
> > >
> > > -static int denali_check_erased_page(struct mtd_info *mtd,
> > > -                               struct nand_chip *chip, uint8_t *buf,
> > > +static int denali_check_erased_page(struct nand_chip *chip,
> > > +                               struct denali_nand_info *denali, u8 *buf,
> >
> > You don't need to pass both chip and denali, as one can be extracted
> > from the other.
> >
> > >                                 unsigned long uncor_ecc_flags,
> > >                                 unsigned int max_bitflips)
> > >  {
> > > -   struct denali_nand_info *denali = mtd_to_denali(mtd);
> > > +   struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
> > >     uint8_t *ecc_code = chip->oob_poi + denali->oob_skip_bytes;
> > >     int ecc_steps = chip->ecc.steps;
> > >     int ecc_size = chip->ecc.size;
> > > @@ -303,9 +308,9 @@ static int denali_check_erased_page(struct mtd_info *mtd,
> > >                                               NULL, 0,
> > >                                               chip->ecc.strength);
> > >             if (stat < 0) {
> > > -                   mtd->ecc_stats.failed++;
> > > +                   ecc_stats->failed++;
> > >             } else {
> > > -                   mtd->ecc_stats.corrected += stat;
> > > +                   ecc_stats->corrected += stat;
> > >                     max_bitflips = max_t(unsigned int, max_bitflips, stat);
> > >             }
> > >
> > > @@ -316,11 +321,11 @@ static int denali_check_erased_page(struct mtd_info *mtd,
> > >     return max_bitflips;
> > >  }
> > >
> > > -static int denali_hw_ecc_fixup(struct mtd_info *mtd,
> > > +static int denali_hw_ecc_fixup(struct nand_chip *chip,
> > >                            struct denali_nand_info *denali,
> >
> > Ditto.
> >
>
> I am fine with the series in its current state, please submit a v5
> with Boris comment's addressed and I'll queue it right away to next.
>


OK, I will submit v5 shortly.




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
