Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1F5C43464
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 06:11:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9FA206E5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 06:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dYt77zOz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QaZvdjqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9FA206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h5j1/0y2Bz+r+uSR4uYDuZGiF4aFT3Z9JgOdVNNNjSw=; b=dYt77zOzpipNGEzGkAUF7DYhk
	Zo/A+LcMAhbBM+FU0m7PlU8c2rXcYVnxUQfMIQfBJ8bTVILrUIP/axNEw6DGK3SlF3Wbbshq2uwWE
	mPxEy8rvgUAYmvXgCn6ACgGJF7qYcvruhibceI/+ijFxICtc+fSoBsGF9oELpAO1IZD0OabjjPpB5
	fk4kiP7xkfxoGl8Da2NYplHk0S9X+cK903ZJ6ZR2ObhSoKaLKnPBnJNHdCrq8r0fGbV/P1jLYUezm
	O+30Xn8X6Y/FIURXSKC2hgVSx/V2WgSRnk/aLs9e5uxoTEWvjvz1fYIZDRXipgm3LywPZImfpRJu/
	oga1odiAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKF24-0003wP-CF; Mon, 21 Sep 2020 06:10:36 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKF22-0003v1-1Y
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 06:10:35 +0000
Received: by mail-vk1-xa41.google.com with SMTP id a16so2908478vke.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 23:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hi2rPF/VTt+7YBV2OIek85mNirM/1FNuwC783UZ79gY=;
 b=QaZvdjqmE01vsDCJpv/L3PIhQD9pFvCOGUpf8KQBf3AdasjOy8neTN7t/wRbvEYv1E
 O1FVTx4IAh2rEkqCtye+7TzvIRzyjesUj2gTs4+Ewbb5W8ANnrCwLRpt5GYWxlXO4ElQ
 JwwGdQdUvIdzbc2Tp2ibQkb6BgEX3QMwJUSt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hi2rPF/VTt+7YBV2OIek85mNirM/1FNuwC783UZ79gY=;
 b=JCyaX3UILk1amXMpwomSTVSlEXe8ZEunR6IZlE4AF1p9PK4B/Z3/UdKf3l5smyHI7M
 So/4s++Rn8Ek1CnCw4btjIArwMoEFOp3ZNNW6JwT6u3U3RLDIU/IUtKptFOEgw8cUkn/
 kxl7KOq2xbwgX4hoaBa0g0DOVr3Pd/mgc74vcSi1qMFHeHGMiBg1jr0VWko7VhatVNnU
 1btU7EXtizUZ0K4oxQMfQ2FRbXWKDUqpQAmSjyyLC7BoxbHnGcVmDKYrXCZTDY14ZgeA
 DR25Qrp0uTaBiknQewV6ZxC358k9J86nH/FGN8nwRNG8zq6UlOl9P2wLPiBiFRMT/Nxh
 5HHg==
X-Gm-Message-State: AOAM531zxbo9fdz9cRzs2hG2uwhdTNa5ObE0qjufliNa4Bx+nNpJEi72
 HZIydnaWGaC2pP/QMIlKUlBVwK8G+7CzXuWhgD/bmQ==
X-Google-Smtp-Source: ABdhPJwS1vT6jl1+U7TJLvBVogQi38c1rNUQm4Kcmwy0nzE27iFQkCgHBkdfG6By1N4TLFUCpb7VEZDUgpxahYlWQZM=
X-Received: by 2002:a1f:1c17:: with SMTP id c23mr17961911vkc.0.1600668630316; 
 Sun, 20 Sep 2020 23:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.2.I3de2918f09b817cc2ae6d324f1ece62779ecc7cf@changeid>
 <CAJsYDV+Um3aEsgW-829BsZSaiVCp3O2LkrTmgCthhFv4fuEnLg@mail.gmail.com>
In-Reply-To: <CAJsYDV+Um3aEsgW-829BsZSaiVCp3O2LkrTmgCthhFv4fuEnLg@mail.gmail.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 21 Sep 2020 14:10:19 +0800
Message-ID: <CAATdQgB5UAFbxW6J2no7=Jyn2ddaHXceAxedGaaAxa++gGNDkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] spi: spi-mtk-nor: fix mishandled logics in
 checking SPI memory operation
To: Chuanhong Guo <gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_021034_160086_E3EDCF1B 
X-CRM114-Status: GOOD (  38.45  )
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

On Fri, Sep 18, 2020 at 9:09 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Hi!
>
> On Fri, Sep 18, 2020 at 4:34 PM Ikjoon Jang <ikjn@chromium.org> wrote:
> >
> > Fix a simple bug which can limits its transfer size,
> > and add a simple helper function for code cleanups.
> >
> > Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/spi/spi-mtk-nor.c | 62 ++++++++++++++++++++++++---------------
> >  1 file changed, 38 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> > index 6e6ca2b8e6c8..54b2c0fde95b 100644
> > --- a/drivers/spi/spi-mtk-nor.c
> > +++ b/drivers/spi/spi-mtk-nor.c
> > @@ -167,52 +167,63 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
> >         return false;
> >  }
> >
> > -static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> > +static bool need_bounce(void *cpu_addr, unsigned long len)
> >  {
> > -       size_t len;
> > +       return !!(((uintptr_t)cpu_addr) & MTK_NOR_DMA_ALIGN_MASK);
> > +}
>
> parameter 'len' isn't used in this function.

ACK.

