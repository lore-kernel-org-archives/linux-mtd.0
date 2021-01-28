Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F984C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 07:54:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FD464DD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 07:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FD464DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SkWMhV2ilaJyqgoqCRxfH35yICd/OV4Cs91V/4dCOLw=; b=EGvjW1st4MyEm0nFlXRDs2Nlk
	BYaZ/DHz9h0fOGXaMltRsfUhKhOsv8NgagENcta/PV1uaTdBtFRJ/J/AU6THMcx++qRU9zxTeZf28
	lIP8lz4X/+tMP7kf4EwpoDQ4BsEDRs48caDPN9nAWF0cNGYfvdZLaMFnrB7UZRXab+kZJsbpDMDvG
	nJQZQIduGThi96Y4eyZKN4dcTlpLdx/JfhRICiboR8wyv2Yzxp8zYo5YeM6iu3wx09f6V6hP51Mmh
	jzLHOfiSyT3Je9pfEPRUTDny5tZuViTdIO/V7xkmqwa01+r80OuSdJ2xPSUOvRRAcQIV3ZXyHSrOX
	dvuJXVL9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l526y-0004KH-8w; Thu, 28 Jan 2021 07:53:04 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l526v-0004JR-Ov
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 07:53:03 +0000
Received: by mail-pl1-x633.google.com with SMTP id d4so2878681plh.5
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2021 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VsdZHEXPOYBz1t7Uapp8O+nzDu+rjZQkCqjAz0dmanc=;
 b=hirkWz3AUfnmEfgBflhYsHNAKT2Opv+yUSQpfA9pWpHH1FqbiJ6Gfd9YPCcd33ysBy
 QezBDwBeMAb0MrM39cZ96gr6g7bFgaCfQ4dGd8vyWiJUmvE1/jI2N13lbcPbpaiQS1Fz
 f39wFaVxC4nRmw7yjb7n227pi4LGcyZ5CkhCfERij7SNFiHfF+Qc8vKqh0u8HdvhCbiO
 ZYR4XI648Y44w66bxslwoctwpU6ccLz+7xJUUbRktbrdB2EhXOUZpl3FnZcTTvW9RwX4
 qTeM0wr/rtLvuD6iLUydoG55TCAh3HAaGWSlCExsYBQ6TtMxk9zasrd6MYz04C7no42S
 J/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VsdZHEXPOYBz1t7Uapp8O+nzDu+rjZQkCqjAz0dmanc=;
 b=KFR1AGkWwPg8Q5rhle20QmoYfZgqHYgP/WjWyROp/WZ401Zq2pOUiIVqVo0PET7lYT
 uHJh3cdil9K+IWXcBbTE60/yP9wYuqhAcOtJh2NXh8SxSAvm3CMTLEj/HCzbJZzJ5soQ
 YVrvgUxoaQXQ3bdbjCXij9aqay+TGwXjHPFTWk8NELy7g3bJ8Vf9V/GmsSCW8XzeZHSc
 ZV9efdrtkeqikS8E0fIwe6LDegb8wVBPzQJJQrdcm2NHZUG79lDuRxG4dzJtG8NoGz7/
 aGwuUaH1n6fDxGoJTDqR6B0uv5JNw9ipBuQQ77ErJlVox2deYh5cYniPRhRq2W4X80kH
 8bbg==
X-Gm-Message-State: AOAM532AfVGYVAhU844kDjKaT3Kh+bGTqKtF41qFBFtimAnIA1z4faAP
 CVoEWsCV9+08T1nFm5famZgl
X-Google-Smtp-Source: ABdhPJzzzYNIlXEgBMv3vSx5fp7JvWt2aQkGBD+cHyBm7aGgUtykjfsy6mkV6/vCoaHJyq2V9r6yDw==
X-Received: by 2002:a17:902:d4d0:b029:df:d246:ca81 with SMTP id
 o16-20020a170902d4d0b02900dfd246ca81mr15522541plg.58.1611820377621; 
 Wed, 27 Jan 2021 23:52:57 -0800 (PST)
