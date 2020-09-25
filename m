Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A33C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 09:26:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8AAD20738
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 09:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ym8EE1Sn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NCvFcGrJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8AAD20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6SD4spHw63ISANk6SDe3SfQva4qwr+/SlR5DNPxDtuc=; b=Ym8EE1SnfsgK81JI04nmUcOXh
	Eq/lb2xi9HnzbSCncAaVfU+tpmeyjnWlTNzmgIKBhWwmVdQ2jzzm2zVvbdOV+3UR8NRykKxL+TfCw
	LvP+HW/twv4XgbdfaL45V7QS4+zNv6r24VdbvBqXSEQ6eUZkz45LHmh4T3zVZQt9pO8hIAQvrMsPX
	IN6pqQJYQ/iECdd+XwCEmUPVKh34lZPgja6/Hrq6ZwtYVdRJOWakKfZyFdhlRTl/OtlUEIJ6GC8Rs
	acTPujQnmjsfhzju0pycm/lriPfsJa46D4L+8TsMqCZzyxXANXblc8B5HO0n5OtxrP4bvKY83QdEg
	cwgjFypiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjyS-0003Fh-T8; Fri, 25 Sep 2020 09:25:04 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjyP-0003EA-F6
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 09:25:02 +0000
Received: by mail-ua1-x944.google.com with SMTP id d18so715374uav.4
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwgHnfwJO4p3e2k/8UmICPhqPe1pJTwIO3qj/AAMTOs=;
 b=NCvFcGrJ4lAMHxPsuRNAM6CQqIi8DN2DhKWzJy934kPHwe8Q25N/LRBK3oE3ruxgdO
 jMCZ3ABixw8fJ8qWStplc3e7oLYbrPCm7yWKBM1VkbU5poVN6p97MMqg/MyPSLbb72Sj
 cZ6nhCwkAnlntTsedZEux/9pumM7CSlH2r0Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwgHnfwJO4p3e2k/8UmICPhqPe1pJTwIO3qj/AAMTOs=;
 b=UTZzVbGknw8MIlAxoHEoEkxeQH8qbzXZFA/wcyeqQ6t7z4pkwa9rdEJx7W6rxN1OaD
 8pK/71QRhbVQDBrhF8kCrjRTwq/aV8faFU6v0hVRB0Op57QMeOKJE3Y/19w5cDXvHtcs
 Auupl9UbX+uqH5NaAvtwjb2JGDzQSkWwrJeHWx/vnKvqyUZEh/g9SPuMCfyPopuThd9j
 Fze3TomOW2uEb1+ffUTxcT0jonk6APuN6BSM5Rkn6nIPI3R/D7Ufn0BOKhyGAoeAWvDE
 Rt4e2sI6YoX/2szoHBkB7eCiCFdS6Z81n64SnCAYCzq7d5zyZHGy/xOWIFftysv1SIaU
 t+gw==
X-Gm-Message-State: AOAM531uWVJhuR/+WAGaT1u7YugkLkKcnY+XVhOMSj4KkC179TO09/jo
 jAHSl/+QXRSoUT02EN47beFt56BIE8HrfiDL5BSNxQ==
X-Google-Smtp-Source: ABdhPJwEhNuZMKTBbzc2tvQBDUTaHYy/tzrpFK9uL/uoFKikWZI7pmKGmiwxngGtWyRur+oP/X/aWlhGFiVPkyjZpws=
X-Received: by 2002:ab0:2404:: with SMTP id f4mr1874548uan.108.1601025899341; 
 Fri, 25 Sep 2020 02:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.3.I7a3fc5678a81654574e8852d920db94bcc4d3eb8@changeid>
 <CAJsYDV+CEQ2PEOcdP1vadOBOHgW39XNNjPET04uWQktnPHZcFA@mail.gmail.com>
In-Reply-To: <CAJsYDV+CEQ2PEOcdP1vadOBOHgW39XNNjPET04uWQktnPHZcFA@mail.gmail.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 25 Sep 2020 17:24:48 +0800
Message-ID: <CAATdQgAZyi+T5YLsDooTjCJTGD6jvzXuKqUwpdNY=-Eqi1=_YQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] spi: spi-mtk-nor: support 7 bytes transfer of
 generic spi
To: Chuanhong Guo <gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_052501_524101_0D49CA83 
X-CRM114-Status: GOOD (  38.10  )
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

