Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D960CC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsMYRkzvkttjrMpcPJbeNSXx7A20l3DFxKNnHSQw7Kc=; b=3YcIVrc51GJSrW
	5reBw+WuTqLLKrdg6a9CIHgztF1PZfY7YiwROveLHYQV8W7U9tlmLE6Yk1HFGmQtlRfd9golQbhNT
	QxV7d/8iKqKnpC0sm/u5aoKRKqLDvNXlR2dwY7X4g4fGONIX+vP+2xe807Mm9ntSXfFCD6MMInj5a
	54aklWbr9LLfsA7YoBTUkvUo2FYrsBAyKpQWqcJvOBE29yY5bK9pa3xgiEYb8nRPutiyE0MaMn9EQ
	LhICb11+yNgxaK4GVbd3eIoEQOMh6n1b6kJ5V2HdfodOqL60OtOBqgO3Gbi3zXVyK5TztETWd+fvt
	/F85z0IiFnQcRQqRwAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnA8-00AdZr-0O;
	Mon, 22 Jan 2024 05:48:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnA2-00AdZL-0C
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 05:47:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so34086575e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 21 Jan 2024 21:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705902470; x=1706507270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB3k4bOEHsfZ3BnTyiyUuxkXfGmyhPbl4WHfu0BUDT0=;
        b=iWc/rQuUMwsV6pwnmWjVTQIo1qJDmhONMJ3o4NI+h84gPnmU3ZafmxFftyLtECQptg
         tODFHTJmmlInQ2qDTMzTox1Cc8KX3oWv0WmkjyE1JHuViukpdTtmKU+sShA7kxIlEgot
         gvVKFaPT3+4WtEJXp2Bw0NmZc/rJcd7MzM11era10Fzzfg7kSpzxrscxhj5ttxdDkuBw
         /VDIQRrR/ee0PRCTnNFZxNMVSdxfOlQsYQ29qXcECF/7SUmwj+Pt6G1oHiT/4NtMFOpC
         7VUiYS8iL5YZWAtj8QVT5m8Rp6S0R+dyAU3B2cfYRL5OmT941+MPiGxIA6LxhFyO9D7n
         vtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705902470; x=1706507270;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EB3k4bOEHsfZ3BnTyiyUuxkXfGmyhPbl4WHfu0BUDT0=;
        b=phNZrz99MEOO5WUkj3cPGdgERTEChhihCnVkWeICZWvlt4UO45N+nYCWrL9JHMXTTb
         nXXwlyXWq1EnCuVvXjqRwz5zI5tZqHNOWRT3MLU+FfCNKXI5m9pdLUeBW0yCFje6xdag
         mbmUMe5+dd4zMtNiNxLjw99qQiVLCmpb36m71m/6bzzjiqL4vnluYv61vdut+A/V+EHb
         yoYjLloBeoD6l2oPzErTB3Ck/XoNkivsz1TOMKlIhNXK1xGFfx/F8klVSNWFnSbhE3iq
         A/5y4Pc/dUviF7tIXnsFo1NnqiNGtwaKwmRsglWCXOi+R2KsjvkftEvc/mSQcQUnk9cE
         0iQQ==
X-Gm-Message-State: AOJu0YxNzHAAzCHVFNQYmlGr/yd/kCvJ7tVwYQ3ht946NpWAx5KiRTQx
	4+DfGryySmCYF9YZdR849e/g1BgQGVfqmamk9eoMEN3gesR8AHEohzG7OnO6LSQ=
X-Google-Smtp-Source: AGHT+IF0qKJobBgBE/56kVzGTnv2kQ5tUQSpyLMkpcOPTcYPC7N+x/UNRQmGDo6MJ4WM+kEtxpsVqA==
X-Received: by 2002:a1c:7511:0:b0:40e:49be:48e1 with SMTP id o17-20020a1c7511000000b0040e49be48e1mr1414347wmc.61.1705902469993;
        Sun, 21 Jan 2024 21:47:49 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b0040d6ffae526sm41972927wmq.39.2024.01.21.21.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 21:47:49 -0800 (PST)
Message-ID: <9cb99638-b43a-4f4d-b112-77f8d35f74f4@linaro.org>
Date: Mon, 22 Jan 2024 07:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: hyperbus: Introduce SFDP probe
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <480824dd0f9b1d549ffe08e7a6e2a93a88f6e13d.1680663252.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <480824dd0f9b1d549ffe08e7a6e2a93a88f6e13d.1680663252.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_214754_117217_86ECC273 
X-CRM114-Status: GOOD (  42.99  )
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

