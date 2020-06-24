Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F71C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 17:16:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C62120823
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 17:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iex3GxSj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR+CHrdN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C62120823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J7dqHvq8z2RZtWxy7ZNF2neG+imjlv2rmugWZitBE9Q=; b=iex3GxSjv/TZ6bHtiOO2J7a2d
	CrqqvZ8yL6VqGhnN+NlRqP8laJtRbR3n/3zNgSbQvt1Lk6Cd1Xbsr419kdLtHPxv1OEDvpzp3lS3O
	hQnIfL2Du1i/OJy+DAz++LCxpaYuAgXrLgUDdz0q/R3t3kt0w3kiu7muMN8ogmuANPINQGgAM1MT+
	UK+lf/ViISuedaE67nimJtqyJfUFiIpQ+mLMFYq85SBKwWnSbjUHaQlJSAEy7XEd7RX6othlhYCzx
	8ujx+a3steu/Zsn6SUI5xjZ6av7CAzs/1K37lLW7PX5DSNdHqaRMmnhjKM3SCD5M0EcLoPVl8ic+G
	S1bTrGFUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo8zW-0005C8-1M; Wed, 24 Jun 2020 17:15:18 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo8zT-0005AT-6I
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 17:15:16 +0000
Received: by mail-ot1-x343.google.com with SMTP id d4so2642432otk.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jun 2020 10:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJq1E9+4ZIKiH2IMq2/oJWvEWmQE7EtG4I/6aJCrDto=;
 b=SR+CHrdNFIVnKcR5PuzzeRzD/q1oh/SKiAAgMxN3LTOve05sHTsCzluGm2WXe/7okI
 6AAkZlim56rMH5brzjlld/n4iEyYw3+G08opJ6Tvnwhf+sLNA1WdTWzk6Zx/GKcztLZg
 oZx5EokOZT6grCL1UULM3If8PSsNtCkb6oB1yF3mpAv0wDZ7GVp+3rJ4oQF7zEgRx0Wh
 /pBD9SGJQYSSMS0cOYpoIbU4/aLQ5Vbo+GepRjU3aWwDYc8nc2V85CN5hMP0FKGClSUh
 9jFHHnr3dZE/7hMaQ66dC95x4dJbFxvZn+2bHbr6yK76sa4OKGMfZgh5yeoLfsiH8cFg
 5Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJq1E9+4ZIKiH2IMq2/oJWvEWmQE7EtG4I/6aJCrDto=;
 b=RXnL/mnK4nncdRQ3s2lheVe5btNpEl8P3A4+sU1qW/Tnsnh2Uqgj55PWFxeBTyQJB0
 otMXHLZ73XAulA4X+czQutEWacevRG2ZHYUuckfHpGtRJXoiFlkGMbow+QD/pVJwai3x
 hVPv3pSt2NdGRRA0QYCCjEhZUdaa/sdmZnk8SUpY/XS1gxF0ypi8NxMEB6R+xDGaHHpr
 /c/r/3BkFC3rQSSpMQ4y+Q5fwWpIsKwxhj8BpjQWfdZsSK52Z52zEvYi4t7A76JEkBWv
 yKvIzKa9dkdUo8JILw47Pg3cBTsQx+DZ2I9XSbjbPSJdg8dJU7mViKhv6vazWtTr4mxA
 N2Eg==
X-Gm-Message-State: AOAM532O62YHr8+q9I7qYU43FrJ3FTzKYjLnnhsIvAG2BePJz+/9w//m
 7zO047fPkIwjnkBbhzFdy73y/YV+NNzVfq05yjcLgA==
X-Google-Smtp-Source: ABdhPJw0uBvgV2g3AF7veHKvHYWDw9aQO7TojFYpl6P4GiFvNpCq04hG1+J1+Vn/xvwfRTt/0DfkyOeKdIR/q48sUJc=
X-Received: by 2002:a4a:db4b:: with SMTP id 11mr24595586oot.11.1593018913261; 
 Wed, 24 Jun 2020 10:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200613235331.24678-1-TheSven73@gmail.com>
In-Reply-To: <20200613235331.24678-1-TheSven73@gmail.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 24 Jun 2020 13:15:02 -0400
Message-ID: <CAGngYiX1Pz3bkvT=17VUapBwZ9=zrW8rXDP4wuVK=-uD67tfqA@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for Winbond w25q64jv spi
 flash
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Is there any way I can help to get this patch into mainline?

Thank you,
Sven

On Sat, Jun 13, 2020 at 7:53 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> This chip is (nearly) identical to the Winbond w25q64 which is
> already supported by Linux. Compared to the w25q64, the 'jv'
> does not support Quad SPI mode, and has a different JEDEC ID.
>
> To: Tudor Ambarus <tudor.ambarus@microchip.com>
> To: Miquel Raynal <miquel.raynal@bootlin.com>
> To: Richard Weinberger <richard@nod.at>
> To: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>
> Tree: next-20200613
>
>  drivers/mtd/spi-nor/winbond.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 5062af10f138..18bdff02f57f 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -65,6 +65,7 @@ static const struct flash_info winbond_parts[] = {
>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>         { "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
>         { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "w25q64jv", INFO(0xef7017, 0, 64 * 1024, 128, SECT_4K) },
>         { "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
