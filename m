Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BCBC31E5B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 15:40:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4C32084A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 15:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rrg/oKOB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iNjxUkk6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4C32084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+uKREbPsvUtkyf3mR78eUy1SvERps7EvMfJJntL3FI=; b=Rrg/oKOBLo0DqT
	vPJWn3xKS2FxtMtuZ/RI80/rAYDP3mU43lQXgetwGpXNKYDEe0huNBUHAh3B8B4fHgZyDlsKSFu9T
	1jUBqkRdt1S3t/OpYOVSX+whZsztfsYfJcxf2ZiySaW0Sy3LND/e7jabS4yZvDNkt5IQD1drZM66B
	s/YIUDLUO3ZdRUo11yqo3rHnFGSYv+Xzb1CBUUIKRk1uDrw1Ol+NTkM9aFwOi0OdnKsDzT2B9asEA
	gUv5vH1OtLVjM+uy5J0kugER7RneZOtDhcX18dA8aePorW+SLs0vCIhgLCZgycadyuKvJ4L6mf+Vj
	YX53ZkXatlLJwFwc8fkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hctk5-00015Y-NH; Mon, 17 Jun 2019 15:40:21 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hctjz-000112-RX
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 15:40:20 +0000
Received: by mail-ua1-x944.google.com with SMTP id o19so3592903uap.13
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2019 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+xHCh/5/rajrFwBWcxrYmQ2rJ/d9uDBLferqy5gsc5o=;
 b=iNjxUkk6tKL7h6GWxxpTadhgfrjy1TgdbpkEPYvg7MY3UCHkHrHKVVBONZzW2DJsEl
 PJeI7wx8pSQBvfDtvV4HFTfxw4CWQaDaOrLLrDFGbJdSMV5KFzpqtYE/B+X30PUMXxC8
 D2ZAkv11pMF7tFbT8OyYfRdc1HnL51qEfe+k/LE37uxWrWFoO6zluyjaOjmarrwb4Lr0
 M0zwGvulTwtpjlCdgF0cmoOiX26RFl1h/FgeDm985WZoQCKIIxAdqXhBmSWY+B5wu7t3
 c+BCjr8pBnq9sHU41D96E/3t2YKceWbrK163rl59O/mU6PSzISc384X2FidLxQ8DprF1
 +eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+xHCh/5/rajrFwBWcxrYmQ2rJ/d9uDBLferqy5gsc5o=;
 b=Lrs9+PqE6/HPUpjf8pt3OMyVTctWbGYTbPJJURmuu56/RMFbV2kJzMTC2r7ABmhwg2
 KpoAjyUwIf+MuRpc/1cpjLfIqrarwWFWgz6WSmo+408L88GucTOf/DqF0TVGKc2LP4+S
 WJwzgfY/d+ZSV7I8h9YUrypg47unGuili+gA+WBxp2pp1La4C2L29SbtnbvAIItQ5XuV
 7iDdE2MwbP4fqtqYHGQfW7aRWQGbYQ8d0E3GrBWrLvMbqROhaSf5HP2ekHs+1stVuS4I
 TkTsQYRLADeLLAoBzt2tTbpfOTj504souEayvIzMxoMTxpzSmXHtM+UUkQUOmV9FSfjh
 Encw==
X-Gm-Message-State: APjAAAW6MLICR7xidfrvvuf76nprN40Td3cmFZt3A8W5+PBdal7TwrZX
 GRvhpIX5Ub/YUUIl4BJvHQxBk0Ezq6BWI6FTuPYG5Q==
X-Google-Smtp-Source: APXvYqwcs6MIyZsucbjzRDDsDgKyPNBaK5l7jkhpkBXUGYaRrgzJjV8YqNDp7nbsnUgIo3NsZ+/PB4mrET6IlwpvVeI=
X-Received: by 2002:ab0:30c7:: with SMTP id c7mr7769825uam.143.1560786014401; 
 Mon, 17 Jun 2019 08:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
 <1560336476-31763-3-git-send-email-sagar.kadam@sifive.com>
 <70732c8e-111f-7c46-9e93-11894d944a1d@ti.com>
In-Reply-To: <70732c8e-111f-7c46-9e93-11894d944a1d@ti.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Mon, 17 Jun 2019 21:10:02 +0530
Message-ID: <CAARK3HmFg=v+cMGAykPPpwxDGaSKk5k+Gz4fSHQPQmg-rCjPhQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: add support to unlock flash device
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_084016_677930_1A1424FD 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: aou@eecs.berkeley.edu, tudor.ambarus@microchip.com,
 Wesley Terpstra <wesley@sifive.com>, richard@nod.at,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Vignesh,

