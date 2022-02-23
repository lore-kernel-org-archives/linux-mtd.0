Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517DAC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPMECyHV0lElOaoB/5+ftNIO4+TIPgLhnZ7w0VHZKm0=; b=hmDeaY4S1Kb7KV
	mc5OF83VoPsbN5kH+yaLyOn767TCeek5oOjGsS+TWcJ5nOv12Ym7wCpKUYn4u8PQEAy/Xc7ToW7kJ
	mw8j+ay7yy1/HYx17Q1kE19PY8KB2/zJJZPLIYxztwk6XYttLQj5SC0jxoH0xsQqe9oVA4E0qJgHb
	UwxHXtXkK9Iem3egQtKmcH4dvatiyh3NpSWGNUEgFj8ZvJ5UNOZ7Ax4UXJ0lrVRH2QeCyo74YzmOk
	Q7PGZ5E9fwXzMvoTkcD2ww/yazxPjbe8fQVoET0UC3gCYXjPyTZ9ApBa20E/eDGTr+0Ds5huU+E4o
	UcWeNn05kR2uV4G/cwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMqq0-00EBrv-Gl; Wed, 23 Feb 2022 12:33:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqEJ-00E0a5-W9
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:54:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBsjx6125254;
 Wed, 23 Feb 2022 05:54:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645617285;
 bh=nZ7gTtsnYSWT0640cyi2p07HuKh9WWN1Sd0k1wHT2yc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=N7igpGNDbVhg91kQ8YcJjBMl0kBQ8zR6r5Oa4FwkGAMRga8lLAuH/FNuK4NOyrmui
 Zgoh6wARohWyrnNRVKxtiVnQTTBEi9QcnuTYotnuI2sFmRGFjlWjNB+4L6RtFZ0VNP
 xjZCYiF/wlN5523EHjm1YC67ljOE/N9e2sZrtJ/g=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBsjU0020751
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:54:45 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:54:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:54:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBsiFB046499;
 Wed, 23 Feb 2022 05:54:45 -0600
Date: Wed, 23 Feb 2022 17:24:44 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 26/32] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Message-ID: <20220223115444.wj24a2vvtjc2zexv@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-27-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-27-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_035448_152414_0B56AE04 
X-CRM114-Status: GOOD (  19.90  )
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

On 21/02/22 01:08PM, Michael Walle wrote:
> Drop the generic spi_nor prefix for all the micron-st functions.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index f693f8720541..de450495e1ab 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -309,7 +309,7 @@ static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  }
>  
>  /**
> - * spi_nor_read_fsr() - Read the Flag Status Register.
> + * micron_st_nor_read_fsr() - Read the Flag Status Register.
>   * @nor:	pointer to 'struct spi_nor'
>   * @fsr:	pointer to a DMA-able buffer where the value of the
>   *              Flag Status Register will be written. Should be at least 2
> @@ -317,7 +317,7 @@ static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> +static int micron_st_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>  {
>  	int ret;
>  
> @@ -353,10 +353,10 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>  }
>  
>  /**
> - * spi_nor_clear_fsr() - Clear the Flag Status Register.
> + * micron_st_nor_clear_fsr() - Clear the Flag Status Register.
>   * @nor:	pointer to 'struct spi_nor'.
>   */
> -static void spi_nor_clear_fsr(struct spi_nor *nor)
> +static void micron_st_nor_clear_fsr(struct spi_nor *nor)
>  {
>  	int ret;
>  
> @@ -380,13 +380,13 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
>  }
>  
>  /**
> - * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
> - * ready for new commands.
> + * micron_st_nor_fsr_ready() - Query the Flag Status Register to see if the
> + * flash is ready for new commands.

This is misleading. This function doesn't only query the FSR, but the SR 
as well. I think this should be renamed to micron_st_nor_ready(), and 
documentation updated to reflect that it checks for SR, and then FSR as 
well if the flag is specified.

>   * @nor:	pointer to 'struct spi_nor'.
>   *
>   * Return: 1 if ready, 0 if not ready, -errno on errors.
>   */
> -static int spi_nor_fsr_ready(struct spi_nor *nor)
> +static int micron_st_nor_fsr_ready(struct spi_nor *nor)
>  {
>  	int sr_ready, ret;

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
