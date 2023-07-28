Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B756DC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIJvVi7FEbnduviZOLsKKWXV4Whv3O6cJ64FPyP3yLE=; b=jRxhe3W4G6u7XZ
	i8r1UcCaC59ueETGn2MZYuzCwNroZVojfLTzWR0dbfxP9QbXbZEeHPcajVn6vNVDTdS/MCuyNdYQH
	sw55OxML0Tf/F+e435j+l9a2aghdvpJzZT59kBBHhVWZx5RVdZSsYNVeXV7o3NbDg6f7+9otcPKJr
	LWie8xko3H8Bt+ilEVXvN59sY8zkiVhvVASvurGF6qujL3MDKtcx8VYqDaIUhXN6Wto27kaN213Ed
	M3P1rIB+SpMx1jSvqWZd7UmJ3EwceyRfEpEiv/4uWscQUL5aRTnb4CxNRsBXu1zjFoNmAdj/dZHNY
	P+Kc5GvYcbB5thsiw+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD6A-001Hdm-31;
	Fri, 28 Jul 2023 02:20:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD67-001Hbz-0i
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:20:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso17021125e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690510853; x=1691115653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHNmsX1L3exM5YHrmJYSgAuHeoCvpRthm20M/V5rFkE=;
        b=SG6mS1yNtO+QYeV+X7L7yQMg16efgT9KS5cNzyL9utIIZExEsFpCw6CnpziK7elvuM
         DgAgH7fcv6+WTL8Jv1R1Kqo2J+mwT6SdQZ7DuAKSrlwaBuuo+zIBpbz5N567bupDIC18
         pcP8KdHaxdmpsShfG0p3Df+CPeWlss43RuZF9sbqge6BJ3R4tSwgxwxxUru7aOWQBMs6
         Hjz9LZQKpS47Ms2aqxrQ4+6i4HtkFf2ImV0z2FQUW8frClriP/SZsBJcAgMFl7+BIc3a
         3u0GdcBsHF1zreUNMpjA2u//SA7y09UZGsDvRXU0qa/Vpr6ZYzTAAiL3FiHjMCCcg/LF
         10wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690510853; x=1691115653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHNmsX1L3exM5YHrmJYSgAuHeoCvpRthm20M/V5rFkE=;
        b=AfuOVHhEt9sfl9pd0tyi2+U+u2Gp2P2fpoLC21zqUdMbNZPQe2D7eRTjAszyRmueYp
         1VZbFDG0c/K1+QUp1SzYKoCi5fSg351mx5xrYE1Wo0IqEhGhGk4LBJ59OAUOvKC7tRBg
         yv4PxIeAECydFF++fcJgPXmjUFzerDrkQ/dOGHaxZsoYawxc3toUPSriWkUEM88BpRnj
         GeSbTcV3y+D0Y9csHGwbGJefx21GH4NrXebXFki26+X/oah8DLLdYHhSKahmTOrjkIGz
         0piAIYseuF4zteJJiU0Pyot/q54r+Dp79L1emCJ1BldTAoy4LEQVOVJgWFyBRs5v+G/s
         d0lw==
X-Gm-Message-State: ABy/qLbaD35/K44N0fNY7btSf9WgOMi4Pqc/g5Q/OBU4RmoHCU886u+K
	0+ZSAvIh7Myh7ZsZ6h2Jtscv0A==
X-Google-Smtp-Source: APBJJlFR8XP9KhQ7HlA0NMSR4HTiS68KXrQ8nTstT5QZgD7Argfe9iJajxOMI0nWDbGeqRi3Lvmuaw==
X-Received: by 2002:a1c:ed0e:0:b0:3fc:5a3:367c with SMTP id l14-20020a1ced0e000000b003fc05a3367cmr600733wmh.32.1690510852419;
        Thu, 27 Jul 2023 19:20:52 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c015100b003fbfef555d2sm5855974wmm.23.2023.07.27.19.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:20:51 -0700 (PDT)
Message-ID: <accdb348-e96c-e635-461e-65e4a6584e9a@linaro.org>
Date: Fri, 28 Jul 2023 03:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] mtd: rawnand: qcom: Fix wrong indentation
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
 <20230716144612.32132-6-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_192055_308716_D5ED7467 
X-CRM114-Status: GOOD (  16.25  )
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
> The main "for" loop in qcom_read_status_exec() does guard the following
> to if's which are badly indented. Fix the indentation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 554cca3801da..3adc40ef5cf6 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2722,12 +2722,12 @@ static int qcom_read_status_exec(struct nand_chip *chip,
>  	for (i = 0; i < num_cw; i++) {
>  		flash_status = le32_to_cpu(nandc->reg_read_buf[i]);
>  
> -	if (flash_status & FS_MPU_ERR)
> -		host->status &= ~NAND_STATUS_WP;
> +		if (flash_status & FS_MPU_ERR)
> +			host->status &= ~NAND_STATUS_WP;
>  
> -	if (flash_status & FS_OP_ERR ||
> -	 (i == (num_cw - 1) && (flash_status & FS_DEVICE_STS_ERR)))
> -		host->status |= NAND_STATUS_FAIL;
> +		if (flash_status & FS_OP_ERR ||
> +		    (i == (num_cw - 1) && (flash_status & FS_DEVICE_STS_ERR)))
> +			host->status |= NAND_STATUS_FAIL;
>  	}
>  
>  	flash_status = host->status;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
