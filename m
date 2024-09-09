Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0179ACE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wY9v53+I4xPcLygHT1RSRrSCDIeaTrWWuNcokLdtIIA=; b=i3D7lWAORkBTVx
	Ah+21pnIPsJD7jOC7HYqrWDVsWBQgyW7Lh0KUFSSqjO9f02/z2Yk+XnyuJ0MGtAV/YAhHm3opdPBX
	IHV8Cm8OLoCsNskfc4VlUEzdjtRcvautH65bYntiGUpUOQhHA+fLM6GKmK/btoFs7s9HjTackdIO0
	Mwlc+7iQSg4/2wiryCZrkn9QE/vWBvm6rgpmTEI3BXVgucPwoMYtHnPT7UnHNVcGOuFi1bn72wxlY
	jNuOQ4ndacMcXJeM6yxYaT4ZnAgf+N9rDvddy//0cX8s2HrWiw9GtjhuoAyv3w5qWl0ad+eeV45zK
	bPiVAP4LgNuGlm28jr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYvr-00000000rFe-3yks;
	Mon, 09 Sep 2024 07:35:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYvp-00000000rEG-04Xl
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:35:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8a7929fd64so474732666b.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725867326; x=1726472126; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSyWMbLAIiVLQsXdks3HCLYLCsP3mSrbhpF0vqvBOCg=;
        b=zQzm9rE23PAVM5P3ukATaq4Gro2NR9xFizKBLw9/zvlLfxoEFFobJhjpYmY46/2q2i
         cFX7J9q5ZQC8Ei5mSO6aJQGZoJgvsm43XQpF0X5NTNiqg7ynw7waaC7+f3Gdio8+G8fJ
         dvoi25kFIaeWeMTQQtGsHgsokLQrEA7rahjpdP0tXy+0NhSrJO2ioYgR1gqUk1hzdizf
         Dc+1iv7mMZCfXM+TYTfnbK55V86tk0XE6bA8jz8u1qbGUYWsHZpupu0tmQHEfaZ+uOWO
         0KC3mB3qgR51YidNDUcJzFngGaU+8ZvPC2eJec29fG13S1xrAQcE/BAcfZM/KUFMRB7i
         hlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725867326; x=1726472126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSyWMbLAIiVLQsXdks3HCLYLCsP3mSrbhpF0vqvBOCg=;
        b=nqDp423iHR4wnewMPSLexpOJ3HMZ+o6W/eeWBbV4fYHrTHEYD3pS86ihmnynvX4E/n
         MZb656givaHJdG5PjYoeCvs29lSVJc0mtjYVgv1VLzExwXM1UQo1RmaY/i/ML9onPvST
         Ghjcs7moDmEDpxFy5E4UlEbZOb/gYSAaSVWI7BVODK4Qh121HqDbt7DrxwIOQLA6TcG+
         ZPXrEfgEAlD1pfT+b9jCCa5Pg6lHJvvnj4VXK278zTKWqQhgyjYqIy1Q7wi5l4QUInLP
         Et6QfvGHuT0qHzrfimkgjgpdBLArCClNy/pou68pZobXeDv8EzWQbKJe0+RLmGgGTB0F
         Yang==
X-Forwarded-Encrypted: i=1; AJvYcCVzKmxzoBMHYqKanigM2gibLAobqkbXkBuWGejKPX3la+97ruD611tBu8N14+ypxfRb3CrBasd40Bo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yytd7mcsS8naPXAV6vpfOJknsllAWLIz8dI7428lmWiP1YsXIac
	0IvJRw1diKfuoVZqkoPCji0cDPVPSyLfhFzrapWzvKsy5SvsEMRBUpfGar1YBkbY0tq8GzdY4wy
	Q
X-Google-Smtp-Source: AGHT+IEiPJXGsX5J1tk213MU20LHOyQWs711l73TpOnftb+1B1+yCMOVrh07U1XusjImbewemB7MXg==
X-Received: by 2002:a17:907:98c:b0:a86:ac91:a571 with SMTP id a640c23a62f3a-a8a88867469mr791091866b.56.1725867325770;
        Mon, 09 Sep 2024 00:35:25 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25950cc6sm299397466b.54.2024.09.09.00.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 00:35:25 -0700 (PDT)
Message-ID: <ad9ee29c-b96a-4861-a7cd-b8649a3d1f3a@linaro.org>
Date: Mon, 9 Sep 2024 08:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: fix flash probing
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
References: <20240909072854.812206-1-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240909072854.812206-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_003529_094453_581E819F 
X-CRM114-Status: GOOD (  18.92  )
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



On 9/9/24 8:28 AM, Michael Walle wrote:
> Fix flash probing by name. Flash entries without a name are allowed
> since commit 15eb8303bb42 ("mtd: spi-nor: mark the flash name as
> obsolete"). But it was just until recently that a flash entry without a
> name was actually introduced. This triggers a bug in the legacy probe by
> name path. Skip entries without a name to fix it.
> 
> Fixes: 2095e7da8049 ("mtd: spi-nor: spansion: Add support for S28HS256T")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/r/66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com/
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d8e551fd2e2a..101ee5b0ddeb 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3281,7 +3281,8 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
>  
>  	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
>  		for (j = 0; j < manufacturers[i]->nparts; j++) {
> -			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
> +			if (manufacturers[i]->parts[j].name &&
> +			    !strcmp(name, manufacturers[i]->parts[j].name)) {
>  				nor->manufacturer = manufacturers[i];
>  				return &manufacturers[i]->parts[j];
>  			}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
