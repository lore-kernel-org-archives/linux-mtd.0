Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Khez2-0002Yw-Gk
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 06:33:20 +0000
Received: by yx-out-1718.google.com with SMTP id 3so506967yxi.72
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 Sep 2008 23:33:19 -0700 (PDT)
Message-ID: <9c9fda240809212333n76fa6cc6jbf1025f4f272d3f4@mail.gmail.com>
Date: Mon, 22 Sep 2008 15:33:19 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: moorthy.apg@samsung.com
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support
In-Reply-To: <30508484.52991221827822859.JavaMail.weblogic@epml16>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <30508484.52991221827822859.JavaMail.weblogic@epml16>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Sep 19, 2008 at 9:37 PM, AYYANARPONNUSAMY GANGHEYAMOORTHY
<moorthy.apg@samsung.com> wrote:
> Currently JFFS2 writes twice to the first page of the block,
> cleanmarker in OOB area and data in main area, which prevents
> JFFS2 from being used on MLC devices which have NOP count 1.
> This patch reserves the first page only for the cleanmarker.

Is it reasonable to waste the first page at each blocks?
It wastes 1/128 storages e.g., 512MiB/128 = 4MiB.
How about to unuse the oob cleanmarker at previous email sent by me?

I'm not sure why the oob cleanmaker makes a problem at runtime?

And small coding synmatic problem at patche. See below.

Thank you,
Kyungmin Park

> Signed-off-by: Rajshekar H Payagond <rajshekar.hp@samsung.com>
> ---


> --- a/fs/jffs2/gc.c     2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/gc.c     2008-09-01 13:39:56.000000000 +0530
> @@ -237,9 +237,19 @@ int jffs2_garbage_collect_pass(struct jf
>        D1(if (c->nextblock)
>           printk(KERN_DEBUG "Nextblock at  %08x, used_size %08x, dirty_size %08x, wasted_size %08x, free_size %08x\n", c->nextblock->offset, c->nextblock->used_size, c->nextblock->dirty_size, c->nextblock->wasted_size, c->nextblock->free_size));
>
> -       if (!jeb->used_size) {
> -               mutex_unlock(&c->alloc_sem);
> -               goto eraseit;
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +               if (jeb->used_size <= c->wbuf_pagesize) {
> +                       mutex_unlock(&c->alloc_sem);
> +                       goto eraseit;
> +               }
> +
> +       }
> +
> +       else{
> +               if (!jeb->used_size) {
> +                       mutex_unlock(&c->alloc_sem);
> +                       goto eraseit;
> +               }
>        }

Please add 'else' after curly braces .

>
>        raw = jeb->gc_node;
> @@ -429,13 +439,32 @@ int jffs2_garbage_collect_pass(struct jf
>        spin_lock(&c->erase_completion_lock);
>
>  eraseit:
> -       if (c->gcblock && !c->gcblock->used_size) {
> -               D1(printk(KERN_DEBUG "Block at 0x%08x completely obsoleted by GC. Moving to erase_pending_list\n", c->gcblock->offset));
> -               /* We're GC'ing an empty block? */
> -               list_add_tail(&c->gcblock->list, &c->erase_pending_list);
> -               c->gcblock = NULL;
> -               c->nr_erasing_blocks++;
> -               jffs2_erase_pending_trigger(c);
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +               if (c->gcblock && (c->gcblock->used_size <= c->wbuf_pagesize)) {
> +                       D1(printk(KERN_DEBUG "Block at 0x%08x completely"
> +                               " obsoleted by GC. Moving to erase_pending_list\n"
> +                               , c->gcblock->offset));
> +                       /* We're GC'ing an empty block? */
> +                       list_add_tail(&c->gcblock->list,
> +                                       &c->erase_pending_list);
> +                       c->gcblock = NULL;
> +                       c->nr_erasing_blocks++;
> +                       jffs2_erase_pending_trigger(c);
> +               }
> +       }
> +
> +       else{
> +               if (c->gcblock && !c->gcblock->used_size) {
> +                       D1(printk(KERN_DEBUG "Block at 0x%08x completely"
> +                               " obsoleted by GC. Moving to erase_pending_list\n"
> +                               , c->gcblock->offset));
> +                       /* We're GC'ing an empty block? */
> +                       list_add_tail(&c->gcblock->list,
> +                                       &c->erase_pending_list);
> +                       c->gcblock = NULL;
> +                       c->nr_erasing_blocks++;
> +                       jffs2_erase_pending_trigger(c);
> +               }
>        }
>        spin_unlock(&c->erase_completion_lock);

Ditto.



> --- a/include/mtd/mtd-abi.h     2008-09-02 13:51:09.000000000 +0530
> +++ b/include/mtd/mtd-abi.h     2008-09-02 13:51:42.000000000 +0530
> @@ -28,12 +28,14 @@ struct mtd_oob_buf {
>  #define MTD_BIT_WRITEABLE      0x800   /* Single bits can be flipped */
>  #define MTD_NO_ERASE           0x1000  /* No erase necessary */
>  #define MTD_POWERUP_LOCK       0x2000  /* Always locked after reset */
> +#define MTD_WRITABLE_ONCE      0x4000
>
>  // Some common devices / combinations of capabilities
>  #define MTD_CAP_ROM            0
>  #define MTD_CAP_RAM            (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
>  #define MTD_CAP_NORFLASH       (MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH      (MTD_WRITEABLE)
> +#define MTD_CAP_MLCNANDFLASH   (MTD_WRITEABLE | MTD_WRITABLE_ONCE)
>

As previously, define MTD_OOB_WRITEABLE instead of WRITABLE_ONCE.
SLC NAND has WRITEABLE | OOB_WRITEABLE, but MLC NAND has WRITEABLE only
