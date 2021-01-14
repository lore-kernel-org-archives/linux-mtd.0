Return-Path: <SRS0=+zBv=GR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8177CC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 16:32:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453692065E
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 16:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 453692065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oCOe47ogvR1fpyRQ9Sb0JDQSkkXvahrtEJjqKJ0iIbI=; b=0NRFb6PaSWxUbeXjOeIsPPZSU
	i5rMEkHyRYzjRw8Ip55L+QyNeDfwGzRcd/q14k7iqMUy+Kajw6uzgJnhjGwcuEyVxG7bDpK8IjVvx
	1DcQ3TUX3jx3L5j96yvS6mwP4L2zLeJ08HatKD3SqlvEY74/T6DjlyfJubJOIDJp/tK85gaO00PIl
	deo+yi5n7F2HhQNkG11g/CxWbx8+ut5gG4z5tX3RcbSIIIQ5YikvmOA8mBk/It+ZQEXqLsluJEYKS
	8wq08NbpKeoLbp7QeiAPAeXbnXFLU9iX6yoN9ZdhH7Cv1GzW6AUj/XpfdhX+Y+szd7xXzd9Uc4B+Q
	0Ag7Qqprg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l05Xa-0002Cp-Rt; Thu, 14 Jan 2021 16:32:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l05XY-0002Bw-1Q
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2021 16:32:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id y8so3157177plp.8
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jan 2021 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=u8M1Ty5OLh4UsZ7uFBCWguj8B/eIFjDQpgpp1xwZlPo=;
 b=NQo/sZL27ppZpDKlVtUpimBct9hQKJUXmYUyrXp/j+Op+WuW7lDrShIM2ZrZIbzq/s
 ccJ50DLzl6eEpyqN1WQ7cnK8cQWQRk5gDK0l/vZ7+JDd4gkZLAPKtKqRzjN3MCEcVO3q
 RQ/2M3IDe3UpvDMoCTTJFXzB9X3DhbVeEbZ3kgtpfv/VpnYKjSWCgTi68zRVJaPkFcRn
 E6I+hy/l50GejoBT/OqeepfgE8SgmuPlSIh2CsGw9jrVaJ5i2ENWH3ud50nApaYoM/z4
 tqb8hwKnNof+pXOTYbyqad5VOSj5fBK1DCtk5X0vOpufblQFzMM7HLkTxvejD2f1CeK9
 em4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u8M1Ty5OLh4UsZ7uFBCWguj8B/eIFjDQpgpp1xwZlPo=;
 b=YLA0oGG8werf0HwTWqdIUlwiVz3njsCrgoROOrOu+iFBmrHSiwYkJR+p6xq2hn3vJO
 4JHHHdn/t0xe/vZlDTW2xPqHlCmbTn37CZJzizrVITUA4d+D2MHPMfG0dwtN3jcKyN6g
 G72Y9Qn54T3wwwlWilwn+2Aftqy8FhhQK34LDBjeLNmutWTzRT5811AoUAVBooouqAn0
 Ez6FZhAeGq8PvUG/33icbUvw5iJjQ9/BE8yod0ylt+Ph4PqXmZR6wFC22kfbmxmtEBXq
 jXfhhC/MNjZfA8dzaVYteNU3yl3IB3pdfLlsdI9gyJbOuTdrZTbhcmcoAXe3M6zywdXo
 VnJg==
X-Gm-Message-State: AOAM533TigFKa/Q3njjVLg7FWL9OEofTCw6WWHedewRF1F2a9tKgBZkK
 F/DA/GKfSvNf5/vxWQeq0m6gmt9+5yeG6Cw=
X-Google-Smtp-Source: ABdhPJw4UQdkapz8h0EaMcLjLjRWB+aITeZbyNWwPKy2PG8qgUDVTUgkOI3nRYI2t5CCGPUn7cZ9vw==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id
 k6mr5742585pjd.204.1610641920066; 
 Thu, 14 Jan 2021 08:32:00 -0800 (PST)
Received: from thinkpad ([103.77.37.186])
 by smtp.gmail.com with ESMTPSA id s1sm5402235pfb.103.2021.01.14.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:31:59 -0800 (PST)
Date: Thu, 14 Jan 2021 22:01:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH V3] mtd: rawnand: qcom: update last code word register
Message-ID: <20210114163154.GA76759@thinkpad>
References: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
 <20210114165325.3d510355@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114165325.3d510355@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_113204_367200_9BB31B48 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: Md Sadre Alam <mdalam@codeaurora.org>, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 04:53:25PM +0100, Miquel Raynal wrote:
> Hello,
> =

> Md Sadre Alam <mdalam@codeaurora.org> wrote on Sun, 10 Jan 2021
> 09:31:45 +0530:
> =

> > From QPIC version 2.0 onwards new register got added to
> =

>                                 a
> =

> > read last codeword. This change will update the same.
> =

>        the?           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                       Please reword this sentence.
> =

> > For first three code word READ_LOCATION_n register will be
> > use.For last code word READ_LOCATION_LAST_CW_n register will be
> > use.
> =

> "For the first three codewords, READ_LOCATION_n registers will be used.
> The last codeword register will be accessed through
> READ_LOCATION_LAST_CW_n."
> =

> Also, please specify what these registers store.
> =

> > Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> =

> Could someone please test this patch?
> =


This is on my TODO list. Will get back to it once I'm back from holidays
or sooner if I find some time in the middle.

