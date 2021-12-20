Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A0FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 18:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ0NETb5Pz6oM6xY5wIZOoNlMCys3KS2G5FCY3VeXSs=; b=gZW1dBwumoFYD/
	HcYu/p7wfvVw7R/ER6FFmevaCNh2CpS8Npr6at0eoqaWFzbr6tB9RhGtGIipHYFcuVlZmxGQf31Rx
	jwsMmSLywA+f7iMwuufmwOOz0yBjah74HZQFq2r3RGUbAyTf8dE3rYnM3j2X+pBBKynW3iPKRA95k
	QpxYhdmQYTjiM4bw7AA5gilLPULGEcv55eE/qxlbap3qwiriyYMr7RzAZ3/N+aHVQsU1VsVrtiMym
	y7jDe7gMBfQD9lzBr+BJ+1ycqGkUzJ9Ay5W70q//QJ+YFI5LsKVHaOb5vJeJ9N/FXNBGjlTBfwisM
	GR/2hCj0RWuJeWtRiv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNdL-003rYO-Sf; Mon, 20 Dec 2021 18:43:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNdH-003rUU-2F
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 18:43:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKIhRJV121727;
 Mon, 20 Dec 2021 12:43:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640025807;
 bh=op9adSc02RSBJvFhrCaZ9umEgBc9t0ASTDmU5qXBjXY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=YcY0DQI2uXiRWkrBrHpBEId5ZV3SbchngTLTuGXUf6AzctvzlZ+kq57le+XTtXBzD
 jR+s054wX8TOP86ElozNM1dB5POx408MkGdNIrJG0ongK5qCWRybtcuhtU1IezoYpJ
 mtlwmbk590kok31IqHX3LHAlXwyrsStAuY+KVJV0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKIhREh130826
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 12:43:27 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 12:43:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 12:43:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKIhQMi104484;
 Mon, 20 Dec 2021 12:43:26 -0600
Date: Tue, 21 Dec 2021 00:13:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 02/14] spi: spi-mem: Introduce a capability structure
Message-ID: <20211220184323.cfbd5ypintmz2xrq@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217161654.367782-3-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_104335_246428_CD78BE3C 
X-CRM114-Status: GOOD (  24.65  )
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

On 17/12/21 05:16PM, Miquel Raynal wrote:
> Create a spi_controller_mem_caps structure and put it within the
> spi_controller_mem_ops structure as these are highly related. So far the
> only field in this structure is the support for dtr operations, but soon
> we will add another parameter.
> 
> Also create a helper to parse the capabilities and check if the
> requested capability has been set or not.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/spi/spi-mem.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 85e2ff7b840d..045ecb7c6f50 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -220,6 +220,17 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
>  	return mem->drvpriv;
>  }
>  
> +/**
> + * struct spi_controller_mem_caps - SPI memory controller capabilities
> + * @dtr: Supports DTR operations
> + */
> +struct spi_controller_mem_caps {
> +	bool dtr;

I assume this would mean DTR is supported on _all_ phases? I am not sure 
if we would ever need to encode DTR support per-phase, but that can 
probably come later. Or the controller's supports_op() hook can do those 
checks before calling spi_mem_default_supports_op().

> +};
> +
> +#define spi_mem_controller_is_capable(ctlr, cap)		\
> +	((ctlr)->mem_ops->caps && (ctlr)->mem_ops->caps->cap)	\
> +
>  /**
>   * struct spi_controller_mem_ops - SPI memory operations
>   * @adjust_op_size: shrink the data xfer of an operation to match controller's
> @@ -253,6 +264,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
>   * @poll_status: poll memory device status until (status & mask) == match or
>   *               when the timeout has expired. It fills the data buffer with
>   *               the last status value.
> + * @caps: controller capabilities for the handling of the above operations.
>   *
>   * This interface should be implemented by SPI controllers providing an
>   * high-level interface to execute SPI memory operation, which is usually the
> @@ -283,6 +295,7 @@ struct spi_controller_mem_ops {
>  			   unsigned long initial_delay_us,
>  			   unsigned long polling_rate_us,
>  			   unsigned long timeout_ms);
> +	const struct spi_controller_mem_caps *caps;

I feel like this would be better passed in as an argument to the 
spi_mem_default_supports_op() function. But I see that Mark and you feel 
differently so I won't insist on it.

>  };
>  
>  /**
> -- 
> 2.27.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
