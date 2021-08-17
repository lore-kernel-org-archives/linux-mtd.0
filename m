Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AD9C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:22:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8C560F5C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD8C560F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltzEYBXBojH5zqvuoRFPZAxc5niUt+ZJUA4mnbc8sMw=; b=i/gGYxWZcai4kW
	KxP4GxEt7WsvNd3Ur3qafufNgpIpcc7s2Na4ao1Y6ilbDwo8PpJJinK8cM+xcuMpPRjc+Ur28q10w
	piCqhkQfcmrPsBNtPUy3DYynM8Nlv37fwl0I20k6u6M3gW/602j6nQJAhd73mTqLi3DebbuqZ1Dnz
	WwfOAYlw8lyNGV9dMQp8hOv2uz1ZXHDl6WAC848bmO+79EgOsq4vAwmQ7F3UKPqIIrjUkN7d0caW6
	n0u4hHuJhOshIKIv6m88v7nd0my/nN2FVEXgxYTSccb2D6hezJQJZFuUbwqHvMP1BHzjnmj1a95Cv
	/V+R0LTXKyDPFOMcZyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFy69-002Qrx-Jx; Tue, 17 Aug 2021 12:21:41 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFy63-002QqF-SC; Tue, 17 Aug 2021 12:21:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HCLCwG101137;
 Tue, 17 Aug 2021 07:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629202872;
 bh=34eQKgR5SpNXpkJlZehmpYdK5qLA05eHSnAbSZTo8RE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nH7PM3Y2wLERQo55feXrG3vlFs5fioYUusEtcNJ+LJ9+Q7jNPhHjS6k++IeU1N6EE
 rT++ctlIxuvRp/8ALbkb9OiHYpK/YhsT7HX7Rqc6pQbOteKcme7dJFptpCBEF2ZDl6
 r7whOPZqlVRolLRqfR2PaYDKQaOAOlSQZ1z5uQxs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HCLCF7014796
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Aug 2021 07:21:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 07:21:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 07:21:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HCLBHr093297;
 Tue, 17 Aug 2021 07:21:12 -0500
Date: Tue, 17 Aug 2021 17:51:11 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 19/35] mtd: spi-nor: Get rid of
 SPI_NOR_IO_MODE_EN_VOLATILE flag
Message-ID: <20210817122108.nr2elnkiyatdp2hz@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-20-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-20-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_052136_070293_861C4D43 
X-CRM114-Status: GOOD (  26.88  )
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
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:52AM, Tudor Ambarus wrote:
> Get rid of flash_info flags that indicate settings which can be
> discovered when parsing SFDP. It will be clearer who sets what,
> and we'll restrict the flash settings that a developer can choose to
> only settings that are not SFDP discoverable.
> 
> SNOR_F_IO_MODE_EN_VOLATILE is discoverable when parsing the optional
> SCCR Map SFDP table. Flashes that do not define this table should set
> the flag in the late_init() call. Flashes that define the SFDP optional
> table but get the value wrong, should fix it in a post_sfdp fixup hook.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c      |  3 ---
>  drivers/mtd/spi-nor/core.h      |  9 ++-------
>  drivers/mtd/spi-nor/micron-st.c | 11 ++++++++---
>  3 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 240d5c31af88..9885d434ea83 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3204,9 +3204,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
> -		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> -
>  	ret = spi_nor_set_addr_width(nor);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index dfdc51a26cad..987797a789c8 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -367,17 +367,12 @@ struct flash_info {
>  					 */
>  #define SPI_NOR_OCTAL_DTR_READ	BIT(18) /* Flash supports octal DTR Read. */
>  #define SPI_NOR_OCTAL_DTR_PP	BIT(19) /* Flash supports Octal DTR Page Program */
> -#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(20) /*
> -						 * Flash enables the best
> -						 * available I/O mode via a
> -						 * volatile bit.

We are losing the information contained in the comment. I think you 
should move it to SNOR_F_IO_MODE_EN_VOLATILE's declaration.

> -						 */
> -#define SPI_NOR_SWP_IS_VOLATILE	BIT(21)	/*
> +#define SPI_NOR_SWP_IS_VOLATILE	BIT(20)	/*
>  					 * Flash has volatile software write
>  					 * protection bits. Usually these will
>  					 * power-up in a write-protected state.
>  					 */
> -#define SPI_NOR_PARSE_SFDP	BIT(22) /*
> +#define SPI_NOR_PARSE_SFDP	BIT(21) /*
>  					 * Flash initialized based on the SFDP
>  					 * tables.
>  					 */
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 72cc4673bf88..31ebd4c9b431 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -118,13 +118,18 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
>  	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
>  };
>  
> +static void mt35xu512aba_late_init(struct spi_nor *nor)
> +{
> +	nor->flags |= SNOR_F_4B_OPCODES;

Like I mentioned in the previous email, you can drop this since the 
flash populates the 4BAIT table.

> +	nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> +}
> +
>  static const struct flash_info micron_parts[] = {
>  	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
>  			       SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> -			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
> -			       SPI_NOR_IO_MODE_EN_VOLATILE)
> +			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
>  	  .fixups = &mt35xu512aba_fixups,
> -	  .late_init = snor_f_4b_opcodes, },
> +	  .late_init = mt35xu512aba_late_init, },
>  	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>  			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ)
>  	  .late_init = snor_f_4b_opcodes, },

I forgot to say this in the previous email, but since this flash is the 
same family as the one above, it should also have the 4BAIT table, and 
should not need this late_init. But I don't have access to this part so 
I can't say with 100% certainty.

> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
