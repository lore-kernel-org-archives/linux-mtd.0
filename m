Return-Path: <SRS0=2SY/=L4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F69C07E95
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 13:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA947613D1
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 13:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA947613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8S543pGGuqLK2ynSgbrM4X0CVc8Jn3hl8HcpO8ore8=; b=cYWIY4x9UfSvxL
	7H6ToWaFFlo8OW7ivke51sm7wv5WC0zATGNt4MAkRYRcuHZtngNJX6u+D1dzWi91h5s8vtq5fvIif
	PADgUVcVa7zpicvcbe+uXxMDoxOfaxUn2xYQjtK/Yt9mfa0/vghK6iGVekUcjmaR9PGMoprXaA8W6
	MwkUtfRNQBKnqd89SE+oFwBekc7WpxtD9XIMt2ZEmxho2Wgg1wrLjh9C+JZ84F97d0yG7YQXqIq/t
	4EdT9f4JRjvotHqNkWxpT4xaHmnb+i5kU/PyvBDVZYk8FHrV4Ti3gqIZ9uR2ZUqFSIW0Dr6ZkLNe9
	aCfYHNLmu2UY+KDMM9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m01v3-006Jzh-9c; Sun, 04 Jul 2021 13:12:21 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m01ul-006JyW-3j
 for linux-mtd@lists.infradead.org; Sun, 04 Jul 2021 13:12:04 +0000
Received: by mail-io1-xd2f.google.com with SMTP id u7so15550676ion.3
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jul 2021 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6yajXS3rL1yMBlHU8SEgTQ56L2hNY3a1We+yQ/hx3L4=;
 b=aIhhAUKkGJKIYWtysvdcZhc7mEPxL0SWuW61UeJMu3tfVKoFfjKnJgBywnsdeET6ti
 wqBS9fuq1wukXxA/1vAKNtUlBUBtAzJBA9IjJ0G+l+1bZ6LPRk5Izyx5WUATf+bGH7mM
 uPaNrFZTo7bxarJXufuc+eBKB8X6mFKCJYIhy01JBKtR582l3bx1eFaP+3LYnmtSNMNn
 PJlcdHHaZ4GeTP293nsofVy+G2edveT3lcZP0LXYJolv3l9d/Uf4V5jturYYoXC00396
 qV5OvcxGsWjXSwXo7QcoivXLiE+UEQER5ebMwvdmxZv20BwM9jfioakJCeubEzXKSSH/
 ljvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6yajXS3rL1yMBlHU8SEgTQ56L2hNY3a1We+yQ/hx3L4=;
 b=BYPX1iYiWLj8pc3Xcw1ZjwPAaJKbRs8oOsFTLpQlQ54BEYp493BUYyNTp4mwdWYe6e
 Gxr1mth4MjLdzQcMybc9bgGNdrBhvxq1H4QREysTs2idTdFQ9tNOOdoi4xrCafvZ3n1s
 LGdUC5PHsxA6PKXSKiO+HuDaS1VOAWTJuNCJaBeLnB6UUeUIm/5Wd/0iV77M0KPAIdmC
 C3Q6AoL//YJ3pC/9ACnSX4lWihW5waqjxZVY4McR9M6CLmRfmWe5ZYiR0v8zRs3YqxwO
 SCTFSpdIKdAv4mf7857sM7pASqbNJIU8yAIo6HRk8l4cqaLQNrtA5gy4//4yKK7vW2GI
 8LCw==
X-Gm-Message-State: AOAM533B4G6rbc5H8iJBZbIG3UDtdA+KfMNIo/R9o0cYga2vLCCBj2Nf
 jVaHwurBf1SMHDPMO7h3lz06qvKkx3vwpxpfAHg=
X-Google-Smtp-Source: ABdhPJyAaEcr8GxWeAcZ8q1Yu2rzqcAR2EOQw+lKR8M1r/wZpZ2EiDJ3qjkAYaZcSp9VVAqeEeNTlQngpMrvmQwQySs=
X-Received: by 2002:a5e:9802:: with SMTP id s2mr1946ioj.73.1625404322303; Sun,
 04 Jul 2021 06:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-5-tudor.ambarus@microchip.com>
In-Reply-To: <20210702144110.250481-5-tudor.ambarus@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 4 Jul 2021 15:11:51 +0200
Message-ID: <CAEyMn7aJpMgoHhm5JqcQTjA4p5AHXdaC-Yof2ZaNUbrMLU6MDg@mail.gmail.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, vigneshr@ti.com, p.yadav@ti.com,
 figgyc@figgyc.uk, 
 mail@david-bauer.net, linux@rasmusvillemoes.dk, esben@geanix.com, 
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw, 
 jaimeliao@mxic.com.tw, macromorgan@hotmail.com, sr@denx.de, 
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_061203_199377_B2E540F3 
X-CRM114-Status: GOOD (  19.98  )
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

Hi Tudor,

Am Fr., 2. Juli 2021 um 16:41 Uhr schrieb Tudor Ambarus
<tudor.ambarus@microchip.com>:
>
> MX25L12835F define SFDP, while MX25L12805D does not.

I tested this on the kontron pitx-imx8m board with a MX25L12835F equipped.

[    1.213448] spi-nor spi0.0: mx25l12835f (16384 Kbytes)

>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Testd-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  drivers/mtd/spi-nor/macronix.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 83a097708949..38701347bf04 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,26 @@
>
>  #include "core.h"
>
> +static const char *mx25l12835f = "mx25l12835f";
> +
> +static int mx25l12835f_post_bfpt_fixups(struct spi_nor *nor,
> +                               const struct sfdp_parameter_header *bfpt_header,
> +                               const struct sfdp_bfpt *bfpt)
> +{
> +       /*
> +        * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
> +        * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
> +        * variant does not.
> +        */
> +       nor->name = mx25l12835f;
> +
> +       return 0;
> +}
> +
> +static struct spi_nor_fixups mx25l12835f_fixups = {
> +       .post_bfpt = mx25l12835f_post_bfpt_fixups,
> +};
> +
>  static const char *mx25l3233f = "mx25l3233f";
>
>  static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
> @@ -71,8 +91,9 @@ static const struct flash_info macronix_parts[] = {
>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
> -                             SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
> +                             SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
> +               .fixups = &mx25l12835f_fixups },
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>                               SECT_4K | SPI_NOR_DUAL_READ |

Thank you


--
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
