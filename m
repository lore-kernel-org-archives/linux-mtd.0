Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D879EC02198
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2025 10:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2S/vzIhW7Gcs4yW6pHkvr+99dNvzlhEs4AjxgdJrmE8=; b=M8r6kRlqgqSSaX
	Rpn9iZxjNCo4s/6G4sci58qP44bvba/Bn1wXtwZ2SNv4heUQMYqfNqkAuC823fHvORY+UpaNEb7m2
	LV6r9UwcGzaHSn8ighduLPZ7DWHMxCwPKuFCD2uBTAvTkBr0T5F/M18IE9KP+8T3rmXRNHYgxv+rA
	w0FUqeS8mAzpXE6F/4DXQpNWiJcDFIT2QU62GEvpmuGph0kBPUIEOcRNxFEuPGxtapxyINTH9XJOJ
	AIjAvCLvFA2imqUOtlR9+Ip1+3YRRqzmcZ9847jdztTMNDZ92V5glHNWx4LDc3KCQbq8nHWEZVxCg
	Cxi4wqdsUL0KX1wrBt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tghk6-0000000ChoU-4AMO;
	Sat, 08 Feb 2025 10:07:18 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tghk4-0000000ChnH-2WwI
	for linux-mtd@lists.infradead.org;
	Sat, 08 Feb 2025 10:07:17 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab79de014b6so115439966b.0
        for <linux-mtd@lists.infradead.org>; Sat, 08 Feb 2025 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739009234; x=1739614034; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pyb3ufJSTQ8U3pKurPleGgl26RyZuM45GOpbWBuw9I=;
        b=KFWeLO3ciDjH8JFwOEFw/4+SRHld3XawPicddvCDOk8fdrbz2vBDXmv6Yq3KIcyMr/
         hOEeXxY+XY+uRXpbSJn1C2h+P1Pg5LnQrRrOY7DBljqCn1BWDqIhkq4TpaVOMaYvqh2D
         8wER3+NS+p0kGUngClqSKoKuehhu77vrEy/48e5oE+va9a3af08MX6U3vew+7P2pF6bU
         0kxgAI52C1qVbYoTv0TGsHwV+Ad0l55MIKajT1w3s/OHUv3wkGkJC1u5kGT13KZWOIFe
         NGFmgYLuPgIKcuHKz1Hn390hcfIE5ARth/Cr8eEiiwJKeIPIv4SL7u3lBgZvrhJQ8Laj
         c6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739009234; x=1739614034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pyb3ufJSTQ8U3pKurPleGgl26RyZuM45GOpbWBuw9I=;
        b=Nz/+KVG8ZSJGUm8DjL1A2MfpaPqTF8sd5bGK+FO4wa/lUSFhbe3ZbVlLRQy+r+/+eT
         vboRzjxos6WIWOm4EylgxqV9rHlaZUroZU/7krDouRc2wQvaBXOhDcF5I27lr58B2+It
         yLhUi1tAbgT+1NPrworxkRFO2tDjhODCTcZ+YOr9q920Y3BbwiqTMHvwOAPw03aFc9k1
         S4yAKoMSpCnILxcZscLdrf7TtUTRynglHKdxdag7DFHyOKPsEP9thpSIXGcs2r07Ubfj
         afNedVVhYkxrH9w0P9/MSee3bs+qIVHwGxM4hVKb/v2smOAEluTq4mimfyLRx9Sbvhdf
         xc5g==
X-Forwarded-Encrypted: i=1; AJvYcCVhSyYJo714Jb1E4UpW7OTbnL47ZPef8Db3tWKF7rhcb/o6YpZyrIoiW9uSjUziPBK+9PFj9s2mtcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSTCmMTYLp1Ump1EJbzG/zdFAC7ACvoy6X5UTWxteaJ33+X382
	dMorK/iC1bIhpBMJw3aSvjIBaoVmX4SaVGC53y0G73dVyXCT3Kzh
