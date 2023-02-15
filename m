Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AD1C636CC
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoBFBBLCKS+tcPfHmD1KuunTbIgdp9vYQYNEPIUIbZg=; b=DhbmRahwmynOLm
	kbIl6wEv7iMrkXa04++a2mthtz+N1LyvZsplnwm1JFeJktf1tmBgPQK5KBg8cFhclw6Y8Ux2jv52r
	1sN/bLbQF/SMgw2bRK249uheVaRE5D5DWbwivtXHLSfwcVfApk0CWkMtwMGDRwGK+A/biifKtNNRY
	i3Y/TqkmCW9ovV93uP6o6QfyXCS2T5GZik+DMYbKEDvBHAekpW/J0FsWaGIL/S+LFrmEXFPYvIil+
	ttDsI0lITHSSKfA01n85/27C16SpiWe0lpiwAqwfE6FbB4OlHNSIwqpXb81s8y+kEiTYSzmuvmiyS
	7R0dhOUHwwEQ0qyr9t4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSBdn-004zJ6-Sv; Wed, 15 Feb 2023 06:51:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSBdj-004zDh-1d
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2023 06:51:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bu23so17978026wrb.8
        for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2023 22:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AGXGn+iszj7wBKyEG3uxWkLyNhixgFRBNkfqVVC8+cE=;
        b=LnmSHKKcgrxPFh5MUwsFLSL8Paf9tDabrv8LO0Ygx8XGHA0dRjqVov0vOKJYMcpJF4
         ewFStEkRyM3VeaVcLUrsUsxmIUOnoJmeomJ8B9raSnYYZGYDtXHIbzgRjp9j8yuSBpIB
         uaXcDCibGtuxEbkN5X43/iba7YhsxIvm3AL+g1Oc6bbQKM0IljCXmyAdRGKU2RcSWxZv
         I+9XIPNoXI/XRehmJe/yFNv2C5jSfjkmlzxnPEoQRw9IwjJZPYyDS1RnkvJSMlqtEpzZ
         Ia1MP9spXZ8w4ZuSZysb5kTQw0N2+N+1eoQOKQpsqB2ydpjAv4sdxRIfDam3Ov1Q1Zkp
         at5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGXGn+iszj7wBKyEG3uxWkLyNhixgFRBNkfqVVC8+cE=;
        b=NImL3Xkuqz1iWp+kKhs5fSbHcOL5mWRlNi3G+CYRn/6fa+DvSlJZC2vHyBGAn7uT7H
         AYpvkoEQ2was6PiHyVoUTlw/gIGIwXL/uTtjtfJLQFsAzzFOVpcBi+yCkX50MVu3sZJt
         2zjx6j5i8x8CTLYg46NGG3hjw/kXBgNKkqzLQ7NtRyhu+vj3RY0uquwVdZ9Q/zAtyWoM
         Rg0Fol5VFfDZKLgwPVGp173jTmz7s0o5kmrdt+NfuLYRDPzpZ/d3UETIKpT608POgkUo
         2oIAogruBQNOK/Hj87voXkEmXwav/+3IY4qasJUBTKEcaWv+sytOuPVC5VTx0Bwdg+kt
         8UQQ==
X-Gm-Message-State: AO0yUKVfX8B4jku6bkL60fQTmo6jCAlaIDIrpgyFt3/OyEYCI5zdLkc2
	3meg33bxemkjwVBqCcdGAFe4jVgLe9jT3K2u0csU22pCCiU=
X-Google-Smtp-Source: AK7set+htt932d5LJyii6scvyO1AxkotK+GY0JCBhQcQwFtqeJzRrqAqi/VJRzY9uq4Fxlqoh7piTSznJIXjnm/dxsc=
X-Received: by 2002:adf:fa45:0:b0:2c5:63df:8d4c with SMTP id
 y5-20020adffa45000000b002c563df8d4cmr30405wrr.698.1676443888445; Tue, 14 Feb
 2023 22:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20230209120853.660564-1-jaimeliao.tw@gmail.com> <20230209120853.660564-4-jaimeliao.tw@gmail.com>
