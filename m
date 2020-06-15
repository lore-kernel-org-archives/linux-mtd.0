Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C244EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 10:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9183B2068E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 10:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wbm4d/io";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fjy/rzpI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9183B2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLCXLgsQOTMmOzZlOi4vsScJT4krEIxPYnUOIlyXtbw=; b=Wbm4d/iomBAmb5
	eLA1zDXEAv6eb31Ap8Nm0miaUYVkt95xudhgnrY3bEVMNQGcmKWaEVMfzZ3gooVpxkF0Y7t+ag2Dk
	rLyot63Ra5obir4vtq9yOF/NaE6c+Z7Kmpi4zZmWaus3dHBGVCzicD+IqUWV786YRjoWhkAjyHzth
	pTOfjR2ucgD5IeGvCvGcj1kiMp9hFOo2LpWoSbansIsRRXzYr5ZJeIeHf+aaajMJye3DLZRw9c4bF
	1oSgs5f2wT6x8pvvXeyDUJJf52XrDjms8ri9gFqjKGE63rclb7R0fMiTUOdudiDy3EOUZRgNzr6U/
	Q5hQxBuMs0ryoy/GcS/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkmkJ-0003V6-Dz; Mon, 15 Jun 2020 10:53:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkmkG-0003Ue-Ea
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 10:53:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FArPLH061769;
 Mon, 15 Jun 2020 05:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592218405;
 bh=wkRcUaXwD0TRPA9v3wUHE1QqAU3b8ZTdWuDpEbnA2vk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fjy/rzpIvpXL2C4eqDMXRbpt/+8dZdQ5Z0eAngJTGSGpNcyT9WqUcbMFaCeVzS22f
 /23bojwTdLOEAdItbjJnJYVG0dG7T5UsZxNG4ZzW7KKdru7F/fA6zdoL/A5p7qH8cf
 lp8jtsD+/GfU2k6ArDwRuD4KyNmC2tHJWhLn3v7k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05FArOn0092659
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Jun 2020 05:53:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 05:53:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 05:53:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FArNZB101156;
 Mon, 15 Jun 2020 05:53:24 -0500
Date: Mon, 15 Jun 2020 16:23:23 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH v2 1/2] mtd: spi-nor: Add capability to disable flash
 quad mode
Message-ID: <20200615105321.d2pjwjmm3wch4qtx@ti.com>
References: <1589282819-42358-1-git-send-email-yangyicong@hisilicon.com>
 <1589282819-42358-2-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589282819-42358-2-git-send-email-yangyicong@hisilicon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_035340_598721_25582CD4 
X-CRM114-Status: GOOD (  19.93  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Yicong,

You generally shouldn't mark a series as "RFC" if you intend it to get 
merged in.

On 12/05/20 07:26PM, Yicong Yang wrote:
> Previous we didn't provide a way to disable the flash's quad mode.
> Which means we cannot do some cleanup works when to remove or
> poweroff the flash, like what set 4-byte address mode does in
> spi_nor_restore().
> 
> Add the capability to disable the flash quad mode, by introducing
> an enable flag in the flash parameters quad_enable() hooks and
> related functions.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 53 ++++++++++++++++++++++++++++++++--------------
>  drivers/mtd/spi-nor/core.h |  8 +++----
>  2 files changed, 41 insertions(+), 20 deletions(-)

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Nits below.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cc68ea8..72e8d8b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1907,15 +1907,17 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  }
>  
>  /**
> - * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status
> + * spi_nor_sr1_bit6_quad_enable() - Set/Unset the Quad Enable BIT(6) in the
> + *                                  Status
>   * Register 1.

The "Register 1" should be on the same line as the "Status above".

>   * @nor:	pointer to a 'struct spi_nor'
> + * @enable:	true to enter quad mode. false to leave quad mode.
>   *
>   * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI memories.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
> +int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
>  
> @@ -1923,45 +1925,59 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
> +	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
> +	    !(enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))

I still think writing it as:

    (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6))

is slightly more readable. But maybe it's just me so this is OK I guess.

>  		return 0;
>  
> -	nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
> +	if (enable)
> +		nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
> +	else
> +		nor->bouncebuf[0] &= ~SR1_QUAD_EN_BIT6;
>  
>  	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
>  }
>  
>  /**
> - * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
> + * spi_nor_sr2_bit1_quad_enable() - set/unset the Quad Enable BIT(1) in the
> + *                                  Status
>   * Register 2.

The "Register 2" should be on the same line as the "Status above".

>   * @nor:       pointer to a 'struct spi_nor'.
> + * @enable:	true to enter quad mode. false to leave quad mode.
>   *
>   * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
> +int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
[...]
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b2..719a31d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -219,7 +219,7 @@ struct spi_nor_flash_parameter {
>  
>  	struct spi_nor_erase_map        erase_map;
>  
> -	int (*quad_enable)(struct spi_nor *nor);
> +	int (*quad_enable)(struct spi_nor *nor, bool enable);

Update the comment above reflecting that @quad_enable "enables/disables 
SPI NOR quad mode".

>  	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>  	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>  	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