On Sun, Jun 16, 2019 at 6:35 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
>
>
> On 12-Jun-19 4:17 PM, Sagar Shrikant Kadam wrote:
> > Nor device (is25wp256 mounted on HiFive unleashed Rev A00 board) from ISSI
> > have memory blocks guarded by block protection bits BP[0,1,2,3].
> >
> > Clearing block protection bits,unlocks the flash memory regions
> > The unlock scheme is registered during nor scans.
> >
> > Based on code developed by Wesley Terpstra <wesley@sifive.com>
> > and/or Palmer Dabbelt <palmer@sifive.com>.
> > https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 51 ++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/mtd/spi-nor.h   |  1 +
> >  2 files changed, 51 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 2d5a925..b7c6261 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1461,6 +1461,49 @@ static int macronix_quad_enable(struct spi_nor *nor)
> >  }
> >
> >  /**
> > + * issi_unlock() - clear BP[0123] write-protection.
> > + * @nor: pointer to a 'struct spi_nor'.
> > + * @ofs: offset from which to unlock memory.
> > + * @len: number of bytes to unlock.
> > + *
> > + * Bits [2345] of the Status Register are BP[0123].
> > + * ISSI chips use a different block protection scheme than other chips.
> > + * Just disable the write-protect unilaterally.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int issi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> > +{
> > +     int ret, val;
> > +     u8 mask = SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3;
> > +
> > +     val = read_sr(nor);
> > +     if (val < 0)
> > +             return val;
> > +     if (!(val & mask))
> > +             return 0;
> > +
> > +     write_enable(nor);
> > +
> > +     write_sr(nor, val & ~mask);
> > +
> > +     ret = spi_nor_wait_till_ready(nor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = read_sr(nor);
> > +     if (ret > 0 && !(ret & mask)) {
> > +             dev_info(nor->dev,
> > +                     "ISSI Block Protection Bits cleared SR=0x%x", ret);
> > +             ret = 0;
> > +     } else {
> > +             dev_err(nor->dev, "ISSI Block Protection Bits not cleared\n");
> > +             ret = -EINVAL;
> > +     }
> > +     return ret;
> > +}
> > +
> > +/**
> >   * spansion_quad_enable() - set QE bit in Configuraiton Register.
> >   * @nor:     pointer to a 'struct spi_nor'
> >   *
> > @@ -1836,7 +1879,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
> >                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
> >                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> > -                     SPI_NOR_4B_OPCODES)
> > +                     SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK)
> >       },
> >
> >       /* Macronix */
> > @@ -4080,6 +4123,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >               nor->flash_is_locked = stm_is_locked;
> >       }
> >
> > +     /* NOR protection support for ISSI chips */
> > +     if (JEDEC_MFR(info) == SNOR_MFR_ISSI ||
> > +         info->flags & SPI_NOR_HAS_LOCK) {
>
> This should be:
>
>         if (JEDEC_MFR(info) == SNOR_MFR_ISSI &&
>             info->flags & SPI_NOR_HAS_LOCK) {
>
> Otherwise you would end up overriding nor->flash_unlock function for
> other vendors too, right?
>
Yes, right. I will submit a v6 for this.

> > +             nor->flash_unlock = issi_unlock;
> > +
>
> No need for blank line here.
> Please run ./scripts/checkpatch.pl --strict on all patches and address
> all the issues reported by it.
>
>
Ok. The plain checkpatch.pl run didn't catch this.
I will fix this and provide a v6 for this.
>
> > +     }
> >       if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
> >               mtd->_lock = spi_nor_lock;
> >               mtd->_unlock = spi_nor_unlock;
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index ff13297..9a7d719 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -127,6 +127,7 @@
> >  #define SR_BP0                       BIT(2)  /* Block protect 0 */
> >  #define SR_BP1                       BIT(3)  /* Block protect 1 */
> >  #define SR_BP2                       BIT(4)  /* Block protect 2 */
> > +#define SR_BP3                       BIT(5)  /* Block protect 3 for ISSI device*/
>
> No need to mention ISSI here. I am sure there are devices from other
> vendors with BP3
>
Ok, I will drop this in V6 and submit.

> >  #define SR_TB                        BIT(5)  /* Top/Bottom protect */
> >  #define SR_SRWD                      BIT(7)  /* SR write protect */
> >  /* Spansion/Cypress specific status bits */
> >
>
> Regards
> Vignesh

Thanks & BR,
Sagar Kadam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
