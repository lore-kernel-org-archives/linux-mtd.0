Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD4EC43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 13:11:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5B8235FD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 13:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uNbLLbiX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/vw0UX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5B8235FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qklf4Jioptq6YmQjUCMxYs6CoLcWiH1L3+Z5GOmXhzE=; b=uNbLLbiXUAMVxa/omp23yNJvg
	IMhDAfM3DVdiGqIj909IBX3RkwZDvrXDNC9XbnS5YbZHtfuM65NvkTQDYNKsrYpgQG4URrtNQbPD/
	KJ3b7t9GKRbBBUX9dlrFa1Byd7lXvoPYnrk5KiNRlVgzka33U7wzmSX1UM4sICa6CzOZrMmmE7+St
	XVWTPFAaUIEZ7JkJ82opBnf86rP1FyG1fMdMup3lWe4XY6vsCAN98bjSEN0KAS+nMReOuBnriDHwu
	9gWgzejLTV+R83ZFYcwD2D+PcOQA0NrJM7Wf1I2d+8h69FCTVSEGioy6e04KGP3Xm5Pg/WXlWCiq7
	WQW5qBfOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJG96-0005VA-0p; Fri, 18 Sep 2020 13:09:48 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJG92-0005Tk-VB; Fri, 18 Sep 2020 13:09:46 +0000
Received: by mail-il1-x143.google.com with SMTP id u18so6092141iln.13;
 Fri, 18 Sep 2020 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AwYmmTDlWSbIST63rvxFGjm3o83wHP5Fmvwxfhe27kQ=;
 b=m/vw0UX8Eh7f2b7XnK7E4lSCV8SX39EKwxoKBcMzWuhvqZgtda8lj9tjTkOiyFbHpL
 hjqz/1qteZTTTzuiE8H8iAzWEN/9+LD/nvg1dWxcStxfCyng2YlCdzxmV6gpXTlhOupK
 traOX3UvkdRM3VnjXYDccdvhelU2E1dI7JsvVfcOY4O7uA+UCO971IB//rLsmeHxXE5a
 8Of+uFqA6vDmAzbWAmZFlzOnLcCAbrqwGJo7qCj8nytrRAi7cCBAFJre9p01uJ0susqZ
 0F2GoOiRpJ9vvMmT9+V+MbcIIIW1F5BhuTlJFalrYDP0FD5BIQKLaTzAzavokqc+2GwY
 sOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AwYmmTDlWSbIST63rvxFGjm3o83wHP5Fmvwxfhe27kQ=;
 b=Cc/ogJdWublQoMWSbS7OOOZu5Mhg8CJb/8muL/x+Bo7qE2K9+vqhF7dOwmZwkL2opS
 +dloWoHLVbdHAJUYRQonRTg5GnJ/Rg2h+GW5rRQ1Bs4xu9kIXcSEpDdBhIJcbQbajU+O
 wqB4Xy59xBZDv+ooC2drN+D89YoM9RJiq9e/ce4gcEbfRZ4M6FhGXmOfOzrmjXuH4v8L
 ueqQYibFnON8HHcC3lcwEZyfQPAoVxuo7btdtbe0C5Y1H4UTPPlvbse0R3PjPkalWH2Q
 8u30C6+GW7xzl0FKoSs53em/h86Uujc7uHnOWwbFen+IT21EjSLLi8w00WQAVSBdCZkd
 KAXQ==
X-Gm-Message-State: AOAM533dnqntQT0ynL+VS5UPimz+ImVa++ERJIHIakgVMavEVym19tMx
 SFD60AQxFxq3/VBo3m76j6l5/p0mwEYAAXku0Yg=
X-Google-Smtp-Source: ABdhPJzxEIe2mEpThaSZt59Gp6X4dtBHZvPS/ySQQqJ+IhxBYPEiVmEp8osLZw3/wabTdwpQ9/oyZTBuGPGFccSOn8Y=
X-Received: by 2002:a92:c10c:: with SMTP id p12mr4596560ile.274.1600434581511; 
 Fri, 18 Sep 2020 06:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.2.I3de2918f09b817cc2ae6d324f1ece62779ecc7cf@changeid>
In-Reply-To: <20200918162834.v2.2.I3de2918f09b817cc2ae6d324f1ece62779ecc7cf@changeid>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 18 Sep 2020 21:09:29 +0800
Message-ID: <CAJsYDV+Um3aEsgW-829BsZSaiVCp3O2LkrTmgCthhFv4fuEnLg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] spi: spi-mtk-nor: fix mishandled logics in
 checking SPI memory operation
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_090945_028409_F7A42061 
X-CRM114-Status: GOOD (  28.04  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Fri, Sep 18, 2020 at 4:34 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Fix a simple bug which can limits its transfer size,
> and add a simple helper function for code cleanups.
>
> Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> ---
>
> (no changes since v1)
>
>  drivers/spi/spi-mtk-nor.c | 62 ++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 6e6ca2b8e6c8..54b2c0fde95b 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -167,52 +167,63 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
>         return false;
>  }
>
> -static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> +static bool need_bounce(void *cpu_addr, unsigned long len)
>  {
> -       size_t len;
> +       return !!(((uintptr_t)cpu_addr) & MTK_NOR_DMA_ALIGN_MASK);
> +}