Thanks,
Mani

> > ---
> > [V3]
> >  * Added else condition for last code word in update_rw_regs().
> >  drivers/mtd/nand/raw/qcom_nandc.c | 84 +++++++++++++++++++++++++++++++=
+-------
> >  1 file changed, 70 insertions(+), 14 deletions(-)
> > =

> > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/q=
com_nandc.c
> > index 667e4bf..50ff6e3 100644
> > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > @@ -48,6 +48,10 @@
> >  #define	NAND_READ_LOCATION_1		0xf24
> >  #define	NAND_READ_LOCATION_2		0xf28
> >  #define	NAND_READ_LOCATION_3		0xf2c
> > +#define	NAND_READ_LOCATION_LAST_CW_0	0xf40
> > +#define	NAND_READ_LOCATION_LAST_CW_1	0xf44
> > +#define	NAND_READ_LOCATION_LAST_CW_2	0xf48
> > +#define	NAND_READ_LOCATION_LAST_CW_3	0xf4c
> >  =

> >  /* dummy register offsets, used by write_reg_dma */
> >  #define	NAND_DEV_CMD1_RESTORE		0xdead
> > @@ -187,6 +191,12 @@ nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
> >  	      ((size) << READ_LOCATION_SIZE) |			\
> >  	      ((is_last) << READ_LOCATION_LAST))
> >  =

> > +#define nandc_set_read_loc_last(nandc, reg, offset, size, is_last)	\
> > +nandc_set_reg(nandc, NAND_READ_LOCATION_LAST_CW_##reg,			\
> > +	      ((offset) << READ_LOCATION_OFFSET) |		\
> > +	      ((size) << READ_LOCATION_SIZE) |			\
> > +	      ((is_last) << READ_LOCATION_LAST))
> > +
> >  /*
> >   * Returns the actual register address for all NAND_DEV_ registers
> >   * (i.e. NAND_DEV_CMD0, NAND_DEV_CMD1, NAND_DEV_CMD2 and NAND_DEV_CMD_=
VLD)
> > @@ -316,6 +326,10 @@ struct nandc_regs {
> >  	__le32 read_location1;
> >  	__le32 read_location2;
> >  	__le32 read_location3;
> > +	__le32 read_location_last0;
> > +	__le32 read_location_last1;
> > +	__le32 read_location_last2;
> > +	__le32 read_location_last3;
> >  =

> >  	__le32 erased_cw_detect_cfg_clr;
> >  	__le32 erased_cw_detect_cfg_set;
> > @@ -644,6 +658,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_re=
gs *regs, int offset)
> >  		return &regs->read_location2;
> >  	case NAND_READ_LOCATION_3:
> >  		return &regs->read_location3;
> > +	case NAND_READ_LOCATION_LAST_CW_0:
> > +		return &regs->read_location_last0;
> > +	case NAND_READ_LOCATION_LAST_CW_1:
> > +		return &regs->read_location_last1;
> > +	case NAND_READ_LOCATION_LAST_CW_2:
> > +		return &regs->read_location_last2;
> > +	case NAND_READ_LOCATION_LAST_CW_3:
> > +		return &regs->read_location_last3;
> >  	default:
> >  		return NULL;
> >  	}
> > @@ -719,9 +741,14 @@ static void update_rw_regs(struct qcom_nand_host *=
host, int num_cw, bool read)
> >  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
> >  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
> >  =

> > -	if (read)
> > -		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
> > -				   host->cw_data : host->cw_size, 1);
> > +	if (read) {
> > +		if (nandc->props->qpic_v2)
> > +			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
> > +					host->cw_data : host->cw_size, 1);
> > +		else
> > +			nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
> > +					host->cw_data : host->cw_size, 1);
> > +	}
> >  }
> >  =

> >  /*
> > @@ -1096,9 +1123,13 @@ static void config_nand_page_read(struct qcom_na=
nd_controller *nandc)
> >  static void
> >  config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
> >  {
> > -	if (nandc->props->is_bam)
> > +	if (nandc->props->is_bam) {
> > +		if (nandc->props->qpic_v2)
> > +			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
> > +				      1, NAND_BAM_NEXT_SGL);
> >  		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
> >  			      NAND_BAM_NEXT_SGL);
> > +	}
> >  =

> >  	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
> >  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> > @@ -1633,16 +1664,28 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, st=
ruct nand_chip *chip,
> >  	}
> >  =

> >  	if (nandc->props->is_bam) {
> > -		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> > +		if (nandc->props->qpic_v2 && cw =3D=3D (ecc->steps - 1))
> > +			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
> > +		else
> > +			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> =

> You repeat many times this logic, a helper to avoid this extra
> indentation level with the if/else block is needed.
> =

> >  		read_loc +=3D data_size1;
> >  =

> > -		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> > +		if (nandc->props->qpic_v2 && cw =3D=3D (ecc->steps - 1))
> > +			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
> > +		else
> > +			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> >  		read_loc +=3D oob_size1;
> >  =

> > -		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> > +		if (nandc->props->qpic_v2 && cw =3D=3D (ecc->steps - 1))
> > +			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
> > +		else
> > +			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> >  		read_loc +=3D data_size2;
> >  =

> > -		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> > +		if (nandc->props->qpic_v2 && cw =3D=3D (ecc->steps - 1))
> > +			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 0);
> > +		else
> > +			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> >  	}
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
