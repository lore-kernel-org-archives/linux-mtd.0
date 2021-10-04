Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF39FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 14:33:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE1B61002
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 14:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAE1B61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVYukRN3ixkXpFrPi4pJk5NR2n+7A2uwJcuXarkr59g=; b=hMIxIQpmtgf9QO
	NzjcmC06oYOYKuPiOVgvoo4bKFvzXiLmSi9QhiG0Fpn/lenD6LGmMTWFaiCGu4V/nc2DpQDk2vLiK
	04CPSS0UJHwA+zqD2F321ldD16q1hKy4BdxoE70uMJXmztz07KAY87tcLQjUKFpdQnxb1qz58ZF9o
	5XnoPlw6RFSu4YA1go9i77/xb5zIWBNNXSYmDjb+0Pb+xNaJsSd8icCYOxiB8ooDNHVd1x0RV/2a6
	ke4fOUCPLe8uO5+Yhuuv/B17T+7VmFULCxp4r3fIbMntV/d1NSMnuCwjP1OQ5fGwMSEc25RtUoUWx
	c0wHb6rloJVMQyBA7QVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXP0c-006law-AM; Mon, 04 Oct 2021 14:32:02 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXP0Y-006lZ3-Ef
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 14:32:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id g8so65792640edt.7
 for <linux-mtd@lists.infradead.org>; Mon, 04 Oct 2021 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vZuUk2iu5vHcMhoBaZr8flTV9KKhRBTDDf88OfAd1bQ=;
 b=hcseAkgo8Fs/UKNurZ/HjOn337SWuxoZle/5s2FKM//51k9M24jWvZZPDoKpuXJiHT
 DoSp8kDCxl49ACyPlhcukNkilsGYyb60QabmKfGpnQ+NGNx76NSO0pn8BKRJSq/1kNnw
 ZRaGw/gdJtZADTU2vhQT5diiYiSrqPghbGYGBdIXDuuqvsIXb9IhO7OzdT7Dr80frjfS
 euVwrBpLHkcYVIiQSGAYZxj+9FXt7NqRW5An2Cbfda+EIu9nCtJOtjHpOX1ihMJSBoGs
 9b4ZxDnFuimiqx7kXno3u/tRsNN7PXx8tl12CKZ1nmDCO7CZFu1AY4irD+oL7g3/B4m9
 LXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vZuUk2iu5vHcMhoBaZr8flTV9KKhRBTDDf88OfAd1bQ=;
 b=pTnLUpt7z3LpNwzcYSQIORNthgnpzBmhSLhebaRVbSzl7MDqoBEA7eOkp6tH7tMmgF
 twl/gWVnrj/bfUci1CEbf+MqRrb0PCGuEiKmmPvtpGhNx0VP++5KOKWlnLEbN06s3sVC
 /pMTWarMyTcQBP38qW4XPi58hRTA24x058tG6T89q2tbHMKHMvRaUxxhPEQqc5T5Juo9
 ofyVlxY4h1s5i8TC7ZJD7EGwDqMxliQYjsGCA5S+FCfJAf7fJgS/zdJRKqaxxxycNegt
 XmHJad1v8o5P5vFykAG4fCk3oxVT43kcCPVQ7ZML944dchjn8qEfaWkbVIRAXqAuDl55
 Zz5A==
X-Gm-Message-State: AOAM531xJfjcX7wA8g+CBUBvb41NcdVvHV3A7h0v4J4QXDqqX36sZ0S+
 4UpAsIkUp+ypZ101B9y9zRL9ZCwWPi5FElb0hOHOpt85obk=
X-Google-Smtp-Source: ABdhPJzozW2lp8HI17qauDAxWFN5XLE/VahlI/0T8huV8hDx4D44743HHJgPMc8S0aGca96NXIfEgutghG41+/OiKpc=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr17716073ejc.69.1633357824072; 
 Mon, 04 Oct 2021 07:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
In-Reply-To: <20210930100719.2176-3-mika.westerberg@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Oct 2021 17:29:47 +0300
Message-ID: <CAHp75VdtOHn4ED-ixdDngBQw10OnKmbtTv=ydLs6dYbkjyqW4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Lima <mauro.lima@eclypsium.com>, 
 Alexander Sverdlin <alexander.sverdlin@nokia.com>, 
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_073158_517602_DD78B28E 
X-CRM114-Status: GOOD (  27.35  )
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

