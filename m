Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904DCC4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 07:48:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E43F6206C3
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 07:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qx5+Oj6V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMYmBOUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E43F6206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5aoRjSAd1kSyh/X0XU4XW5Oxm7xI7cGWe9N1C5rkLFU=; b=Qx5+Oj6VSRdkfCYy+FEi9YF3F
	8ayuCEGY5uzmwonEIZes7JI96sIn7tA4xBttYQkjDmHiM2NFXYnG7vPPG+KdlrpUea+5pp+4CYWOb
	1yCTX7YIJpgRUgqXysTdSQno4FgZisMHU1q3KiZQGT2qyix0o6ld3m5xVyBaN/I9/pGNdi9/AdQpS
	OOknjbRYUm2TDRxQB0Zds/Iox14jwK/wxbnUxN70CgIw7QbqxHLXkPi1YDUKCuCbf23y1OyGIozzy
	tnPeOpbEtmQ/DOvAvroe8YK6NwLFPqjAZ3QQTY+v2y1Qi2k5NXlSOt1fhQVBuf8IgJb9eUSbcQ8LY
	biuZzae6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiSM-0005hW-JF; Fri, 25 Sep 2020 07:47:50 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiSJ-0005eo-17; Fri, 25 Sep 2020 07:47:48 +0000
Received: by mail-il1-x141.google.com with SMTP id h2so1447072ilo.12;
 Fri, 25 Sep 2020 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pw6656Z22S9nYHWwkiLg4SRLNcb2nFCcbc2U+u2zenM=;
 b=MMYmBOUOFsGO+PUbWtxwr/dFGe4EfE2obPvTc2+It29nDUnNZzPiDvVJk/xeXxxKPu
 Rz+7lo9dQL6yldsZ9EurIcWDVOipxtEoURayZxD8XL2/zCzuoYcEjLOhzHlFwDJyUDJU
 V6veUAY3pk+9lQaJ0xBQ/lcXynD+IRlJlcuZmzymiROnGQcZKN5db0uRH2io8iGMFopG
 nWXp1uvIQif/PzIz+qRP/La9NtUhv6L+yvo7H5q9dN+C1w/8+fEwFyO70y6tWoGvpIrz
 wTfryd9QeTJmRgMGW7dffwHysPbSo+5E9xGhTgSFRr23XPxXG6kQJz9CG4DWzj5wYT9t
 UVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pw6656Z22S9nYHWwkiLg4SRLNcb2nFCcbc2U+u2zenM=;
 b=snpaCQzdlitUwtl0i2WrGHUi17GrmA44z6l6vqfLoBPJtGf0obFVMmiXGZm3jxxozT
 snFM4eSlKAPlXf6b9EnLSYSiSdwwAihH65NhuyXTv64RQNt/jDQNX9wyQ7gz37DQCXCf
 G2ITiaPX460U0nnowFAbqs5HFMdf8jKZg9IRH+a3HZsFwRU57wuQR030Mv2ZGUTGZUm+
 O2xBQnSgs26YV7WcX0v84f60E654jtmn5g74QPSFIw+XcL5X3sOUJZCcBx1PEgwko5LR
 g0UBbp2IQatEe/Fi3GI7y3jOyN0mqLZWOZP9TwzUVj1Jyi62ZENk1M999OcAjG+vUu1U
 s7Ag==
X-Gm-Message-State: AOAM5323apyR3Np0beIkEnvZAtTrcC+oUneGvxhgDwxp8edyJbZpf897
 SI+Oxof4pImdT6P8epRiBl9zSH7Ri4gZ5KBoVoc=
X-Google-Smtp-Source: ABdhPJwVot1rzBOoqbUEKv4CYI45KAcUd02DV308BynBqILl6dHmpS6B7qX5IljDjk9UHtVMMCt/cNWJfDwZBDLFrH4=
X-Received: by 2002:a92:d07:: with SMTP id 7mr2152934iln.243.1601020063295;
 Fri, 25 Sep 2020 00:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.3.I7a3fc5678a81654574e8852d920db94bcc4d3eb8@changeid>