Received: from thinkpad ([2409:4072:69e:9090:ae18:d40b:b43a:cda9])
 by smtp.gmail.com with ESMTPSA id i67sm4827628pfc.153.2021.01.27.23.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:52:56 -0800 (PST)
Date: Thu, 28 Jan 2021 13:22:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH V3] mtd: rawnand: qcom: update last code word register
Message-ID: <20210128075248.GA31543@thinkpad>
References: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_025301_942590_8E182B59 
X-CRM114-Status: GOOD (  28.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, sricharan@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jan 10, 2021 at 09:31:45AM +0530, Md Sadre Alam wrote:
> From QPIC version 2.0 onwards new register got added to
> read last codeword. This change will update the same.
> 
> For first three code word READ_LOCATION_n register will be
> use.For last code word READ_LOCATION_LAST_CW_n register will be
> use.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

I gave this patch a try on SDX55 board but not able to resolve an issue and
I think it is related to reading the last code word which this patch is trying
to address. For my patch on supporting QPIC v2 IP, I tested with SDX55-MTP board
and I never hit any issue. But on my new dev board (Telit FN980), there seems to
be an issue while populating the partitions and tracing down that bug lands me
in copy_last_cw() function.

The issue only happens while creating the 3rd partition on Telit board whose
size differs when compared with MTP. The board just reboots into QDL mode
whenever it tries to read the last code word.

Below is the snippet of partition layout:

Telit partitions:

[    1.082015] 0: sbl offs=0x00000000 size=0x0000000a attr:0x000000ff
[    1.082702] 1: mibib offs=0x0000000a size=0x0000000a attr:0x000000ff
[    1.083488] 2: ico offs=0x00000014 size=0x00000014 attr:0x000000ff
[    1.084572] 3: efs2 offs=0x00000028 size=0x0000002c attr:0x000000ff
[    1.085316] 4: tz offs=0x00000054 size=0x00000007 attr:0x000000ff
[    1.086089] 5: tz_devcfg offs=0x0000005b size=0x00000004 attr:0x000000ff
....

MTP partitions:

[    1.573871] 0: sbl offs=0x00000000 size=0x0000000a attr:0x000000ff
[    1.581139] 1: mibib offs=0x0000000a size=0x0000000a attr:0x000000ff
[    1.587362] 2: efs2 offs=0x00000014 size=0x0000002c attr:0x000000ff
[    1.593853] 3: tz offs=0x00000040 size=0x00000007 attr:0x000000ff
[    1.599860] 4: tz_devcfg offs=0x00000047 size=0x00000004 attr:0x000000ff
...

So until I figure this out, please keep this patch on hold!

Thanks,
Mani

> ---
> [V3]
>  * Added else condition for last code word in update_rw_regs().
>  drivers/mtd/nand/raw/qcom_nandc.c | 84 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 70 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 667e4bf..50ff6e3 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -48,6 +48,10 @@
>  #define	NAND_READ_LOCATION_1		0xf24
>  #define	NAND_READ_LOCATION_2		0xf28
>  #define	NAND_READ_LOCATION_3		0xf2c
> +#define	NAND_READ_LOCATION_LAST_CW_0	0xf40
> +#define	NAND_READ_LOCATION_LAST_CW_1	0xf44
> +#define	NAND_READ_LOCATION_LAST_CW_2	0xf48
> +#define	NAND_READ_LOCATION_LAST_CW_3	0xf4c
>  
>  /* dummy register offsets, used by write_reg_dma */
>  #define	NAND_DEV_CMD1_RESTORE		0xdead
> @@ -187,6 +191,12 @@ nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
>  	      ((size) << READ_LOCATION_SIZE) |			\
>  	      ((is_last) << READ_LOCATION_LAST))
>  
> +#define nandc_set_read_loc_last(nandc, reg, offset, size, is_last)	\
> +nandc_set_reg(nandc, NAND_READ_LOCATION_LAST_CW_##reg,			\
> +	      ((offset) << READ_LOCATION_OFFSET) |		\
> +	      ((size) << READ_LOCATION_SIZE) |			\
> +	      ((is_last) << READ_LOCATION_LAST))
> +
>  /*
>   * Returns the actual register address for all NAND_DEV_ registers
>   * (i.e. NAND_DEV_CMD0, NAND_DEV_CMD1, NAND_DEV_CMD2 and NAND_DEV_CMD_VLD)
> @@ -316,6 +326,10 @@ struct nandc_regs {
>  	__le32 read_location1;
>  	__le32 read_location2;
>  	__le32 read_location3;
> +	__le32 read_location_last0;
> +	__le32 read_location_last1;
> +	__le32 read_location_last2;
> +	__le32 read_location_last3;
>  
>  	__le32 erased_cw_detect_cfg_clr;
>  	__le32 erased_cw_detect_cfg_set;
> @@ -644,6 +658,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
>  		return &regs->read_location2;
>  	case NAND_READ_LOCATION_3:
>  		return &regs->read_location3;
> +	case NAND_READ_LOCATION_LAST_CW_0:
> +		return &regs->read_location_last0;
> +	case NAND_READ_LOCATION_LAST_CW_1:
> +		return &regs->read_location_last1;
> +	case NAND_READ_LOCATION_LAST_CW_2:
> +		return &regs->read_location_last2;
> +	case NAND_READ_LOCATION_LAST_CW_3:
> +		return &regs->read_location_last3;
>  	default:
>  		return NULL;
>  	}
> @@ -719,9 +741,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>  
> -	if (read)
> -		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
> -				   host->cw_data : host->cw_size, 1);
> +	if (read) {
> +		if (nandc->props->qpic_v2)
> +			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
> +					host->cw_data : host->cw_size, 1);
> +		else
> +			nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
> +					host->cw_data : host->cw_size, 1);
> +	}
>  }
>  
>  /*
> @@ -1096,9 +1123,13 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
>  static void
>  config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
>  {
> -	if (nandc->props->is_bam)
> +	if (nandc->props->is_bam) {
> +		if (nandc->props->qpic_v2)
> +			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
> +				      1, NAND_BAM_NEXT_SGL);
>  		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
>  			      NAND_BAM_NEXT_SGL);
> +	}
>  
>  	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> @@ -1633,16 +1664,28 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	}
>  
>  	if (nandc->props->is_bam) {
> -		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
> +			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
> +		else
> +			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
>  		read_loc += data_size1;
>  
> -		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
> +			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
> +		else
> +			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
>  		read_loc += oob_size1;
>  
> -		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
> +			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
> +		else
> +			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
>  		read_loc += data_size2;
>  
> -		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
> +			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 0);
> +		else
> +			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
>  	}
>  
>  	config_nand_cw_read(nandc, false);
> @@ -1873,14 +1916,27 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
>  
>  		if (nandc->props->is_bam) {
>  			if (data_buf && oob_buf) {
> -				nandc_set_read_loc(nandc, 0, 0, data_size, 0);
> -				nandc_set_read_loc(nandc, 1, data_size,
> -						   oob_size, 1);
> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1)) {
> +					nandc_set_read_loc_last(nandc, 0, 0, data_size, 0);
> +					nandc_set_read_loc_last(nandc, 1, data_size,
> +								oob_size, 1);
> +				} else {
> +					nandc_set_read_loc(nandc, 0, 0, data_size, 0);
> +					nandc_set_read_loc(nandc, 1, data_size,
> +							   oob_size, 1);
> +				}
>  			} else if (data_buf) {
> -				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1))
> +					nandc_set_read_loc_last(nandc, 0, 0, data_size, 1);
> +				else
> +					nandc_set_read_loc(nandc, 0, 0, data_size, 1);
>  			} else {
> -				nandc_set_read_loc(nandc, 0, data_size,
> -						   oob_size, 1);
> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1))
> +					nandc_set_read_loc_last(nandc, 0, data_size,
> +								oob_size, 1);
> +				else
> +					nandc_set_read_loc(nandc, 0, data_size,
> +							   oob_size, 1);
>  			}
>  		}
>  
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
