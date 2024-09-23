Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37408CF9C5B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mKJTiISicQzC0hJcXNHWW/wjN2UQfZuX9JsY9+mO8U=; b=YZx5ZrsR9vBKxz
	Gs72pR9hCkkShR/PhMVDKG4QevTGQ3SuIyyr1u2NFFgNpmFelcGq8Vu75sO2dHUJAPzNXzWsxlmWc
	daAYxTQVjt341jbBG3arh8CwKhapYIxEyIYWNZJksbXjbGsYq2mzT6uG/+rgCflgl63khVxMZGX1v
	aN83UBXQMNKD/n+gpZjo2NBx1DQoRAWxx2AMjY9cl2E+oGqjyVlY+oi9dRnXrtnkN2/zYbPFXhrrr
	G3aX1YvUlgoS8tXAB0nCvutKyQqNbNhKkSnt6IHaRh5zH2WypYCHqz3/QUjvgzZL5Pt0VoS7x3W7P
	dOBsn1QzY7zYReaSJezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseqX-0000000Gjif-31xc;
	Mon, 23 Sep 2024 08:55:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseqU-0000000Gji0-1BDF
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 08:55:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so40610975e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727081700; x=1727686500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKHXyXv8u9rhkwRUOZ/ML3LklCgz5A4fWbLYE4hpCrw=;
        b=TM9+fODVfLmTcCkqx+akBstKE2/mEJX6s3zNgku+knqeYt6ngNNX0d0jovTddE2uPG
         4Pf8Ql4v989LcrFyqdg4WIXMz3NfagDxYcOvP5nL17F3yNyZd6TTO2uKUQzdK6CODEpI
         kNDF5PWTmkxMHjHbZ6XfmNZ1w8ShDwHNBsx2IQso5RmdMnkwPxQZTLQKgrKohZXyMpPM
         f4CEhiBedBApta4PRJ7fv73OiUemR8yrB76yvaVFZW3coYwpftrW3vLmNqeuKUgODCuG
         HG1pzZUlvwftCNNHLPXqMaytQRjE7nKrn97QMTz/7TPX5xutx4ZcibHUv7N0+H8u4Sjt
         cSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727081700; x=1727686500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKHXyXv8u9rhkwRUOZ/ML3LklCgz5A4fWbLYE4hpCrw=;
        b=HT+NEZlV+LiQ0J9WZesCDsuK1xjJU3yY77dxhKR9Qm5sJbTXL56lI7RTa5yz+gM5/U
         xzxy8/F6M9/uRpjJZc8DeozxImJFqwJQifQUcBbhLqTI4nCwkOEL2wZkgYWl2ODlaxmi
         oUubaxygtx5BCXgJDWohdbj9o9sbFy6ZxQfyAY2h3FvypP4jMmwdvP0VBRC4SC/k+CcX
         eAbBWa9OtS7w57GNtDwmxLcL8itMbuSgBsOklaDfbcON54/pQ+z0zJpOMPmWXgzU8K8M
         jfOL4UlnN6ftoYXmF1FU5F3xDATVsbvJvStQXglQ4mNtP9wuBk24vLYU+HbBfd5UGmYx
         ICOg==
X-Forwarded-Encrypted: i=1; AJvYcCXg24NxJjUaXmmbyFAMJSRIAB/DXzmPE+RSBL0YNkYccRhM6846Vx0HvGYzwPuQRrhug1M2i7R0qjE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxft9DMMWBb4wLnvP5jWsxPdHdKVXQNLDp3s3ZWIzwuxuzSvNnF
	62JDfXgv4KT0h0nJCJWeUMfAHn9EBZnLnbQDeT90u/xFS+go9OV8n1zm4YdeNZM=
X-Google-Smtp-Source: AGHT+IFD9FZW3owM5RP6khtxxFcvSKuoQVXgqiUYUHkdAGP3MqPAxsF9w69ZtKP+xWv4akFLPoz8XA==
X-Received: by 2002:a05:600c:46c3:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42e7c1640ccmr53682555e9.12.1727081699963;
        Mon, 23 Sep 2024 01:54:59 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afec0c3sm94245065e9.37.2024.09.23.01.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 01:54:59 -0700 (PDT)
Message-ID: <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
Date: Mon, 23 Sep 2024 09:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_015502_376582_153FB0BB 
X-CRM114-Status: GOOD (  43.40  )
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

Hi, Marek,