On Thu, Sep 30, 2021 at 1:08 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> The preferred way to implement SPI-NOR controller drivers is through SPI
> subsubsystem utilizing the SPI MEM core functions. This converts the
> Intel SPI flash controller driver over the SPI MEM by moving the driver
> from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> SPI MEM functions. The driver name will be changed from intel-spi to
> spi-intel to match the convention used in the SPI subsystem.

...

> +config SPI_INTEL_PCI
> +       tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> +       depends on PCI && (X86 || COMPILE_TEST)

Perhaps two entries, one of which will be the same as for platform case?

> +       depends on SPI_MEM
> +       select SPI_INTEL
> +       help
> +         This enables PCI support for the Intel PCH/PCU SPI controller in
> +         master mode. This controller is present in modern Intel hardware
> +         and is used to hold BIOS and other persistent settings. Using
> +         this driver it is possible to upgrade BIOS directly from Linux.
> +
> +         Say N here unless you know what you are doing. Overwriting the
> +         SPI flash may render the system unbootable.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called spi-intel-pci.
> +
> +config SPI_INTEL_PLATFORM
> +       tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
> +       depends on X86 || COMPILE_TEST
> +       depends on SPI_MEM
> +       select SPI_INTEL
> +       help
> +         This enables platform support for the Intel PCH/PCU SPI
> +         controller in master mode. This controller is present in modern
> +         Intel hardware and is used to hold BIOS and other persistent
> +         settings. Using this driver it is possible to upgrade BIOS
> +         directly from Linux.
> +
> +         Say N here unless you know what you are doing. Overwriting the
> +         SPI flash may render the system unbootable.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called spi-intel-platform.

...

+ Blank line ?

>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/spi-nor.h>

+ Blank line?

> +#include <linux/spi/flash.h>
> +#include <linux/spi/spi.h>
> +#include <linux/spi/spi-mem.h>

The rationale is to show that we use two sub(sub)sytems here.

...

> -                       dev_err(ispi->dev, "read error: %llx: %#x\n", from,
> +                       dev_err(ispi->dev, "read error: %x: %#x\n", from,
>                                 status);

Now one line?

...

> -                       dev_err(ispi->dev, "write error: %llx: %#x\n", to,
> +                       dev_err(ispi->dev, "write error: %x: %#x\n", to,
>                                 status);

Ditto.

...

> +               ret = intel_spi_sw_cycle(ispi, opcode, 0,
> +                                        OPTYPE_WRITE_WITH_ADDR);
> +               return ret ? ret : 0;

Why not simply return intel_spi_dw_cycle(...); ?

...

> +       val = readl(ispi->base + HSFSTS_CTL);
> +       val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> +       val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;

> +       val |= cmd;
> +       val |= HSFSTS_CTL_FGO;

Maybe swap these lines to group constants?

...

> +       status = readl(ispi->base + HSFSTS_CTL);
> +       if (status & HSFSTS_CTL_FCERR)
> +               return -EIO;

> +       else if (status & HSFSTS_CTL_AEL)

Redundant 'else'

> +               return -EACCES;

...

> +static int intel_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +       struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> +       size_t nbytes = op->data.nbytes;
> +       u8 opcode = op->cmd.opcode;
> +
> +       if (op->addr.nbytes) {
> +               if  (op->data.dir == SPI_MEM_DATA_IN)
> +                       return intel_spi_read(ispi, op->addr.val, nbytes,
> +                                             op->data.buf.in);

> +               else if (op->data.dir == SPI_MEM_DATA_OUT)

Redundant 'else' here and nearby.

> +                       return intel_spi_write(ispi, op->addr.val, nbytes,
> +                                              op->data.buf.out);
> +               else if (op->data.dir == SPI_MEM_NO_DATA)
> +                       return intel_spi_erase(ispi, opcode, op->addr.val);
> +       } else {
> +               if  (op->data.dir == SPI_MEM_DATA_IN)
> +                       return intel_spi_read_reg(ispi, opcode, op->data.buf.in,
> +                                                 nbytes);
> +               else if (op->data.dir == SPI_MEM_DATA_OUT)
> +                       return intel_spi_write_reg(ispi, opcode, op->data.buf.out,
> +                                                  nbytes);
> +               else if (op->data.dir == SPI_MEM_NO_DATA)
> +                       return intel_spi_write_reg(ispi, opcode, NULL, 0);
>         }

> +       return -EINVAL;
> +}

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
