Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KghJy-0004VM-Uh
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 14:50:59 +0000
Received: by gxk5 with SMTP id 5so784849gxk.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Sep 2008 07:50:58 -0700 (PDT)
Message-ID: <e8775dd00809190750k171a9e86j328e063a8693fbf8@mail.gmail.com>
Date: Fri, 19 Sep 2008 22:50:58 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
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

Could you send out the panic log? How do you perform the robustness test.
Currently, I found the jffs2 filesystem can't support MLC well. Not
long time ago,
I use the patch JFFS2 doesn't use OOB at MLC NAND/OneNAND from
Kyungmin Park <kyungmin.park at samsung.com> on Sumsung MLC nand flash
K9LAG08U0M, but sometimes i will meet BUG() on the jffs2 file system. I suspect
that that patch does not completely handle MLC nand flash well. How
about this patch?

2008/9/19 AYYANARPONNUSAMY GANGHEYAMOORTHY <moorthy.apg@samsung.com>:
> Currently JFFS2 writes twice to the first page of the block,
> cleanmarker in OOB area and data in main area, which prevents
> JFFS2 from being used on MLC devices which have NOP count 1.
> This patch reserves the first page only for the cleanmarker.
>
> Note : With robustness testing, one test board out six has
> given a BUG. We are looking into it.
>
> Signed-off-by: Rajshekar H Payagond <rajshekar.hp@samsung.com>
> ---
> --- a/fs/jffs2/build.c  2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/build.c  2008-09-01 13:39:56.000000000 +0530
> @@ -330,7 +330,11 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>        int i;
>        int size;
>
> -       c->free_size = c->flash_size;
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
> +               c->free_size = 0;
> +       else
> +               c->free_size = c->flash_size;
> +
>        c->nr_blocks = c->flash_size / c->sector_size;
>        size = sizeof(struct jffs2_eraseblock) * c->nr_blocks;
>  #ifndef __ECOS
> @@ -346,7 +350,14 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>        for (i=0; i<c->nr_blocks; i++) {
>                INIT_LIST_HEAD(&c->blocks[i].list);
>                c->blocks[i].offset = i * c->sector_size;
> -               c->blocks[i].free_size = c->sector_size;
> +               if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +                       c->blocks[i].free_size =
> +                                       c->sector_size - c->wbuf_pagesize;
> +                       c->blocks[i].used_size = c->wbuf_pagesize;
> +                       c->free_size +=  c->blocks[i].free_size;
> +                       c->used_size += c->blocks[i].used_size;
> +               } else
> +                       c->blocks[i].free_size = c->sector_size;
>        }
>
>        INIT_LIST_HEAD(&c->clean_list);
> --- a/fs/jffs2/debug.c  2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/debug.c  2008-09-01 13:39:56.000000000 +0530
> @@ -307,6 +307,9 @@ __jffs2_dbg_acct_paranoia_check_nolock(s
>        uint32_t my_dirty_size = 0;
>        struct jffs2_raw_node_ref *ref2 = jeb->first_node;
>
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
> +               my_used_size = c->wbuf_pagesize;
> +
>        while (ref2) {
>                uint32_t totlen = ref_totlen(c, jeb, ref2);
>
> --- a/fs/jffs2/erase.c  2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/erase.c  2008-09-01 13:39:56.000000000 +0530
> @@ -454,13 +454,21 @@ static void jffs2_mark_erased_block(stru
>                }
>        }
>        /* Everything else got zeroed before the erase */
> -       jeb->free_size = c->sector_size;
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +               jeb->free_size = c->sector_size - c->wbuf_pagesize;
> +               jeb->used_size = c->wbuf_pagesize;
> +       } else
> +               jeb->free_size = c->sector_size;
>
>        mutex_lock(&c->erase_free_sem);
>        spin_lock(&c->erase_completion_lock);
>
>        c->erasing_size -= c->sector_size;
> -       c->free_size += c->sector_size;
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +               c->free_size += c->sector_size - c->wbuf_pagesize;
> +               c->used_size += c->wbuf_pagesize;
> +       } else
> +               c->free_size += c->sector_size;
>
>        /* Account for cleanmarker now, if it's in-band */
>        if (c->cleanmarker_size && !jffs2_cleanmarker_oob(c))
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
>
> --- a/fs/jffs2/nodelist.c       2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/nodelist.c       2008-09-01 13:39:56.000000000 +0530
> @@ -634,7 +634,11 @@ struct jffs2_raw_node_ref *jffs2_link_no
>
>        if (!jeb->first_node) {
>                jeb->first_node = ref;
> -               BUG_ON(ref_offset(ref) != jeb->offset);
> +               if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
> +                       BUG_ON(ref_offset(ref) !=
> +                                               jeb->offset + c->wbuf_pagesize);
> +               else
> +                       BUG_ON(ref_offset(ref) != jeb->offset);
>        } else if (unlikely(ref_offset(ref) != jeb->offset + c->sector_size - jeb->free_size)) {
>                uint32_t last_len = ref_totlen(c, jeb, jeb->last_node);
>
> --- a/fs/jffs2/nodemgmt.c       2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/nodemgmt.c       2008-09-01 16:15:47.000000000 +0530
> @@ -362,16 +362,25 @@ static int jffs2_do_reserve_space(struct
>        }
>
>        if (!jeb) {
> -
>                ret = jffs2_find_nextblock(c);
>                if (ret)
>                        return ret;
>
>                jeb = c->nextblock;
> +               if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +                       if (jeb->free_size != c->sector_size -
> +                               c->cleanmarker_size - c->wbuf_pagesize) {
> +                               printk(KERN_WARNING "Eep. Block 0x%08x taken from free_list had free_size of 0x%08x!!\n", jeb->offset, jeb->free_size);
> +                               goto restart;
> +                       }
> +               }
>
> -               if (jeb->free_size != c->sector_size - c->cleanmarker_size) {
> -                       printk(KERN_WARNING "Eep. Block 0x%08x taken from free_list had free_size of 0x%08x!!\n", jeb->offset, jeb->free_size);
> -                       goto restart;
> +               else{
> +                       if (jeb->free_size != c->sector_size -
> +                                       c->cleanmarker_size) {
> +                               printk(KERN_WARNING "Eep. Block 0x%08x taken from free_list had free_size of 0x%08x!!\n", jeb->offset, jeb->free_size);
> +                               goto restart;
> +                       }
>                }
>        }
>        /* OK, jeb (==c->nextblock) is now pointing at a block which definitely has
> --- a/fs/jffs2/scan.c   2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/scan.c   2008-09-01 13:39:56.000000000 +0530
> @@ -534,7 +534,10 @@ static int jffs2_scan_eraseblock (struct
>                }
>        }
>
> -       buf_ofs = jeb->offset;
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
> +               buf_ofs = jeb->offset + c->wbuf_pagesize;
> +       else
> +               buf_ofs = jeb->offset;
>
>        if (!buf_size) {
>                /* This is the XIP case -- we're reading _directly_ from the flash chip */
> @@ -582,7 +585,10 @@ static int jffs2_scan_eraseblock (struct
>        }
>
>        /* Now ofs is a complete physical flash offset as it always was... */
> -       ofs += jeb->offset;
> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
> +               ofs += jeb->offset + c->wbuf_pagesize;
> +       else
> +               ofs += jeb->offset;
>
>        noise = 10;
>
> --- a/fs/jffs2/wbuf.c   2008-08-24 04:48:32.000000000 +0530
> +++ b/fs/jffs2/wbuf.c   2008-09-01 13:39:56.000000000 +0530
> @@ -873,6 +873,13 @@ int jffs2_flash_writev(struct jffs2_sb_i
>                        vlen -= wbuf_retlen;
>                        outvec_to += wbuf_retlen;
>                        c->wbuf_ofs = outvec_to;
> +                       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
> +                               /* adjust write buffer offset,
> +                                * else we get a non contiguous write bug
> +                                */
> +                               if (!(c->wbuf_ofs % c->sector_size))
> +                                       c->wbuf_ofs = 0xffffffff;
> +                       }
>                        donelen += wbuf_retlen;
>                        v += wbuf_retlen;
>                }
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
>  /* ECC byte placement */
>  #define MTD_NANDECC_OFF                0       // Switch off ECC (Not recommended)
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
