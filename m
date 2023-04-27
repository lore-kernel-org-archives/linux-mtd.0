Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60469C77B61
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Apr 2023 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBIJiyyWmO40hkc7iayUQ0bxfb4oteDpy1HmVs6qqqE=; b=JtrrloPU00icpd
	Sy7xhf77dnweoqY9CNVNQJ9IBghZfRBPCyINvFRnpkJPGgbKZ+hfCvjtd8qkiVEnA6K5R1EjFZ0Zt
	Roy2Fpn0YITN4K+g6EzHhfQjHbK1Vhvk0Z0WPMEs+UaPpqcnV9SszqAZo8aiu+sRYhsCG2ah/BYyf
	JxuoePsHtqq13AeyK4wwZQ5CPrMNJ7EW9GRNZFlHRs0NHjzkUeMS6RjQ4ag9CRPSAZcm/wyq4X3HA
	YmuM0jdD9aw54jQgH05YsUedmM0ah6iluNhwkROzPw/S7wNSo5boDrpzBTBLlBv5M9OxtZwIYBFUH
	ihtkB75UFJacKEL5/JuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pryOT-00655g-0O;
	Thu, 27 Apr 2023 09:58:29 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pryOP-00653g-0b
	for linux-mtd@lists.infradead.org;
	Thu, 27 Apr 2023 09:58:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso5870502b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2023 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682589501; x=1685181501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6fOzyH1rMG3X1aZNgX+nkBciC5jwV/P2ArNGn08gr1A=;
        b=pClJBJV4VxPR5hCylt6N3tTUrbgHPJizJI+B0p1f6C1t/Bk/KdJ4e6z/fjNcWMgZs7
         gsHSqlxDWXvtltnBHLmTKLh8/u6JZt/jp8nbXyy7JUczN/A654CnJjGFV+5KUPLqwEiA
         A209fPs6QuCrZOCm3ySd9qS1lXTVTwTTBj9ft4EiGJgAQ+dmo09tLt+FV6EQMpRRWX/q
         r6pGKDHhRvQjWDrlnTMcfbVAzeglBxVuhjRQ15sQRgl0EzkkMxmL9HooJfQwukA90bVg
         EqUDjd7BlFLB/fqvvxGm481C1nifAr1O1LZX8Ax56n4eMMLN3o1QhoVJeYeDPdXh5OSK
         Eomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682589501; x=1685181501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fOzyH1rMG3X1aZNgX+nkBciC5jwV/P2ArNGn08gr1A=;
        b=hKP3Yg8fzwWe/gqQBU89+jaVo7rlSHHkTAzHjtEPv1Cu7YSpXpNXp6f27QgGNisd+d
         s/ARyPUC0ntiPX9RpH5BrY4Wm4atHZnZiaCVmipLZkCnLUmRZa4/eWyl5TCJkwKh516U
         TRV6zIZIs1QOXkMzJj7KudAzZIh4Cs9CHP74sTBAUCbjB/FINEg73tY+In4hCqpb6NRV
         JKFIuIunS0vDyilBbEIXn0kCucm8MlVbIh9xjoaml6+RHQZ5n4FVOfMpNc7nRDc47z2j
         MkSlEXhQH2vZg419/S883tTlNm60IwYTv8+Vl4BIWl7jFDNOdtQmkAdnqOLSut7g6JlV
         qfKA==
X-Gm-Message-State: AC+VfDwFJZjtmNzUgVZX0XfD5gjtxW23ru/kQVb6B3Dh4Iq3kFDCH3fG
	r4grRYZYAEGZ+q7p+qv+WJVVz46fLixOacvdJvr+4CGI8Xg=
X-Google-Smtp-Source: ACHHUZ4vLoN5Jz+6kXeQwwzxajDfT4PvLy288N1bOdZf3fJWOKuvT6hYzrPb0H69kycFxA1KWNuESzGuQT1A1Rwz4Io=
X-Received: by 2002:a05:6a20:54a3:b0:ef:b575:e559 with SMTP id
 i35-20020a056a2054a300b000efb575e559mr1462042pzk.8.1682589501582; Thu, 27 Apr
 2023 02:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
 <20230209120853.660564-4-jaimeliao.tw@gmail.com> <CAJsYDV+EgDe-qTS9XUEYLQm1e=+rUiKpDzxQZM03tufyKxeNjA@mail.gmail.com>