>
> >
> > +static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> > +{
> >         if (!op->data.nbytes)
> >                 return 0;
> >
> >         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
> > -               if ((op->data.dir == SPI_MEM_DATA_IN) &&
> > -                   mtk_nor_match_read(op)) {
>
> I think replacing a if/else if with a two-case switch is more
> of a personal code preference rather than code cleanup.
> I'd prefer only adding need_bounce to replace alignment
> check using a separated commit and leave other stuff
> untouched because:
> 1. This "cleanup" made unintended logic changes (see below)
> 2. The "cleanup" itself actually becomes the major part of
>     this patch, while the actual fix mentioned in commit
>     message is the minor part.
> 3. A fix commit should contain the fix itself. It shouldn't
>     mix with these code changes.

Got it, v3 will only include the fix itself.

>
> > +               switch (op->data.dir) {
> > +               case SPI_MEM_DATA_IN:
> > +                       if (!mtk_nor_match_read(op))
> > +                               return -EINVAL;
>
> You are changing the code logic here.
> mtk_nor_match_read checks if the operation can be executed
> using controller PIO/DMA reading. Even if it's not supported,
> we can still use PRG mode to execute the operation.
> One example of such an operation is SPI NOR SFDP reading.
> Your change breaks that which then breaks 1_2_2 and 1_4_4
> reading capability because spi-nor driver parses these op formats
> from SFDP table.

As you already noticed it, this is a bug from the last patch I made
and v2 isn't fixing this problem. This should be restored & fixed in v3.
And will not include other changes in a same patch.

>
> > +                       /* check if it's DMAable */
> >                         if ((op->addr.val & MTK_NOR_DMA_ALIGN_MASK) ||
> > -                           (op->data.nbytes < MTK_NOR_DMA_ALIGN))
> > +                           (op->data.nbytes < MTK_NOR_DMA_ALIGN)) {
> >                                 op->data.nbytes = 1;
> > -                       else if (!((ulong)(op->data.buf.in) &
> > -                                  MTK_NOR_DMA_ALIGN_MASK))
> > +                       } else {
> > +                               if (need_bounce(op->data.buf.in, op->data.nbytes) &&
> > +                                   (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE))
> > +                                       op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
> >                                 op->data.nbytes &= ~MTK_NOR_DMA_ALIGN_MASK;
> > -                       else if (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE)
> > -                               op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
>
> data length alignment is intentionally done only for DMA reading
> without the bounce buffer.
> My intention here:
> If we use the bounce buffer, we can read more data than needed to.
> Say we want 25 bytes of data, reading 32 bytes using DMA and
> bounce buffer should be faster than reading 16 bytes with DMA
> and another 9 bytes with PIO, because for every single byte of PIO
> reading, adjust_op_size and exec_op is called once, we
> program controller with new cmd/address, and controller need
> to send extra cmd/address to flash.
> I noticed that you removed this part of logic from DMA reading
> execution in 3/5 as well. Please revert the logic change here
> add in DMA reading function (see later comment in 3/5).

In v2, I wasn't sure whether this behavior is sane (read more than requested)
Now I think this is okay, I've missed the fact that flash address is
also aligned together.
I'll just keep the previous logics with padding in v3.

Thanks!

>
> > -                       return 0;
> > -               } else if (op->data.dir == SPI_MEM_DATA_OUT) {
> > +                       }
> > +                       break;
> > +               case SPI_MEM_DATA_OUT:
> >                         if (op->data.nbytes >= MTK_NOR_PP_SIZE)
> >                                 op->data.nbytes = MTK_NOR_PP_SIZE;
> >                         else
> >                                 op->data.nbytes = 1;
> > -                       return 0;
> > +                       break;
> > +               default:
> > +                       break;
> >                 }
> > +       } else {
> > +               u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > +
> > +               if (len > MTK_NOR_PRG_MAX_SIZE)
> > +                       return -EINVAL;
> > +               if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
> > +                       return -EINVAL;
> > +               if (op->data.nbytes > (MTK_NOR_PRG_MAX_SIZE - len))
> > +                       op->data.nbytes = MTK_NOR_PRG_MAX_SIZE - len;
> >         }
> >
> > -       len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
> > -             op->dummy.nbytes;
> > -       if (op->data.nbytes > len)
> > -               op->data.nbytes = len;
> > -
> >         return 0;
> >  }
> >
> >  static bool mtk_nor_supports_op(struct spi_mem *mem,
> >                                 const struct spi_mem_op *op)
> >  {
> > -       size_t len;
> > -
> >         if (op->cmd.buswidth != 1)
> >                 return false;
> >
> >         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
> > -               switch(op->data.dir) {
> > +               switch (op->data.dir) {
> >                 case SPI_MEM_DATA_IN:
> >                         if (!mtk_nor_match_read(op))
> >                                 return false;
> > @@ -226,11 +237,14 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
> >                 default:
> >                         break;
> >                 }
> > +       } else {
> > +               u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > +
> > +               if (len > MTK_NOR_PRG_MAX_SIZE)
> > +                       return false;
> > +               if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
> > +                       return false;
> >         }
> > -       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > -       if ((len > MTK_NOR_PRG_MAX_SIZE) ||
> > -           ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
> > -               return false;
> >
> >         return spi_mem_default_supports_op(mem, op);
> >  }
> > --
> > 2.28.0.681.g6f77f65b4e-goog
> >
>
>
> --
> Regards,
> Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
