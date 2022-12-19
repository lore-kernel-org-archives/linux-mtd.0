Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6980AC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Dec 2022 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk9w6hJT82t0e9YXxjsIZdHqmLI3RfeGn3GSMZgV2po=; b=tCRyoucvPXvfRlpFubcFPWquFp
	jbZwoTaAAUM2H/DHqqZI4kFG071LHKQ4uQe0LtSWnlORkBe87ka0JfHC2eMMiLA+q7oMqOAOJPOdx
	wZYWAwkbSQxBTChhPTo27OlgbhCkcianI7t3BA5XiIWRLwz2F7ObmyCoTOPghBe54KjmZv4iCPT+Z
	W4gcC0UiaYXCFG+T0GJp/OtLc2jhmNtNF+D66KWfRj+9m95fAH9ghIWVUhnYl7wPJNsCHNhW2tLjP
	WsfijI/W+KLvCWOTt1F4EcpBEJzBW6HdXQRe7CH+StFIXiPrYntV8nFDs2yyQEf6UMAnZhum+y5zt
	k4kUwFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7AaU-009tiN-7B; Mon, 19 Dec 2022 07:29:26 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7AaP-009teC-Ag
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2022 07:29:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 950A11650;
	Mon, 19 Dec 2022 08:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1671434954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bJxKcynlwztP4tq8dfGNMPsNg59/ckG2EZsgBOYUGxQ=;
	b=VV2EwLmh6EIv7MVA8cHFxrfc2ywlDUXS9YxZUU+bnYpxbGRCgdr5CYsyj4G8YxodOKIcPL
	T6XODJgQ4pVlbGwckZc+AHH40mWVUWeYC3QQiG9FIxKUBekAloVqjF5JucTpQsPtikpvF2
	Yq/N3pykeYSYBp1uMa5VdNTl06t4XvCpSGpJTVJ5JpPICT5zwXLAekA816A7dio7s7EAld
	d12L01XztuTaIIDGix8DsqNu3o7B2rgQAHcziYa+QTaUlQ9ReiYZyY0cE2daHR4vSAfwwZ
	NUj3eCRx9607jbUiRBv1f2BRnLdAixBTOaLf6NUST3O/5cVFhesYKPNir/v4lg==
MIME-Version: 1.0
Date: Mon, 19 Dec 2022 08:29:14 +0100
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for Infineon
 S25FS256T
In-Reply-To: <20221219015509.15075-1-Takahiro.Kuwano@infineon.com>
References: <20221219015509.15075-1-Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <511703b7a86075387b5bf07434077724@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_232921_772997_30C34513 
X-CRM114-Status: GOOD (  27.41  )
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

Hi,

