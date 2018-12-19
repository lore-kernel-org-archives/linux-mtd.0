Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZh1b-0000bF-GM
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 18:56:56 +0000
Date: Wed, 19 Dec 2018 19:56:38 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Emil Lenngren <emil.lenngren@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd: spinand: wait on erase success in spinand_markbad?
Message-ID: <20181219195619.64f62b8e@bbrezillon>
In-Reply-To: <CAO1O6sd-JZBfGnAB7tOnsJeJSLXTguLHGdSEokOYq9n=bY5jPA@mail.gmail.com>
References: <CAO1O6sd-JZBfGnAB7tOnsJeJSLXTguLHGdSEokOYq9n=bY5jPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Dec 2018 14:27:51 +0100
Emil Lenngren <emil.lenngren@gmail.com> wrote:

> Hi,
> 
> I was just reading the spinand driver and found this piece of code:
> static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
> {
>     struct spinand_device *spinand = nand_to_spinand(nand);
>     struct nand_page_io_req req = {
>         .pos = *pos,
>         .ooboffs = 0,
>         .ooblen = 2,
>         .oobbuf.out = spinand->oobbuf,
>     };
>     int ret;
> 
>     /* Erase block before marking it bad. */
>     ret = spinand_select_target(spinand, pos->target);
>     if (ret)
>         return ret;
> 
>     ret = spinand_write_enable_op(spinand);
>     if (ret)
>         return ret;
> 
>     spinand_erase_op(spinand, pos);
> 
>     memset(spinand->oobbuf, 0, 2);
>     return spinand_write_page(spinand, &req);
> }
> 
> Shouldn't there be spinand_wait call after spinand_erase_op and before
> spinand_write_page?
> 

Absolutely. Can you send a patch to fix that?

Thanks,

Boris