Hi, Takahiro!

On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon(Cypress) S26HL-T/S26HS-T family of flash devices support both
> legacy SPI mode and HyperBus (JESD251C xSPI profile 2.0) mode. In
> HyperBus mode, it is compatible with Cypress S26KL-S/S26KS-S HyperFlash
> family with some exceptions. One significant difference is that the CFI
> is replaced by SFDP. This patch intends to support Hyperbus devices that
> has SFDP instead of CFI, by adding new probing method that detects SFDP
> signature and setting up CFI structure to make SFDP chips work with
> cfi_cmdset_xxxx.
> 

By SFDP you mean the JESD216 SFDP standard, right? Would it make sense
to pull out the SFDP parsing from SPI NOR into its own dedicated entity
so that it's used by hyperbus as well?

> The probe flow implemented in hyperbus_sfdp_probe_chip() is same as
> cfi_probe_chip() in chips/cfi_probe.c. The CFI "QRY" detection is
> replaced by "SFDP" signature detection.
> 
> Device identification and setup functions specific for S26Hx-T are also
> implemented in the same source file as SFDP probe and called from probe
> function. Once other devices that supports SFDP come up, we will implemet
> generic detection and setup flow.

What other hyperflash devices are out in the market and which of them
support SFDP? I saw ISSI has hyperflashes:
https://www.issi.com/us/product-flash.shtml

In SPI NOR we worked a lot to separate the core from the manufacturer
drivers. I'd make the split here since the beginning, the code will
become cleaner and easier to maintain.

> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/hyperbus/Makefile        |   4 +-
>  drivers/mtd/hyperbus/hyperbus-core.c |  15 +-
>  drivers/mtd/hyperbus/hyperbus-sfdp.c | 346 +++++++++++++++++++++++++++
>  3 files changed, 363 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mtd/hyperbus/hyperbus-sfdp.c
> 
> diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
> index 26386158bd1c..03132bc05853 100644
> --- a/drivers/mtd/hyperbus/Makefile
> +++ b/drivers/mtd/hyperbus/Makefile
> @@ -1,9 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
> +obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus.o
>  obj-$(CONFIG_HBMC_AM654)	+= hbmc-am654.o
>  obj-$(CONFIG_RPCIF_HYPERBUS)	+= rpc-if.o
>  
> +hyperbus-objs	:= hyperbus-core.o hyperbus-sfdp.o

maybe rename hyperbus-core to core, as we're already in a hyperbus directory

