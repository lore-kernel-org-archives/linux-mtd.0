Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BC3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 18:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A164661407
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 18:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A164661407
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKIsAsuxtQuAKNl85GcF9qXBVEY6o17Oz7ep/3I6jxA=; b=VvuJUIoA4FHAp/
	kJLvAAb1O5Xc4Oy5EDEE3XiDPNU+AWcEzL6urI6fhMB4of81kp2J/yj/Gqa0UosxGA3KghIZBl6bW
	yXgV3X5Xv1QwTyjOZDxZxxK8q2ZAKbuAOgGE8NOORoSzHI/OoFsLu5PQy5WSMQ0OvvdyOP+b2gvI9
	uz0vUGzLFJIonW544YPsDqn8GAgYm4ZLEdmAkn0JohL0Jz0S7qqnB/kpEVY566yyPg6leDux0cFF8
	W3xlBP3L1Ic7PYFWJIzEV2lOtYSeRFTiJEIO6H5se8FBFwE4NbLBDgwv7Aq+i08uZUAoxl+vdLhr3
	J5ztJFHdMWGnhs5EUcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn2wH-002XHI-AP; Tue, 16 Nov 2021 18:12:13 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn2wC-002XGI-Rv; Tue, 16 Nov 2021 18:12:11 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGIBfcY003348;
 Tue, 16 Nov 2021 12:11:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637086301;
 bh=0VbB7B/oLiz5/WW1IEYIfbxalMnH/aa/3TcRFwoPCO4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=N3qJ1BsTVQ2uGsR3TcTDSMFtV06pDIKboWy1WxrL2EbDsRKkN5hrqO1p54N/X74fr
 NBPpQq/i1QVRTjVmUCLAB1LUknmBGBek9+ApEOgSxb++0DegcggY/58O+p7ObSmnLv
 0xTvaK54HYKbqOpqEyiqMrQq4ieQembBqoHjD6cs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGIBfup039616
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Nov 2021 12:11:41 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 12:11:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 12:11:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGIBdTD063568;
 Tue, 16 Nov 2021 12:11:40 -0600
Date: Tue, 16 Nov 2021 23:41:39 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Message-ID: <20211116181137.ddo4tw3cafb4ozep@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
 <20211115185227.4b4gjnf5zi5bdw56@ti.com>
 <f55d2c76-0265-b616-93fe-9b3db8f714bc@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f55d2c76-0265-b616-93fe-9b3db8f714bc@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_101209_022221_941295D7 
