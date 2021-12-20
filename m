Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C66C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANvTTpj8a/J/UmtLiHjZRncgyXItQCgqVQ/Te+/+SNU=; b=boqvjTbys+Y1Da
	/pqqnM97VNi5AFRzg8l9x2KyRhBi2pt6PIX6jhLG6yKJ05jzKC5XsLPQiNXsZDFHnXvc9fiKGMf0Z
	qLQCMTfRGhlW7avJz06OrBiYvOrS6cOLNbfmoHBsURAZWTn6YzOE9heSRzDMeKcfyGCXCOB2eK/FU
	Fs9dSzd6G+RC/UTaD6yFiy101VDRGe4pWz7BKAfEafN9oYDAunTOha+7Sb474OwHrsdb5FWug5x1c
	QtRhp6C8BM2Qejx6dCer9sZeCrftxwLrekaAQRJvvBNFXQk8kCLTU1w9TlSGHM/R63bV/m2rwSnfo
	dwY9sTCz2iIosqvxjIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNoy-003vw9-Da; Mon, 20 Dec 2021 18:55:40 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNon-003vt1-JO
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 18:55:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKItKea023931;
 Mon, 20 Dec 2021 12:55:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640026520;
 bh=P7JkFi+LBZjD9ILv70AdUzMgiXN4qffn1W2EvwhJXps=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=q0yd/O/h55zMvGkSk554wZTDxkNrcec8sMdPeAmlHcrtPEnLgeXaqPJ/hHBMTMwKO
 aB3p69eb5YjJ272zMK62BVeez3txQCHIezmHkfF9K0h3WyyzyNJN0i03p0YDCuvBG8
 2XG8L82r1Jh7XnnT8PzRoUPe9DWhTZhEBPoIcm3g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKItKab004062
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 12:55:20 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 12:55:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 12:55:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKItIJQ127935;
 Mon, 20 Dec 2021 12:55:19 -0600
Date: Tue, 21 Dec 2021 00:25:18 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 04/14] spi: cadence: Provide a capability structure
Message-ID: <20211220185515.wujhgn66mnwns7bw@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217161654.367782-5-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_105529_763635_D5794335 
X-CRM114-Status: GOOD (  19.37  )
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

> Subject: [PATCH v7 04/14] spi: cadence: Provide a capability structure

s/cadence/cadence-quadspi/

On 17/12/21 05:16PM, Miquel Raynal wrote:
> This controller has DTR support, so advertize it with a capability now
> that the spi_controller_mem_ops structure contains this new field. This
> will later be used by the core to discriminate whether an operation is
> supported or not, in a more generic way than having different helpers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-cadence-quadspi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index 101cc71bffa7..98e0cc4236e3 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1388,10 +1388,15 @@ static const char *cqspi_get_name(struct spi_mem *mem)
>  	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi->chip_select);
>  }
>  
> +static const struct spi_controller_mem_caps cqspi_mem_caps = {
> +	.dtr = true,
> +};
> +
>  static const struct spi_controller_mem_ops cqspi_mem_ops = {
>  	.exec_op = cqspi_exec_mem_op,
>  	.get_name = cqspi_get_name,
>  	.supports_op = cqspi_supports_mem_op,
> +	.caps = &cqspi_mem_caps,

I just noticed you put it under struct spi_mem_ops, not under struct 
spi_mem. This is not an operation per se so wouldn't it be better if it 
is moved to struct spi_mem?

Anyway, the change itself looks good to me. The cqspi_supports_mem_op()
already checks for mixed DTR modes so we should be good.

>  };
>  
>  static int cqspi_setup_flash(struct cqspi_st *cqspi)
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
