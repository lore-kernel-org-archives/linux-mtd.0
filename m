Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39EDC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z26qhHfuKYEZCwv+x+ID7fFsDuD6OaCI7GSSltVlM9A=; b=cvidxFBDTC4ITx
	8nWtYQ326m1RmY5dEJb8Kn3AMDMJ0ZsSqHsBd/ee857uJmCxQlBEvtxiqRETFGwsrsEeKQrn7z+yk
	FIkPNsB9PNregkVvgfXR5rlyKdTK/DHQLZ0aHlutpc0ZVBUkFN9VEL5ZMARf3Bnog+oSiZvVPoT4I
	g8fr5VOYfQfEMbgUhmg4SstUa30YMVozW3GcB3QSnt4gqG+qCcnfFNYBgz9g2bmeNNBveVW201+dg
	mJEiStq/jnetbCcq1I/R8t5nAyH5nVRdLgcfTy+HAZ8BH1i2J1TWI4wO6SCheTIFHj2QB64grr1kX
	aOsVuCdMxKxl+UO0mpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FGs-007O7X-0O;
	Wed, 29 Nov 2023 07:46:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FGq-007O7C-0O
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 07:46:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-332c0c32d19so4435593f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 23:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701243964; x=1701848764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yN+tUdd9HKDL5IxRS3qriGU+Y1r/NfH7A0nKJ7ANPiw=;
        b=dkI3E5mvQ9EgPBTHUwg5elAV2vZWHno8FEhk9MBaCEoIeF++HtT1Ofe5OWXo3DTrEr
         P3WvBNW5TRPEfnMgjHtv9X3h23I3UDnVzaqbQ13bHB8/z77brdXCuRZV6lQ87NNpneGp
         qJmpixe94GuzXqG6nZevqe2IqhF2tLj5qRWYLlqgcLcvxpBWEY3AcgNAKv3N14+4bIyn
         mj2L1YXB2BZv42TWmpWXK6UBTa8dTYFNTvmdTZ7YTzJIucIlCVoN119Tfe3LHxGlqg1K
         JruZStPLalq3zdJqgucesAQqynsAR7W2YhhQXSVcalL/07UbTvvwIx/+gux/Rb2+Pspq
         WRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701243964; x=1701848764;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yN+tUdd9HKDL5IxRS3qriGU+Y1r/NfH7A0nKJ7ANPiw=;
        b=b+6ZLLFBsLWLkEuhr47svNzOB/EZFFlqwGdyGAwg3PF4991hkBQIeUyl2eEj2TZHuX
         Hy5qfRTDTxdt2Qv+HnkNbO4K7+pvPKRxA0/AS02Aa4RX+yqcgznMIl5s1D7vIAlENhLE
         b7PX94jXzTuAA8sXg/Ni1WmuurGUiSKiqsoC4fACegf3pKouJNYC1KlVZzvavhLVDOzc
         tURqOrbFbGHK/uN3q3Kbp+eP84IEUOa+MSVzdSK6sImV2uxrooQW/Zu+F6GR+yzLp18x
         aE7Yz/M6PP7i+2O34E0vPD5NCvvfMnBKe0yMOkI2MXApge3m+HxmzsGx5GU1cvrtfXBt
         C0aQ==
X-Gm-Message-State: AOJu0Yx3tyPrVSTPgjx61Fe74tQsSvYI35NPleDEBBsy1MR50cuaxoC9
	MyeAPd5/Q8QD2RHYhB9DcSnA3A==
X-Google-Smtp-Source: AGHT+IEZvxP6pS9h2j8jtvDdPYUEovMoR8W9UmelKPapkGQD84xi4FuUfLE7t+kF/Bgeqj7DCMUC1g==
X-Received: by 2002:a5d:464f:0:b0:32d:a54a:f57c with SMTP id j15-20020a5d464f000000b0032da54af57cmr12396758wrs.25.1701243964350;
        Tue, 28 Nov 2023 23:46:04 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id t20-20020adfa2d4000000b00332cbece829sm17137026wra.59.2023.11.28.23.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 23:46:03 -0800 (PST)
Message-ID: <9c97e28e-fbb8-4a7f-8205-821fcbd579f6@linaro.org>
Date: Wed, 29 Nov 2023 07:46:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] mtd: spi-nor: Stop reporting warning message when
 soft reset is not suported
Content-Language: en-US
To: AceLan Kao <acelan.kao@canonical.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mario Kicherer <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231129064311.272422-1-acelan.kao@canonical.com>
 <20231129064311.272422-2-acelan.kao@canonical.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231129064311.272422-2-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_234608_161775_868F8C24 
X-CRM114-Status: GOOD (  17.91  )
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



On 11/29/23 06:43, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 

Hi,

> When the software reset command isn't supported, we now stop reporting
> the warning message to avoid unnecessary warnings and potential confusion.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

You haven't specified who shall take these patches. Is it fine for you
if I take just the SPI NOR bits? If you want Mark to queue both:

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> v2. only lower the priority for the not supported failure
> v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
> v4. move the version information below the '---' line
> v5. remove dev_warn if soft reset operation is not supported
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 87cb2047df80..96a207751cf2 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3237,7 +3237,8 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
>  
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		if (ret != -EOPNOTSUPP)
> +			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>  		return;
>  	}
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