In-Reply-To: <20230209120853.660564-4-jaimeliao.tw@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 15 Feb 2023 14:51:15 +0800
Message-ID: <CAJsYDV+EgDe-qTS9XUEYLQm1e=+rUiKpDzxQZM03tufyKxeNjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: spinand: Add support continuous read operation
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_225139_167270_C34FFA63 
X-CRM114-Status: GOOD (  23.73  )
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

Hi!

On Thu, Feb 9, 2023 at 8:10 PM Jaime Liao <jaimeliao.tw@gmail.com> wrote:
> [...]
> +static int spinand_mtd_continuous_read(struct mtd_info *mtd, loff_t from,
> +                                      struct mtd_oob_ops *ops,
> +                                      struct nand_io_iter *iter)
> +{
> +       struct spinand_device *spinand = mtd_to_spinand(mtd);
> +       struct nand_device *nand = mtd_to_nanddev(mtd);
> +       int ret = 0;
> +
> +       /*
> +        * Continuous read mode could reduce some operation in On-die ECC free
> +        * flash when read page sequentially.
> +        */
> +       iter->req.type = NAND_PAGE_READ;
> +       iter->req.mode = MTD_OPS_RAW;
> +       iter->req.dataoffs = nanddev_offs_to_pos(nand, from, &iter->req.pos);
> +       iter->req.databuf.in = ops->datbuf;
> +       iter->req.datalen = ops->len;
> +
> +       if (from & (nanddev_page_size(nand) - 1)) {
> +               pr_debug("%s: unaligned address\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       ret = spinand_continuous_read_enable(spinand);
> +       if (ret)
> +               return ret;
> +
> +       spinand->use_continuous_read = true;
> +
> +       ret = spinand_select_target(spinand, iter->req.pos.target);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * The continuous read operation including: firstly, starting with the
> +        * page read command and the 1 st page data will be read into the cache
> +        * after the read latency tRD. Secondly, Issuing the Read From Cache
> +        * commands (03h/0Bh/3Bh/6Bh/BBh/EBh) to read out the data from cache
> +        * continuously.
> +        *
> +        * The cache is divided into two halves, while one half of the cache is
> +        * outputting the data, the other half will be loaded for the new data;
> +        * therefore, the host can read out the data continuously from page to
> +        * page. Multiple of Read From Cache commands can be issued in one
> +        * continuous read operation, each Read From Cache command is required
> +        * to read multiple 4-byte data exactly; otherwise, the data output will
> +        * be out of sequence from one Read From Cache command to another Read
> +        * From Cache command.
> +        *
> +        * After all the data is read out, the host should pull CS# high to
> +        * terminate this continuous read operation and wait a 6us of tRST for
> +        * the NAND device resets read operation. The data output for each page
> +        * will always start from byte 0 and a full page data should be read out
> +        * for each page.
> +        */

This mode requires the entire read_from_cache op to finish in one command.
i.e. there can only be one read_from_cache command and the chip-select
can only be pulled low exactly once.
There's no guarantee that spinand_read_from_cache_op issues exactly one
command. spi-mem controllers may have a transfer size limit, requiring an
operation to be split into multiple read_from_cache requests with different
column addresses. spi-mem controllers with dirmap support can map a
memory space to a specific spi-mem read operation, and reading from this
memory-mapped space also isn't guaranteed to be completed in one
command. (Controllers may decide to respond to a bus read request using
multiple spi-mem ops with auto-incremented op addr.)
So, in order to use this mode, you can't reuse the spinand_read_from_cache_op
function. Instead, you should write a new function for read_from_cache
using spi_mem_adjust_op_size and spi_mem_exec_op: When calling
adjust_op_size, check whether the op size is truncated. If it is, current
continuous_read request should be aborted and fallback to the normal
read mode.

> +       ret = spinand_read_page(spinand, &iter->req);
> +       if (ret)
> +               goto continuous_read_error;
> +
> +       ret = spinand_reset_op(spinand);
> +       if (ret)
> +               goto continuous_read_error;
> +

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
