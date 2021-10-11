Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468ACC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D83608FB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01D83608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tkHLsoQtx42fl1Q/GKkufkVxOdayucRRNgRq2J+AkM=; b=FLWGWNq2nVQ/rv
	aVS9UHe/kMFv+RG3HE9Uk1gGITcqbYcrjTjH/r98SeGL0Vz5QLC2llgaA28fmsL/Z85GBma4Nx3Fo
	7huO4NPg7kWa7+U9xZ83UEJuweSG/VSlXg517Qy3UUpCCUHZK161h3kme5sBtnUYlsaPSY/hQjXAU
	c1Z5x8Xy1QVZhA0B6u0WkV7Nmcz6gywyz+SSU3c7exaGhkQjycNKtTGqj602whH22v0Hr+l8kxFXw
	dcgbslYa7Ukrgo8hFYbXBZiW0G07AMGCv2ZVMwjiL0RJRKMebgjCfYKVQ8ImhiOhgpjbeoiq8caL3
	jsVJ5CMMUxpmmVCU1KdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZoc3-007uhV-NW; Mon, 11 Oct 2021 06:16:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZoc0-007ugj-GL; Mon, 11 Oct 2021 06:16:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19B6FxJH086222;
 Mon, 11 Oct 2021 01:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633932959;
 bh=vyXbBGxc5Mx9Aw/YQncr64y0jY7zhJlK5M19P6vXISg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tl1yvva11ePFwanQ+LAWvDOwYnQ8T8tSsy7sVIEyFMOW8fxfFTw0kSOLH3VeopOKo
 LUbas7GFV8a/5dEsxK20zdaTt2DU98CPlnPKrPH2gHcjruwGB5VbM2oCglK4RBmbSX
 gu6i5VzV7oXbrwJRXTPFiaFKD/tfXKu73CHXqQL4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19B6FxdF098767
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 01:15:59 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 01:15:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 01:15:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19B6FwoA061796;
 Mon, 11 Oct 2021 01:15:58 -0500
Date: Mon, 11 Oct 2021 11:45:57 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 19/35] mtd: spi-nor: Get rid of
 SPI_NOR_IO_MODE_EN_VOLATILE flag
Message-ID: <20211011061555.6sxmpuvpq7awkyke@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-20-tudor.ambarus@microchip.com>
 <20210817122108.nr2elnkiyatdp2hz@ti.com>
 <490dc958-1033-5807-5a67-8e7f6d064fd7@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <490dc958-1033-5807-5a67-8e7f6d064fd7@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_231636_699773_D0AC308A 
X-CRM114-Status: GOOD (  34.28  )
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

On 04/10/21 03:52AM, Tudor.Ambarus@microchip.com wrote:
> On 8/17/21 3:21 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 27/07/21 07:52AM, Tudor Ambarus wrote:
> >> Get rid of flash_info flags that indicate settings which can be
> >> discovered when parsing SFDP. It will be clearer who sets what,
> >> and we'll restrict the flash settings that a developer can choose to
> >> only settings that are not SFDP discoverable.
> >>
> >> SNOR_F_IO_MODE_EN_VOLATILE is discoverable when parsing the optional
> >> SCCR Map SFDP table. Flashes that do not define this table should set
> >> the flag in the late_init() call. Flashes that define the SFDP optional
> >> table but get the value wrong, should fix it in a post_sfdp fixup hook.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c      |  3 ---
> >>  drivers/mtd/spi-nor/core.h      |  9 ++-------
> >>  drivers/mtd/spi-nor/micron-st.c | 11 ++++++++---
> >>  3 files changed, 10 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 240d5c31af88..9885d434ea83 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -3204,9 +3204,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>       if (ret)
> >>               return ret;
> >>
> >> -     if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
> >> -             nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> >> -
> >>       ret = spi_nor_set_addr_width(nor);
> >>       if (ret)
> >>               return ret;
> >> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> >> index dfdc51a26cad..987797a789c8 100644
> >> --- a/drivers/mtd/spi-nor/core.h
> >> +++ b/drivers/mtd/spi-nor/core.h
> >> @@ -367,17 +367,12 @@ struct flash_info {
> >>                                        */
> >>  #define SPI_NOR_OCTAL_DTR_READ       BIT(18) /* Flash supports octal DTR Read. */
> >>  #define SPI_NOR_OCTAL_DTR_PP BIT(19) /* Flash supports Octal DTR Page Program */
> >> -#define SPI_NOR_IO_MODE_EN_VOLATILE  BIT(20) /*
> >> -                                              * Flash enables the best
> >> -                                              * available I/O mode via a
> >> -                                              * volatile bit.
> > 
> > We are losing the information contained in the comment. I think you
> > should move it to SNOR_F_IO_MODE_EN_VOLATILE's declaration.
> 
> ok
> 
> > 
> >> -                                              */
> >> -#define SPI_NOR_SWP_IS_VOLATILE      BIT(21) /*
> >> +#define SPI_NOR_SWP_IS_VOLATILE      BIT(20) /*
> >>                                        * Flash has volatile software write
> >>                                        * protection bits. Usually these will
> >>                                        * power-up in a write-protected state.
> >>                                        */
> >> -#define SPI_NOR_PARSE_SFDP   BIT(22) /*
> >> +#define SPI_NOR_PARSE_SFDP   BIT(21) /*
> >>                                        * Flash initialized based on the SFDP
> >>                                        * tables.
> >>                                        */
> >> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> >> index 72cc4673bf88..31ebd4c9b431 100644
> >> --- a/drivers/mtd/spi-nor/micron-st.c
> >> +++ b/drivers/mtd/spi-nor/micron-st.c
> >> @@ -118,13 +118,18 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
> >>       .post_sfdp = mt35xu512aba_post_sfdp_fixup,
> >>  };
> >>
> >> +static void mt35xu512aba_late_init(struct spi_nor *nor)
> >> +{
> >> +     nor->flags |= SNOR_F_4B_OPCODES;
> > 
> > Like I mentioned in the previous email, you can drop this since the
> > flash populates the 4BAIT table.
> 
> ok
> 
> > 
> >> +     nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> >> +}
> >> +
> >>  static const struct flash_info micron_parts[] = {
> >>       { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
> >>                              SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> >> -                            SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
> >> -                            SPI_NOR_IO_MODE_EN_VOLATILE)
> >> +                            SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
> >>         .fixups = &mt35xu512aba_fixups,
> >> -       .late_init = snor_f_4b_opcodes, },
> >> +       .late_init = mt35xu512aba_late_init, },
> >>       { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
> >>                           SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ)
> >>         .late_init = snor_f_4b_opcodes, },
> > 
> > I forgot to say this in the previous email, but since this flash is the
> > same family as the one above, it should also have the 4BAIT table, and
> > should not need this late_init. But I don't have access to this part so
> > I can't say with 100% certainty.
> > 
> 
> yeah, we don't update flash entries solely by datasheet, we can't update it without
> testing it.

Sounds fair to me. I didn't add Octal DTR support for this flash either, 
since I couldn't actually test it.

> 
> Cheers,
> ta

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
