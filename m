Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B617C7EE2D
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Feb 2023 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9ZJRblo+C+hPBveDqAHIqc7OuNqB9OqqBbmztWuY/E=; b=We4hPertnuOHnj
	Cx8zGqSCxkxwjVgOrwottWkkb4aqw08yaSG6uR6V8X/9U3Ui4Q+WiFxMkwr2Z3kvWobwpO2ItDFl7
	afTl+f6UzclvmOMwvqrvS65F70hqrTAIOMck4fxNr7qi2463IQxbgHYrkaP2mNInhPof14fvzxXLL
	+mR/+olHegjR5WRrhcMVvBdcCsYdyKhH1ywdgQT5N/0EOikYLftP+ZzituryolsZceOQamiKpGJSW
	3o6GFd53OsxxspLqqA9Z7pOtPT9eSCt+Pd37VFB8JBOKQS2zUcuyL/7DjShZPXGiwKm2T7f9H7k3p
	frMa206678mLsIn9WK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWMnC-007n2y-AJ; Sun, 26 Feb 2023 19:34:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWMn7-007n2S-Pg
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2023 19:34:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso981468wmo.0
        for <linux-mtd@lists.infradead.org>; Sun, 26 Feb 2023 11:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVy2Xu0NZ5kupHmryTFf+v07eG7DCuNrsjYqPSqTUwc=;
        b=gDssZSSFhuN7R1nW6haPV7DuQpBSUdgKKBOpxgblDa2FBRR+Ziu1P6ZEffResLtti9
         kRwZPn7Pjvqy4Vh8E8R5rUGoD5gG+2ulT5dD0R9K4PKd5xnOzM6WqGc81sSt9gvzaCNr
         l6XZGk12LLWc7oOBoYVXBr9yxYanPhV1GB55FmUhUkQZoAXstHjl1EjjnG+LLuxY3YsB
         MEhaQJPfEL85sRPPMFWu1cs3DwpeSI7c8CmxKU+YAHbAqYgHLJkk2HHsR8pMA56LsXY3
         BIxFmkeA7/C36MjZS/bhhiOz5Df7r+2Do1mpRSjtLdd/cZqTTcBPKEwOJ5GoGBbSKL6x
         /UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVy2Xu0NZ5kupHmryTFf+v07eG7DCuNrsjYqPSqTUwc=;
        b=2PCI9eCN2BqPWta4w4CTyYL8+DzKhOvtoud4ABzgavnOAKoBo745LCQRWCkbfvEjgh
         uAWrSr4usIvGm3a0/aumRRqGOA5oxTZ2pgoJhvB+5ocXDm8OzGFE8MSKJ044kAHN0pVv
         MvqCW7jbIvyL7CNApo4NQnekgXAwL/f+mSGKllNgZcizNCOT2UZ+Snd4bAbYzhPx/PwD
         6VyC5Mrro5HuqsuFFv0t9DOfUiNijF6u/pVBKEfQXVNTuqHjTcBytyoYMtWrQABMtA0P
         NVo899DEcfNX23Fe2dd4Xhirkt0sRqAtwrYsiLjL2GDgPqRaG3Z+xCEzzNxyl1MCVLOq
         pwEA==
X-Gm-Message-State: AO0yUKUQa8eYc2MesWNIRqVm0+wR/ca3HzkeJTDUNUhqw0etDlszNET6
	XqyahBtsuVhd63Ydrolpm/G+tQ==
X-Google-Smtp-Source: AK7set/0YbUBbkTrdkWuhJV7zuYeZrIcy7UR+rOriyypG/Z8Y8mb5dyrD9IOJyvad6PXpTfghKJLpw==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id l7-20020a05600c16c700b003e21e01803amr17003530wmn.9.1677440070470;
        Sun, 26 Feb 2023 11:34:30 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id m15-20020a5d6a0f000000b002c707785da4sm5016949wru.107.2023.02.26.11.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 11:34:30 -0800 (PST)
Message-ID: <0a0c1cfa-718a-2f05-dba1-a2f50a2b3a3e@linaro.org>
Date: Sun, 26 Feb 2023 21:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Add support for Infineon
 S25FS256T
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20230203044853.23513-1-Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230203044853.23513-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_113437_935479_E6374B6D 
X-CRM114-Status: GOOD (  35.49  )
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

Hi, Takahiro,

