Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB7D2E9FF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYFALFWQvPeysatqgps6XCD+OcPGMDio5vzo0tqP4jY=; b=hRYkyi+62lUsbP
	zWSrP6Xg0HAideoTX6DHuNfLJq97gdiCQhyY+yFdINg7zQFB+7y3Sx/W/6TE5TBNN2oSiJof1sHG9
	/sw/1uS1/+0FrFu1Yq2qNWKRDshA+W3BtMJIhO8CMlbUwz/HLGFj+OtQeb2qcuj4RWTF3OZmNED0z
	JpMN9oCVpRcB1oRDLzAxj1ik0yxraB1i5gQ/ZfrlaiNz87/4UQlaWm9dmN10a2bKIatwvcFrJ0mb3
	jcAdKDpQUxK8wl+N1Hq34ckJyetPhf0/5XwdRAnd0d62Ff97QQjQEG7jBWJB2slnFn4/cLs5wddDA
	gEnBUNDGAv5bx8xuhh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVZE-00000000Lt0-35ie;
	Mon, 11 Nov 2024 14:39:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVZC-00000000LsG-1G5u
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:38:59 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso60020461fa.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731335936; x=1731940736; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q86RIhAO7LM/N1jsUJRHeBTO+9FQwZpmv/PNBndqJwU=;
        b=nlBF2l+eZ3D8qUwJGtgRo8vMz3tP+1miiKzxA+IfK2HPJmUXjcZe/Z37VeNz/tE+Mm
         hLaS9mLF7cgx3f2a8s3VbmdFhzw5pgr0r8+H5orX9AuTk2QL0sIQ0QrWE/ZLYpCAQF+q
         iusZ1xGt01/OOa3ukhQBLKfrCvOzn+iTcGxGkt4X1/qtxvK+3cFZwlmRAyy8+o2DD9Wb
         gHJPn3ZbuI9emcZHB1CXGELQmGklXy4xbRmxAVic8hQ6tdnvP6iEVS+94c8znALfEUDo
         L27reFxjtW4jgl+2tgQZVim74DKG6UexAbfD7dznkOo8bQUgGaVq22g45MHSNq6DUrky
         GKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335936; x=1731940736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q86RIhAO7LM/N1jsUJRHeBTO+9FQwZpmv/PNBndqJwU=;
        b=okxcX6g06R0PvDUkMdChdWlLtbIErFHadVprFdJxMYA9UG/OzY7igq25Udv7NgC/BV
         bb4W3Po7hIRxe3aoDrbHeaHF97SDVoR2/i03kPU6g/PzmmFqIXgwbNaqPOBUT5WrXSaQ
         fe259YmGzWcYKXoJ4T6JTOLN8u8lzqKmuhXfDikTucHSJ29J2HK1qvi2S5D0GWSBBXbY
         VVZw+Qw+K2noGULbNV97lhbLPzJr3dyK24vYuBKsAZ2gPOf/J8VPBugNUSD3TlCY6YPQ
         ENPI/T8jQpskbTPyY6tKzAz+4WjdAX0caPG6TQdR/uw1fQqkGl5IyuwTQ9LgPp+dthk0
         5n2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKGzMMJsUkc70V6k0eMvt9EA8EuMHmFxISwPXnQxlivuQ0dXWBIKXjiCRCrt2yssYTE+fID2wB8Ss=@lists.infradead.org
X-Gm-Message-State: AOJu0Yypw/qiA74vXCg7Rif0mCDY2kknHBKTZKqaspW8QEMSAtC8wC4f
	l/H3WDrnYiDABJtyILuhJjol0UKDWeiXT/2ZXESXgEu3CksCDRCnX2Pt5S6TXcw=
X-Google-Smtp-Source: AGHT+IFeOtl3DkD8EMuB8gc8RFfdxKgMEnHE3y6HRa4hffxk49A510G2oJUaW3J9NxQK5kJx3a5BMw==
X-Received: by 2002:a2e:a995:0:b0:2fb:5206:1675 with SMTP id 38308e7fff4ca-2ff2028a9a5mr82305981fa.27.1731335936065;
        Mon, 11 Nov 2024 06:38:56 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a184dasm598568166b.30.2024.11.11.06.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:38:55 -0800 (PST)
Message-ID: <71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org>
Date: Mon, 11 Nov 2024 14:38:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] mtd: spinand: winbond: Add comment about naming
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-24-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-24-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_063858_392189_FE4C1A8E 
X-CRM114-Status: GOOD (  15.61  )
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



On 10/25/24 5:15 PM, Miquel Raynal wrote:
> Make the link between the core macros and the datasheet.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/winbond.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 686e872fe0ff..9e2562805d23 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -18,6 +18,11 @@
>  
>  #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
>  
> +/*
> + * "X2" in the core is equivalent to "dual output" in the datasheets,
> + * "X4" in the core is equivalent to "quad output" in the datasheets.
> + */

doesn't help great for an outsider like me. Is quad referring to cmd,
addr or data? Or maybe of all? I need to read the code anyway.
> +
>  static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
