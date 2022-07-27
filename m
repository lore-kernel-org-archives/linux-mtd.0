Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543C6C04A68
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWx7k/DzE1ETO4PumXi5B6O8H/huBP4n4HiDTUZspqc=; b=JVTfd0ezBDJCACkeLHM7EtwDUt
	S0uKJurDOeMMzQToIsT9mI8YcVH1DgaDbWWlCopKpY60BZ2ncrj1XNtq7is7AC2NPBgboGDBwGbjC
	Lguv3PVPY5YW95vxnCxRc/MXlHW55N24MDf9WYmgykoMvKVdS5R2l0PQ23pUIpNp8KZIgv8In2s5r
	k9Ju0VGat94/DynxNoqF9C4VOMGGNGZzPpB6qXX7vU7Wrz4fA8c6JzhZQain51dsxOq8gzEKjV7S8
	AN3D+mJU4UdGSvXMnaacNVBSf1tsOZ47FyzvVOArxA6SKkwmmRLhIu/H4YffS31p+BrUy1Gnzx68W
	K0VDAFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeyE-00Co6T-Dl; Wed, 27 Jul 2022 11:12:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGey8-00CnvI-83
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 11:12:53 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id E8E1F22239;
	Wed, 27 Jul 2022 13:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658920352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQAtppeA309Co7iQaLdRWo+x0wtjbDdsWMV75FMeHXo=;
	b=fiAS6KzdQW7vrrMx+b9myHUA/XqHHm+OPfHlMiz2Mc5N67Kj0PgvQXXtPWx5ZHqNgA+oJR
	S9vNBcspLttAQi8InVhyblr7kO6AGb0t4ipzEwrfjhDBpfAsbE34ATwd1mwf7Xnad9+0TM
	JTvUeMDuuHT0xlTCD54fVpAOeAbJeZE=
MIME-Version: 1.0
Date: Wed, 27 Jul 2022 13:12:31 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com
Subject: Re: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
In-Reply-To: <20220725092505.446315-6-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-6-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <97493d572d27d1b9d2102d0110cc7b70@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_041248_641188_8BA1E358 
X-CRM114-Status: GOOD (  31.92  )
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

Am 2022-07-25 11:25, schrieb Tudor Ambarus:
> We need to track the flash's internal address mode as there are flashes
> that can operate with 4B opcodes but unfortunately do not have a 4B 
> opcode
> correspondent for all the 3B opcodes. Such an example is the Infineon
> Semper chips which provide 4B opcodes for read/program/erase but do not
> provide 4B opcodes for Read/Write Any Register. These registers are
> indexed by address and require the internal address mode of the flash
> before Read/Write Any Register opcodes are issued.
> 4B opcodes are preferred over changing the flash's address mode to 
> 4byte,
> as set_4byte_addr_mode could be done in a non-volatile way and could 
> break
> the boot sequence. Thus we need to track the flash's internal address 
> mode
> so that we can use 4B opcodes together with opcodes that don't have a 
> 4B
> opcode correspondent. Track flash's internal address mode.
> 
> addr_mode_nbytes is discovered when parsing BFPT. For the
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 case, one could introduce a method 
> that
> queries the flash's internal address mode at run-time (works for 
> Winbond).
> If a run-time querying can not be accomplished or if SFDP is not 
> defined
> at all, but the address mode is volatile and resets to a default known
> value at boot, one can change the default addr_mode_nbytes value of 3 
> by
> introducing a flash_info flag. If the address mode can not be queried,
> discovered and it is configured via a non-volatile register, we may
> introduce a dt property, but it will harm the generic approach of the
> jedec,spi-nor compatible. All this complexity is not needed now, so let 
> it
> for future development.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.h | 5 +++++
>  drivers/mtd/spi-nor/sfdp.c | 6 +++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7dc4cda41db3..85b0cf254e97 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -341,6 +341,10 @@ struct spi_nor_otp {
>   *			ECC unit size for ECC-ed flashes.
>   * @page_size:		the page size of the SPI NOR flash memory.
>   * @addr_nbytes:	number of address bytes to send.
> + * @addr_mode_nbytes:	number of address bytes of current address mode. 
> Useful
> + *			when the flash operates with 4B opcodes but needs the
> + *			internal address mode for opcodes that don't have a 4B
> + *			opcode correspondent.
>   * @rdsr_dummy:		dummy cycles needed for Read Status Register command
>   *			in octal DTR mode.
>   * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status 
> Register
> @@ -374,6 +378,7 @@ struct spi_nor_flash_parameter {
>  	u32				writesize;
>  	u32				page_size;
>  	u8				addr_nbytes;
> +	u8				addr_mode_nbytes;
>  	u8				rdsr_dummy;
>  	u8				rdsr_addr_nbytes;
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 3a48173a2d78..c7973368f5dc 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -462,11 +462,11 @@ static int spi_nor_parse_bfpt(struct spi_nor 
> *nor,
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) 
> {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
> -		params->addr_nbytes = 3;
> +		params->addr_mode_nbytes = params->addr_nbytes = 3;

I'd suggest to just use two lines here because you still can do a git
blame and (maybe) see what the purpose of addr_nbytes was. But I
don't have an objection here. You might or might not change it while
committing.

Reviewed-by: Michael Walle <michael@walle.cc>

>  		break;
> 
>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> -		params->addr_nbytes = 4;
> +		params->addr_mode_nbytes = params->addr_nbytes = 4;
>  		break;
> 
>  	default:
> @@ -653,7 +653,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct
> spi_nor *nor, const u32 settings
>  		return 4;
>  	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>  	default:
> -		return nor->params->addr_nbytes;
> +		return nor->params->addr_mode_nbytes;
>  	}
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