On 03.02.2023 06:48, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon S25FS256T is 256Mbit Quad SPI NOR flash. The key features and
> differences comparing to other Spansion/Cypress flash familes are:
>    - 4-byte address mode by factory default
>    - Quad mode is enabled by factory default
>    - OP_READ_FAST_4B(0Ch) is not supported
>    - Supports mixture of 128KB and 64KB sectors by OTP configuration
>      (this patch supports uniform 128KB only due to complexity of
>       non-uniform layout)
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Link: https://www.infineon.com/dgdlac/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v12_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v2:
>    - s/EOPNOTSUPP/ENODEV
>    - Drop READ_FAST support
>    - Amend comment in late_init()
>    - sector size and page size as 0 in sizeINFO6()
> 
> ---
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
> 13ecce2f195c4c71648e90d4a7e4a0df  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> zynq> test_qspi.sh
> random: crng init done
> 6+0 records in
> 6+0 records out
> 6291456 bytes (6.0MB) copied, 2.025928 seconds, 3.0MB/s
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Erased 6291456 bytes from address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0600000
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 09ed7922931fe10795adc0ba3aff4efd2127be02  qspi_test
> 09ed7922931fe10795adc0ba3aff4efd2127be02  qspi_read
> ---
>   drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 12a256c0ef4c..a499ce393454 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -29,6 +29,7 @@
>   	 SPINOR_REG_CYPRESS_CFR5_OPI)
>   #define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
>   #define SPINOR_OP_CYPRESS_RD_FAST		0xee
> +#define SPINOR_REG_CYPRESS_ARCFN		0x00000006
>   
>   /* Cypress SPI NOR flash operations. */
>   #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
> @@ -218,6 +219,62 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>   	return 0;
>   }
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

you'll need to set params->addr_nbytes = 4; as well, even if it is set
in parse_4bait(). From post_bfpt() to parse_4bait() you're uncovered.
Also, 4bait is optional and if it fails, we just continue, so you'll end
up with a wrong configuration. Please update.

> +
> +	/* Read Architecture Configuration Register (ARCFN) */
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_ARCFN,
> +					  nor->bouncebuf);
> +	op.dummy.nbytes = 1;

 From the datasheet I see that there are two flavors of the read any
register command, one for volatile registers which does not require
latency cycles and one for non volatile registers which needs latency
cycles. Please rename CYPRESS_NOR_RD_ANY_REG_OP to
CYPRESS_NOR_RD_ANY_VREG_OP and introduce a CYPRESS_NOR_RD_ANY_NVREG_OP
which will handle the latency cycles.

Also you should go with the maximum number of latency cycles if you want
to be able to operate this flash at its maximum frequency, see Table 43
from the datasheet.

BTW, I hate the dummy.nbytes nonsense, there's no such thing as
dummy/latency number of bytes. This should have been defined as latency
number of cycles. Sergiu Moga had a patch addressing this in MTD and SPI
but I don't think he's going to send a new version. If there are no
other volunteers I'll respin it myself.

> +	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	/* ARCFN value must be 0 if uniform sector is selected  */
> +	if (nor->bouncebuf[0])
> +		return -ENODEV;
> +
> +	return cypress_nor_set_page_size(nor);
> +}
> +
> +static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	/* PP_1_1_4_4B is supported but missing in SFDP. */

missing in the 4-Byte Address Table you mean, right?

Overall the patch is good. I'd like to address the non volatile byte
address mode if possible, but it's not a strong requirement. I'll read
again the datasheet tomorrow. The problem is that even if the flash has
a default 4 byte address mode (factory default), users can change the
address mode to 3 by writing to the non-volatile configuration register
and we'll end up with an unusable flash because as of now we assume the
flash is in the 4 byte address mode state. I'd like to determine the
address mode at runtime if possible. For this flash we can't use your 
CRC idea to determine the mode, as the flash does not have such support.
I see in the datasheet that "RDARG_C_0 transaction can be used during 
embedded operations to read Status Register 1 (STR1V)." RDSR1_0_0 does
not need any address, so an idea is to use RDARG_3_0, RDARG_4_0 and
RDSR1_0_0, compare what we receive and determine the mode. If we're
devilish, we can also do a WREN, change a bit in SR and reread all to 
double verify the result, then a WRDIS.
Other idea is to force 4 byte address mode by default using EN4BA_0_0,
this command does not need address bytes. Not the most elegant method
though, but it should work.
Again, I'd like to re-read the datasheet. If you have other idea, shoot.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
