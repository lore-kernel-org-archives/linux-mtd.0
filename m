Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC90C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 09:02:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F185464E45
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 09:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F185464E45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0GtrCOQ4Qd338ffvsaQoW3OKlEUbeaq8NqWARr2OwtI=; b=QVGzLDJA6/QW3GP+QA80g6kXy
	hvmccuUAhU96k8f5UflQ7bQJlI4FdAMsPNOayFEUnF/4enajgUETa3bQtHDkmaFD9P/oc7mswuHsx
	I7kL7g1jF2qxkkved2KUpbQwmxSHN0nx6XTf4w5HPRbfp4YSwltRNO9rwfPL+pqfy8/kaq1E0YUXu
	aCPl7Wap2uWQDsHeyNScHyCLzH/keWfSs7R5Ro+mIGDiMw9ajHAYe7wQLprUsj7NbD3yvEDEyzACT
	gwCuFfS9OX+HQ3++//nX3rn8rSXr0tLuVkk8jZY0hJV6hZnknBPeOkgFKrakBSZfUf+ESHUU3Yoh3
	Ga5rXZVaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9lNg-0000no-Vt; Wed, 10 Feb 2021 09:01:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9lNe-0000nA-KK
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 09:01:51 +0000
Received: by mail-pg1-x534.google.com with SMTP id z21so807884pgj.4
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 01:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZR4GWczI+xHbDhy8yOwk9fJn8ZUuJW3l++fUKt2TTmI=;
 b=yh0yiPM9YI7dLK05YNe7g5QKHA9z63Z3iVqHuDfs3yD4fGnGacePFZrzTO+KHh7icC
 MPZLidOMyUdM3C7L4mei80RNnDSTbZQLSSZN7SmbQaFbOQAMc2ePUBipwSB0Vaad4Yd2
 vPKNBqHPSeDdrhfpnMFS02efBBMOiKijd1FdXQfthnYdy194K0Bk+atdrwOl5/Fu8WDA
 MJpQ6NzgC/krfTylo8L09AS9BsfzFeC0Zyi1+uRhuGghgQF3SjCAqZtIHubcmGyu4bB8
 avLJij9knNCry/xJbZEu5XrKT5KOh73MoA23QJtQpMoK+4VXYgbyEyJ1W18cB9bqfJnO
 w2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZR4GWczI+xHbDhy8yOwk9fJn8ZUuJW3l++fUKt2TTmI=;
 b=QEWFRnGJ1COCtdElbVCpvsNsr8zb6BWBMYOhhVeSay/8s7wrTzpASnd9BQHqMgQnW2
 t+4DKWwapmvHjEvZ2bgjjHKQB5dqTy8SdDE5MR1Cs0l+pCFxhtdprZjtSbjyeYhzpBPv
 GD1chlKDx0wgqB70BY/IH2gmc3c+aYlzwwgkc2mSZFYn21S2ZyurLyxUzcU4ePFvuCgg
 1BPp1ckPExWKC5miF8SHzmof2SXhx/BTnOhJwA1ji6pVrCwNqwgrop0r0NCJdnA+M7xQ
 XVL6i3+p+W2clXQ/MpEdE8S3PKozzIfYfMZ75W0FKJE+0uS1BA3SSU5Ys5iF6elk4l9R
 mm2g==
X-Gm-Message-State: AOAM532gb5DUyX7TV/urM1M/XvJ4Khzo1s4GgJcnB3LQLu4Mv4lJhg6o
 XjKZtBF4mIkwNXmOZ/0tC6Gx
X-Google-Smtp-Source: ABdhPJxshQShTa9xlKcEJvbbFXKh7+En4nStubVYK1Tm2QncQAPwh19ZJt2iU2E6ZBO4gqcagz9g7g==
X-Received: by 2002:a63:1965:: with SMTP id 37mr2194334pgz.349.1612947708171; 
 Wed, 10 Feb 2021 01:01:48 -0800 (PST)
Received: from work ([103.66.79.29])
 by smtp.gmail.com with ESMTPSA id p19sm1444013pjo.7.2021.02.10.01.01.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 01:01:47 -0800 (PST)