X-Gm-Gg: ASbGncuCmzOqgcZ7JZHUI3jVosJq4dY3XyFowz3/ukFVNhYGfl88q51saX9RsYE0OkU
	VZjeP9qALaRGwUr2YCVDeIg9J3WwTzCXJjYJuQ8zjJyEOtVExgNSrHXbmn6SeLE/be2t9WjTKF1
	r8VElf4EXAVwuOaR+4H2GH+p83nW+/t7m81ehrc/OSWJmYw+xsh6qARTKkuVvf6p3O/C0W0IjWD
	DHUf4ndpppb7k5bpF9A6Jkmo+Wgnj9NR3lf1KuEX6gUkSgc1xcRfoiZUIl5lFc/+RYKjPhuoRli
	weSKXXRcugnql7ZCEZm07gzh0heUi2khELU89w7wuOQ2Xa7fzuq0AZN1
X-Google-Smtp-Source: AGHT+IFothKq1c5gcI7clQBK7JiID9fpYLS2hgokmh6v32rCA6ZIVZGfs9O9ATM73c8F8fjW+P620Q==
X-Received: by 2002:a17:907:7e97:b0:ab6:de35:730a with SMTP id a640c23a62f3a-ab789a9ebc9mr693900666b.8.1739009234265;
        Sat, 08 Feb 2025 02:07:14 -0800 (PST)
Received: from [192.168.3.32] (cpe-188-129-46-137.dynamic.amis.hr. [188.129.46.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a8a3aa3esm36318066b.88.2025.02.08.02.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 02:07:13 -0800 (PST)
Message-ID: <81563943-f5cc-4489-bfaa-d58ad3816516@gmail.com>
Date: Sat, 8 Feb 2025 11:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
To: Christian Marangi <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Md Sadre Alam <quic_mdalam@quicinc.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250207195442.19157-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Robert Marko <robimarko@gmail.com>
In-Reply-To: <20250207195442.19157-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_020716_650021_3403099F 
X-CRM114-Status: GOOD (  17.58  )
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


On 07. 02. 2025. 20:54, Christian Marangi wrote:
> Fix broken config in qcom_param_page_type_exec caused by copy-paste error
> from commit 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
>
> In qcom_param_page_type_exec the value needs to be set to
> nandc->regs->cfg0 instead of host->cfg0. This wrong configuration caused
> the Qcom NANDC driver to malfunction on any device that makes use of it
> (IPQ806x, IPQ40xx, IPQ807x, IPQ60xx) with the following error:
>
> [    0.885369] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xaa
> [    0.885909] nand: Micron NAND 256MiB 1,8V 8-bit
> [    0.892499] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> [    0.896823] nand: ECC (step, strength) = (512, 8) does not fit in OOB
> [    0.896836] qcom-nandc 79b0000.nand-controller: No valid ECC settings possible
> [    0.910996] bam-dma-engine 7984000.dma-controller: Cannot free busy channel
> [    0.918070] qcom-nandc: probe of 79b0000.nand-controller failed with error -28
>
> Restore original configuration fix the problem and makes the driver work
> again.
>
> Cc: stable@vger.kernel.org
> Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Tested-by: Robert Marko <robimarko@gmail.com> #IPQ8074 and IPQ6018
> ---
>   drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index d2d2aeee42a7..4e3a3e049d9d 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1881,18 +1881,18 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>   	nandc->regs->addr0 = 0;
>   	nandc->regs->addr1 = 0;
>   
> -	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
> -		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
> -		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
> -		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
> -
> -	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> -		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
> -		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
> -		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
> -		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> -		     FIELD_PREP(WIDE_FLASH, 0) |
> -		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
> +	nandc->regs->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
> +			    FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
> +			    FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
> +			    FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
> +
> +	nandc->regs->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> +			    FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
> +			    FIELD_PREP(CS_ACTIVE_BSY, 0) |
> +			    FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
> +			    FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> +			    FIELD_PREP(WIDE_FLASH, 0) |
> +			    FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
>   
>   	if (!nandc->props->qpic_version2)
>   		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
