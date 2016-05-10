Received: from mail-ig0-x243.google.com ([2607:f8b0:4001:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0AUD-0002w0-QA
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 16:26:18 +0000
Received: by mail-ig0-x243.google.com with SMTP id c3so1652864igl.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 09:25:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160503184835.GA21428@mwanda>
References: <20160503184835.GA21428@mwanda>
Date: Tue, 10 May 2016 18:25:55 +0200
Message-ID: <CABYn4sz_sZ_iHaZ+m6Eug3XS8mrn+2sn9rTDQXc5uFxjgSrS-w@mail.gmail.com>
Subject: Re: mtd: sh_flctl: Add DMA capabilty
From: Bastian Hecht <hechtb@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bastian Hecht <hechtb@googlemail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dan,

thanks for the bug report and the comments.

Currently I don't work as a software engineer and have no development
environment at all, so I can't really take care of this problem.

Best,

 Bastian


2016-05-03 20:48 GMT+02:00 Dan Carpenter <dan.carpenter@oracle.com>:
> Hello Bastian Hecht,
>
> The patch 83738d87e3a0: "mtd: sh_flctl: Add DMA capabilty" from Oct
> 19, 2012, leads to the following static checker warning:
>
>         drivers/mtd/nand/sh_flctl.c:532 write_ec_fiforeg()
>         error: wrong number of bits for 'cpu_to_be32' (64 vs 32) left= '*buf + i' *buf + i = (__builtin_bswap32(((*buf + i))))
>
> drivers/mtd/nand/sh_flctl.c
>    523  static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen,
>    524                                                  unsigned int offset)
>    525  {
>    526          int i, len_4align;
>    527          unsigned long *buf = (unsigned long *)&flctl->done_buff[offset];
>                 ^^^^^^^^^^^^^^^^^^
> Long can be 8 bytes.  Are we really assuming a 32 bit CPU in this day
> and era?
>
>
>    528
>    529          len_4align = (rlen + 3) / 4;
>    530
>    531          for (i = 0; i < len_4align; i++)
>    532                  buf[i] = cpu_to_be32(buf[i]);
>
> Storing a be32 in long is not right.
>
>    533
>    534          /* initiate DMA transfer */
>    535          if (flctl->chan_fifo0_tx && rlen >= 32 &&
>    536                  flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
>    537                          return; /* DMA success */
>    538
>    539          /* do polling transfer */
>    540          for (i = 0; i < len_4align; i++) {
>    541                  wait_wecfifo_ready(flctl);
>    542                  writel(buf[i], FLECFIFO(flctl));
>                         ^^^^^^
> writel() is named historically.  It actually writes u32s.  This code has
> endian bugs.  Read.  https://lwn.net/Articles/205624/
>
>    543          }
>    544  }
>
>
> regards,
> dan carpenter
