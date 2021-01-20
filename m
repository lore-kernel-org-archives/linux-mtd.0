Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB86C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 12:30:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9ADD2250F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 12:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9ADD2250F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bVRuqDcoGkksRVYJCubtmceUedORVapXYoCCKXZxhSw=; b=pDpNwck1F4iU3zUEU3sic7sZO
	IPnlEEYg7EK/eXBKr6YTQm7D3sJHNfrpae56cp1eL0v31te7E8jGqLvW1Ia3kD+EJPEM4AhvSkSGb
	KZFe0T/c9/LkxkINCtUvIAMiJ8sdjF6+RFX4XMRRjYNQHWYKIc8yNbifP+0F3mA4ZN9sqi2xHJP9u
	TYNkmWv5m4edn1WN6rrw7rRBDn3bj7DOUJMdcUe6Zw5RPMTzmXE3BBeWwc3dhQKgHZ0sNchM0VARl
	FYnBlQuHbLUcL5EAXk0JTr6k3lupfpVAdx6oBIUvcwbnDYsSe/R78x8OgL+pe58TVN/U2v9UEXyt/
	TgNuFKiBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2CcO-00009q-Ku; Wed, 20 Jan 2021 12:29:48 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2CcL-00009R-FT
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 12:29:46 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10KCTgfK001804;
 Wed, 20 Jan 2021 06:29:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1611145782;
 bh=mkonnS399k2ET+gZIAzhzr9qheut3j+L6l9jvq4tMOE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RohWxg8V/CpAtkgIldbR4jhijfWEqZNGf8ceyJW2ePIY0uYCUaCFLZC7MgkLWybmB
 r3Sp54du9pDJr/RVLoRosS/vHcfyvsBVEebcuywSvSKpcKzoEffQVaQqEwmNAoL7ZB
 4er9TvbRh/aZsmzz1YOxaInWlE0SvhG6Gi0AAz/0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10KCTg8Q090719
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Jan 2021 06:29:42 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 Jan 2021 06:29:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 Jan 2021 06:29:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10KCTfFa115893;
 Wed, 20 Jan 2021 06:29:41 -0600
Date: Wed, 20 Jan 2021 17:59:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: sst: Add support for Global Unlock on
 sst26vf
Message-ID: <20210120122940.2xkiwghtszzyylnm@ti.com>
References: <20210120105411.254890-1-tudor.ambarus@microchip.com>
 <20210120105411.254890-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120105411.254890-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_072945_622064_C14013EB 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 20/01/21 12:54PM, Tudor Ambarus wrote:
> Even if sst26vf shares the SPINOR_OP_GBULK opcode with
> Macronix (ex. MX25U12835F) and Winbound (ex. W25Q128FV),
> it has its own Individual Block Protection scheme, which
> is also capable to read-lock individual parameter blocks.
> Thus the sst26vf's Individual Block Protection scheme will
> reside in the sst.c manufacturer driver.
> 
> Add support to unlock the entire flash memory. The device
> is write-protected by default after a power-on reset cycle
> (volatile software protection), in order to avoid inadvertent
> writes during power-up. Could do an erase, write, read back,
> and compare when MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/sst.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 00e48da0744a..1cd2a360c41e 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -8,6 +8,39 @@
>  
>  #include "core.h"
>  
> +static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	if (!ofs && len == nor->params->size)

Nitpick: ofs is not a boolean value. Don't treat it as such. (ofs == 0 
&& len == nor->params->size) makes the intent much clearer.

> +		return spi_nor_global_block_unlock(nor);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct spi_nor_locking_ops sst26vf_locking_ops = {
> +	.lock = sst26vf_lock,
> +	.unlock = sst26vf_unlock,
> +	.is_locked = sst26vf_is_locked,
> +};
> +
> +static void sst26vf_default_init(struct spi_nor *nor)
> +{
> +	nor->params->locking_ops = &sst26vf_locking_ops;
> +}
> +
> +static const struct spi_nor_fixups sst26vf_fixups = {
> +	.default_init = sst26vf_default_init,
> +};
> +
>  static const struct flash_info sst_parts[] = {
>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> @@ -39,8 +72,9 @@ static const struct flash_info sst_parts[] = {
>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
>  			      SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
> -			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> +			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		.fixups = &sst26vf_fixups },
>  };
>  
>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
> -- 
> 2.25.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