On 9/14/24 11:08 PM, Marek Vasut wrote:
> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
> and 256kiB uniform sectors device configuration, however according to
> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
> manufactured devices, which means 64kiB sectors. Since the device does not
> support 64kiB uniform sectors in any configuration, parsing SMPT table
> cannot find a valid sector map entry and fails.
> 
> Fix this up by setting SMPT configuration index bit 0, which is populated
> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
> fixup hook and a wrapper function. The only implementation of the hook is
> currently specific to S25FS512S.
> 
> This fixes the following failure on S25FS512S:
> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>  drivers/mtd/spi-nor/core.h     |  5 +++++
>  drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>  drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>  4 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9d6e85bf227b..ca65f36e5638 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  	return 0;
>  }
>  
> +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
> +{
> +	int ret;
> +
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->post_smpt) {
> +		ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (nor->info->fixups && nor->info->fixups->post_smpt)
> +		return nor->info->fixups->post_smpt(nor, smpt);
> +
> +	return 0;
> +}
> +
>  static int spi_nor_select_read(struct spi_nor *nor,
>  			       u32 shared_hwcaps)
>  {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 1516b6d0dc37..d5294424ab9d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>   *             parameters that could not be extracted by other means (i.e.
>   *             when information provided by the SFDP/flash_info tables are
>   *             incomplete or wrong).
> + * @post_smpt: update sector map configuration ID selector according to
> + *             chip-specific quirks.
>   * @late_init: used to initialize flash parameters that are not declared in the
>   *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>   *             Will replace the default_init() hook.
> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>  			 const struct sfdp_parameter_header *bfpt_header,
>  			 const struct sfdp_bfpt *bfpt);
>  	int (*post_sfdp)(struct spi_nor *nor);
> +	int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>  	int (*late_init)(struct spi_nor *nor);
>  };
>  
> @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  			     const struct sfdp_parameter_header *bfpt_header,
>  			     const struct sfdp_bfpt *bfpt);
>  
> +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
> +
>  void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>  void spi_nor_try_unlock_all(struct spi_nor *nor);
>  void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 5b1117265bd2..542c775918ad 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  		map_id = map_id << 1 | !!(*buf & read_data_mask);
>  	}
>  
> +	err = spi_nor_post_smpt_fixups(nor, &map_id);
> +	if (err)
> +		return ERR_PTR(err);
> +
>  	/*
>  	 * If command descriptors are provided, they always precede map
>  	 * descriptors in the table. There is no need to start the iteration
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index d6c92595f6bc..d446d12371e1 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>  	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>  };
>  
> +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
> +{
> +	/*
> +	 * The S25FS512S chip datasheet rev.O Table 71 on page 153
> +	 * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
> +	 * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
> +	 * device configuration, however according to section 7.5.5.1
> +	 * Configuration Register 3 Non-volatile (CR3NV) page 61, the
> +	 * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
> +	 * 0 on newly manufactured devices, which means 64kiB sectors.
> +	 * Since the device does not support 64kiB uniform sectors in
> +	 * any configuration, parsing SMPT table cannot find a valid
> +	 * sector map entry and fails. Fix this up by setting SMPT
> +	 * configuration index bit 0, which is populated exactly by
> +	 * the CR3NV bit 1 being 1.
> +	 */
> +	*smpt |= BIT(0);

Please help me understand this. Maybe a link to your revision of
datasheet would help me. In the flash datasheets that I see, there shall
be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
table is described showing an Index Value constructed by the CRxNV[y]
return values. That index value is the map_id in the code.

By reading your description I understand CR3NV[1] has value zero as it
is marked as RFU, but at the same time that bit is expected in SMPT to
always have value 1. That's why datasheets like this one [1] in their
"Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.

I assume what you're doing is fine as it shouldn't break backward
compatibility with other older flashes as their CR3NV[1] has value one
anyway. Correct me if I'm wrong.

Now looking at the code, what we usually do is to save the flash
parameters described by SFDP in nor->params, then amend those parameters
with fixup hooks if that's needed. Here you modify the map_id and then
let the code use it in order to determine the sector_map. Then that
sector_map (which is SMPT data from the table itself) is used to
initialize erase regions. That sector_map can contain wrong data too.

I'd suggest saving a nor->params->sector_map then call a
int spi_nor_post_smpt_fixups(struct spi_nor *nor,
	const struct sfdp_parameter_header *smpt_header,
	const u32 *smpt)
in case spi_nor_get_map_in_use() fails. This way others can update
sector_map as well if that's ever needed. What do you think?

Cheers,
ta

[1]
https://www.mouser.com/datasheet/2/100/CYPR_S_A0011121083_1-2541215.pdf?srsltid=AfmBOorpMLKdybn-E_tAUjSBW0AigP0bQ3JR3tD9VUPwf4nGVBYBC1fB


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
