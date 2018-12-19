Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZhvk-0002q0-FM
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 19:54:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id t13so9915970ply.13
 for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2018 11:54:44 -0800 (PST)
MIME-Version: 1.0
References: <CAO1O6sd-JZBfGnAB7tOnsJeJSLXTguLHGdSEokOYq9n=bY5jPA@mail.gmail.com>
 <20181219195619.64f62b8e@bbrezillon>
In-Reply-To: <20181219195619.64f62b8e@bbrezillon>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Wed, 19 Dec 2018 20:54:33 +0100
Message-ID: <CAO1O6scbGZwf_ZiG66zQuoeXHKuHLgmNHz_TjKaJi84Y7xV-ng@mail.gmail.com>
Subject: Re: mtd: spinand: wait on erase success in spinand_markbad?
To: bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Den ons 19 dec. 2018 kl 19:56 skrev Boris Brezillon <bbrezillon@kernel.org>:
>
> On Wed, 19 Dec 2018 14:27:51 +0100
> Emil Lenngren <emil.lenngren@gmail.com> wrote:
>
> > Hi,
> >
> > I was just reading the spinand driver and found this piece of code:
> > static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
> > {
> >     struct spinand_device *spinand = nand_to_spinand(nand);
> >     struct nand_page_io_req req = {
> >         .pos = *pos,
> >         .ooboffs = 0,
> >         .ooblen = 2,
> >         .oobbuf.out = spinand->oobbuf,
> >     };
> >     int ret;
> >
> >     /* Erase block before marking it bad. */
> >     ret = spinand_select_target(spinand, pos->target);
> >     if (ret)
> >         return ret;
> >
> >     ret = spinand_write_enable_op(spinand);
> >     if (ret)
> >         return ret;
> >
> >     spinand_erase_op(spinand, pos);
> >
> >     memset(spinand->oobbuf, 0, 2);
> >     return spinand_write_page(spinand, &req);
> > }
> >
> > Shouldn't there be spinand_wait call after spinand_erase_op and before
> > spinand_write_page?
> >
>
> Absolutely. Can you send a patch to fix that?
>

Sure, although I'm a bit unsure how the error handling should be done.
In the u-boot version
(https://github.com/u-boot/u-boot/blob/9e5c2a755a6ca5f3931de548f43101d0d18ac003/drivers/mtd/nand/spi/core.c#L718),
if the spinand_erase_op spi transfer fails, the function quits without
writing the bad block marker, while the linux version ignores the
error. Is the intention that the bad block marker should be written
regardless if the erase spi transfer fails or not, or is it just a
mistake?

> Thanks,
>
> Boris
