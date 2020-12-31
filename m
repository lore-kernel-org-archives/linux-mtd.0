Return-Path: <SRS0=XVws=GD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE07C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Dec 2020 10:54:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3FBD223C8
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Dec 2020 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3FBD223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gqv8VkkxqFBgu1y5EUZ9BwQsItr78sYPcQJmP4bgYpM=; b=VbOTfCcYBrwAOchHtLD499/iD
	mh6EpJLQq+F7S1bCaAD3Aa/R4PjDzLHrpZeH05yvyeb3UJ0NJ73qQV/ppIvp6X1z2A/toHLJGpY9s
	46efJtTQkEuDWpCeeNrwz7AfaOy5sHHNWNe2hsVIz3FugiXP8m5vKV33cvNTDo5pewn58HF8mBl8h
	0EQwLEx6aM0Hmyn/2QvtYr73TcNOLI/BkA3kt7Rw+tNIvfxfSqaAuKvb9to5AH1MMt+iDpJcBy7Oq
	x62yhi6sRghetwnKNIvOq0tH4u3DWiCeteGGfEL9O2lTbbIXPGWO6wmRxoEmD2MzIGuTM5MiMVLD2
	EiqFuuHtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuva1-0007Wj-39; Thu, 31 Dec 2020 10:53:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuvZy-0007WH-MX
 for linux-mtd@lists.infradead.org; Thu, 31 Dec 2020 10:53:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id hk16so5176937pjb.4
 for <linux-mtd@lists.infradead.org>; Thu, 31 Dec 2020 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FK38+lBYH46YbkwWKBfh4GZnY66BJTZOsbK6+7PCcwk=;
 b=WRd7o+JxNxw3zd3rxugJpx4wKHEQeW+AAaoMFCc5bmI9TyT7jhB1Kv1pCU2jpk6V1/
 jCrw5gS2gDjTVa95BGcwsZexQIIx3Sor2Xo8Ue+cb37MnJGeaFp4WZtoz9Yt+pLaV9zZ
 TKoEk0Y5VvCu4TYvUCdTJs4OwTQ0K1JIxgD1p4oLacKfsSE2UFFyS+ZF8Cf7mqrouxHR
 Y1vzKbsDEkyJcUhaiVgNE06oJjf4kUdMNzNFIRjoe3B6itObMDFKgJlnpiY8aZEPGHWS
 kOPH1qUZI2r/sdVWOssgZ7JzhSiaqOCXrEvBs5Nuf4Fz2nFdvNhND5paAbsNHOa/TxEr
 pSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FK38+lBYH46YbkwWKBfh4GZnY66BJTZOsbK6+7PCcwk=;
 b=ombAsokxsCt38U3Z259+btS9yNNU701LsJ3ELy7lQ6I2vI6sxYcq3hbTt/FhrvzASG
 ZfTYPHzne8I5nC7dRiTWyRUFkv/xVMxh5zgceLp8YoUX72phbZvoWpkBTlnU/buXog3/
 K6TBALMAWuqTbJFUJybfv/N12xzXjC9UN7acep1rlpKMOOrG21kJ18lvBlCnABAbcv1m
 Fk0LOgvtwo3qtYK3ZXe+nYYGpM5LapBbADZJquibXGX1sSNxxb5oqRGkKOjvQcp1VW4+
 6qXfsTBeq6mkm2QQVb+bZuEmHyt5xKy3B1O83vG3ERtkhcl+IQ7jXeTMUe098p/fmMXW
 Eb1Q==
X-Gm-Message-State: AOAM530r/N0VI4IJr9dyuYJQ2HM22IksUwRx6LvnVUoilYE8X/Rw3z01
 g7XY6V8G72un1/i48UE8FApz
X-Google-Smtp-Source: ABdhPJyP7cCiZntjBKc5iJucBEdLRlk2Gw58FYRcaCTStMZIiA/e/ulPOwvI/Kc8ic7TR1zoNzRx2w==
X-Received: by 2002:a17:902:b415:b029:dc:42b1:9b26 with SMTP id
 x21-20020a170902b415b02900dc42b19b26mr41828184plr.71.1609411992055; 
 Thu, 31 Dec 2020 02:53:12 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
 by smtp.gmail.com with ESMTPSA id 82sm46540887pfv.117.2020.12.31.02.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 02:53:11 -0800 (PST)
Date: Thu, 31 Dec 2020 16:23:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
Message-ID: <20201231105303.GI7345@thinkpad>
References: <1608213776-19584-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608213776-19584-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_055314_782177_7B61D736 
X-CRM114-Status: GOOD (  24.05  )
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
Cc: sricharan@codeaurora.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 07:32:56PM +0530, Md Sadre Alam wrote:
> From QPIC version 2.0 onwards new register got added to
> read last codeword. This change will update the same.
> 
> For first three code word READ_LOCATION_n register will be
> use.For last code wrod READ_LOCATION_LAST_CW_n register will be
> use.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 79 +++++++++++++++++++++++++++++++++------
>  1 file changed, 67 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 667e4bf..eaef51d 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -48,6 +48,10 @@
>  #define	NAND_READ_LOCATION_1		0xf24
>  #define	NAND_READ_LOCATION_2		0xf28
>  #define	NAND_READ_LOCATION_3		0xf2c
> +#define NAND_READ_LOCATION_LAST_CW_0    0xf40
> +#define NAND_READ_LOCATION_LAST_CW_1    0xf44
> +#define NAND_READ_LOCATION_LAST_CW_2    0xf48
> +#define NAND_READ_LOCATION_LAST_CW_3    0xf4c

Please keep the alignment as before.

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
> @@ -719,9 +741,13 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>  
> -	if (read)
> +	if (read) {
> +		if (nandc->props->qpic_v2)
> +			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
> +					host->cw_data : host->cw_size, 1);

Forgot to add else? Otherwise both NAND_READ_LOCATION_n and NAND_READ_LOCATION_LAST_CW_n
will be used.

>  		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
>  				   host->cw_data : host->cw_size, 1);
> +	}
>  }
>  
>  /*
> @@ -1096,9 +1122,13 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
>  static void
>  config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
>  {
> -	if (nandc->props->is_bam)
> +	if (nandc->props->is_bam) {
> +		if (nandc->props->qpic_v2)
> +			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
> +				      4, NAND_BAM_NEXT_SGL);
>  		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
>  			      NAND_BAM_NEXT_SGL);

Don't you need to modify the number of registers to write? It can't be 4 all the
time if NAND_READ_LOCATION_LAST_CW_0 is used.

> +	}
>  
>  	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> @@ -1633,16 +1663,28 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	}
>  
>  	if (nandc->props->is_bam) {
> -		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
> +			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
> +		else
> +			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);

IIUC nandc_set_read_loc_last() is only needed to read the last codeword which is
handled by the last command in this function:

nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);

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
> @@ -1873,14 +1915,27 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
>  
>  		if (nandc->props->is_bam) {
>  			if (data_buf && oob_buf) {
> -				nandc_set_read_loc(nandc, 0, 0, data_size, 0);
> -				nandc_set_read_loc(nandc, 1, data_size,
> -						   oob_size, 1);
> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1)) {
> +					nandc_set_read_loc_last(nandc, 0, 0, data_size, 0);

Why do you need this? Can't you use nandc_set_read_loc()? Same for below cases.

Thanks,
Mani

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
