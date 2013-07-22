Received: from mail-vb0-x229.google.com ([2607:f8b0:400c:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1BVu-0001AH-UN
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 08:30:39 +0000
Received: by mail-vb0-f41.google.com with SMTP id p13so4630898vbe.0
 for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2013 01:30:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OF488B7050.CCC82AE1-ON86257B6D.004A7953-86257B6D.004AAE09@ni.com>
References: <OF488B7050.CCC82AE1-ON86257B6D.004A7953-86257B6D.004AAE09@ni.com>
Date: Mon, 22 Jul 2013 01:30:15 -0700
Message-ID: <CAN8TOE_O_9yasnPv=E+FzL_QugfbJMvp=sqZAbGUY_JAf=ufqQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] mtd: nand: nand_bbt: scan for next free bbt block
 if writing bbt fails
From: Brian Norris <computersforpeace@gmail.com>
To: Jeff Westfahl <jeff.westfahl@ni.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jeff,

Sorry this has sat a while. I have a few comments now, and I expect to
take an even closer look in the near future.

On Thu, May 16, 2013 at 6:35 AM, Jeff Westfahl <jeff.westfahl@ni.com> wrote:
> If erasing or writing the BBT fails, we should mark the current BBT block
> as bad and use the BBT descriptor to scan for the next available unused
> block in the BBT. We should only return a failure if there isn't any space
> left.

This idea looks good. We can of course run into a worn-out BBT block,
especially since we're pretty dumb at write-erase cycles (every new
bad block causes a full erasure/reprogram). So we should mark failing
BBT blocks as bad and move to the next one.

A general comment: it looks like you take care of updating the BBT
with the new bad block you're marking, but we expect that any
newly-marked bad block should be marked in both the BBT and in the OOB
area of the block itself (just in case we ever have to fall back to
using the bad block markers in each block again). See
nand_default_block_markbad() in nand_base.c.

> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> ---
>  drivers/mtd/nand/nand_bbt.c |   21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 2672643..900bda1 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -697,6 +697,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t
> *buf,
>                         page = td->pages[chip];
>                         goto write;
>                 }
> +       next:
>
>                 /*
>                  * Automatic placement of the bad block table. Search
> direction
> @@ -831,14 +832,26 @@ static int write_bbt(struct mtd_info *mtd, uint8_t
> *buf,
>                 einfo.addr = to;
>                 einfo.len = 1 << this->bbt_erase_shift;
>                 res = nand_erase_nand(mtd, &einfo, 1);
> -               if (res < 0)
> -                       goto outerr;
> +               if (res < 0) {
> +                       /* This block is bad. Mark it as such and see if
> there's

You probably don't want to turn *all* errors into new bad blocks. You
probably should only mark a block bad for some combination of -EIO (a
failed IO operation) and/or einfo.state == MTD_ERASE_FAILED, and not
for things like a read-only MTD (?), an out-of-bounds flash address
(shouldn't happen at this point?), or anything else that theoretically
could happen.

> +                          another available in the BBT area. */

You also may want to take a glance at Documentation/CodingStyle and/or
run scripts/checkpatch.pl on your patch. The comment closure doesn't
follow the CodingStyle.

> +                       int block = page >>
> +                               (this->bbt_erase_shift -
> this->page_shift);
> +                       this->bbt[block >> 2] |= 0x01 << ((block & 0x03)
> << 1);

It's been a while since I really looked at the nand_bbt.c coding
details... This is kinda ugly! (Note that this not particularly a
criticism of this part of your patch; this line follows the (IMO bad)
style of the rest of nand_bbt.c). I mean, we could at least use a nice
macro or something... I may look into whether this file deserves some
new cleanup macros, but that would be independent of this patch.

> +                       goto next;
> +               }
>
>                 res = scan_write_bbt(mtd, to, len, buf,
>                                 td->options & NAND_BBT_NO_OOB ? NULL :
>                                 &buf[len]);
> -               if (res < 0)
> -                       goto outerr;
> +               if (res < 0) {
> +                       /* This block is bad. Mark it as such and see if
> there's
> +                          another available in the BBT area. */

Similar comment here: you don't want to turn *all* errors into new bad
blocks, only -EIO.

> +                       int block = page >>
> +                               (this->bbt_erase_shift -
> this->page_shift);
> +                       this->bbt[block >> 2] |= 0x01 << ((block & 0x03)
> << 1);
> +                       goto next;
> +               }
>
>                 pr_info("Bad block table written to 0x%012llx, version
> 0x%02X\n",
>                          (unsigned long long)to, td->version[chip]);

(Comment to myself mostly:) write_bbt() is a monstrous function; 203
lines before this patch! And that's after cheating with lines like
this:

                case 1: sft = 3; sftmsk = 0x07; msk[0] = 0x00; msk[1] = 0x01;

But in light of this observation, it may be time to consider some refactoring...

Brian

[NOTE: I just crafted this reply and realized I actually received 3
copies of this patch via the mailing list, and I'm replying to the
only one that is line-wrapped. Sorry.]
