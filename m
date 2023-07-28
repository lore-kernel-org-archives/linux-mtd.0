Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD2C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J6qiRwOfnYUffAboglateW9w8GkRDPkDMWvbqjE4+Q=; b=PP8KCyxNVkqMwA
	aNHKUafFqqGevNOFGYqmyUxw4m8jEvhsmxBvvf7Ap1wRrIU2cFuALh0BZaRIvaumvhjaMDkhdUuiG
	4waBaCfQF436STfcRjjQW52c7tkbxD8MVEYqrmEaVvSFsfTQ56/oJWZClwoDoJ1SRoNGkNp5lT7NL
	JF30de9Cd7XUfdxUnTgPmp2dGQrsqujfV+cnYIgoALrLf3LktCNIpK0wzTh26o1aXMAXfxB9lmGoL
	gkNpgCfjHit07Yd754/tsXGEZsbnJQEvVUS8z0eT4nkDZ2CQ+54l7lkm7t+xqv8Ub2Jeg6ThkID3S
	MaM+1fN8JbsL+lMXLh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD2s-001GfW-1G;
	Fri, 28 Jul 2023 02:17:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD2o-001Gde-1W
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:17:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso18081005e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690510646; x=1691115446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnRQwBxQI81dc/EYPsxODn2YXpA7ydeJBRvn2gKd3as=;
        b=oMo6GY/ZkstgQIF6rpImtwIm/1pEicIwnm1YNJ99Uflvn+v+71bNUsMN3zufKar/HL
         nLDNDBm+ShFy5+cYl8CGTQ5GU7i/yQrr9bdlcnIvavM39d4nL9ikTyfwMq+jIUJy3MVc
         HtWiSISPC93Q63jjFA6/0/RrqpzHhAXAx2uiHeftpsaI17hOVqT7GWOzVcXfflRUsmGu
         AVtzHT8IVA03YoSes+yhs7f2kH1Py0GBXWegMZMh11RKpZUpQsSQGfQgnKEgN5CfG25x
         6wUiYyTpdIMdakMfIxI9sOQJ0rF5VaWWojvY+iIALKMSWYWjbBaPVAltL+8ZTwK9WhYR
         EdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690510646; x=1691115446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnRQwBxQI81dc/EYPsxODn2YXpA7ydeJBRvn2gKd3as=;
        b=kW6UnMyNOnV7zlj8c+w0T3+1yXFuC6Hxg9hWH9RbBCigkKoQQ/BNB6/cuBq3GQPxeR
         dagxe3i0tCfLNtrIL/FqC2cMnDZcEEFOadPZZLzB2Hfn1RYI7XhBw2z45Kq8FAMhsyxg
         jabYTUQhOnGYIm/nNws2gk3+8dGQZ3uRtiYfqKlZS29Au9/CYTQVC9mBmlHrG3HAHkNt
         nLgG42qpXgwfheCruukculvQuolyrKRtNhWbVX0WKEnqPM6f2kSLGf9psqj7c54KD1uv
         ohPJbY0Y5yg5jYjTRhynR03yyOJwIGyAhjb6JxyDOK+2T6dssx3erIINeoR/vD2fTUDg
         B1rg==
X-Gm-Message-State: ABy/qLaZfju9OAg1T1C93UC1YiarVmuGH934L3tmKQ4NMHfKDGInBzSr
	QTUdlbFHiW1yM04/Uo3JEl58LQ==
X-Google-Smtp-Source: APBJJlEfcKasF9ODETFLVzH1tXc34zNBxcFpObRPpmfodnEMtKxrmtA+lsbOora2MwjFjh4uIc7x4w==
X-Received: by 2002:a05:600c:22c4:b0:3fb:c9f4:1506 with SMTP id 4-20020a05600c22c400b003fbc9f41506mr674242wmg.1.1690510646292;
        Thu, 27 Jul 2023 19:17:26 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fbc9b9699dsm3067634wml.45.2023.07.27.19.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:17:25 -0700 (PDT)
Message-ID: <e94882cf-97a7-a9f5-c9ff-102acab2a3ba@linaro.org>
Date: Fri, 28 Jul 2023 03:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] mtd: rawnand: qcom: Use u8 instead of uint8_t
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-3-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_191730_510472_2F75C838 
X-CRM114-Status: GOOD (  15.98  )
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



On 7/16/23 15:46, Miquel Raynal wrote:
> Fix the following checkpatch warning:
>     "CHECK: Prefer kernel type 'u8' over 'uint8_t'"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 023c8b36426b..0136df01738e 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -212,7 +212,7 @@ nandc_set_reg(chip, reg,			\
>  /* Returns the dma address for reg read buffer */
>  #define reg_buf_dma_addr(chip, vaddr) \
>  	((chip)->reg_read_dma + \
> -	((uint8_t *)(vaddr) - (uint8_t *)(chip)->reg_read_buf))
> +	((u8 *)(vaddr) - (u8 *)(chip)->reg_read_buf))
>  
>  #define QPIC_PER_CW_CMD_ELEMENTS	32
>  #define QPIC_PER_CW_CMD_SGL		32
> @@ -1884,7 +1884,7 @@ static void qcom_nandc_codeword_fixup(struct qcom_nand_host *host, int page)
>  }
>  
>  /* implements ecc->read_page() */
> -static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
> +static int qcom_nandc_read_page(struct nand_chip *chip, u8 *buf,
>  				int oob_required, int page)
>  {
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
> @@ -1912,7 +1912,7 @@ static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
>  }
>  
>  /* implements ecc->read_page_raw() */
> -static int qcom_nandc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
> +static int qcom_nandc_read_page_raw(struct nand_chip *chip, u8 *buf,
>  				    int oob_required, int page)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -1958,7 +1958,7 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
>  }
>  
>  /* implements ecc->write_page() */
> -static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
> +static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
>  				 int oob_required, int page)
>  {
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
> @@ -2035,7 +2035,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
>  
>  /* implements ecc->write_page_raw() */
>  static int qcom_nandc_write_page_raw(struct nand_chip *chip,
> -				     const uint8_t *buf, int oob_required,
> +				     const u8 *buf, int oob_required,
>  				     int page)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
