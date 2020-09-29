Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84C5C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 16:46:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5CC206F7
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 16:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eo3XXTWG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vHvjPIdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5CC206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wNzSzgCVMPzUHSHKpiUdOPToWkcUKDowFH7etEXrg3Y=; b=Eo3XXTWGoKiv/Jzsbo4E0TuCG
	q+brybQVSib8pvS1xW8mFlHGjPzphOosZRdTx2NlbCNZtr7EIXNU2exNWzQDSqUiot0z2LpGr8vL0
	q26PhGEb3hhTT3TwHPgZAQzmducmnOfhmdVmX8nS6HhmS3YrbFG98VVg6dZd0FRW+OckG435rmBj+
	s6Z2Fgl4EIKyhXkM9wbBjDW3qxogDeQVVEre79A3CUPAPidqu+zIw3Wo0z8SgrQPxPYiieVjvqPjE
	3HmfYP77Jfg7bEL0PFdeuY014P0ArbU9qNbrygZqzJGtCI6n4INSHqO3tI0iE0vtd97iSeLxnnvLJ
	VXYb+gwjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNIl0-0004L4-Ah; Tue, 29 Sep 2020 16:45:38 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNIkx-0004Ki-Up
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 16:45:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TGjYeq098358;
 Tue, 29 Sep 2020 11:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601397934;
 bh=G3wuX0xFDMsxLlO7wQPuZHccULTwoS24ziAs3OgkTxM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vHvjPIddf3CgiE/s34gzL81i+yC+qpNkmVa/l0uVkZQQc31iLladXWQVCBrNh+qwy
 NeBYfo/N7JUnWDgotaExZdn9x1V72C9R6sj7hNHzdXSQoXTy7bwjbeSd9Q2/yo3pmr
 ZGbXZEtWk74V+cNeSvq1Z5pOiPcwsCXPS91OQdik=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TGjYNe048352
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 11:45:34 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 11:45:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 11:45:33 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TGjVul016043;
 Tue, 29 Sep 2020 11:45:31 -0500
Subject: Re: [RFC PATCH 1/3] mtd: spi-nor: Introduce SNOR_F_IO_MODE_EN_VOLATILE
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <boris.brezillon@collabora.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200929095951.1575658-1-tudor.ambarus@microchip.com>
 <20200929095951.1575658-2-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <dbfbe704-6d12-bdbd-db81-0296f5a9557a@ti.com>
Date: Tue, 29 Sep 2020 22:15:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929095951.1575658-2-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_124536_134209_42FD352E 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/29/20 3:29 PM, Tudor Ambarus wrote:
> We don't want to enter a stateful mode, where a X-X-X I/O mode
> is entered by setting a non-volatile bit, because in case of a
> reset or a crash, once in the non-volatile mode, we may not be able
> to recover in bootloaders and we may break the SPI NOR boot.
> 
> Forbid by default the I/O modes that are set via a non-volatile bit.
> 
> SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes that
> don't define the optional SFDP SCCR Map, so that we don't pollute the
> flash info flags.
> 

I would make this SPI_NOR_IO_MODE_EN_NON_VOLATILE. Because flashes with
volatile bits to change IO modes are more common than non volatile ones
and above change makes its easier to spot such quirky flashes.

> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 6 ++++++
>  drivers/mtd/spi-nor/core.h | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 34edfcf33172..c149b318e2e8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3089,6 +3089,9 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
>  		return 0;
>  
> +	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
> +		return 0;
> +
>  	ret = nor->params->octal_dtr_enable(nor, enable);
>  	if (ret)
>  		return ret;
> @@ -3474,6 +3477,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (info->flags & SPI_NOR_4B_OPCODES)
>  		nor->flags |= SNOR_F_4B_OPCODES;
>  
> +	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
> +		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> +
>  	ret = spi_nor_set_addr_width(nor);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 10dc03506f93..c2755c82f978 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -27,6 +27,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_HAS_4BIT_BP      = BIT(12),
>  	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
>  	SNOR_F_SOFT_RESET	= BIT(14),
> +	SNOR_F_IO_MODE_EN_VOLATILE = BIT(15),
>  };
>  
>  struct spi_nor_read_command {
> @@ -323,6 +324,11 @@ struct flash_info {
>  					 */
>  #define SPI_NOR_OCTAL_DTR_READ	BIT(19) /* Flash supports octal DTR Read. */
>  #define SPI_NOR_OCTAL_DTR_PP	BIT(20) /* Flash supports Octal DTR Page Program */
> +#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(21) /*
> +						 * Flash enables the best
> +						 * available I/O mode via a
> +						 * volatile bit.
> +						 */
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
