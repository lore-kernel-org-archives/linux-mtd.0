Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6ACC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJ0hdRDMGmyuu+i5r7Bo3l+WyXgXlQuWI0qyAor/R1A=; b=nX4r7gaHXNCYhx
	rkOOMg61ayS5Fk/yBnSZcAmVi1KJdlPjp2fPo8HUaOA353GxHLm9XxJtpAdVUm0Yfyb4nyLEDaPQo
	6FHwG+1SUIlRjoqG0mCp4HTvqFxJrIIWstYQ4u6mQ+PqYkEaK9jt0crtUC2lF5Gt01LWdv6RctodJ
	288qiwnKmRqL2gI+taXpuF0EaOS1e1vFpiGvIImA3QZU2qXCvZHupycVzDOEq+XWIQiMZRizvNdyq
	diszR74oXuhQ5qdwnE5F1zO/55t411Ru2DG9HxWJNvLpXwhxn+sOn04waiT9zdIqFZpsZ+r4Js/sc
	dzF5CbpHmfJO/nKM6Png==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9iTG-002bnY-97; Mon, 26 Dec 2022 08:04:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9iTB-002bm8-KF
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 08:04:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id kw15so24760590ejc.10
        for <linux-mtd@lists.infradead.org>; Mon, 26 Dec 2022 00:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yazwz3rKKYGoJc4/RODm75wP9Gxei4CxcZJhPtgB2nU=;
        b=sb54ryAb0Hf0aPxdFNo8YpoaTMFT502S2XGeBjd2Sigr8svWlWphRv9Am88uS1YC84
         VBmD2ZRW5dJJGme+gWPT0CcB8E0asGj4r6MQuHPbTs5SIHeulJJO8Iapwfb/MCYrV7Ce
         KO2OiHTy609NVFYnElAKXeqQk3SAisqz67Rx/NcsYPcG4ZD2+hvbjeYyU4iXb7crG4ma
         veYjG8x81T/msyszjh0TbmtPUEpTHOqTAjli+M0AyPJbujyLOcvEkZuyLyzVMA20PeTz
         X49jhSjPjPl8orqeVLZ+mTDCfuG6GAMaQ+mA5vUxsW0/GpQoMEd5LuGjGWXfg44Mwec5
         NWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yazwz3rKKYGoJc4/RODm75wP9Gxei4CxcZJhPtgB2nU=;
        b=r8DYfdjJVcZ/K8WA7hGesWBnZdjRpKyu0roO/Kx3JNoq9TqBDc8Wt+z2CgeuovhpIo
         BQVSQwg0Tfbb4zkZgnIWNjQZubu+z+QI2nSF6UA/AAMmZVEI7YZBJhyegqWdtfMEjhWw
         Dh8k9agdxZAPx/v+Pz4C+Yyo508Ihr11bjsdohnPnJcGmBA/ePu3RwJbQddYxpibOX1s
         GLxBsPaT+iy9SSSrRgTNjjD0vKcJ929ut8rGhNN7WaJaqExytNaJEtguJxtGPp51x5H9
         Hiq/1PyoIFG+uAbRtVHC2VEnavcEqyorBL4JRuYMv6fTshI+4MvfA5qxTp+beMwEvUle
         iAqw==
X-Gm-Message-State: AFqh2kqX+P8XnyJrEGa3QXliUEFjhulA19Iawk6iw+L/BgWi3Htkkoku
	nKCZfivYpPLT+FgmxuyUijkq6w==
X-Google-Smtp-Source: AMrXdXv8kRfN77ZyulKPLZjmzBBNeuxEGjUqmksPVYsTHWFZi5eW5K5zrDa3zK6FazbCFrQvtrKthw==
X-Received: by 2002:a17:906:bcd5:b0:7c0:a49a:1 with SMTP id lw21-20020a170906bcd500b007c0a49a0001mr14797222ejb.71.1672041862411;
        Mon, 26 Dec 2022 00:04:22 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id mj26-20020a170906af9a00b0073d71792c8dsm4549388ejb.180.2022.12.26.00.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 00:04:22 -0800 (PST)
Message-ID: <9927a8c3-40cf-2c69-46c6-f660ff2422b1@linaro.org>
Date: Mon, 26 Dec 2022 10:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Add support for IS25LX256 operating
 in 1S-8S-8S octal read mode
Content-Language: en-US
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-4-nathan.morrison@timesys.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221202135539.271936-4-nathan.morrison@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_000425_764418_73AC7D68 
X-CRM114-Status: GOOD (  22.54  )
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

Hi, Nathan,

The series is starting to look good, but I'll need another version,
please.

On 02.12.2022 15:55, Nathan Barrett-Morrison wrote:
> This adds the IS25LX256 chip into the ISSI flash_info parts table

Describe your changes in imperative mood, e.g. "Add support for
S25LX256" instead of "This adds ..."

It may worth to re-read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
once in a while.

> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>   drivers/mtd/spi-nor/issi.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 89a66a19d754..362bc3603d8f 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -29,6 +29,35 @@ static const struct spi_nor_fixups is25lp256_fixups = {
>   	.post_bfpt = is25lp256_post_bfpt_fixups,
>   };
>   
> +static int
> +is25lx256_post_bfpt_fixups(struct spi_nor *nor,
> +			   const struct sfdp_parameter_header *bfpt_header,
> +			   const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * IS25LX256 supports both 1S-1S-8S and 1S-8S-8S.
> +	 * However, the BFPT does not contain any information denoting this
> +	 * functionality, so the proper fast read opcodes are never setup.
> +	 * We're correcting this issue via the fixup below.  Page program
> +	 * commands are detected and setup properly via the 4BAIT lookup.
> +	 */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;

add a reference to params, the build fails here.

> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_8],
> +				  0, 8, SPINOR_OP_READ_1_1_8,
> +				  SNOR_PROTO_1_1_8);
> +
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
> +				  0, 16, SPINOR_OP_READ_1_8_8,
> +				  SNOR_PROTO_1_8_8);
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups is25lx256_fixups = {
> +	.post_bfpt = is25lx256_post_bfpt_fixups,
> +};
> +
>   static void pm25lv_nor_late_init(struct spi_nor *nor)
>   {
>   	struct spi_nor_erase_map *map = &nor->params->erase_map;
> @@ -74,6 +103,9 @@ static const struct flash_info issi_nor_parts[] = {
>   		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>   		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>   		.fixups = &is25lp256_fixups },
> +	{ "is25lx256", INFO(0x9d5a19, 0, 0, 0)
> +		PARSE_SFDP
> +		.fixups = &is25lx256_fixups },

For every new flash addition or update, we ask contributors to do some
little tests. Would you please run the commands from below and send us
the output?

# dd if=/dev/urandom of=./qspi_test bs=1M count=6
6+0 records in
6+0 records out

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug erase /dev/mtd4 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*

0600000

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# sha1sum qspi_test qspi_read
57f8d4fee65622104e24276e865f662844f12242  qspi_test
57f8d4fee65622104e24276e865f662844f12242  qspi_read

# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
is25wp256

# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
9d7019

# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
issi

# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030faa9ffffffffffffffff
ffffffffffffffff501950169ff9c0648fefffff

# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ba14818b9ec42713f24d94d66bb90ba0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
