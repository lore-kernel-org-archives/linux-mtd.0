Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4EFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 22:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZCbjcQvthQHSh1kai9x8RiCk+gnZojgihBOq1CNuuA=; b=fuvrZRyq9wbNDcYcV58jQh2qWR
	9fJRqWnTG4KpqqX1o80xhM91M5/iTM/2QNP5OSczQ0704DAiMTxWBNRiJMOqVf34Ee4dKUEW+t+3u
	1HW3jIfX//Y76wn38zcRVaQMkpnYkVjG/WZFRqfTziuFbDYT6QqtBU4MMPA8ZDHguXrWVB7bu1L8n
	v8aJ0TdILcVxd5PXLNMH15yoVGKWS8mIzkZUYADknWi3c2qrttWslC827Adppze2VtEscfFhjUCMF
	hXWQVXt63lv56Fx34TcXnm/u1W8YPQ7qhIkA+E5EYvx+68zTYWQDoz/wRBhbNmIh9KsygwKCqGmii
	nINUm8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npGxj-00Dh3j-Et; Thu, 12 May 2022 22:07:11 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npGxg-00Dh3L-1m
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 22:07:10 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A880C2223A;
 Fri, 13 May 2022 00:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652393225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GA2u5Lof59bHnF0dFTl91EJzjZeR/L8r2fdvWC1qdpg=;
 b=IB9ujMzcVaqr+iPszKLgduMEhDxafx1Yb5i6v4vAjgdAMAPzfifN5Sufz3DY6C4QNk6BPI
 BdTpW2UcbFaTNd9stNvi/FQf2Cg0cC+sxJvrNvXwpzPoK95WErZJgY4L5jkQHRuaRutfTU
 lR0uP2II8zG6XoFGyifKQsM1OHGEEaw=
MIME-Version: 1.0
Date: Fri, 13 May 2022 00:07:04 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 5/8] mtd: spi-nor: core: Couple the number of address
 bytes with the address mode