parameter 'len' isn't used in this function.

>
> +static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> +{
>         if (!op->data.nbytes)
>                 return 0;
>
>         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
> -               if ((op->data.dir == SPI_MEM_DATA_IN) &&
> -                   mtk_nor_match_read(op)) {

I think replacing a if/else if with a two-case switch is more
of a personal code preference rather than code cleanup.
I'd prefer only adding need_bounce to replace alignment
check using a separated commit and leave other stuff
untouched because:
1. This "cleanup" made unintended logic changes (see below)
2. The "cleanup" itself actually becomes the major part of
    this patch, while the actual fix mentioned in commit
    message is the minor part.
3. A fix commit should contain the fix itself. It shouldn't
    mix with these code changes.

> +               switch (op->data.dir) {
> +               case SPI_MEM_DATA_IN:
> +                       if (!mtk_nor_match_read(op))
> +                               return -EINVAL;

You are changing the code logic here.
mtk_nor_match_read checks if the operation can be executed
using controller PIO/DMA reading. Even if it's not supported,
we can still use PRG mode to execute the operation.
One example of such an operation is SPI NOR SFDP reading.
Your change breaks that which then breaks 1_2_2 and 1_4_4
reading capability because spi-nor driver parses these op formats
from SFDP table.

> +                       /* check if it's DMAable */
>                         if ((op->addr.val & MTK_NOR_DMA_ALIGN_MASK) ||
> -                           (op->data.nbytes < MTK_NOR_DMA_ALIGN))
> +                           (op->data.nbytes < MTK_NOR_DMA_ALIGN)) {
>                                 op->data.nbytes = 1;
> -                       else if (!((ulong)(op->data.buf.in) &
> -                                  MTK_NOR_DMA_ALIGN_MASK))
> +                       } else {
> +                               if (need_bounce(op->data.buf.in, op->data.nbytes) &&
> +                                   (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE))
> +                                       op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
>                                 op->data.nbytes &= ~MTK_NOR_DMA_ALIGN_MASK;
> -                       else if (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE)
> -                               op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;

data length alignment is intentionally done only for DMA reading
without the bounce buffer.
My intention here:
If we use the bounce buffer, we can read more data than needed to.
Say we want 25 bytes of data, reading 32 bytes using DMA and
bounce buffer should be faster than reading 16 bytes with DMA
and another 9 bytes with PIO, because for every single byte of PIO
reading, adjust_op_size and exec_op is called once, we
program controller with new cmd/address, and controller need
to send extra cmd/address to flash.
I noticed that you removed this part of logic from DMA reading
execution in 3/5 as well. Please revert the logic change here
add in DMA reading function (see later comment in 3/5).

> -                       return 0;
> -               } else if (op->data.dir == SPI_MEM_DATA_OUT) {
> +                       }
> +                       break;
> +               case SPI_MEM_DATA_OUT:
>                         if (op->data.nbytes >= MTK_NOR_PP_SIZE)
>                                 op->data.nbytes = MTK_NOR_PP_SIZE;
>                         else
>                                 op->data.nbytes = 1;
> -                       return 0;
> +                       break;
> +               default:
> +                       break;
>                 }
> +       } else {
> +               u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +
> +               if (len > MTK_NOR_PRG_MAX_SIZE)
> +                       return -EINVAL;
> +               if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
> +                       return -EINVAL;
> +               if (op->data.nbytes > (MTK_NOR_PRG_MAX_SIZE - len))
> +                       op->data.nbytes = MTK_NOR_PRG_MAX_SIZE - len;
>         }
>
> -       len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
> -             op->dummy.nbytes;
> -       if (op->data.nbytes > len)
> -               op->data.nbytes = len;
> -
>         return 0;
>  }
>
>  static bool mtk_nor_supports_op(struct spi_mem *mem,
>                                 const struct spi_mem_op *op)
>  {
> -       size_t len;
> -
>         if (op->cmd.buswidth != 1)
>                 return false;
>
>         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
> -               switch(op->data.dir) {
> +               switch (op->data.dir) {
>                 case SPI_MEM_DATA_IN:
>                         if (!mtk_nor_match_read(op))
>                                 return false;
> @@ -226,11 +237,14 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>                 default:
>                         break;
>                 }
> +       } else {
> +               u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +
> +               if (len > MTK_NOR_PRG_MAX_SIZE)
> +                       return false;
> +               if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
> +                       return false;
>         }
> -       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> -       if ((len > MTK_NOR_PRG_MAX_SIZE) ||
> -           ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
> -               return false;
>
>         return spi_mem_default_supports_op(mem, op);
>  }
> --
> 2.28.0.681.g6f77f65b4e-goog
>


-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
