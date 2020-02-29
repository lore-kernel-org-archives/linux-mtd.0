Return-Path: <SRS0=4xdD=4R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD31C3F2CE
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Feb 2020 13:13:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D2D246A2
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Feb 2020 13:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kg9b/bkB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k16YhlmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D2D246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lczeLx/IKLeJH8BxPovCCAhrqZQfuH83JRfu7y0p4SE=; b=kg9b/bkBaRAtSg
	qirYrtqSr3/KLPE1HDe1CXe0fbFYoRk3jHza+L1o23OUV5n6/4WDPrj525nPjaZv2TOmAv5HOUYx3
	NIKgXWXNdS3kZ8FjHbOk4YTSJvDQWgGvxpVPmg2vWG9FRj/dq9CN7meVOVPHYFeZh1lMBhNFijElY
	wWdzlU7twLN/a6dvKyVu5hq+GtlSL2OThVXQBb2I8Zd/lCjpU3wav7yvJyaGLKaRWzKI4DCcYbuZ9
	AdPuWmSoLPqlGdaZU1yswa/Ogyxpatt52KXymvrb1ws/L2agQzGoqyP3CZzz6MZCEke8ZmmMsSTSZ
	e/tvDgXgno/nIRrwj3Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j81vn-0007OS-Ro; Sat, 29 Feb 2020 13:13:23 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j81vk-0007O1-RE
 for linux-mtd@lists.infradead.org; Sat, 29 Feb 2020 13:13:22 +0000
Received: by mail-lj1-x242.google.com with SMTP id u26so6306220ljd.8
 for <linux-mtd@lists.infradead.org>; Sat, 29 Feb 2020 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDDWeqVro44wdCQh/a23fhafDkg7Z03pdvu6hjS6sIw=;
 b=k16YhlmZuZ2KPPv5UslTn3eZ2z12OEEoOVyo+Mu0Jur952MXTscbCbw6uWmFzoWKdR
 92P0VJ/yGhVMVJIP4lN/lcTD9Wfv+NFVr2/DbMHF9Nd9koZmjxpiTtSNkqXTogQpa1SJ
 EbHAX8C+VukHSebESgQP7DbQkdkUk6baOGSYCVJTGofgbNnlbNGCViTS72bwE3URDQfp
 wCEmEO4lvlJc9g0lUqPSTqOERp+27hJR2vnKvvMn2S97jlWDFsH4AyTxDuPjynFQpNSn
 Rxh13EY7xxhhaWQbFKK6aAY5aAkD7HI+UxxoKMtDRib2H/SxKDbuj2BLwxPKgsEaoVxE
 yl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDDWeqVro44wdCQh/a23fhafDkg7Z03pdvu6hjS6sIw=;
 b=bvKrVtzEctbQkjLaa+7Y38+Gi4C0aXL+3vCMGgRmaOisU8mhBWFfaECiaRcsHkdEiS
 g+ImvjBoeBp5dBwVEtFXVKD8c6F65TAfuTJRLskvyWZEH6XFfEYKtHzNI7rZCoauUukd
 jMOO6Gy9dQOeEBMhUqyaprZWYUyqHqU349GZvQu54cEpP2CBvsClOng4Hmy4gCoko8LE
 k/eIKWUTZqEXrHxhSQ/ohxpSJX3DIWvb+r4sO28kEacRw1upe/pFk4oqf1ws9j7D+mu8
 ageTqnK5wbeuPBZV83iZwGQ9s5DWCnUscUjvk4+POZIqWf0Z9BCdD0rR3/hH7YsWek5F
 TO8A==
X-Gm-Message-State: ANhLgQ2hQZPo3M/qeKaifSwQZTMA8/a+Wghcaqv8f6mpLrVnBXocJIPo
 cmi5oHG/VGlSp7FK7deN2YgWQsRd+z3mPguzyLo=
X-Google-Smtp-Source: ADFU+vsRFOZayJ16jB0V1Bc0yKjSYuEGWIMgN7EnpjTsJ8DBqt9YCmq9/ZVzOr7cNKS/mfD+6eww+r5jozLUuF6ZohU=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr5997987ljk.37.1582981998773;
 Sat, 29 Feb 2020 05:13:18 -0800 (PST)
MIME-Version: 1.0
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAOMZO5BHW7r8aMT_7g91LpGem+WpP+PRKwnsfu9v7yn278pErQ@mail.gmail.com>
 <49a83666-2e08-833e-dc63-0fb820b5c6f3@exertus.fi>
 <CAOMZO5A0wCz6EUB_Qc+oS1UDLrBSLgAKEE0g8SYTDFq8AGLsVw@mail.gmail.com>
 <92909395-0b0b-da7f-a896-a6c1f11a678f@exertus.fi>
