Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EACCC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 10:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8CC20675
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 10:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auxo5Va3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFan4mjW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C8CC20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00Je5CWGbpkZXxMf5808szIzn2xnd9ouq+H8MGF/Gy4=; b=auxo5Va329VSze
	wV2UftPY29bmyat3PCUuYj528NsXqVHURAHKsOrOEk/GrMa3kIgTxF333OdRE/F0ltzmXMqC8fQ7A
	WxgdDDqnM2T6qOIxj2CWXYAloogBHmCV+BNTaHOS4RmEZvzK4RcwigzB6f7KLkzRctHwpzxDgxLm0
	o7z7i9wFTDUgXMkTwcoLyngtHHzCM+bIKOb6hkTWhDkh5h/xy1C1LZWHux8VMWedrSEkkb7gonueW
	WleL7auoZq0gNuWsihrXi6gVNq7emm3hW5Q6ZiWS0Nc8rtAL2Px1XRgy4YBhVZy06ZC32J/Ooh1+W
	rDNevP1Zv71x1hgt4gIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMUzV-0000qc-Du; Fri, 03 May 2019 10:00:29 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMUzR-0000qB-Ro
 for linux-mtd@lists.infradead.org; Fri, 03 May 2019 10:00:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id k16so7089223wrn.5
 for <linux-mtd@lists.infradead.org>; Fri, 03 May 2019 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PRAopPWeL4S3euytRS1nMzqnSButv4IeRogp1ulwv8s=;
 b=EFan4mjWaWCv92gpX1vXUlcT4OVZK7FEiDH7p/3bnOqtYHSqenlLxRJQ0wQ0VS2UPY
 NMwFVBJKpK5VE+BWn4wRJGQAFir4CwFKF/+O6Rz/ZDbrdRvHBaONs2NqNkm1aYBiDyNl
 YYQcqzaV/t1hHeRtX5ChguzIoEBRumgA5ga/3XMv/+zl2ifMe2Y+nvP/NmSbnJQRAGcB
 IG6BDtOKCulTUjP4/pPTHXXUot2OAivVAwIhMZHSuHgASaKEXhyO7RS1P5y2ZqVTQT05
 3JlHhydeWGlj2PGITsJeupQtE0sTWcAGQWT2h1Hx5lnjPn9wNnWWJmAxNJ9/tNyGshUd
 uwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PRAopPWeL4S3euytRS1nMzqnSButv4IeRogp1ulwv8s=;
 b=rbGQPYmebBUJCT+nKGU6F25tg23hoFdOp7IGrTT4Adln+G0Uq2nrW7YIbuerv6xj95
 bmjwYnB3w6XpREA2zcYYNcSFtd9p1S8LJPS67HAmxoLGxW6Tlvi4ClvHZnEk3kLzPCgY
 cIZyYujUTpBD5qFZ7Saedr0RP5n0pQXiX6XpPbotGGnq9j5zdZz72Ydk2yNrh5VXwPXR
 FNm14yxnSrqJJPrpxg0Ihl3PVBs8nNU5n4FcUNOru+usgO7nx7/1DD5FcyXkdQLI65LQ
 6QWsXJ83z9rUQc7v1n0zKdUzlHtRFNmtCEdOQgi+gm5OA1Z6ytdGoKcSSJ3cv9vctZvq
 NhjA==
X-Gm-Message-State: APjAAAVfXgN8vlQLfoDehM+8tZkgHXc+h+fnGatthoc2pbBC51rQan3P
 AuZiiGuq4iFryMfKH5PrqMg=
X-Google-Smtp-Source: APXvYqyjM73brLAKJq6+yXJVB6DnX6DD1BkXcftrX1JvKTH4WCPo9+xV+HWlboKWD30jUJfk7WS3Bg==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr155345wrv.253.1556877623545;
 Fri, 03 May 2019 03:00:23 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
 [86.49.110.70])
 by smtp.gmail.com with ESMTPSA id u11sm2033029wrg.35.2019.05.03.03.00.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 03:00:22 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: enable 4B opcodes for n25q256a
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 linux-mtd@lists.infradead.org
References: <20190503085327.5180-1-simon.k.r.goldschmidt@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <8161008c-fafd-a89f-d2d8-413224844cd2@gmail.com>
Date: Fri, 3 May 2019 12:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503085327.5180-1-simon.k.r.goldschmidt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_030025_933528_6153FCC5 
X-CRM114-Status: GOOD (  17.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/3/19 10:53 AM, Simon Goldschmidt wrote:
> Tested on socfpga cyclone5 where this is required to ensure that the
> boot rom can access this flash after warm reboot.

Are you sure _all_ variants of the N25Q256 support 4NB opcodes ?
I think there were some which didn't, but I might be wrong.

> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> ---
> 
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index fae147452..4cdec2cc2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1874,7 +1874,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> 


-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
