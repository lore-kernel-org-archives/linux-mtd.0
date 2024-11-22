Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69288E65D3E
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urZO4x9AX3WLqb1KHsn5ZllMNSE01vZ5Jfnw47YJ3vM=; b=C0y56/DJMDup9Y
	R4lP9j6v2phXnRevXMNr+5/+sn05gH1fOKXflfnd/dwfV5U6aex931op6NNB3vuvKlOIbFLD297EO
	SO7ICBHPKQVsXr794ISFeij7GueAi+VlJx5GJUaa7Hu2/Wo4synDc7X+I/C71/+xxCpn0Aq9nfPfU
	RKvwt4OE2yMaABLxv+/JT3CfCicH0zTAyOwIRZxGwjghIm6GgCo4ko3ImbZvhVzwG0pcW6myDRzvV
	a0SwyOnbmOtstL8ga3rttAu0LohnWAvdJdFcWShTcPix7AZWYZbnuu9vLwsOZXHkXmmLhYW8MDbwr
	Cjnn8KFVGG03CEQeJRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQ6q-000000027EJ-0ffB;
	Fri, 22 Nov 2024 09:37:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQ6n-000000027Du-48Fh
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 09:37:51 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53da5a27771so2189612e87.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2024 01:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732268268; x=1732873068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/fvS2pZvBCS2EcXKm3vL4SHGirRH/E+Y71cic6lH1E=;
        b=AcorGz5isPopNElbCFZnD+JHXGNb0WnGPcfvv1sI5Yps9oFCh4Xw0fDNhJJKCsVsyQ
         ICqCT+dwjE1qA550UMEXcSGbQAta015tpE1RQ3yaIAHJdDz6PNpX8pRcPD+KgOGgDWW5
         dyInT+NtvcOex53B1Y7v3TPHLjg7eOEh1v45mZwjm2/yno9nhdirkYYeGCB+MiWc0nqV
         HbMZpsfd5pP5+1MMpEsWG5owUIYGQlVjGWTKUiHuLiiinloR8HiL7tuKjvMnHmDKQ64q
         7yRpS+OFSZoFOTmE55yrc2gu7px2lQNrqHtEEYtqpI4sVP5cNGlrhBdcEhkbUXhFZBb/
         SHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268268; x=1732873068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/fvS2pZvBCS2EcXKm3vL4SHGirRH/E+Y71cic6lH1E=;
        b=TIBH4x2ip54ipWbedzQ4VMOlrG10oL55Pjzp9Uu78Ilns911H+AUeJ67jkRsxLU3AW
         NpTSPq/EBanUaxKjpveJUQKAc6n+LHLQcaDHf9PYuOmI6yKinB3teMLrXvD61KYZeMsL
         KUCLpGLFJI50GHCdZk5zXPz5juQi/lyxgCeectx9MymUqzhhBZoF6CTeo6uDFJ++o33Z
         IX3tySl3vdwPA90cR3HvS2YQ/P1TE0MmG5ZSPwwrakf336CRmftj9z/mmY/B4w3MXjKl
         /dSqyUxHMNgr15tJyTTRgVGiLEqveGK92Q9dF+78uLd8cvMcvDHtnO7IrJ3P/rf8rPZ5
         QJvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBWWzhW/4H5kbU4aw3Da/3aQQvKKjRS47KtKChJNnIrttEZKoXOkiIlkvzMMp2ptkqBlMiF87fneo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXWgIqv01ETgCm4rpQQdLe4JGsiKScWMNFof0e4wQSRiPph48
	W4M9ioeSmVS6Pn8m+y9KpMHOm8WgUjIU0Xs4pc9OOfMIGC5qS7RK1vmWVS+c7OA=
X-Gm-Gg: ASbGncvnULEIh0BqSO4tH5Z9bm5nZmsOfKdWnSW25F3jKLuPAGfyIyJxc2iphigW5nC
	j1nvhTYaXKCQean7cM5rnuQc3MVvl9xQrHf9rWq34lSydNXKh2kGz2YFuWZd5nsJOX5ESSmyauX
	FyK8wjz/h8ui76C3No91rAtIlNlv022ufaLRShs0OmSI20+1tnIlI/3UBrtygMgLh/ZrrSrU09a
	iQEIG21TzsIlTmDmPV+DSjawUM+076/9XKk//Nv4Obry6TV64Wo+ZYVFg==
X-Google-Smtp-Source: AGHT+IFYgbeEZP/OUJD4UhVHR3Ln6ffbctB1JTApHzD/7gqkT31l8U2sYFuzW/gIiwsHzQWcfZIZaQ==
X-Received: by 2002:a05:6512:138e:b0:53d:d57f:929e with SMTP id 2adb3069b0e04-53dd57f92b6mr672299e87.44.1732268267957;
        Fri, 22 Nov 2024 01:37:47 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825faf9a5asm1899445f8f.23.2024.11.22.01.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:37:47 -0800 (PST)
Message-ID: <a5c09a0a-7d63-4029-abb2-597ade1da74a@linaro.org>
Date: Fri, 22 Nov 2024 09:37:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spinand: Remove write_enable_op() in
 markbad()
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 pratyush@kernel.org, mwalle@kernel.org, kr.kim@skyhighmemory.com,
 zhi.feng@skyhighmemory.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
 <8be5cb694a763d3a74d9c3c7e76dd98b7b1333f6.1732152768.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8be5cb694a763d3a74d9c3c7e76dd98b7b1333f6.1732152768.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_013750_206406_13D51AA2 
X-CRM114-Status: GOOD (  13.82  )
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



On 11/21/24 2:08 AM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> We don't have to call spinand_write_enable_op() in spinand_markbad() as
> it is called in spinand_write_page().

Indeed. The patch is a follow up for:
Fixes: b645ad39d568 ("mtd: spinand: Do not erase the block before
writing a bad block marker")

That commit removed spinand_erase_op(), but failed to remove
spinand_write_enable_op() with it.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Miquel, shall the spinand_write_enable_op() call be moved into
spinand_erase_op()?

> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/nand/spi/core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 4d76f9f71a0e..47c369f2925d 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -942,10 +942,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>  	if (ret)
>  		return ret;
>  
> -	ret = spinand_write_enable_op(spinand);
> -	if (ret)
> -		return ret;
> -
>  	return spinand_write_page(spinand, &req);
>  }
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
