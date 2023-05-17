Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B6C77B75
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gha6H/gyBfs3OT1iVt1eRH3TCLmlwmWODLASFN5jU40=; b=z67iJdSky65zAB
	u4MyRGmz8GEDJ1ZL51Nop/wQd980THbqkBNNCdoG33L9oAQESe9Oy2CDLBzt4RQXQkIIZRCDchT7g
	CUCpIW/KvnrtVO8gXOgaMFL+wtLVgTC1I2QZ9btMRSKqaczhkdFmGSLO1QgwFV9bXFDI2nQbpSjTm
	4jR40mokL/FxLGSm/zZlATyvTAudBQkzxKxljJyL2Q6atvqC4q6qtyVQ+uZ64eXfQ3ME3j/xX3BD+
	uuGClSoWFGNczJYuTHZO5QwXWPzv1jx8aVA+QFQ/VDR3hAA7ZNZdrOl7K1RzhK7Be/MZe4OGELrgX
	tJM13r1juWPdtSjYuDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBQ1-008djy-1z;
	Wed, 17 May 2023 07:17:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBPy-008djP-1s
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 07:17:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so51300965e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 17 May 2023 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684307869; x=1686899869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3b7hHEbI+h5xExrBy/3T83CDD//SAXlI6SxFmf+dg6o=;
        b=k/U/uR+Kh2i8gM7Pk6RUGeZwy7PDiUYiTnAV/R3uiK0IqpFL70tKxc9hp7IdwFlPa7
         xUUIcNxQhDYAY9LsvdDpjgWgZEreMKVqY93hiz8/RlgBMI7BsE7GSEAfrdVM4Ig0bbQ9
         wR8PKfUscO1vVY2odj8vQH+U/hDGDbhVUg9tlVdFCoHVHRW09CsgiQ2/XIQfWJkGsRGK
         8JNjUNt9KtUO8fyuWb4LIXe298IL2XLTSEqP0ywZ2dnZuMG+yHqUq2Vcwq5YxkZgH3Pb
         QRSp4tt6bXwHCiJyXY3xuw/GoDx5ZqiJbVWaIbJecOaWmSRDltxEVHuM4b/uVGY8XIjK
         +Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684307869; x=1686899869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3b7hHEbI+h5xExrBy/3T83CDD//SAXlI6SxFmf+dg6o=;
        b=I5BddTLS2KoTS/fNBgLSMw0Mr3dZ7sNS2UpULmvUfxixgfJMPbDgTzrKpfJU6rEJXR
         18yIQcigENT13ytsTmTDBgO5ELTNUbTOveW+gqXHG2XWJCfK3DBb6XX2MEbrBXCH5MWn
         N6VP5Lb/QD5QEW7A/Wv0FRIaNFkwmoXKegGjbbiI+d4viALHWRLJzlRN3t0Z1J0NqoQW
         I1gHKAPxpdypYePGFkYxTUALjOVswg5loywv6BetP2IPTPbhIGTUCKO+I7+14HvlJdlB
         lWvcqRuaX7Ztr6wuLfgVhX1246+aSwQp+SmPTHJmGcZ+xOUHEw+zUOwnnflkODS/q706
         8J4A==
X-Gm-Message-State: AC+VfDyAuWAH8ssL5hU8bsbvIS+4a2YNwF+FefTtbcGkN4LBXViYSN0A
	pI5tG/AXcHNU+rbd7JsJPl8C6Q==
X-Google-Smtp-Source: ACHHUZ7L8yq0YUXp4EkM5Pe8eXsIVBrvz531exY2hfJ5I3XU3mTKbCCNdU+W3txyHrHKucWdLC23/Q==
X-Received: by 2002:adf:ce8d:0:b0:307:cf71:ed8c with SMTP id r13-20020adfce8d000000b00307cf71ed8cmr780409wrn.35.1684307868772;
        Wed, 17 May 2023 00:17:48 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id d15-20020adff2cf000000b0030647449730sm1762852wrp.74.2023.05.17.00.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 00:17:48 -0700 (PDT)
Message-ID: <41d0bb3f-559d-ac70-9525-dd98b820a85c@linaro.org>
Date: Wed, 17 May 2023 08:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: make sure local struct does
 not contain garbage
Content-Language: en-US
To: miquel.raynal@bootlin.com
Cc: pratyush@kernel.org, michael@walle.cc, richard@nod.at, vigneshr@ti.com,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org
References: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
 <20230509193900.948753-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230509193900.948753-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_001750_625495_76F69500 
X-CRM114-Status: GOOD (  18.09  )
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

Miquel, please consider this fix for -rc3.

cheers,
ta

On 5/9/23 20:39, Tudor Ambarus wrote:
> Following errors were seen with um-x86_64-gcc12/um-allyesconfig:
> + /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27
> 
> Initialise local struct spi_mem_op with all zeros at declaration in
> order to avoid using garbage data for fields that are not explicitly
> set afterwards.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
> Fixes: 6afcc84080c41 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v2:
> - init both local vars with all zeros at declaration
> - squash patches as the blamed commits were just introduced in this
>   merge window.
> 
>  drivers/mtd/spi-nor/spansion.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 15f9a80c10b9..36876aa849ed 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -361,7 +361,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
>   */
>  static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
>  {
> -	struct spi_mem_op op;
> +	struct spi_mem_op op = {};
>  	u8 addr_mode;
>  	int ret;
>  
> @@ -492,7 +492,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>  			  const struct sfdp_parameter_header *bfpt_header,
>  			  const struct sfdp_bfpt *bfpt)
>  {
> -	struct spi_mem_op op;
> +	struct spi_mem_op op = {};
>  	int ret;
>  
>  	ret = cypress_nor_set_addr_mode_nbytes(nor);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
