Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF7BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PGyR2htyfERtFS3dBxamCax23uRHY2C5ptCDtgzP8E=; b=3X6wfzqI+ZFt5q
	D4klyizVBSqeVbD5G0V1j94hGwk7WyyYqxDfYQ6kbeVsSJ80z0RaVJcTMuXfSbp+LhXsFeeRyzLhL
	EkhZ6PTKtVwkNWo45C4O/jmavM7Od52e36W+nIbQyRbxvrYUjv/FCyQFBn2pETpbJ63rwgDEn0l16
	xliYNruQuuKQKN2/1H4ZEm/e17wGLea05wGJDcaIA27jGJStBonFmNPTo2eM4Jag0pmcPa23YkAs5
	JoTqIYqT5TzYCrU3sQQtGl3wRinNm1IUk66Ck9glee9o0JyNOVtpaT4CGv22dcanVnxYLUJmH2F5O
	PcN0xPX50v7oXY7pxPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK3S3-004J9E-Ty; Tue, 15 Feb 2022 19:25:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3Rz-004J73-L1
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 19:25:25 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FJPLrU003705;
 Tue, 15 Feb 2022 13:25:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644953121;
 bh=1NuIuit/4zuRZb3BIfE4uUvyfzH1uAzthPeCBGr5OYA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nJe4JaG/wuollj5gn70+8qsJ80HDumGvNIACssSnBV/YeKLxBZArVN64E8C7H8HuE
 o44Yepq/23H2Etik70Yxri7xs96beyST/lvj/tccrJJDtH8YDhkxg2yXOm0lRrNyF/
 LFjXWwnjN+h7kgS5lZB1I7TEJxKzw2YxwfCvRkxk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FJPLKJ113261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 13:25:21 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 13:25:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 13:25:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FJPJC3112735;
 Tue, 15 Feb 2022 13:25:20 -0600
Date: Wed, 16 Feb 2022 00:55:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v1 13/14] mtd: spi-nor: spansion: convert USE_CLSR to a
 manufacturer flag
Message-ID: <20220215192519.xff2wx33aee75fsl@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-14-michael@walle.cc>
 <b02814f4-bfad-6b80-e849-1bb57b74702d@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b02814f4-bfad-6b80-e849-1bb57b74702d@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_112523_862671_F563E305 
X-CRM114-Status: GOOD (  23.03  )
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

On 10/02/22 03:34AM, Tudor.Ambarus@microchip.com wrote:
> On 2/2/22 16:58, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Now that all functions using that flag are local to the spanion module,

s/spanion/spansion/

> > we can convert the flag to a manufacturer one.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> >  drivers/mtd/spi-nor/core.c     |  3 --
> >  drivers/mtd/spi-nor/core.h     |  3 --
> >  drivers/mtd/spi-nor/spansion.c | 54 +++++++++++++++++++++-------------
> >  3 files changed, 33 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 5b00dfab77a6..2d5517b3db96 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2448,9 +2448,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
> > 
> >         if (flags & NO_CHIP_ERASE)
> >                 nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> > -
> > -       if (flags & USE_CLSR)
> > -               nor->flags |= SNOR_F_USE_CLSR;
> >  }
> > 
> >  /**
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index a02bf54289fb..2130a96e2044 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -14,7 +14,6 @@
> >  enum spi_nor_option_flags {
> >         SNOR_F_HAS_SR_TB        = BIT(1),
> >         SNOR_F_NO_OP_CHIP_ERASE = BIT(2),
> > -       SNOR_F_USE_CLSR         = BIT(4),
> >         SNOR_F_BROKEN_RESET     = BIT(5),
> >         SNOR_F_4B_OPCODES       = BIT(6),
> >         SNOR_F_HAS_4BAIT        = BIT(7),
> > @@ -347,7 +346,6 @@ struct spi_nor_fixups {
> >   *   SPI_NOR_NO_ERASE:        no erase command needed.
> >   *   NO_CHIP_ERASE:           chip does not support chip erase.
> >   *   SPI_NOR_NO_FR:           can't do fastread.
> > - *   USE_CLSR:                use CLSR command.
> >   *
> >   * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
> >   *                  Used when SFDP tables are not defined in the flash. These
> > @@ -398,7 +396,6 @@ struct flash_info {
> >  #define SPI_NOR_NO_ERASE               BIT(6)
> >  #define NO_CHIP_ERASE                  BIT(7)
> >  #define SPI_NOR_NO_FR                  BIT(8)
> > -#define USE_CLSR                       BIT(9)
> > 
> >         u8 no_sfdp_flags;
> >  #define SPI_NOR_SKIP_SFDP              BIT(0)
> > diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> > index 4756fb88eab2..c31ea11f71f2 100644
> > --- a/drivers/mtd/spi-nor/spansion.c
> > +++ b/drivers/mtd/spi-nor/spansion.c
> > @@ -8,6 +8,8 @@
> > 
> >  #include "core.h"
> > 
> > +#define USE_CLSR       BIT(0)
> 
> add a description, tell the reader this is a manufacturer specific flag.

+1

> excellent work:

+1

> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> 
> > +
> >  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
> >  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
> >  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> > @@ -212,43 +214,53 @@ static const struct flash_info spansion_parts[] = {
> >         { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
> >                 NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
> > -               FLAGS(USE_CLSR)
> >                 NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
> > -                             SPI_NOR_QUAD_READ) },
> > +                             SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
> > -               FLAGS(SPI_NOR_HAS_LOCK | USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               FLAGS(SPI_NOR_HAS_LOCK)
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
> > -               FLAGS(USE_CLSR)
> >                 NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> >                 .fixups = &s25fs_s_fixups, },
> >         { "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
> > -               FLAGS(USE_CLSR)
> >                 NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> >                 .fixups = &s25fs_s_fixups, },
> >         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
> >         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
> >         { "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
> > -               FLAGS(USE_CLSR)
> > -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               MFR_FLAGS(USE_CLSR)
> > +       },
> >         { "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
> >         { "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16) },
> >         { "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32) },
> > @@ -370,7 +382,7 @@ static void spansion_late_init(struct spi_nor *nor)
> >                 nor->mtd.erasesize = nor->info->sector_size;
> >         }
> > 
> > -       if (nor->flags & SNOR_F_USE_CLSR)
> > +       if (nor->info->mfr_flags & USE_CLSR)
> >                 nor->params->ready = spi_nor_sr_ready_and_clear;
> >  }
> > 
> > --
> > 2.30.2
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
