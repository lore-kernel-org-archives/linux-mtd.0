Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AC6C001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+S+vy6eerC28d5YnJiDvhlJ632S0RVFSdo6suNllF8=; b=OqcM7SYyE1pMOr
	8IPc6NW0WaxA3DXcNgo2kv2Og2+t+UFxgZeb5Jf9bAsszvx8XyBHUjQw1bNRZ2aeevCH95E2p4yc8
	jGdfrBy2r9sfhCu66PMNfirSLXcWkj3Cnfe0dB014hYBX0o481saL3cqGc9wPa6m5FxrUXwQgC5oj
	4bXMl5D32XCXSCBcSJn7oQr4cn2B6OYZSXZXtK2P7YJA0hMvA1QgLolArldB+rfVGQPT5iEKK+Apj
	hHEiUAK0Sj720/T5EeYjGMfhA0SZeuOg6dze+0OjH9T0+jzUu99feEbi3Rhko2ouZ/AtRpS69ZYiQ
	CE2RwrJ/A1ibr/zyMiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD7e-001Hxe-1g;
	Fri, 28 Jul 2023 02:22:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD7b-001Hvn-1G
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:22:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3144098df56so1681808f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690510943; x=1691115743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aASS9uz9E/a3KvOpLYUb7AIuyh57muyZ+16PNytMRGQ=;
        b=RMk2Yx+tVutqk2yV6x2G/yugzXm6MnqT9KSubD6Dkx+Kw9KGXmqlMPnZFrS3ZjwOv7
         XI1vjJQ9saFiIBTzXEw2jzED9md9/bBFzGhUmmBy8buGGb0kFCsXjfDgGClmsHxSU4KU
         YM8r3vsfiu97lHtpg2nzyltvYXY7Nj8qxznTLBiIBQigbyP8gR+4sZZz4AjToVXx9fVo
         bLD16l9TanVEu1DtdX7aSeROTWTOp2gsxaZP4t5LDSf1s10lQuUVfp+JgUNiFcHILTJj
         2sAK6ac13/dgi2OSoB/7BTSyOrOzMOgj8NZwlhRiykc+3UYZ1+eutEen3Lh9w7yiwO/y
         Fy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690510943; x=1691115743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aASS9uz9E/a3KvOpLYUb7AIuyh57muyZ+16PNytMRGQ=;
        b=Wl6KWbC3uP016OltTowVC4+f7LlDi5w3kqZK2e1mhb++1T3hCfyxYawzX7UX1d24HO
         w333YbjolEfFCi9UqKiJlclg6DYxO2RpvEQjUu8VD1bX6VsFhRk4rlLDHaO2/dYgV+Fu
         aDop12vefkTsA0DNbK8aPTDj4My05XlSsi1d9EexAPyB6h5v+yxy0xi/sGfbiphhflEE
         gKt0bS8IHZnNofMlxlxi2ymY1VNNr64JYDhJa6nWADvrlRgZE3/lU7mSXE04IbDu/lls
         KZDssncnic21xZAAyGmGxmeWtKuu1+r8JTWOYn0DPxdw4OJ+vS8ufzCUDKCpj/rYuLEw
         RYig==
X-Gm-Message-State: ABy/qLbCYPYbZX058qA+QRIDiqcy8unGvB5ILkkk8GRWclXgveRoiN+9
	HAlhsDcGkIV5jFBndaeOoAfyDQ==
X-Google-Smtp-Source: APBJJlEfvqiKiGMAyxruleOMPmLP8TKnwcG0PnvvGH3JWugb6EFdJd6t1SQKOmbVE9jAT0vKaBBJTw==
X-Received: by 2002:a5d:5948:0:b0:314:3b9c:f02f with SMTP id e8-20020a5d5948000000b003143b9cf02fmr583613wri.49.1690510943648;
        Thu, 27 Jul 2023 19:22:23 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d5552000000b003142439c7bcsm3459081wrw.80.2023.07.27.19.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:22:23 -0700 (PDT)
Message-ID: <67d30c61-81d5-6770-3a14-286f7a3fc0f9@linaro.org>
Date: Fri, 28 Jul 2023 03:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] mtd: rawnand: qcom: Fix a typo
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
 <20230716144612.32132-7-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_192227_429438_095355CA 
X-CRM114-Status: GOOD (  15.72  )
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
> 	CHECK: 'tranasction' may be misspelled - perhaps 'transaction'?
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 3adc40ef5cf6..cb6ccaa19224 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -3144,7 +3144,7 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  		/*
>  		 * Initially allocate BAM transaction to read ONFI param page.
>  		 * After detecting all the devices, this BAM transaction will
> -		 * be freed and the next BAM tranasction will be allocated with
> +		 * be freed and the next BAM transaction will be allocated with
>  		 * maximum codeword size
>  		 */
>  		nandc->max_cwperpage = 1;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
