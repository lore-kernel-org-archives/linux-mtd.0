Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6348AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 31 May 2022 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftVi7xPOcODJZNRt4zmq/oIvtxMohkwOtpXg8ffOQjs=; b=WCHCfNXEj0iU2+
	ctWk5GjCvF4SnjAvQtWgI/RlTcrHa95PObss57i5hTFJ93y/Pc5+R38fd38FdTYWC5v4NPfcehVF7
	MLK1Mg39Jde6s4+EDGZcUTrKeenfCkIC8v/A4LvEULvetBVf/niyOXqEzapHDEzxXYKodSdbbNWxc
	HQ/L8thQgY6QwFtF5HMzuLVSiQrLEE11+ENQRE6eLxliQM3LU1JOSoWYdv+EBXYTC8gMlI0zksE7D
	/RcJtDVgt0an+mgKiTHFLEVR+thGqeXdZjEE0t2cAANFJpYUQQtXwPWnZnT84d4BfDK/aM0NwH+fr
	xGM9cXNAqvUdu8NHT/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvztK-00AMQL-LX; Tue, 31 May 2022 11:18:26 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvztH-00AMP5-K6
	for linux-mtd@lists.infradead.org; Tue, 31 May 2022 11:18:25 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24VBII0A005651;
	Tue, 31 May 2022 06:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653995898;
	bh=MTExxFagCBGIGW3JmGKv7y6yK1af1k6qCz9/kZEb2/w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WVlE+na8GTgMotL9w+tUF9SC8EEbPjcH3r52e5DbXzjdB0aG/aCUFNsaDzkbT+XEJ
	 SqCDybSj6Ziy268y3y8JHHrzKi/iEa6OMDZDUXa3TgPoby5dgijipJHeV4zUwlwuj5
	 ZV6WJAuYki/6OxAyZD2JkxTli69LRQgtW9jRL+ns=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24VBIIdQ011152
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 May 2022 06:18:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 31
 May 2022 06:18:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 31 May 2022 06:18:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24VBIHFj121747;
	Tue, 31 May 2022 06:18:18 -0500
Date: Tue, 31 May 2022 16:48:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <michael@walle.cc>, <Bacem.Daassi@infineon.com>,
        Takahiro Kuwano
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 3/8] mtd: spi-nor: sfdp: Clarify that
 nor->read_{opcode, dummy} are uninitialized
Message-ID: <20220531111817.rg6l63by5as5sf5q@ti.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <cdfe160d76401fe538c42b71edb1fe338604c055.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdfe160d76401fe538c42b71edb1fe338604c055.1652063152.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_041823_782017_E9007B00 
X-CRM114-Status: GOOD (  19.72  )
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

On 10/05/22 07:10AM, tkuw584924@gmail.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> nor->read_{opcode, dummy} are uninitialized (value zero) at SFDP parsing
> time. Clarify that in the code.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 61ae8c8c5237..058ce218d2af 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -178,12 +178,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
>  static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  			     size_t len, void *buf)
>  {
> -	u8 addr_nbytes, read_opcode, read_dummy;
> +	u8 addr_nbytes;
>  	int ret;
>  
> -	read_opcode = nor->read_opcode;
>  	addr_nbytes = nor->addr_nbytes;
> -	read_dummy = nor->read_dummy;
>  
>  	nor->read_opcode = SPINOR_OP_RDSFDP;
>  	nor->addr_nbytes = 3;
> @@ -191,9 +189,10 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  
>  	ret = spi_nor_read_raw(nor, addr, len, buf);
>  
> -	nor->read_opcode = read_opcode;
>  	nor->addr_nbytes = addr_nbytes;
> -	nor->read_dummy = read_dummy;
> +	/* Restore setup to its uninitialized state. */
> +	nor->read_opcode = 0;
> +	nor->read_dummy = 0;

Hmm, I don't like this too much. Why do you need to explicitly set the 
default value here? What's wrong with this function just not caring 
about what is initialized by this point and what is not? It is really 
not its business caring about default values of these parameters. Modify 
them, run the command, and restore them, regardless of default or 
initialized values.

>  
>  	return ret;
>  }
> @@ -690,7 +689,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  	u32 addr;
>  	int err;
>  	u8 i;
> -	u8 addr_nbytes, read_opcode, read_dummy;
> +	u8 addr_nbytes;
>  	u8 read_data_mask, map_id;
>  
>  	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
> @@ -699,8 +698,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  		return ERR_PTR(-ENOMEM);
>  
>  	addr_nbytes = nor->addr_nbytes;
> -	read_dummy = nor->read_dummy;
> -	read_opcode = nor->read_opcode;
>  
>  	map_id = 0;
>  	/* Determine if there are any optional Detection Command Descriptors */
> @@ -757,8 +754,9 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  out:
>  	kfree(buf);
>  	nor->addr_nbytes = addr_nbytes;
> -	nor->read_dummy = read_dummy;
> -	nor->read_opcode = read_opcode;
> +	/* Restore setup to its uninitialized state. */
> +	nor->read_dummy = 0;
> +	nor->read_opcode = 0;
>  	return ret;
>  }
>  
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