> +
>  
>  
>  obj-y += ifx-hyperbus.o
> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
> index 4d8047d43e48..b31a8bea3995 100644
> --- a/drivers/mtd/hyperbus/hyperbus-core.c
> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
> @@ -12,6 +12,19 @@
>  #include <linux/of.h>
>  #include <linux/types.h>
>  
> +struct mtd_info *hyperbus_sfdp_probe(struct map_info *map);
> +
> +static struct mtd_info *hyperbus_map_probe(struct map_info *map)
> +{
> +	struct mtd_info *mtd;
> +
> +	mtd = do_map_probe("cfi_probe", map);
> +	if (!mtd)
> +		mtd = hyperbus_sfdp_probe(map);
> +
> +	return mtd;
> +}
> +
>  static struct hyperbus_device *map_to_hbdev(struct map_info *map)
>  {
>  	return container_of(map, struct hyperbus_device, map);
> @@ -106,7 +119,7 @@ int hyperbus_register_device(struct hyperbus_device *hbdev)
>  		}
>  	}
>  
> -	hbdev->mtd = do_map_probe("cfi_probe", map);
> +	hbdev->mtd = hyperbus_map_probe(map);
>  	if (!hbdev->mtd) {
>  		dev_err(dev, "probing of hyperbus device failed\n");
>  		return -ENODEV;
> diff --git a/drivers/mtd/hyperbus/hyperbus-sfdp.c b/drivers/mtd/hyperbus/hyperbus-sfdp.c
> new file mode 100644
> index 000000000000..f292e39856cb
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hyperbus-sfdp.c
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023, Infineon Technologies.
> + */
> +#include <linux/mtd/xip.h>
> +#include <linux/mtd/gen_probe.h>
> +
> +#ifdef CONFIG_MTD_XIP
> +
> +/* only needed for short periods, so this is rather simple */
> +#define xip_disable()	local_irq_disable()
> +
> +#define xip_allowed(base, map) \
> +do { \
> +	(void) map_read(map, base); \
> +	xip_iprefetch(); \
> +	local_irq_enable(); \
> +} while (0)
> +
> +#define xip_enable(base, map, cfi) \
> +do { \
> +	hyperbus_sfdp_mode_off(base, map, cfi);		\
> +	xip_allowed(base, map); \
> +} while (0)
> +
> +#else
> +
> +#define xip_disable()				do { } while (0)
> +#define xip_allowed(base, map)			do { } while (0)
> +#define xip_enable(base, map, cfi)		do { } while (0)
> +> +#endif


Is the xip tested? You haven't specified anything about it in the commit
message. I would get rid of it if possible, and come with a dedicated
patch on top. The simpler a patch is, the more chances it gets to get
integrated.

> +
> +/* HyperBus Commands */
> +#define HYPERBUS_ADDR_UNLOCK1	0x555
> +#define HYPERBUS_ADDR_UNLOCK2	0x2AA
> +#define HYPERBUS_CMD_UNLOCK1	0xAA
> +#define HYPERBUS_CMD_UNLOCK2	0x55
> +#define HYPERBUS_CMD_RDSFDP	0x90
> +#define HYPERBUS_CMD_RDVCR1	0xC7
> +#define HYPERBUS_CMD_RDVCR2	0xC9
> +#define HYPERBUS_CMD_ASOEXT	0xF0
> +#define HYPERBUS_CMD_ERSCTR	0x30

these shall be moved to include/linux/mtd/hyperbus.h

> +
> +/* For Infineon S26Hx family */
> +#define S26HX_ADDR_MFR_ID	0x800
> +#define S26HX_ADDR_DEV_ID1	0x801
> +#define S26HX_ADDR_DEV_ID2	0x802
> +#define S26HX_DEV_ID1_3V0	0x006A
> +#define S26HX_DEV_ID1_1V8	0x007B
> +#define S26HX_DEV_ID2_512	0x001A
> +#define S26HX_DEV_ID2_01G	0x001B
> +#define S26HX_CFR1_UNIFORM	BIT(9)
> +#define S26HX_CFR1_TP4KBS	BIT(8)
> +#define S26HX_CFR2_SP4KBS	BIT(2)

and these to thier own manufacturer file

> +#define ERASEINFO(s, b)		(((s) << 8) | ((b) - 1))

can we use FIELD_GET/FIELD_SET for eraseinfo?

> +
> +static inline u16 hyperbus_read(u32 addr, struct map_info *map,
> +				struct cfi_private *cfi)
> +{
> +	return cfi_read_query16(map, addr * cfi->interleave * cfi->device_type);
> +}
> +
> +static inline void hyperbus_write(u8 cmd, u32 addr, struct map_info *map,
> +				  struct cfi_private *cfi)

here you ignore the return value of cfi_send_gen_cmd. Shall we change
the return type to u32?

> +{
> +	cfi_send_gen_cmd(cmd, addr, 0, map, cfi, cfi->device_type, NULL);> +}
> +
> +static int __xipram hyperbus_sfdp_present(struct map_info *map, __u32 base,
> +					  struct cfi_private *cfi)
> +{
> +	int osf = cfi->interleave * cfi->device_type; /* scale factor */
> +	map_word val[2];
> +	map_word sfdp[2];
> +
> +	sfdp[0] = cfi_build_cmd(0x4653, map, cfi); /* "SF" */
> +	sfdp[1] = cfi_build_cmd(0x5044, map, cfi); /* "DP" */
> +
> +	val[0] = map_read(map, base + osf * 0x0);
> +	val[1] = map_read(map, base + osf * 0x1);

can we read the entire SFDP in one shot?

> +
> +	if (!map_word_equal(map, sfdp[0], val[0]))
> +		return 0;
> +
> +	if (!map_word_equal(map, sfdp[1], val[1]))
> +		return 0;
> +
> +	return 1; /* "SFDP" found */

return -EINVAL for error and zero for success
> +}
> +
> +static int __xipram hyperbus_sfdp_mode_on(u32 base, struct map_info *map,
> +					  struct cfi_private *cfi)

base is unused
> +{
> +	hyperbus_write(HYPERBUS_CMD_ASOEXT, 0, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_UNLOCK1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_UNLOCK2, HYPERBUS_ADDR_UNLOCK2, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_RDSFDP, HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	return hyperbus_sfdp_present(map, 0, cfi);
> +}
> +
> +static void __xipram hyperbus_sfdp_mode_off(u32 base, struct map_info *map,
> +					    struct cfi_private *cfi)

base in unused
> +{
> +	hyperbus_write(HYPERBUS_CMD_ASOEXT, 0, map, cfi);
> +}
> +
> +static u16 __xipram hyperbus_s26hx_rdvcr1(struct map_info *map,
> +					  struct cfi_private *cfi)
> +{
> +	hyperbus_write(HYPERBUS_CMD_UNLOCK1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_UNLOCK2, HYPERBUS_ADDR_UNLOCK2, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_RDVCR1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	return hyperbus_read(0, map, cfi);
> +}
> +
> +static u16 __xipram hyperbus_s26hx_rdvcr2(struct map_info *map,
> +					  struct cfi_private *cfi)
> +{
> +	hyperbus_write(HYPERBUS_CMD_UNLOCK1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_UNLOCK2, HYPERBUS_ADDR_UNLOCK2, map, cfi);
> +	hyperbus_write(HYPERBUS_CMD_RDVCR2, HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	return hyperbus_read(0, map, cfi);
> +}
> +
> +static int __xipram hyperbus_s26hx_chip_setup(struct map_info *map,
> +					      struct cfi_private *cfi)
> +{
> +	u16 mfr_id, dev_id1, dev_id2, cfr1v, cfr2v;
> +	u8 nregions, nbtm4ks, ntop4ks, n256ks;
> +	u32 *erase;
> +
> +	/* Read manufacturer and Device ID */
> +	mfr_id = hyperbus_read(S26HX_ADDR_MFR_ID, map, cfi);
> +	dev_id1 = hyperbus_read(S26HX_ADDR_DEV_ID1, map, cfi);
> +	dev_id2 = hyperbus_read(S26HX_ADDR_DEV_ID2, map, cfi);
> +
> +	if ((mfr_id != CFI_MFR_CYPRESS) ||
> +	    (dev_id1 != S26HX_DEV_ID1_3V0 && dev_id1 != S26HX_DEV_ID1_1V8) ||
> +	    (dev_id2 != S26HX_DEV_ID2_512 && dev_id2 != S26HX_DEV_ID2_01G)) {
> +		xip_enable(0, map, cfi);
> +		return 0;
> +	}
> +
> +	/* Exit SFDP ASO then read CFR1V and CFR2V */
> +	hyperbus_sfdp_mode_off(0, map, cfi);
> +	cfr1v = hyperbus_s26hx_rdvcr1(map, cfi);
> +	cfr2v = hyperbus_s26hx_rdvcr2(map, cfi);
> +
> +	xip_enable(0, map, cfi);
> +
> +	/*
> +	 * Determine number of regions (nregions), number of bottom 4KB sectors
> +	 * (nbtm4ks), and number of top 4KB sectors (ntop4ks)
> +	 */
> +	if (cfr1v & S26HX_CFR1_UNIFORM) {
> +		nregions = 1;
> +		nbtm4ks = 0;
> +		ntop4ks = 0;
> +	} else if (cfr2v & S26HX_CFR2_SP4KBS) {
> +		nregions = 5;
> +		nbtm4ks = 16;
> +		ntop4ks = 16;
> +	} else if (cfr1v & S26HX_CFR1_TP4KBS) {
> +		nregions = 3;
> +		nbtm4ks = 0;
> +		ntop4ks = 32;
> +	} else {
> +		nregions = 3;
> +		nbtm4ks = 32;
> +		ntop4ks = 0;
> +	}
> +
> +	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + nregions * sizeof(u32),
> +			    GFP_KERNEL);
> +	if (!cfi->cfiq)
> +		return 0;
> +
> +	memset(cfi->cfiq, 0, sizeof(struct cfi_ident));
> +
> +	cfi->mfr = mfr_id;
> +	cfi->id = dev_id1 << 8 | dev_id2;
> +	cfi->cfi_mode = CFI_MODE_CFI;
> +	cfi->addr_unlock1 = HYPERBUS_ADDR_UNLOCK1;
> +	cfi->addr_unlock2 = HYPERBUS_ADDR_UNLOCK2;
> +	cfi->sector_erase_cmd = CMD(HYPERBUS_CMD_ERSCTR);
> +
> +	cfi->cfiq->P_ID = P_ID_AMD_STD;
> +	cfi->cfiq->DevSize = dev_id2; /* dev_id2 indicates size in 2^N */
> +	cfi->cfiq->MaxBufWriteSize = 9; /* 2^9 = 512 */
> +
> +	/*
> +	 * cfi_cmdset_0002 uses fixed timeout for word write (1ms + 1 jiffies)
> +	 * and sector erase (20s) that should be enough for s26hx. For buffer
> +	 * write, 2000us is used if cfiq->BufWriteTimeoutXXX is 0. The typical
> +	 * and maximum 512B page programming times are 680us and 2175us
> +	 * respectively. Specify proper values here to extend buffer write
> +	 * timeout.
> +	 */
> +	cfi->cfiq->BufWriteTimeoutTyp = 10; /* 2^10 = 1024 */
> +	cfi->cfiq->BufWriteTimeoutMax = 2; /* 1024 x 2^2 = 4096 */
> +
> +	/* Setup erase region info */
> +	cfi->cfiq->NumEraseRegions = nregions;
> +	erase = cfi->cfiq->EraseRegionInfo;
> +
> +	/* Bottom 4KB sectors and remaining portion */
> +	if (nbtm4ks) {
> +		*erase++ = ERASEINFO(SZ_4K, nbtm4ks);
> +		*erase++ = ERASEINFO(SZ_256K - (SZ_4K * nbtm4ks), 1);
> +	}
> +
> +	/*
> +	 * The number of uniform 256KB sectors is obtained by dividing 'device
> +	 * size' by 256K(=2^18). Deduct overlaid sector(s) from uniform number
> +	 * if top and/or bottom 4KB sectors exist.
> +	 */
> +	n256ks = (1 << (cfi->cfiq->DevSize - 18)) - !!(nbtm4ks) - !!(ntop4ks);
> +	*erase++ = ERASEINFO(SZ_256K, n256ks);
> +
> +	/* Top 4KB sectors and remaining portion */
> +	if (ntop4ks) {
> +		*erase++ = ERASEINFO(SZ_256K - (SZ_4K * ntop4ks), 1);
> +		*erase = ERASEINFO(SZ_4K, ntop4ks);
> +	}
> +
> +	return 1;

please return 0 for success, -errno in case of others. Is this method
entirely IFX specific? Let's move it in its own cypress/ifx manufacturer
file.

> +}
> +
> +static int __xipram hyperbus_sfdp_chip_setup(struct map_info *map,
> +					     struct cfi_private *cfi)
> +{
> +	/*
> +	 * Just call setup for S26Hx since it is only chip supported.
> +	 * Once other devices come up, we will implement vendor/chip specific
> +	 * detection and setup flow here.
> +	 */
> +	return hyperbus_s26hx_chip_setup(map, cfi);
> +}
> +
> +static int __xipram hyperbus_sfdp_probe_chip(struct map_info *map, __u32 base,
> +					     unsigned long *chip_map,
> +					     struct cfi_private *cfi)
> +{
> +	u32 probe_addr;
> +	int i;
> +
> +	if (base >= map->size) {
> +		pr_notice("Probe at base(0x%08x) past the end of the map(0x%08lx)\n",
> +			  base, map->size - 1);
> +		return 0;
> +	}
> +
> +	probe_addr = base + cfi_build_cmd_addr(HYPERBUS_ADDR_UNLOCK1, map, cfi);
> +	if (probe_addr >= map->size) {
> +		pr_notice("Probe at base[unlock](0x%08x) past the end of the map(0x%08lx)\n",
> +			  probe_addr, map->size - 1);
> +		return 0;
> +	}
> +
> +	xip_disable();
> +	if (!hyperbus_sfdp_mode_on(base, map, cfi)) {
> +		xip_enable(base, map, cfi);
> +		return 0;
> +	}
> +
> +	/*
> +	 * This is the first time we're called. Set up the CFI stuff accordingly
> +	 * and return
> +	 */
> +	if (!cfi->numchips)
> +		return hyperbus_sfdp_chip_setup(map, cfi);

Ah, I need to study more. Would you please speed me up a little and tell
me more about the multi chip handling? Why is the probe called multiple
times?

Thanks!
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