In-Reply-To: <92909395-0b0b-da7f-a896-a6c1f11a678f@exertus.fi>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 29 Feb 2020 10:13:08 -0300
Message-ID: <CAOMZO5AsTpFWr2XWVVFuuxQ2UzCHODtDGSEvLvhmLeyEO70j-g@mail.gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
To: Timo Ketola <Timo.Ketola@exertus.fi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_051320_904725_AB18D8D5 
X-CRM114-Status: GOOD (  24.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Han Xu <han.xu@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding Han Xu and Miquel

On Sat, Feb 29, 2020 at 9:46 AM Timo Ketola <Timo.Ketola@exertus.fi> wrote:
>
> On 27.2.2020 17.16, Fabio Estevam wrote:
> > Hi Timo,
> >
> > On Thu, Feb 27, 2020 at 10:42 AM Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> >
> >> That might take considerable effort. Would you think, there should be
> >> fixes for this? Would it be on recovery side or preventing the issue
> >> happening in the first place?
> >
> > It is hard to tell. 4.9.88 is an old version, so better try with mainline
> >
>
> Ok, I managed to get v5.4 booting - almost.
>
> First, we had 'fsl,legacy-bch-geometry;' flag in device tree and I
> couldn't find how I would get the same effect in this kernel in a
> 'standard way'. I had to put 'nand-ecc-strength = <8>;
> nand-ecc-step-size = <512>;' into the device tree and make this change
> in drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:
>
> > @@ -507,11 +507,11 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
> >       struct nand_chip *chip = &this->nand;
> >
> >       if (chip->ecc.strength > 0 && chip->ecc.size > 0)
> >               return set_geometry_by_ecc_info(this, chip->ecc.strength,
> >                                               chip->ecc.size);
> > -
> > +     return legacy_set_geometry(this);
> >       if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
> >                               || legacy_set_geometry(this)) {
> >               if (!(chip->base.eccreq.strength > 0 &&
> >                     chip->base.eccreq.step_size > 0))
> >                       return -EINVAL;
>
> That is, call legacy_set_geometry unconditionally without then calling
> set_geometry_by_ecc_info. After this it began to read the first half of
> the NAND correctly.
>
> The there is a bug (I think) in the NAND chip S34ML16G2. It has four
> S34ML04G2 dies and two chip selects in the package and shows up as two
> chips. It reports 128KiB per EB, 8192 EBs per LUN and 2 LUNs making up
> 2GiB. This is correct for the package but then Linux finds two such
> chips, total of 4GiB, which is not correct. So I have this in
> drivers/mtd/nand/raw/nand_base.c:
>
> > @@ -4733,12 +4760,36 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> >       if (!type->name || !type->pagesize) {
> >               /* Check if the chip is ONFI compliant */
> >               ret = nand_onfi_detect(chip);
> >               if (ret < 0)
> >                       return ret;
> > -             else if (ret)
> > +             else if (ret) {
> > +                     if (type->name) {
> > +                             struct nand_device *nand = &chip->base;
> > +                             unsigned luns;
> > +
> > +                             pr_info("%s detected\n", type->name);
> > +                             pr_info("luns %d, eraseblocks %d, pages %d, page size %d\n",
> > +                                             nand->memorg.luns_per_target,
> > +                                             nand->memorg.eraseblocks_per_lun,
> > +                                             nand->memorg.pages_per_eraseblock,
> > +                                             nand->memorg.pagesize);
> > +                             pr_info("sizes: page 0x%X, erase 0x%X, chip 0x%X\n",
> > +                                             type->pagesize,
> > +                                             type->erasesize,
> > +                                             type->chipsize);
> > +                             luns = DIV_ROUND_DOWN_ULL((u64)type->chipsize << 20,
> > +                                             nand->memorg.pagesize *
> > +                                             nand->memorg.pages_per_eraseblock *
> > +                                             nand->memorg.eraseblocks_per_lun);
> > +                             if (nand->memorg.luns_per_target != luns) {
> > +                                     printk("Correcting luns-per-target to %d", luns);
> > +                                     nand->memorg.luns_per_target = luns;
> > +                             }
> > +                     }
> >                       goto ident_done;
> > +             }
> >
> >               /* Check if the chip is JEDEC compliant */
> >               ret = nand_jedec_detect(chip);
> >               if (ret < 0)
> >                       return ret;
>
> output:
>
> > nand: NAND 1GiB 3,3V 8-bit detected
> > nand: luns 2, eraseblocks 8192, pages 64, page size 2048
> > nand: sizes: page 0x0, erase 0x0, chip 0x400
> > Correcting luns-pre-target to 1
> > nand: device found, Manufacturer ID: 0x01, Chip ID: 0xd3
> > nand: AMD/Spansion S34ML16G2
> > nand: 1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
> > nand: 2 chips detected
>
> That idea worked on v4.9 imx kernel but not here. The driver reports ECC
> errors for the second half of the NAND. I have debugged down to gpmi
> driver and checked that page address is as should (e.g. realpage 524288,
> page 0 0x80000 in nand_do_read_ops for the first page of the second
> half) and target selection changes correctly. But it reads only FFs.
> Still, it seems to erase correct blocks when trying to write BBTs.
>
> I put this in drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:
>
> > @@ -2270,10 +2270,18 @@ static struct dma_async_tx_descriptor *gpmi_chain_command(
> >
> >       transfer->direction = DMA_TO_DEVICE;
> >
> >       desc = dmaengine_prep_slave_sg(channel, &transfer->sgl, 1, DMA_MEM_TO_DEV,
> >                                      MXS_DMA_CTRL_WAIT4END);
> > +     if (1) {
> > +             unsigned i;
> > +             char b[160], *p;
> > +
> > +             p = b + sprintf(b, "Transfer from/to chip %d, pio[0] %X, naddr %d, addr", chip, pio[0], naddr);
> > +             for (i = 0; i < naddr; ++i) p += sprintf(p, " %02X", addr[i]);
> > +             pr_info("%s\n", b);
> > +     }
> >       return desc;
> >  }
> >
>
> and see
>
> > Transfer from/to chip 1, pio[0] 930004, naddr 3, addr C0 FF 07
>
> for erase, which seems to work and
>
> > Transfer from/to chip 1, pio[0] 930006, naddr 5, addr 00 00 C0 FF 07
>
> for reads/writes, which fail.
>
> I'm real stuck.
>
> --
>
> Timo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