In-Reply-To: <e79c68ce2a82ecfa301962104c877401417a5a62.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <e79c68ce2a82ecfa301962104c877401417a5a62.1652063152.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bdef48aff32b91caaa7159d6592f1d16@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_150708_465495_70FAAB6D 
X-CRM114-Status: GOOD (  36.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Some of Infineon chips support volatile version of configuration 
> registers
> and it is recommended to update volatile registers in the field 
> application
> due to a risk of the non-volatile registers corruption by power 
> interrupt.
> Such a volatile configuration register is used to enable the Quad mode.
> The register write sequence requires the number of bytes of address in
> order to be programmed. As it was before, the nor->addr_nbytes was set 
> to 4
> before calling the volatile Quad enable method. This was incorrect 
> because
> the Write Any Register command does not have a 4B opcode equivalent and 
> the
> address mode was still at default (3-byte mode) and not changed to 4 by
> entering in the 4 Byte Address Mode, so the operation failed.
> 
> Move the setting of the number of bytes of address after the Quad 
> Enable
> method to allow reads or writes to registers that require the number of
> address bytes to work with the default address mode. The number of 
> address
> bytes and the address mode are tightly coupled, this is a natural 
> change.
> 
> Other (standard) Quad Enable methods are not affected, as they don't
> require the number of address bytes, so no functionality changes 
> expected.
> 
> Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 134 +++++++++++++++++++------------------
>  1 file changed, 70 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index dd71deba9f11..1c14a95a23fd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2270,49 +2270,6 @@ static int spi_nor_default_setup(struct spi_nor 
> *nor,
>  	return 0;
>  }
> 
> -static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
> -{
> -	if (nor->params->addr_nbytes) {
> -		nor->addr_nbytes = nor->params->addr_nbytes;
> -	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> -		/*
> -		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
> -		 * in this protocol an odd address width cannot be used because
> -		 * then the address phase would only span a cycle and a half.
> -		 * Half a cycle would be left over. We would then have to start
> -		 * the dummy phase in the middle of a cycle and so too the data
> -		 * phase, and we will end the transaction with half a cycle left
> -		 * over.
> -		 *
> -		 * Force all 8D-8D-8D flashes to use an address width of 4 to
> -		 * avoid this situation.
> -		 */
> -		nor->addr_nbytes = 4;
> -	} else if (nor->info->addr_nbytes) {
> -		nor->addr_nbytes = nor->info->addr_nbytes;
> -	} else {
> -		nor->addr_nbytes = 3;
> -	}
> -
> -	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
> -		/* enable 4-byte addressing if the device exceeds 16MiB */
> -		nor->addr_nbytes = 4;
> -	}
> -
> -	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
> -		dev_dbg(nor->dev, "address width is too large: %u\n",
> -			nor->addr_nbytes);
> -		return -EINVAL;
> -	}
> -
> -	/* Set 4byte opcodes when possible. */
> -	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> -	    !(nor->flags & SNOR_F_HAS_4BAIT))
> -		spi_nor_set_4byte_opcodes(nor);
> -
> -	return 0;
> -}
> -
>  static int spi_nor_setup(struct spi_nor *nor,
>  			 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -2322,10 +2279,7 @@ static int spi_nor_setup(struct spi_nor *nor,
>  		ret = nor->params->setup(nor, hwcaps);
>  	else
>  		ret = spi_nor_default_setup(nor, hwcaps);
> -	if (ret)
> -		return ret;
> -
> -	return spi_nor_set_addr_nbytes(nor);
> +	return ret;
>  }
> 
>  /**
> @@ -2707,6 +2661,74 @@ static int spi_nor_quad_enable(struct spi_nor 
> *nor)
>  	return nor->params->quad_enable(nor);
>  }
> 
> +static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
> +{
> +	if (nor->params->addr_nbytes) {
> +		nor->addr_nbytes = nor->params->addr_nbytes;
> +	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> +		/*
> +		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
> +		 * in this protocol an odd address width cannot be used because
> +		 * then the address phase would only span a cycle and a half.
> +		 * Half a cycle would be left over. We would then have to start
> +		 * the dummy phase in the middle of a cycle and so too the data
> +		 * phase, and we will end the transaction with half a cycle left
> +		 * over.
> +		 *
> +		 * Force all 8D-8D-8D flashes to use an address width of 4 to
> +		 * avoid this situation.
> +		 */
> +		nor->addr_nbytes = 4;
> +	} else if (nor->info->addr_nbytes) {
> +		nor->addr_nbytes = nor->info->addr_nbytes;
> +	} else {
> +		nor->addr_nbytes = 3;
> +	}
> +
> +	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
> +		/* enable 4-byte addressing if the device exceeds 16MiB */
> +		nor->addr_nbytes = 4;
> +	}
> +
> +	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
> +		dev_dbg(nor->dev, "address width is too large: %u\n",
> +			nor->addr_nbytes);
> +		return -EINVAL;
> +	}
> +
> +	/* Set 4byte opcodes when possible. */
> +	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> +	    !(nor->flags & SNOR_F_HAS_4BAIT))
> +		spi_nor_set_4byte_opcodes(nor);
> +
> +	return 0;
> +}
> +
> +static int spi_nor_set_addr_mode(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	ret = spi_nor_set_addr_nbytes(nor);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->addr_nbytes == 4 && nor->read_proto != SNOR_PROTO_8_8_8_DTR 
> &&
> +	    !(nor->flags & SNOR_F_4B_OPCODES)) {
> +		/*
> +		 * If the RESET# pin isn't hooked up properly, or the system
> +		 * otherwise doesn't perform a reset command in the boot
> +		 * sequence, it's impossible to 100% protect against unexpected
> +		 * reboots (e.g., crashes). Warn the user (or hopefully, system
> +		 * designer) that this is bad.
> +		 */
> +		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> +			  "enabling reset hack; may not recover from unexpected 
> reboots\n");
> +		nor->params->set_4byte_addr_mode(nor, true);

Why don't we check the return code here? I know it was this
way before, but that looks wrong.

-michael

> +	}
> +
> +	return 0;
> +}
> +
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>  	int err;
> @@ -2738,22 +2760,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
>  		spi_nor_try_unlock_all(nor);
> 
> -	if (nor->addr_nbytes == 4 &&
> -	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> -	    !(nor->flags & SNOR_F_4B_OPCODES)) {
> -		/*
> -		 * If the RESET# pin isn't hooked up properly, or the system
> -		 * otherwise doesn't perform a reset command in the boot
> -		 * sequence, it's impossible to 100% protect against unexpected
> -		 * reboots (e.g., crashes). Warn the user (or hopefully, system
> -		 * designer) that this is bad.
> -		 */
> -		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> -			  "enabling reset hack; may not recover from unexpected 
> reboots\n");
> -		nor->params->set_4byte_addr_mode(nor, true);
> -	}
> -
> -	return 0;
> +	return spi_nor_set_addr_mode(nor);
>  }
> 
>  /**
> @@ -3014,7 +3021,6 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
>  	 * - set the number of dummy cycles (mode cycles + wait states).
>  	 * - set the SPI protocols for register and memory accesses.
> -	 * - set the address width.
>  	 */
>  	ret = spi_nor_setup(nor, hwcaps);
>  	if (ret)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
