Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE0C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQs9cFyNPE+8OsRIfgwfZvusfP1rjVNsHEefOzcCIak=; b=LjVp0C7g7z0Q0f
	UjeolOvlwsQeAM7Zu5gXL/6x1pAZy+9wwF95Zq+QOYCothja2t3Xj8gFPsaM9eFrgDV9twpvsrbkG
	g0tsR6ELgMYiKTaokxM3blXSnedRq+vx5dcZpWEtWgzHiTkvGjY/JucsMa8y/QB/1eMFg4i++8O+I
	JL+v9XZQ9lRudSm2R7z9+H3FrcgTKZf4t33ObDFLoc9drjknwxMaQ0tQm2mu4mEVTbZMQRkNoOLhd
	Rg9wpLtCy3xjR3fiN73bW02MgopzeuNd8UlJ0Ew3Q8YYVGM6TRBEb5B7zr4AnNLl9xi1XCY2Melb0
	sBLktru+kOjUCQVRzZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD3h-001Gwq-0W;
	Fri, 28 Jul 2023 02:18:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD3d-001Gud-0K
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:18:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbea147034so17260735e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690510700; x=1691115500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niZV9KuZ2GFGX4PR+fTtCGIqcdMp1qduxnH7gPybaRI=;
        b=y9BWxJCdLub7HwwIhjUnSln3Ktr1QW3oUomqcn4OjE3Blk0VSWcVjLij8AG5tXLOvO
         LG4IhAaxb1TlOU3A4+nogb7ISFbSzL4fIchu1GB4SoQrPEs+PhJNrTX8uWiYkiAzAfH6
         37MS5bwvxsKOK3wQZlwIbCmdt8IQmVLeYuH7uqwq4EGxNYC0cfM3cX5GAiLv1j2gCp4S
         9eG3nOFefy/VGbZyWBXeEMFiwZzO2PeMJBVS24+8Bsndl3v53cutmzHdqKuQXOcHv/+6
         ZWCNtpSzcA0egiJcwhCCs03W7mQcYof6KwCkdHaPio6esWZWPBTHkUsWqmuMgRdfF6ZR
         22OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690510700; x=1691115500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niZV9KuZ2GFGX4PR+fTtCGIqcdMp1qduxnH7gPybaRI=;
        b=HY+uleM3n6QBQ8QwGixiLVuaHv0G8LedvHiVQZv+8CSlIomaPTwHQ/d1r/kO7WWCFU
         T5QkWzT7BsRZbP3jZoh+Xl14cBKChJ6Thxj325Yeykp75HzlqVfO8SzEfFB0cT1ci2/4
         AuD/vCezNwcmrEG4uLTQSIr3UKMBPuo0iUhcGqGpL5/WK73PZbgrU+3ZUXMgLq++iDYQ
         YVunu63va8ZqizqHgAUXS2E8rmy8bcg2WdW0DcfYwQ0wz8ur5vAwQNgPzhvpYr9yDBNv
         L2ZXUbAtlZbvh03Bqm1S4ZOMX7FWm2oWPEj3pGfMeqydIVlIlTTFx+joZR3RH7ZQD2Aw
         GRbw==
X-Gm-Message-State: ABy/qLYbomDHG7KLn3wlTeglbNuyIZqa5stXez226mxgS/z013NLK3C+
	vzqfwf/CcIImUnGUzhDJen2omw==
X-Google-Smtp-Source: APBJJlFB/56VBm3kl5IgeiFyzlA+McrpRROrnpLUm04TmFap6/1qSd72GRdSE7p0pKNR4MDBGRFxpQ==
X-Received: by 2002:a05:600c:11cd:b0:3fb:ffef:d058 with SMTP id b13-20020a05600c11cd00b003fbffefd058mr547060wmi.0.1690510699782;
        Thu, 27 Jul 2023 19:18:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fba92fad35sm5893011wmc.26.2023.07.27.19.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:18:19 -0700 (PDT)
Message-ID: <25458c7f-7db7-468b-cdfe-c00cff31a32d@linaro.org>
Date: Fri, 28 Jul 2023 03:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] mtd: rawnand: qcom: Fix the spacing
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
 <20230716144612.32132-5-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_191821_143314_6541AE09 
X-CRM114-Status: GOOD (  15.20  )
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
> Fix following checkpatch warning:
> 	"CHECK: Please don't use multiple blank lines"
> 	"CHECK: Please use a blank line after
> 		function/struct/union/enum declarations"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 54a7b49bda87..554cca3801da 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1997,7 +1997,6 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
>  			oob_size = ecc->bytes;
>  		}
>  
> -
>  		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
>  			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
>  
> @@ -2373,6 +2372,7 @@ qcom_nandc_calc_ecc_bytes(int step_size, int strength)
>  {
>  	return strength == 4 ? 12 : 16;
>  }
> +
>  NAND_ECC_CAPS_SINGLE(qcom_nandc_ecc_caps, qcom_nandc_calc_ecc_bytes,
>  		     NANDC_STEP_SIZE, 4, 8);
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
