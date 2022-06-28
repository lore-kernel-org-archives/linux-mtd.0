Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E0C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CojxRqdUfDQjmhtfYvSlOPJBjR+NRopnfkEYPAvVDkA=; b=on2lOBwH5HtMAw
	iKdOkP+ugAMHrxPofKiLll3bZrCJRpWGyjSZ6Zs+75XS9vf0xYDPI6Q7ctzQ2keCruKxM6Vp9xuHA
	KDu5lulriOwIvlXI8UhVNGDFQfJ+xAWhg+s1ksC+TTAwxmRTy1UU0NHrsPL2AsrTKOQ9jKqnJvEqw
	LI9QRCuOdzGtdQvTJWiKFmln9aR9mNTnoSPY7FJUiLoafmBD9ZTmQVJ1AIfE2NTOOMSYplitbI4HU
	O+lyizaP/u9eJdPOgcaoeA8PXQNtq447NpOGrLNMz1PbINUurxFslIy603NDq3mtzHgQCRzTwxm60
	B8AhfQQmvk1qr0pDfu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69qk-0063oF-0c; Tue, 28 Jun 2022 11:57:46 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69qg-0063kn-7Z
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:57:43 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31772f8495fso114288677b3.4
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvLVhP/AjpuqWFSjcU6XpRyOFeUMk8yJ3yjc2P7HVTk=;
        b=f0Gp/BHD3gfcmEaR199QGMdrClx+g79Ed+cG246stYo5MwUMC7zZV3ypttmz4Kg2n+
         J971aljvsoX4jwq3l8Logu8aZ7IMV0wnoSTKxQuip/j9gMs/QdJ5BrOSCgRu9IcmWvIY
         s8z9Was/NIj0wNrjRJtyLpH2SEChyKQ7Y5pFMWc2lDnKNJ4X6owWy4GrCrVZu+P69u9y
         ZGCzdKha+gapo3HWA3kgES5qF0tNO3YPSCc8Xe1OamlCMEIqUsxnKkLVVIAV2HIjfFOc
         mUjAgXQHEjY0XQiikqkB6rsuhnDyOn8YFNt2JFcgF981TbmaS+IQslDPBf3U98IGkGx1
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvLVhP/AjpuqWFSjcU6XpRyOFeUMk8yJ3yjc2P7HVTk=;
        b=txRSqDSxGZ/M+wOyu7tmYPiKmPMqvM3ZkNSuew9Z7hFAx9rW33+YhupgCuoZ+YkE6k
         o68RsWDmcK1OdtnlQ/YeeuILCG18WjNTgW9NO6Kbm+QFfGFuab6GE5wnTxZer/mHj2tb
         k+OZqYM9rLI9e2ieGrcpC3K6NAYwf/RwElREWij8JrBNrOHBzmwqbDEGbMA0RQZ4VExV
         83fELCgEbR0q/HNWkDXhl0Q86Qg1SP7jagaVa1oSKaHf0j8V3vdbVMrKYKlpzlJQ923G
         Negc/pUYwBb61aOtGVwLDEYsTIXgDd7P2F+7uPW+OL5biUn6D4MRxZ9jZGQf1Fy+66wq
         MrNg==
X-Gm-Message-State: AJIora8JfSBfiUSeOBiP7yURENZVQxjFGof7VFOeQfxwL650JVemc6Lu
	FvD9qzk2zeHdpHyc71HynpihtdGhojt4Wlf4B31b1CUyfImgfQ==
X-Google-Smtp-Source: AGRyM1u8BDvqgROdSlSVMWUAbKTsRoODDq/Hhw/R1IFKwPcgPElKDgRJNJAMdilRZRrodc3My6slR+yqSzD2pWSVT9s=
X-Received: by 2002:a81:7c54:0:b0:317:d4a4:daf0 with SMTP id
 x81-20020a817c54000000b00317d4a4daf0mr19957671ywc.247.1656417455879; Tue, 28
 Jun 2022 04:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
 <72686231-c372-a4fe-347e-39470790fa65@kernel.org>
In-Reply-To: <72686231-c372-a4fe-347e-39470790fa65@kernel.org>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Jun 2022 13:57:24 +0200
Message-ID: <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
Subject: Re: raw/omap2: erasing issue
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, 
	miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_045742_329162_DC4BFE93 
X-CRM114-Status: GOOD (  20.70  )
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

Hi Roger,

On Tue, Jun 28, 2022 at 1:44 PM Roger Quadros <rogerq@kernel.org> wrote:
>
> Hi Yegor,
>
> On 28/06/2022 13:48, Yegor Yefremov wrote:
> > Since linux 5.17 I get the following issue when doing ubiformat:
> >
> > # ubiformat -y /dev/mtd5
> > ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> > eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> > libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> > libscan: scanning eraseblock 2028 -- 100 % complete
> > ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> > ubiformat: 2 eraseblocks are supposedly empty
> > ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> > 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> > 31, 32
>
> I'm guessing these bad blocks recently added due to the offending patch?

Yes.

> > ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> > attempt to erase a bad block at page 0x00000d40
> > ubiformat: formatting eraseblock 28[   33.658809] nand:
> > nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> > ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> > nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> > ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> > nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> > ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> > MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
> >         error 5 (Input/output error)
> >
> > ubiformat: error!: failed to erase eraseblock 34
> >            error 5 (Input/output error)
> > ubiformat: marking block 34 bad
> > ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> > MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
> >         error 5 (Input/output error)
> >
> > ubiformat: error!: failed to erase eraseblock 35
> >            error 5 (Input/output error)
> > ubiformat: marking block 35 bad
> > ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> > MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
> >         error 5 (Input/output error)
> >
> > ubiformat: error!: failed to erase eraseblock 36
> >            error 5 (Input/output error)
> > ubiformat: marking block 36 bad
> > ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> > MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
> >         error 5 (Input/output error)
> >
> > ubiformat: error!: failed to erase eraseblock 37
> >            error 5 (Input/output error)
> > ubiformat: marking block 37 bad
> >
> > ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> > # [   36.322563] vwl1271: disabling
> >
> > git bisect pointed to the following commit:
> >
> > a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> > commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> > Author: Roger Quadros <rogerq@kernel.org>
> > Date:   Thu Dec 9 11:04:55 2021 +0200
> >
> >     mtd: rawnand: omap2: move to exec_op interface
> >
> >     Stop using legacy interface and move to the exec_op interface.
> >
> >     Signed-off-by: Roger Quadros <rogerq@kernel.org>
> >     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> >
> > :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> > c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> >
> > Info to my NAND flash:
> >
> > [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> > [    5.702193] nand: Micron MT29F2G08ABAEAWP
> > [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> > 2048, OOB size: 64
> > [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> > [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> > [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> > [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> > [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> > using UBI block devices instead.
> > [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> > [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> > consider using UBI block devices instead.
> > [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> > [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> > consider using UBI block devices instead.
> > [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> > [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> > consider using UBI block devices instead.
> > [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> > [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> > using UBI block devices instead.
> > [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> > [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> > using UBI block devices instead.
> >
>
> What platform are you on?
> I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.

I am on am335x [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.19-rc4

Yegor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