Am 2022-12-19 02:55, schrieb tkuw584924@gmail.com:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon S25FS256T is 256Mbit Quad SPI NOR flash. The key features and
> differences comparing to other Spansion/Cypress flash familes are:
>   - 4-byte address mode by factory default
>   - Quad mode is enabled by factory default
>   - Supports mixture of 128KB and 64KB sectors by OTP configuration
>     (this patch supports uniform 128KB only due to complexity of
>      non-uniform layout)
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Datasheet:
> fileId=8ac78c8c80027ecd0180740c5a46707https://www.infineon.com/dgdlac/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v12_00-EN.pdf?a
> 
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s25fs256t
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 342b190f0890
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080101ff00000114000100ff84000102500100ffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffe7ffe2ffffffff0f48eb086bffff
> ffffeeffffffffff00ffffff00ff11d810d800ff00ff321cfeff71e9ffe1
> ec031c607a757a75f766805c00d65dfff938c0a100000000000000000000
> 0000ffffffff710600fedcdcffff
> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 13ecce2f195c4c71648e90d4a7e4a0df  
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> zynq> test_qspi.sh
> random: crng init done
> 6+0 records in
> 6+0 records out
> 6291456 bytes (6.0MB) copied, 2.787435 seconds, 2.2MB/s
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Erased 6291456 bytes from address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0600000
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 2c6e12c0a2346cab755ef72cdf2a72f827241d35  qspi_test
> 2c6e12c0a2346cab755ef72cdf2a72f827241d35  qspi_read
> ---
>  drivers/mtd/spi-nor/spansion.c | 64 ++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c 
> b/drivers/mtd/spi-nor/spansion.c
> index b621cdfd506f..7d1d2c27ad71 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -24,6 +24,7 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
> +#define SPINOR_REG_CYPRESS_ARCFN		0x00000006
> 
>  /* Cypress SPI NOR flash operations. */
>  #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
> @@ -213,6 +214,66 @@ static int cypress_nor_set_page_size(struct 
> spi_nor *nor)
>  	return 0;
>  }
> 
> +static int
> +s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
> +			  const struct sfdp_parameter_header *bfpt_header,
> +			  const struct sfdp_bfpt *bfpt)
> +{
> +	struct spi_mem_op op;
> +	int ret;
> +
> +	/* 4-byte address mode is enabled by default */
> +	nor->params->addr_mode_nbytes = 4;

Shouldn't this already be set in spi_nor_parse_4bait()?

> +
> +	/* Read Architecture Configuration Register (ARCFN) */
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_ARCFN,
> +					  nor->bouncebuf);
> +	op.dummy.nbytes = 1;
> +	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	/* ARCFN value must be 0 if uniform sector is selected  */
> +	if (nor->bouncebuf[0])
> +		return -EOPNOTSUPP;

EOPNOTSUPP is wrong here. I'd say ENODEV.

> +
> +	return cypress_nor_set_page_size(nor);
> +}
> +
> +static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	/*
> +	 * READ_FAST is omitted in 4BAIT parse since OP_READ_FAST_4B(0Ch) is 
> not
> +	 * supported. Enable OP_READ_FAST(0Bh) that can work in 4-byte 
> address
> +	 * mode.
> +	 */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST], 0, 8,
> +				  SPINOR_OP_READ_FAST, SNOR_PROTO_1_1_1);

Mh, this requires mode switching, the advantage of the opcodes in
the 4bait table are that they don't require mode switching.
OP_READ_FAST doesn't work here if the address mode is set to 3. (I
know this flash defaults to 1, but there is also a non-volatile
setting for this).

Regarding mode switching, I guess this is wrong for this flash, because
it is set to spansion_set_4byte_addr_mode() by default while it should
really be set to spi_nor_set_4byte_addr_mode().

Also I'm not sure when set_4byte_addr_mode() is called during init.
It seems slightly wrong to me because it will check wether
SNOR_F_4B_OPCODES is set. But in the restore path, it is checked for
!SNOR_F_4B_OPCODES before 3 byte mode is enabled again. Mhh.

> +
> +	/* PP_1_1_4_4B is supported but missing in SFDP. */
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
> +				SPINOR_OP_PP_1_1_4_4B,
> +				SNOR_PROTO_1_1_4);
> +}
> +
> +static void s25fs256t_late_init(struct spi_nor *nor)
> +{
> +	/* The writesize should be ECC data unit size */
> +	nor->params->writesize = 16;

The datasheets mentions, a PP should be either 128 or 256 (for best
performance). So why 16?

> +}
> +
> +static struct spi_nor_fixups s25fs256t_fixups = {
> +	.post_bfpt = s25fs256t_post_bfpt_fixup,
> +	.post_sfdp = s25fs256t_post_sfdp_fixup,
> +	.late_init = s25fs256t_late_init,
> +};
> +
>  static int
>  s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  			const struct sfdp_parameter_header *bfpt_header,
> @@ -441,6 +502,9 @@ static const struct flash_info spansion_nor_parts[] 
> = {
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 128 * 1024, 256)

Does INFO6(0x342b19, 0x0f0890, 0, 0) work for you?

> +		PARSE_SFDP
> +		.fixups = &s25fs256t_fixups },
>  	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLSR)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
