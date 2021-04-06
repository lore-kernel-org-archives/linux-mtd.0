Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8562C433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 11:08:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2C46135D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 11:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2C46135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0VMuSWcrR3dy+KgrkNM98OAN4T6KE0NHZZJxCDh21WQ=; b=jM2yBoKsDgEqVqXQcQTlw/zoG
	t1XQdiouC4uFPaTw9Hwh2mJtrEw2NmSK4erQIRhJTXKbqHbsFQX2IZcR8yC1Ff9PWNe1XTD1bjJg3
	reXSJ7mcmUpYb3VAepe4YMFhTcOE7HiWSk44/N+eaWHbmeiKR0/jQd2063GAFg6JtTsAcWr4h+vUx
	qBMsYlF94wzRQ19zsDMsK3dABlrHy7P4Dco9/cW4TzRwBiNiZVBpW3ID08TtGfUYEn1kG4ViAYjM6
	+gbmiNnsj2ld9T7YcCvuNKZgQF/BZKowLp8wZU1Slg7GcAtnikfrE6XwotDuuRXqBxRIYxe3P+h6h
	likaYnCAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjYV-002HQw-RD; Tue, 06 Apr 2021 11:07:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjYQ-002HQE-Ik
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 11:07:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 136B7MB4088104;
 Tue, 6 Apr 2021 06:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617707242;
 bh=Ib5AzAJu6d3M90nfniDnrX4WUt2KfC0tim1RmqsKGzU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=N0su1rEoSoTaspAK1oaMPNmSPSCJlFTcCc5OKVwuRkCAdYVgs+lB8HBZsPhxW2wnu
 qO70SQ+vvmk7O5aQpZFrzh7mbOogGKwvn3WpECAxpB554eNI8DTeHLJvpyqrFzdGoQ
 vA1nBwpjZzjzHSUmmVQMvVpsQUL2zYZjaoHTWj4A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 136B7Mhs059915
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Apr 2021 06:07:22 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Apr
 2021 06:07:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Apr 2021 06:07:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 136B7LAQ042884;
 Tue, 6 Apr 2021 06:07:21 -0500
Date: Tue, 6 Apr 2021 16:37:20 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <yaliang.wang@windriver.com>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <tkuw584924@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: core: reuse spi_nor_clear_sr function
Message-ID: <20210406110718.y6dacaeqahc7fbpi@ti.com>
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
 <20210401195012.4009166-2-yaliang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401195012.4009166-2-yaliang.wang@windriver.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_120730_990997_FCA926E4 
X-CRM114-Status: GOOD (  23.47  )
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

On 02/04/21 03:50AM, yaliang.wang@windriver.com wrote:
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> spi_nor_clear_fsr() and spi_nor_clear_sr() are almost the same, except
> the opcode they used, the codes can be easily reused without much
> changing.

Honestly, I am not sure how I feel about this. Yes, it would reduce some 
code duplication but at the same time reduces the readability slightly. 
spi_nor_clear_fsr(nor) is easier to read than spi_nor_clear_sr(nor, OP_CLFSR). 
I won't blame someone for missing that 'F' and thinking that it actually 
simply clears the SR. Dunno...

Anyway, if we do decide to go through with this change, the code changes 
look good to me.

> 
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---
>  drivers/mtd/spi-nor/core.c | 40 +++++++-------------------------------
>  1 file changed, 7 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6dc8bd0a6bd4..dbd6adb6aa0b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -652,14 +652,15 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
>  /**
>   * spi_nor_clear_sr() - Clear the Status Register.
>   * @nor:	pointer to 'struct spi_nor'.
> + * @opcode:	the SPI command op code to clear status register.
>   */
> -static void spi_nor_clear_sr(struct spi_nor *nor)
> +static void spi_nor_clear_sr(struct spi_nor *nor, u8 opcode)
>  {
>  	int ret;
>  
>  	if (nor->spimem) {
>  		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
>  				   SPI_MEM_OP_NO_ADDR,
>  				   SPI_MEM_OP_NO_DUMMY,
>  				   SPI_MEM_OP_NO_DATA);
> @@ -668,12 +669,12 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> -		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> +		ret = spi_nor_controller_ops_write_reg(nor, opcode,
>  						       NULL, 0);
>  	}
>  
>  	if (ret)
> -		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> +		dev_dbg(nor->dev, "error %d clearing status\n", ret);
>  }
>  
>  /**
> @@ -697,7 +698,7 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
>  		else
>  			dev_err(nor->dev, "Programming Error occurred\n");
>  
> -		spi_nor_clear_sr(nor);
> +		spi_nor_clear_sr(nor, SPINOR_OP_CLSR);
>  
>  		/*
>  		 * WEL bit remains set to one when an erase or page program
> @@ -715,33 +716,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
>  	return !(nor->bouncebuf[0] & SR_WIP);
>  }
>  
> -/**
> - * spi_nor_clear_fsr() - Clear the Flag Status Register.
> - * @nor:	pointer to 'struct spi_nor'.
> - */
> -static void spi_nor_clear_fsr(struct spi_nor *nor)
> -{
> -	int ret;
> -
> -	if (nor->spimem) {
> -		struct spi_mem_op op =
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
> -				   SPI_MEM_OP_NO_ADDR,
> -				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_NO_DATA);
> -
> -		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -		ret = spi_mem_exec_op(nor->spimem, &op);
> -	} else {
> -		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
> -						       NULL, 0);
> -	}
> -
> -	if (ret)
> -		dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
> -}
> -
>  /**
>   * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
>   * ready for new commands.
> @@ -766,7 +740,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>  			dev_err(nor->dev,
>  			"Attempted to modify a protected sector.\n");
>  
> -		spi_nor_clear_fsr(nor);
> +		spi_nor_clear_sr(nor, SPINOR_OP_CLFSR);
>  
>  		/*
>  		 * WEL bit remains set to one when an erase or page program

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