X-CRM114-Status: GOOD (  36.91  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 16/11/21 02:25PM, Tudor.Ambarus@microchip.com wrote:
> On 11/15/21 8:52 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 29/10/21 08:26PM, Tudor Ambarus wrote:
> >> Used to init all the mtd_info fields. Move the mtd_info init
> >> the last thing in the spi_nor_scan(), so that we avoid superfluous
> >> initialization of the mtd_info fields in case of errors.
> >>
> >> While here use common naming scheme for functions that are setting
> >> mtd_info fields:
> >> s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
> >> s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
> >> The functions names are self explanatory, get rid of the comment
> >> for the OTP function.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c | 54 +++++++++++++++++++++-----------------
> >>  drivers/mtd/spi-nor/core.h |  4 +--
> >>  drivers/mtd/spi-nor/otp.c  |  2 +-
> >>  drivers/mtd/spi-nor/swp.c  |  2 +-
> >>  4 files changed, 34 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 277d1fde84c8..ae971c773334 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -3071,6 +3071,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> >>       return info;
> >>  }
> >>
> >> +static void spi_nor_set_mtd_info(struct spi_nor *nor)
> >> +{
> >> +     struct mtd_info *mtd = &nor->mtd;
> >> +     struct device *dev = nor->dev;
> >> +
> >> +     spi_nor_set_mtd_locking_ops(nor);
> >> +     spi_nor_set_mtd_otp_ops(nor);
> >> +
> >> +     mtd->dev.parent = dev;
> >> +     if (!mtd->name)
> >> +             mtd->name = dev_name(dev);
> >> +     mtd->type = MTD_NORFLASH;
> >> +     mtd->flags = MTD_CAP_NORFLASH;
> >> +     if (nor->info->flags & SPI_NOR_NO_ERASE)
> >> +             mtd->flags |= MTD_NO_ERASE;
> >> +     mtd->writesize = nor->params->writesize;
> >> +     mtd->writebufsize = nor->page_size;
> >> +     mtd->size = nor->params->size;
> >> +     mtd->_erase = spi_nor_erase;
> >> +     mtd->_read = spi_nor_read;
> >> +     /* Might be already set by some SST flashes. */
> >> +     if (!mtd->_write)
> >> +             mtd->_write = spi_nor_write;
> >> +     mtd->_suspend = spi_nor_suspend;
> >> +     mtd->_resume = spi_nor_resume;
> >> +     mtd->_get_device = spi_nor_get_device;
> >> +     mtd->_put_device = spi_nor_put_device;
> > 
> > You should also merge in spi_nor_debugfs_init() in here which
> > initializes mtd->dbg.
> > 
> 
> I was thinking of getting rid of debugfs entries since they duplicate
> those on sysfs.

Okay. Fine by me either way.

> 
> >> +}
> >> +
> >>  int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>                const struct spi_nor_hwcaps *hwcaps)
> >>  {
> >> @@ -3125,26 +3154,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>       if (info->flags & SPI_NOR_HAS_LOCK)
> >>               nor->flags |= SNOR_F_HAS_LOCK;
> >>
> >> -     mtd->_write = spi_nor_write;
> >> -
> >>       /* Init flash parameters based on flash_info struct and SFDP */
> >>       ret = spi_nor_init_params(nor);
> >>       if (ret)
> >>               return ret;
> >>
> >> -     if (!mtd->name)
> >> -             mtd->name = dev_name(dev);
> >> -     mtd->type = MTD_NORFLASH;
> >> -     mtd->writesize = nor->params->writesize;
> >> -     mtd->flags = MTD_CAP_NORFLASH;
> >> -     mtd->size = nor->params->size;
> >> -     mtd->_erase = spi_nor_erase;
> >> -     mtd->_read = spi_nor_read;
> >> -     mtd->_suspend = spi_nor_suspend;
> >> -     mtd->_resume = spi_nor_resume;
> >> -     mtd->_get_device = spi_nor_get_device;
> >> -     mtd->_put_device = spi_nor_put_device;
> >> -
> >>       if (info->flags & USE_FSR)
> >>               nor->flags |= SNOR_F_USE_FSR;
> >>       if (info->flags & SPI_NOR_HAS_TB) {
> >> @@ -3166,12 +3180,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>                       nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> >>       }
> >>
> >> -     if (info->flags & SPI_NOR_NO_ERASE)
> >> -             mtd->flags |= MTD_NO_ERASE;
> >> -
> >> -     mtd->dev.parent = dev;
> >>       nor->page_size = nor->params->page_size;
> >> -     mtd->writebufsize = nor->page_size;
> >>
> >>       if (of_property_read_bool(np, "broken-flash-reset"))
> >>               nor->flags |= SNOR_F_BROKEN_RESET;
> >> @@ -3196,15 +3205,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>       if (ret)
> >>               return ret;
> >>
> >> -     spi_nor_register_locking_ops(nor);
> >> -
> >>       /* Send all the required SPI flash commands to initialize device */
> >>       ret = spi_nor_init(nor);
> >>       if (ret)
> >>               return ret;
> >>
> >> -     /* Configure OTP parameters and ops */
> >> -     spi_nor_otp_init(nor);
> >> +     spi_nor_set_mtd_info(nor);
> > 
> > This will break multiple things.
> 
> this is gold :), thanks
> > 
> > - spi_nor_set_addr_width(), which is called by spi_nor-setup(). It
> >   checks for nor->mtd.size which has not been set yet.> - spi_nor_spimem_check_op(), which is called (indirectly) by
> >   spi_nor_default_setup(). It check for nor->mtd.size.
> 
> Let's use NOR parameters in SPI NOR core, thus nor->params->size instead,
> and let the mtd fields for mtd. This will spare us of these problems.
> And it's cleaner too.

I agree.

> 
> > - spi_nor_try_unlock_all(), which is called by spi_nor_init(). I don't
> >   think it actually uses any values you initialize here but still worth
> >   pointing out.
> 
> we are safe here, the pointer to mtd is used just to get the pointer to
> nor.

Yeah, but who knows if that might change some time later. I would prefer 
we don't use a member we haven't initialized yet.

> 
> Thanks again.
> ta
> 
> > 
> >>
> >>       dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> >>                       (long long)mtd->size >> 10);
> >> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> >> index 223a03769950..48f26d3f1b3c 100644
> >> --- a/drivers/mtd/spi-nor/core.h
> >> +++ b/drivers/mtd/spi-nor/core.h
> >> @@ -548,8 +548,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> >>
> >>  void spi_nor_init_default_locking_ops(struct spi_nor *nor);
> >>  void spi_nor_try_unlock_all(struct spi_nor *nor);
> >> -void spi_nor_register_locking_ops(struct spi_nor *nor);
> >> -void spi_nor_otp_init(struct spi_nor *nor);
> >> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
> >> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
> >>
> >>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
> >>  {
> >> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> >> index 983e40b19134..fa63d8571218 100644
> >> --- a/drivers/mtd/spi-nor/otp.c
> >> +++ b/drivers/mtd/spi-nor/otp.c
> >> @@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> >>       return ret;
> >>  }
> >>
> >> -void spi_nor_otp_init(struct spi_nor *nor)
> >> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
> >>  {
> >>       struct mtd_info *mtd = &nor->mtd;
> >>
> >> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> >> index 8594bcbb7dbe..1f178313ba8f 100644
> >> --- a/drivers/mtd/spi-nor/swp.c
> >> +++ b/drivers/mtd/spi-nor/swp.c
> >> @@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
> >>               dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
> >>  }
> >>
> >> -void spi_nor_register_locking_ops(struct spi_nor *nor)
> >> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
> >>  {
> >>       struct mtd_info *mtd = &nor->mtd;
> >>
> >> --
> >> 2.25.1
> >>
> > 
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments Inc.
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