On Fri, Sep 25, 2020 at 3:47 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Hi!
>
> On Fri, Sep 25, 2020 at 2:55 PM Ikjoon Jang <ikjn@chromium.org> wrote:
> >
> > When mtk-nor fallbacks to generic spi transfers, it can actually
> > transfer up to 7 bytes.
>
> generic transfer_one_message should support full-duplex transfers,
> not transfers with special format requirements. (e.g. here the last
> byte is rx only.) These transfers with format requirements should
> be implemented with spi-mem interface instead.

yep, that's correct.

>
> >
> > This patch fixes adjust_op_size() and supports_op() to explicitly
> > check 7 bytes range and also fixes possible under/overflow conditions
> > in register offsets calculation.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> I was notified by Bayi about your discussion and sent some
> patches yesterday for the same purpose. Whoops...
> As transfer_one_message isn't the proper place to implement
> this, maybe we could work on my version instead?
>

I didn't noticed that before,
Sure, please go ahead, I'll follow up with your patch in v4.

> > ---
> >
> > (no changes since v1)
>
> This should be "new patch" not "no changes" :P

oops, it seems my script did something wrong.

>
>
> >
> >  drivers/spi/spi-mtk-nor.c | 102 ++++++++++++++++++++++++++++----------
> >  1 file changed, 76 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> > index 0f7d4ec68730..e7719d249095 100644
> > --- a/drivers/spi/spi-mtk-nor.c
> > +++ b/drivers/spi/spi-mtk-nor.c
> > @@ -79,7 +79,11 @@
> >  #define MTK_NOR_REG_DMA_DADR           0x720
> >  #define MTK_NOR_REG_DMA_END_DADR       0x724
> >
> > +/* maximum bytes of TX in PRG mode */
> >  #define MTK_NOR_PRG_MAX_SIZE           6
> > +/* maximum bytes of TX + RX is 7, last 1 byte is always being sent as zero */
> > +#define MTK_NOR_PRG_MAX_CYCLES         7
> > +
> >  // Reading DMA src/dst addresses have to be 16-byte aligned
> >  #define MTK_NOR_DMA_ALIGN              16
> >  #define MTK_NOR_DMA_ALIGN_MASK         (MTK_NOR_DMA_ALIGN - 1)
> > @@ -167,6 +171,24 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
> >         return false;
> >  }
> >
> > +static bool mtk_nor_check_prg(const struct spi_mem_op *op)
> > +{
> > +       size_t len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > +
> > +       if (len > MTK_NOR_PRG_MAX_SIZE)
> > +               return false;
> > +
> > +       if (!op->data.nbytes)
> > +               return true;
> > +
> > +       if (op->data.dir == SPI_MEM_DATA_OUT)
> > +               return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_SIZE);
> > +       else if (op->data.dir == SPI_MEM_DATA_IN)
> > +               return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_CYCLES);
> > +       else
> > +               return true;
> > +}
> > +
> >  static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> >  {
> >         size_t len;
> > @@ -195,10 +217,22 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> >                 }
> >         }
> >
> > -       len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
> > -             op->dummy.nbytes;
> > -       if (op->data.nbytes > len)
> > -               op->data.nbytes = len;
> > +       if (mtk_nor_check_prg(op))
> > +               return 0;
> > +
> > +       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > +
> > +       if (op->data.dir == SPI_MEM_DATA_OUT) {
> > +               if (len == MTK_NOR_PRG_MAX_SIZE)
> > +                       return -EINVAL;
> > +               op->data.nbytes = min_t(unsigned int, op->data.nbytes,
> > +                                       MTK_NOR_PRG_MAX_SIZE - len);
> > +       } else  {
> > +               if (len == MTK_NOR_PRG_MAX_CYCLES)
> > +                       return -EINVAL;
> > +               op->data.nbytes = min_t(unsigned int, op->data.nbytes,
> > +                                       MTK_NOR_PRG_MAX_CYCLES - len);
> > +       }
> >
> >         return 0;
> >  }
> > @@ -206,8 +240,6 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> >  static bool mtk_nor_supports_op(struct spi_mem *mem,
> >                                 const struct spi_mem_op *op)
> >  {
> > -       size_t len;
> > -
> >         if (op->cmd.buswidth != 1)
> >                 return false;
> >
> > @@ -223,12 +255,11 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
> >                                (op->data.buswidth == 1);
> >         }
> >
> > -       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > -       if ((len > MTK_NOR_PRG_MAX_SIZE) ||
> > -           ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
> > +       /* fallback to generic spi xfer */
> > +       if (op->cmd.buswidth > 1 || op->addr.buswidth > 1 || op->data.buswidth > 1)
> >                 return false;
>
> Rejecting an op in supports_op doesn't tell it to fall back to generic
> spi transfer.
> It instead tells caller to abort this transfer completely.
> A fallback only happens when exec_op returns -ENOTSUPP.

yep but I think that case always going PRG mode in exec_op() with the
same condition?

> This comment is incorrect. I'd put this buswidth checking in mtk_nor_check_prg
> instead because mtk_nor_check_prg is checking whether an op is supported
> by prg mode, thus it should reject ops with buswidth > 1.
>
> >
> > -       return true;
> > +       return mtk_nor_check_prg(op);
> >  }
> >
> >  static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
> > @@ -459,22 +490,36 @@ static int mtk_nor_transfer_one_message(struct spi_controller *master,
> >         int stat = 0;
> >         int reg_offset = MTK_NOR_REG_PRGDATA_MAX;
> >         void __iomem *reg;
> > -       const u8 *txbuf;
> > -       u8 *rxbuf;
> > -       int i;
> > +       int i, tx_len = 0, rx_len = 0;
> >
> >         list_for_each_entry(t, &m->transfers, transfer_list) {
> > -               txbuf = t->tx_buf;
> > -               for (i = 0; i < t->len; i++, reg_offset--) {
> > +               const u8 *txbuf = t->tx_buf;
> > +
> > +               if (!txbuf) {
> > +                       rx_len += t->len;
> > +                       continue;
> > +               }
> > +
> > +               if (rx_len) {
> > +                       stat = -EPROTO;
> > +                       goto msg_done;
> > +               }
>
> NACK. you are unnecessarily rejecting possible transfers.

yep, ditto

>
> > +
> > +               for (i = 0; i < t->len && reg_offset >= 0; i++, reg_offset--) {
> >                         reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
> > -                       if (txbuf)
> > -                               writeb(txbuf[i], reg);
> > -                       else
> > -                               writeb(0, reg);
> > +                       writeb(txbuf[i], reg);
> > +                       tx_len++;
>
> According to SPI standard, during a rx transfer, tx should be kept low.
> These PROGDATA registers doesn't clear itself so it'll keep sending
> data from last transfer, which violates this rule. That's
> why the original code writes 0 to PRGDATA for rx bytes.

following lines with while() will set 0s to the rest of registers.

>
> >                 }
> > -               trx_len += t->len;
> >         }
> >
> > +       while (reg_offset >= 0) {
> > +               writeb(0, sp->base + MTK_NOR_REG_PRGDATA(reg_offset));
> > +               reg_offset--;
> > +       }
> > +
> > +       rx_len = min_t(unsigned long, MTK_NOR_PRG_MAX_CYCLES - tx_len, rx_len);
> > +       trx_len = tx_len + rx_len;
> > +
> >         writel(trx_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
> >
> >         stat = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
> > @@ -482,13 +527,18 @@ static int mtk_nor_transfer_one_message(struct spi_controller *master,
> >         if (stat < 0)
> >                 goto msg_done;
> >
> > -       reg_offset = trx_len - 1;
> > -       list_for_each_entry(t, &m->transfers, transfer_list) {
> > -               rxbuf = t->rx_buf;
> > -               for (i = 0; i < t->len; i++, reg_offset--) {
> > -                       reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
> > -                       if (rxbuf)
> > +       if (rx_len > 0) {
> > +               reg_offset = rx_len - 1;
> > +               list_for_each_entry(t, &m->transfers, transfer_list) {
> > +                       u8 *rxbuf = t->rx_buf;
> > +
> > +                       if (!rxbuf)
> > +                               continue;
> > +
> > +                       for (i = 0; i < t->len && reg_offset >= 0; i++, reg_offset--) {
> > +                               reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
> >                                 rxbuf[i] = readb(reg);
> > +                       }
>
> I think this is replacing original code with some equivalent ones, which
> seems unnecessary.

This patch addressed the issue with 1+6 bytes transfer (e.g JEDEC ID)
can have negative reg_offset.
And there's skipping the loop if (rx_len < 0)
anyway I'd like to follow with your new patch. :-)

Thanks!

>
> >                 }
> >         }
> >
> --
> Regards,
> Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