Date: Wed, 10 Feb 2021 14:31:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH V4] mtd: rawnand: qcom: update last code word register
Message-ID: <20210210090144.GE19226@work>
References: <1611869959-5109-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611869959-5109-1-git-send-email-mdalam@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_040150_812914_83206B7A 
X-CRM114-Status: GOOD (  24.20  )
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
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, sricharan@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 03:09:19AM +0530, Md Sadre Alam wrote:
> From QPIC version 2.0 onwards new register got added to
> read last codeword. This change will add the READ_LOCATION_LAST_CW_n
> register.
> 
> For first three code word READ_LOCATION_n register will be
> use.For last code word READ_LOCATION_LAST_CW_n register will be
> use.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> [V4]
>  * Modified condition for nandc_set_read_loc_last() in qcom_nandc_read_cw_raw().
>  * Added one additional argument "last_cw" to the function config_nand_cw_read()
>    to handle last code word condition.
>  * Changed total number of last code word register "NAND_READ_LOCATION_LAST_CW_0" to 4
>    while doing code word configuration.
>  drivers/mtd/nand/raw/qcom_nandc.c | 110 +++++++++++++++++++++++++++++---------
>  1 file changed, 84 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 667e4bf..9484be8 100644
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
> @@ -1094,11 +1121,16 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
>   * before reading each codeword in NAND page.
>   */
>  static void
> -config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
> +config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc, bool last_cw)
>  {
> -	if (nandc->props->is_bam)
> -		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
> -			      NAND_BAM_NEXT_SGL);
> +	if (nandc->props->is_bam) {
> +		if (nandc->props->qpic_v2 && last_cw)
> +			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0, 4,
> +				      NAND_BAM_NEXT_SGL);
> +		else
> +			write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
> +				      NAND_BAM_NEXT_SGL);
> +	}
>  
>  	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> @@ -1118,10 +1150,10 @@ config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
>   */
>  static void
>  config_nand_single_cw_page_read(struct qcom_nand_controller *nandc,
> -				bool use_ecc)
> +				bool use_ecc, bool last_cw)
>  {
>  	config_nand_page_read(nandc);
> -	config_nand_cw_read(nandc, use_ecc);
> +	config_nand_cw_read(nandc, use_ecc, last_cw);
>  }
>  
>  /*
> @@ -1215,7 +1247,7 @@ static int nandc_param(struct qcom_nand_host *host)
>  	nandc->buf_count = 512;
>  	memset(nandc->data_buffer, 0xff, nandc->buf_count);
>  
> -	config_nand_single_cw_page_read(nandc, false);
> +	config_nand_single_cw_page_read(nandc, false, false);
>  
>  	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
>  		      nandc->buf_count, 0);
> @@ -1633,19 +1665,32 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	}
>  
>  	if (nandc->props->is_bam) {
> -		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> -		read_loc += data_size1;
> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1)) {
> +			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
> +			read_loc += data_size1;
> +
> +			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
> +			read_loc += oob_size1;
>  
> -		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> -		read_loc += oob_size1;
> +			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
> +			read_loc += data_size2;
>  
> -		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> -		read_loc += data_size2;
> +			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 1);
> +		} else {
> +			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> +			read_loc += data_size1;
> +
> +			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> +			read_loc += oob_size1;
>  
> -		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> +			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> +			read_loc += data_size2;
> +
> +			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> +		}
>  	}
>  
> -	config_nand_cw_read(nandc, false);
> +	config_nand_cw_read(nandc, false, cw == ecc->steps - 1 ? true : false);
>  
>  	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>  	reg_off += data_size1;
> @@ -1873,18 +1918,31 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
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
> -		config_nand_cw_read(nandc, true);
> +		config_nand_cw_read(nandc, true, i == ecc->steps - 1 ? true : false);
>  
>  		if (data_buf)
>  			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
> @@ -1946,7 +2004,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
>  	set_address(host, host->cw_size * (ecc->steps - 1), page);
>  	update_rw_regs(host, 1, true);
>  
> -	config_nand_single_cw_page_read(nandc, host->use_ecc);
> +	config_nand_single_cw_page_read(nandc, host->use_ecc, true);
>  
>  	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
>  
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
