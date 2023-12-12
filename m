Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A84C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyoDdaOUtcsikM5DhI5IsAkiD41Ug2J6xfGxGdQ/6pg=; b=dkIyY0SxFnQ73Q
	ZOEO1cWJKgZySZJa9VYkIS9TXgjlrOoK3THGcw+r6m1brAHz51O0YrKxZf+cQDVBcc4op7dbpB19+
	JzjSGLigBgNXDK0hcVAn2i6vcLtKfiq2Cr2Bq8wFt/5+atnfodg7CaTJGU5nkz+ZNu07cREm4P/r7
	uTEg6W3I/ZJ8gUaYYi3DFr04GwfxGYmkW3osdWJSB5gtW5ja95F/bWMyXDRUAELuUVIt5P9jNPtK3
	PpAxG15KJ982Q6nsTtNdTpYlrlb7UiT/sOauORMKuZfQEFSzOeyMjYufKSH+3N2rv8l36Pm0Is4Cl
	uF+uVdMjO0nL1WnuOdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCti9-00AeWX-0t;
	Tue, 12 Dec 2023 03:45:33 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCti5-00AeUf-2I
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 03:45:31 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1f0616a15bso578423766b.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 19:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702352727; x=1702957527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AATFc1FkHLIK80ylP5aL+oNnT3aVOfM9kBeuwxFv2E=;
        b=tIX/kei5rXZR8JDR3nqQSPQUMGqJgWXie+3b17bbQXhI6jBsWLHlnUp9meURdjxAr8
         TACkJm5HE4WpZygzdEut8zhykoArEPfZa9llJuNE1UfB15RyfCKGB5bhj2w/av9ua4UQ
         JnJycTBLZjNooGjVGYS4d36mLCvjnWD8O1mSfeW1UYgRzlxQak+13Sff0U5CSVKtVsnu
         ID9JqNftOIbr4XdHQw5jgoEN7hJuHTGfhRe7ecTzEOb1PImulIhVqYR/9D59T+93rTsr
         il/HWSLh8gkjulUR03fMYgF8y1Itzh+7cRPCejujkjdmh1+XEEZ6uO97Erzw3Xmu4zFV
         bVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702352727; x=1702957527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+AATFc1FkHLIK80ylP5aL+oNnT3aVOfM9kBeuwxFv2E=;
        b=X7E8ZLr49oPhRSWYGpvjNvREcFMgazw2a8b2YLjrZ9BJUrUpmZsKAAw4RF+nitH1D8
         TAdBA2Mz9iPcbMEw8LpEj/mcThfhKK8dLz4rtae8+MTKDyY42JcZvHbYfowplPF3iHt8
         oxkOQSyzbcXzalIg9asf7VEafYTgxoveJZX3m/SDelyxJYFEmU0lMf9TuZKmmaLdBdN7
         yEwSxbERtif804jRMgCWC6mt+cM2+zwIon5UFdAlVwDs4SSeS3ro1xhJ31bI2LTPy+D2
         hp8s2HJFL21TnTky0786wN5JJGH7nWdJxroyrzAizipLkztTHitI4/2+wfi5TIK77alX
         pUoQ==
X-Gm-Message-State: AOJu0YxMplQT/BEitzFlYywozilTB9Emeln1dtQX78RfN2wLgmkmLetW
	klFofXt4oh8tDVMbaEwNRhey8w==
X-Google-Smtp-Source: AGHT+IEgR7QvtbDivNFu9R0Q196KxIIsuNxphTKtWEYToLyxLpB+/fs2ZNzriZ6KQJBoLd8yRYbg4A==
X-Received: by 2002:a17:907:cc12:b0:a19:a19b:78a9 with SMTP id uo18-20020a170907cc1200b00a19a19b78a9mr2132302ejc.108.1702352726791;
        Mon, 11 Dec 2023 19:45:26 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id re14-20020a170907a2ce00b00a1d01b11498sm5578946ejc.24.2023.12.11.19.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 19:45:26 -0800 (PST)
Message-ID: <b78a47ea-3fdb-462d-a2f5-03b513cbf78e@linaro.org>
Date: Tue, 12 Dec 2023 03:45:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: pl353: Fix kernel doc
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 kernel test robot <lkp@intel.com>
References: <20231211150524.108803-1-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231211150524.108803-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_194529_756794_E243C2BA 
X-CRM114-Status: GOOD (  15.76  )
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



On 12/11/23 15:05, Miquel Raynal wrote:
> Both the "chip" kernel doc member and description are wrong. This field
> is called "chips" and describes the list of NAND chips connected to the
> controller.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312102130.geZ4dqyN-lkp@intel.com/
> Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> index c506e92a3e45..1c76ee98efb7 100644
> --- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
> +++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> @@ -128,7 +128,7 @@ struct pl35x_nand {
>   * @conf_regs: SMC configuration registers for command phase
>   * @io_regs: NAND data registers for data phase
>   * @controller: Core NAND controller structure
> - * @chip: NAND chip information structure
> + * @chips: List of connected NAND chips
>   * @selected_chip: NAND chip currently selected by the controller
>   * @assigned_cs: List of assigned CS
>   * @ecc_buf: Temporary buffer to extract ECC bytes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