In-Reply-To: <20200925145255.v3.3.I7a3fc5678a81654574e8852d920db94bcc4d3eb8@changeid>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 25 Sep 2020 15:47:32 +0800
Message-ID: <CAJsYDV+CEQ2PEOcdP1vadOBOHgW39XNNjPET04uWQktnPHZcFA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] spi: spi-mtk-nor: support 7 bytes transfer of
 generic spi
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_034747_082004_8F053C81 
X-CRM114-Status: GOOD (  29.74  )
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

On Fri, Sep 25, 2020 at 2:55 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> When mtk-nor fallbacks to generic spi transfers, it can actually
> transfer up to 7 bytes.

generic transfer_one_message should support full-duplex transfers,
not transfers with special format requirements. (e.g. here the last
byte is rx only.) These transfers with format requirements should
be implemented with spi-mem interface instead.

>
> This patch fixes adjust_op_size() and supports_op() to explicitly
> check 7 bytes range and also fixes possible under/overflow conditions
> in register offsets calculation.
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

I was notified by Bayi about your discussion and sent some
patches yesterday for the same purpose. Whoops...
As transfer_one_message isn't the proper place to implement
this, maybe we could work on my version instead?

> ---
>
> (no changes since v1)

This should be "new patch" not "no changes" :P


>
>  drivers/spi/spi-mtk-nor.c | 102 ++++++++++++++++++++++++++++----------
>  1 file changed, 76 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 0f7d4ec68730..e7719d249095 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -79,7 +79,11 @@
>  #define MTK_NOR_REG_DMA_DADR           0x720
>  #define MTK_NOR_REG_DMA_END_DADR       0x724
>
> +/* maximum bytes of TX in PRG mode */
>  #define MTK_NOR_PRG_MAX_SIZE           6
> +/* maximum bytes of TX + RX is 7, last 1 byte is always being sent as zero */
> +#define MTK_NOR_PRG_MAX_CYCLES         7
> +
>  // Reading DMA src/dst addresses have to be 16-byte aligned
>  #define MTK_NOR_DMA_ALIGN              16
>  #define MTK_NOR_DMA_ALIGN_MASK         (MTK_NOR_DMA_ALIGN - 1)
> @@ -167,6 +171,24 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
>         return false;
>  }
>
> +static bool mtk_nor_check_prg(const struct spi_mem_op *op)
> +{
> +       size_t len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +
> +       if (len > MTK_NOR_PRG_MAX_SIZE)
> +               return false;
> +
> +       if (!op->data.nbytes)
> +               return true;
> +
> +       if (op->data.dir == SPI_MEM_DATA_OUT)
> +               return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_SIZE);
> +       else if (op->data.dir == SPI_MEM_DATA_IN)
> +               return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_CYCLES);
> +       else
> +               return true;
> +}
> +
>  static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  {
>         size_t len;
> @@ -195,10 +217,22 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>                 }
>         }
>
> -       len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
> -             op->dummy.nbytes;
> -       if (op->data.nbytes > len)
> -               op->data.nbytes = len;
> +       if (mtk_nor_check_prg(op))
> +               return 0;
> +
> +       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +
> +       if (op->data.dir == SPI_MEM_DATA_OUT) {
> +               if (len == MTK_NOR_PRG_MAX_SIZE)
> +                       return -EINVAL;
> +               op->data.nbytes = min_t(unsigned int, op->data.nbytes,
> +                                       MTK_NOR_PRG_MAX_SIZE - len);
> +       } else  {
> +               if (len == MTK_NOR_PRG_MAX_CYCLES)
> +                       return -EINVAL;
> +               op->data.nbytes = min_t(unsigned int, op->data.nbytes,
> +                                       MTK_NOR_PRG_MAX_CYCLES - len);
> +       }
>
>         return 0;
>  }
> @@ -206,8 +240,6 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  static bool mtk_nor_supports_op(struct spi_mem *mem,
>                                 const struct spi_mem_op *op)
>  {
> -       size_t len;
> -
>         if (op->cmd.buswidth != 1)
>                 return false;
>
> @@ -223,12 +255,11 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>                                (op->data.buswidth == 1);
>         }
>
> -       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> -       if ((len > MTK_NOR_PRG_MAX_SIZE) ||
> -           ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
> +       /* fallback to generic spi xfer */
> +       if (op->cmd.buswidth > 1 || op->addr.buswidth > 1 || op->data.buswidth > 1)
>                 return false;

Rejecting an op in supports_op doesn't tell it to fall back to generic
spi transfer.
It instead tells caller to abort this transfer completely.
A fallback only happens when exec_op returns -ENOTSUPP.
This comment is incorrect. I'd put this buswidth checking in mtk_nor_check_prg
instead because mtk_nor_check_prg is checking whether an op is supported
by prg mode, thus it should reject ops with buswidth > 1.

>
> -       return true;
> +       return mtk_nor_check_prg(op);
>  }
>
>  static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
> @@ -459,22 +490,36 @@ static int mtk_nor_transfer_one_message(struct spi_controller *master,
>         int stat = 0;
>         int reg_offset = MTK_NOR_REG_PRGDATA_MAX;
>         void __iomem *reg;
> -       const u8 *txbuf;
> -       u8 *rxbuf;
> -       int i;
> +       int i, tx_len = 0, rx_len = 0;
>
>         list_for_each_entry(t, &m->transfers, transfer_list) {
> -               txbuf = t->tx_buf;
> -               for (i = 0; i < t->len; i++, reg_offset--) {
> +               const u8 *txbuf = t->tx_buf;
> +
> +               if (!txbuf) {
> +                       rx_len += t->len;
> +                       continue;
> +               }
> +
> +               if (rx_len) {
> +                       stat = -EPROTO;
> +                       goto msg_done;
> +               }

NACK. you are unnecessarily rejecting possible transfers.

> +
> +               for (i = 0; i < t->len && reg_offset >= 0; i++, reg_offset--) {
>                         reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
> -                       if (txbuf)
> -                               writeb(txbuf[i], reg);
> -                       else
> -                               writeb(0, reg);
> +                       writeb(txbuf[i], reg);
> +                       tx_len++;

According to SPI standard, during a rx transfer, tx should be kept low.
These PROGDATA registers doesn't clear itself so it'll keep sending
data from last transfer, which violates this rule. That's
why the original code writes 0 to PRGDATA for rx bytes.

>                 }
> -               trx_len += t->len;
>         }
>
> +       while (reg_offset >= 0) {
> +               writeb(0, sp->base + MTK_NOR_REG_PRGDATA(reg_offset));
> +               reg_offset--;
> +       }
> +
> +       rx_len = min_t(unsigned long, MTK_NOR_PRG_MAX_CYCLES - tx_len, rx_len);
> +       trx_len = tx_len + rx_len;
> +
>         writel(trx_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
>
>         stat = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
> @@ -482,13 +527,18 @@ static int mtk_nor_transfer_one_message(struct spi_controller *master,
>         if (stat < 0)
>                 goto msg_done;
>
> -       reg_offset = trx_len - 1;
> -       list_for_each_entry(t, &m->transfers, transfer_list) {
> -               rxbuf = t->rx_buf;
> -               for (i = 0; i < t->len; i++, reg_offset--) {
> -                       reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
> -                       if (rxbuf)
> +       if (rx_len > 0) {
> +               reg_offset = rx_len - 1;
> +               list_for_each_entry(t, &m->transfers, transfer_list) {
> +                       u8 *rxbuf = t->rx_buf;
> +
> +                       if (!rxbuf)
> +                               continue;
> +
> +                       for (i = 0; i < t->len && reg_offset >= 0; i++, reg_offset--) {
> +                               reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
>                                 rxbuf[i] = readb(reg);
> +                       }

I think this is replacing original code with some equivalent ones, which
seems unnecessary.

>                 }
>         }
>
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
