Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFD5C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 13:09:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF33020848
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 13:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4azCSni";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p5V7gkCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF33020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=63r0NnMvoAX/5PtFyvyEkZM82rSihz6e+5EJq264WbI=; b=O4azCSniOsuqUON0BcEqvr18h
	RO1tujDj0TMGtm8Lois9BINE4916AcZIXl//d6CXV5vtelpc1BdVBWuJwAXdDRp3GTq5OeOWgZiNM
	LH/CQVBy2OYh9VISOKGDxHJtPTurWyTl6WIS5BdlHa5l/CggggTmcH5jKWVtbUO50IAwn6kYZhE8D
	zxfY572NQUH6qytIGugMwT1ITCWJ9TQP91EpHxgNP5xPVeoDS07AoEFu65j+GwpV6nVziwfFyZaJu
	mES3qDpJDIMwZOg5f8o3BxHzBpl6XrQjy7g55UWRSa3c+53xRDlO/7zDut77Uf1T7xKOyXty7ggDt
	hyLYuVbPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFNB-0004Cy-Eh; Tue, 29 Sep 2020 13:08:49 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFN9-0004Bn-0C
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 13:08:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TD8gOU014639;
 Tue, 29 Sep 2020 08:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601384922;
 bh=RLGW+YFIRVUBvC5l28tX8bJsGKwv4jqEcGYCjkq2IFw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=p5V7gkCSfgKohSXSEosrHGboPtUvYy+TBjs3Jv56Mb+8/tiYDdMyojAZi5t0cjG8Y
 GKcLN62ZIJ+DeotJu5DhNsUJbNZr1o1IOF7p2oEV/ExRI1btO59NHuxAzKcyWwyDQn
 eUO0F/I9MEwTpIc+F41J6OysuyTnt1uHrPRDxTko=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TD8gM8101901
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 08:08:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 08:08:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 08:08:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TD8e22128959;
 Tue, 29 Sep 2020 08:08:41 -0500
Date: Tue, 29 Sep 2020 18:38:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 11/15] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Message-ID: <20200929130838.4hfa2y3qoxissdus@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-12-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916124418.833-12-p.yadav@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_090847_149274_8E451257 
X-CRM114-Status: GOOD (  23.15  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 16/09/20 06:14PM, Pratyush Yadav wrote:
> Perform a Soft Reset on shutdown on flashes that support it so that the
> flash can be reset to its initial state and any configurations made by
> spi-nor (given that they're only done in volatile registers) will be
> reset. This will hand back the flash in pristine state for any further
> operations on it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 41 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |  2 ++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6ee93544d72f..853dfa02f0de 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -40,6 +40,9 @@
>  
>  #define SPI_NOR_MAX_ADDR_WIDTH	4
>  
> +#define SPI_NOR_SRST_SLEEP_MIN 200
> +#define SPI_NOR_SRST_SLEEP_MAX 400
> +
>  /**
>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>   *			   extension type.
> @@ -3174,6 +3177,41 @@ static int spi_nor_init(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static void spi_nor_soft_reset(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	int ret;
> +
> +	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 8),

The buswidth used here should be 1 instead of 8. It makes no difference 
in practice because the call to spi_nor_spimem_setup_op() immediately 
after will over-write it to the correct value anyway, but let's follow 
the style followed throughout the rest of the codebase. Will fix in the 
next version.

> +			SPI_MEM_OP_NO_DUMMY,
> +			SPI_MEM_OP_NO_ADDR,
> +			SPI_MEM_OP_NO_DATA);
> +	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret) {
> +		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		return;
> +	}
> +
> +	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 8),

Same here.

> +			SPI_MEM_OP_NO_DUMMY,
> +			SPI_MEM_OP_NO_ADDR,
> +			SPI_MEM_OP_NO_DATA);
> +	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret) {
> +		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		return;
> +	}
> +
> +	/*
> +	 * Software Reset is not instant, and the delay varies from flash to
> +	 * flash. Looking at a few flashes, most range somewhere below 100
> +	 * microseconds. So, sleep for a range of 200-400 us.
> +	 */
> +	usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
> +}
> +
>  /* mtd resume handler */
>  static void spi_nor_resume(struct mtd_info *mtd)
>  {

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
