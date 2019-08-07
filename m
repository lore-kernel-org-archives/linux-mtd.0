Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7976FC32751
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 16:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D2121E6C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 16:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qjM/DYQ5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B7V4WtUq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D2121E6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdc8tX3fswsAqzzq8mKt4YGOx3wZBW4aGXW7O5+/06M=; b=qjM/DYQ5GxQXM2
	wixRP7dCqCQnpT13jU3D/L/hUIiUdnab+DdThmTh95j8m7oeoXVTjNxl4zKWplS/z8FkwfH6yIO3Z
	VJog2e6S7mnsS8OOFR0NDX17WVicKBmA+fDKtMsmlyg79rj/XqnS70roF1zClCHUXxAw3z/Ui5c4I
	wdNkgezmaCUw92Ie4yCQJIISO+J0rxxcthW3jscKeBagn7Wk22QPNwWrt2p+n9fKPbLVpjqhpcxHG
	30I7g7pEiyKiSjUrJwu/l+k07ysOG789sU1t/pH1RYg7bMovD7xQ2ySmNPkl9XDb3XiZ9JcddWOfB
	+DZh/RB13RRxhwxBNCIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvOkL-0007Qu-Qd; Wed, 07 Aug 2019 16:25:05 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvOkI-0006dT-CM
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 16:25:03 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77GOf0D107164;
 Wed, 7 Aug 2019 11:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565195081;
 bh=Rd7DS5JXyHAAq1zmDNMB/zcMDAc9CvS8qijx51VvoE4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=B7V4WtUqCJKRhb8XCc+VDGs9BPnK8H9DPPO+JOynJn9NdS6J/ZooZPjWG2DTZ7OmS
 MUHiWChnP2fE2N5RAHHnWDa+aQK6/JP/YWuqR4M7+r9IeYfGXZ/wlrq499Q0VkJy/r
 c5ZJFeGC2x47zrH51wD09nxj5blpGvLibc5g9HZs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77GOfOS058892
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Aug 2019 11:24:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 11:24:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 11:24:41 -0500
Received: from [10.250.132.50] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77GObFI102314;
 Wed, 7 Aug 2019 11:24:38 -0500
Subject: Re: [PATCH v2 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
To: <Tudor.Ambarus@microchip.com>, <marek.vasut@gmail.com>
References: <0fc5d3bb-aa11-2816-4734-75dc86deb0d2@microchip.com>
 <20190717113047.32596-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0ea41a21-a1bb-9d19-f739-8e6ccdd6a421@ti.com>
Date: Wed, 7 Aug 2019 21:54:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717113047.32596-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_092502_513830_FAFEE543 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Tudor

On 17-Jul-19 5:00 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
[...]
> 
>  drivers/mtd/spi-nor/Kconfig   | 8 ++++++++
>  drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 6de83277ce8b..b550e10657f1 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -22,6 +22,14 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>  	  Please note that some tools/drivers/filesystems may not work with
>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>  
> +config MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION
> +	bool "Disable write protection during power-up"
> +	default y
> +	help
> +	   Some spi-nor flashes are write protected by default after a power-on
> +	   reset cycle, in order to avoid inadvertend writes during power-up.
> +	   Disable the write protection during power-up.
> +


Hmm, how about setting MTD_POWERUP_LOCK flag in mtd->flags whenever
flash powers up with WP enabled? User can disable WP by declaring
partitions rw or keep partitions locked with ro. MTD core takes care of
calling mtd->unlock() depending up on the rw/ro flag as part of
add_mtd_device()

We could probably enhance spi_nor_unlock() to use
spi_nor_unlock_global_block_protection() when asked to unlock entire flash.

Kconfig option does not scale well for multi-platform build. There would
not be a way to have WP enabled on one platform but disabled on other.


Regards
Vignesh

>  config SPI_ASPEED_SMC
>  	tristate "Aspeed flash controllers in SPI mode"
>  	depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ffb53740031c..9b948295ef27 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1684,7 +1684,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
> +static int __maybe_unused spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
>  {
>  	int ret;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> @@ -1726,7 +1726,8 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
>  	return spi_nor_clear_sr_bp(nor);
>  }
>  
> -static int spi_nor_unlock_global_block_protection(struct spi_nor *nor)
> +static int __maybe_unused
> +spi_nor_unlock_global_block_protection(struct spi_nor *nor)
>  {
>  	int ret;
>  
> @@ -4049,6 +4050,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  {
>  	int err;
>  
> +#ifdef CONFIG_MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION
>  	/*
>  	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>  	 * with the software protection bits set.
> @@ -4082,6 +4084,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  			return err;
>  		}
>  	}
> +#endif
>  
>  	if (nor->quad_enable) {
>  		err = nor->quad_enable(nor);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