In-Reply-To: <CAJsYDV+EgDe-qTS9XUEYLQm1e=+rUiKpDzxQZM03tufyKxeNjA@mail.gmail.com>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 27 Apr 2023 17:58:10 +0800
Message-ID: <CAAQoYRkq1w3dsTB64d=qdFU4w9cLD0gbfj_WxYpbFuGHD7Zivw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: spinand: Add support continuous read operation
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_025825_231431_7FCF356F 
X-CRM114-Status: GOOD (  30.97  )
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

Hi Chuanhong

>
> Hi!
>
> On Thu, Feb 9, 2023 at 8:10 PM Jaime Liao <jaimeliao.tw@gmail.com> wrote:
> > [...]
> > +static int spinand_mtd_continuous_read(struct mtd_info *mtd, loff_t from,
> > +                                      struct mtd_oob_ops *ops,
> > +                                      struct nand_io_iter *iter)
> > +{
> > +       struct spinand_device *spinand = mtd_to_spinand(mtd);
> > +       struct nand_device *nand = mtd_to_nanddev(mtd);
> > +       int ret = 0;
> > +
> > +       /*
> > +        * Continuous read mode could reduce some operation in On-die ECC free
> > +        * flash when read page sequentially.
> > +        */
> > +       iter->req.type = NAND_PAGE_READ;
> > +       iter->req.mode = MTD_OPS_RAW;
> > +       iter->req.dataoffs = nanddev_offs_to_pos(nand, from, &iter->req.pos);
> > +       iter->req.databuf.in = ops->datbuf;
> > +       iter->req.datalen = ops->len;
> > +
> > +       if (from & (nanddev_page_size(nand) - 1)) {
> > +               pr_debug("%s: unaligned address\n", __func__);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = spinand_continuous_read_enable(spinand);
> > +       if (ret)
> > +               return ret;
> > +
> > +       spinand->use_continuous_read = true;
> > +
> > +       ret = spinand_select_target(spinand, iter->req.pos.target);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /*
> > +        * The continuous read operation including: firstly, starting with the
> > +        * page read command and the 1 st page data will be read into the cache
> > +        * after the read latency tRD. Secondly, Issuing the Read From Cache
> > +        * commands (03h/0Bh/3Bh/6Bh/BBh/EBh) to read out the data from cache
> > +        * continuously.
> > +        *
> > +        * The cache is divided into two halves, while one half of the cache is
> > +        * outputting the data, the other half will be loaded for the new data;
> > +        * therefore, the host can read out the data continuously from page to
> > +        * page. Multiple of Read From Cache commands can be issued in one
> > +        * continuous read operation, each Read From Cache command is required
> > +        * to read multiple 4-byte data exactly; otherwise, the data output will
> > +        * be out of sequence from one Read From Cache command to another Read
> > +        * From Cache command.
> > +        *
> > +        * After all the data is read out, the host should pull CS# high to
> > +        * terminate this continuous read operation and wait a 6us of tRST for
> > +        * the NAND device resets read operation. The data output for each page
> > +        * will always start from byte 0 and a full page data should be read out
> > +        * for each page.
> > +        */
>
> This mode requires the entire read_from_cache op to finish in one command.
> i.e. there can only be one read_from_cache command and the chip-select
> can only be pulled low exactly once.
> There's no guarantee that spinand_read_from_cache_op issues exactly one
> command. spi-mem controllers may have a transfer size limit, requiring an
> operation to be split into multiple read_from_cache requests with different
> column addresses. spi-mem controllers with dirmap support can map a
> memory space to a specific spi-mem read operation, and reading from this
> memory-mapped space also isn't guaranteed to be completed in one
> command. (Controllers may decide to respond to a bus read request using
> multiple spi-mem ops with auto-incremented op addr.)
> So, in order to use this mode, you can't reuse the spinand_read_from_cache_op
> function. Instead, you should write a new function for read_from_cache
> using spi_mem_adjust_op_size and spi_mem_exec_op: When calling
> adjust_op_size, check whether the op size is truncated. If it is, current
> continuous_read request should be aborted and fallback to the normal
> read mode.
As I know, data read could be handle by DMA engine even data length is
greater than
controller limit.
In spi-mem.c, spi_mem_adjust_op_size are using when "no_dirmap" so
that I not sure
that is import for checking before continuous read.
Should I check dirmap mode before enable continuous read?

Thanks your reply.
Jaime

>
> > +       ret = spinand_read_page(spinand, &iter->req);
> > +       if (ret)
> > +               goto continuous_read_error;
> > +
> > +       ret = spinand_reset_op(spinand);
> > +       if (ret)
> > +               goto continuous_read_error;
> > +
>
> --
> Regards,
> Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
