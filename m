Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KksUc-0007st-Nd
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 03:35:15 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K8100JAPJAHKT@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 12:35:05 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K81002PJJAEUC@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 12:35:05 +0900 (KST)
Date: Wed, 01 Oct 2008 09:07:37 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support
To: Jason Liu <liu.h.jason@gmail.com>, apgmoorthy <moorthy.apg@samsung.com>
Message-id: <A51468EF349E43489C7D33B47B8A3A24@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <30508484.52991221827822859.JavaMail.weblogic@epml16>
	<9c9fda240809212333n76fa6cc6jbf1025f4f272d3f4@mail.gmail.com>
	<001101c9222e$1914e6d0$3dd66c6b@sisodomain.com>
	<e8775dd00809300507l44ccb38dg1dff2fb6edc7641a@mail.gmail.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are also facing many difficulty in robustness and 
reliability test with Jffs2 not only this we have tested our 
MLC patches on kernel 2.6.22 their Jffs2 stability was 
little bit higher as compare to  2.6.27 , not only this LTP 
file tests and rw test fails with Jffs2 and same driver 
works fine with yaffs2 but yaffs2 also has issue with 
Symlink operation  we are working for that.

Rgs
Amit
----- Original Message ----- 
From: "Jason Liu" <liu.h.jason@gmail.com>
To: "apgmoorthy" <moorthy.apg@samsung.com>
Cc: <linux-mtd@lists.infradead.org>; "Kyungmin Park" 
<kmpark@infradead.org>; <David.Woodhouse@intel.com>
Sent: Tuesday, September 30, 2008 5:37 PM
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support


> Hi,
>    I have looked into the log file. I notice the oops in 
> the log
> file is the same i often meet with MLC nand after apply 
> the patch
> JFFS2 doesn't use OOB at MLC NAND/OneNAND from Kyungmin 
> Park, it seems
> that jffs2 file system may have serious issues. I have 
> strong feeling
> that jffs2 files system is far from production level at 
> least for MLC
> nand flash. David, do you have any comments?
>
> 2008/9/29 apgmoorthy <moorthy.apg@samsung.com>:
>> Hi,
>>
>> In the earlier patch there was a typo , have rectified it 
>> and posting it
>> back.
>>
>>
>> Signed-off-by: Rajshekar H Payagond 
>> <rajshekar.hp@samsung.com>
>> ---
>> --- a/fs/jffs2/build.c  2008-09-16 20:48:12.000000000 
>> +0530
>> +++ b/fs/jffs2/build.c  2008-09-19 17:07:48.000000000 
>> +0530
>> @@ -330,7 +330,11 @@ int jffs2_do_mount_fs(struct 
>> jffs2_sb_in
>>        int i;
>>        int size;
>>
>> -       c->free_size = c->flash_size;
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
>> +               c->free_size = 0;
>> +       else
>> +               c->free_size = c->flash_size;
>> +
>>        c->nr_blocks = c->flash_size / c->sector_size;
>>        size = sizeof(struct jffs2_eraseblock) * 
>> c->nr_blocks;  #ifndef
>> __ECOS @@ -346,7 +350,14 @@ int jffs2_do_mount_fs(struct 
>> jffs2_sb_in
>>        for (i=0; i<c->nr_blocks; i++) {
>>                INIT_LIST_HEAD(&c->blocks[i].list);
>>                c->blocks[i].offset = i * c->sector_size;
>> -               c->blocks[i].free_size = c->sector_size;
>> +               if (c->mtd->flags == 
>> MTD_CAP_MLCNANDFLASH) {
>> +                       c->blocks[i].free_size =
>> +                                       c->sector_size - 
>> c->wbuf_pagesize;
>> +                       c->blocks[i].used_size = 
>> c->wbuf_pagesize;
>> +                       c->free_size += 
>> c->blocks[i].free_size;
>> +                       c->used_size += 
>> c->blocks[i].used_size;
>> +               } else
>> +                       c->blocks[i].free_size = 
>> c->sector_size;
>>        }
>>
>>        INIT_LIST_HEAD(&c->clean_list);
>> --- a/fs/jffs2/debug.c  2008-09-16 20:48:12.000000000 
>> +0530
>> +++ b/fs/jffs2/debug.c  2008-09-19 17:07:48.000000000 
>> +0530
>> @@ -307,6 +307,9 @@ 
>> __jffs2_dbg_acct_paranoia_check_nolock(s
>>        uint32_t my_dirty_size = 0;
>>        struct jffs2_raw_node_ref *ref2 = jeb->first_node;
>>
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
>> +               my_used_size = c->wbuf_pagesize;
>> +
>>        while (ref2) {
>>                uint32_t totlen = ref_totlen(c, jeb, 
>> ref2);
>>
>> --- a/fs/jffs2/erase.c  2008-09-16 20:48:12.000000000 
>> +0530
>> +++ b/fs/jffs2/erase.c  2008-09-19 17:07:48.000000000 
>> +0530
>> @@ -454,13 +454,21 @@ static void 
>> jffs2_mark_erased_block(stru
>>                }
>>        }
>>        /* Everything else got zeroed before the erase */
>> -       jeb->free_size = c->sector_size;
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
>> +               jeb->free_size = c->sector_size - 
>> c->wbuf_pagesize;
>> +               jeb->used_size = c->wbuf_pagesize;
>> +       } else
>> +               jeb->free_size = c->sector_size;
>>
>>        mutex_lock(&c->erase_free_sem);
>>        spin_lock(&c->erase_completion_lock);
>>
>>        c->erasing_size -= c->sector_size;
>> -       c->free_size += c->sector_size;
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
>> +               c->free_size += c->sector_size - 
>> c->wbuf_pagesize;
>> +               c->used_size += c->wbuf_pagesize;
>> +       } else
>> +               c->free_size += c->sector_size;
>>
>>        /* Account for cleanmarker now, if it's in-band */
>>        if (c->cleanmarker_size && 
>> !jffs2_cleanmarker_oob(c))
>> --- a/fs/jffs2/gc.c     2008-09-16 20:48:12.000000000 
>> +0530
>> +++ b/fs/jffs2/gc.c     2008-09-23 21:36:56.000000000 
>> +0530
>> @@ -237,9 +237,17 @@ int 
>> jffs2_garbage_collect_pass(struct jf
>>        D1(if (c->nextblock)
>>           printk(KERN_DEBUG "Nextblock at  %08x, 
>> used_size %08x, dirty_size
>> %08x, wasted_size %08x, free_size %08x\n", 
>> c->nextblock->offset,
>> c->nextblock->used_size, c->nextblock->dirty_size,
>> c->nextblock->wasted_size, c->nextblock->free_size));
>>
>> -       if (!jeb->used_size) {
>> -               mutex_unlock(&c->alloc_sem);
>> -               goto eraseit;
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
>> +               if (jeb->used_size <= c->wbuf_pagesize) {
>> +                       mutex_unlock(&c->alloc_sem);
>> +                       goto eraseit;
>> +               }
>> +
>> +       } else{
>> +               if (!jeb->used_size) {
>> +                       mutex_unlock(&c->alloc_sem);
>> +                       goto eraseit;
>> +               }
>>        }
>>
>>        raw = jeb->gc_node;
>> @@ -429,13 +437,30 @@ int 
>> jffs2_garbage_collect_pass(struct jf
>>        spin_lock(&c->erase_completion_lock);
>>
>>  eraseit:
>> -       if (c->gcblock && !c->gcblock->used_size) {
>> -               D1(printk(KERN_DEBUG "Block at 0x%08x 
>> completely obsoleted
>> by GC. Moving to erase_pending_list\n", 
>> c->gcblock->offset));
>> -               /* We're GC'ing an empty block? */
>> -               list_add_tail(&c->gcblock->list, 
>> &c->erase_pending_list);
>> -               c->gcblock = NULL;
>> -               c->nr_erasing_blocks++;
>> -               jffs2_erase_pending_trigger(c);
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH) {
>> +               if (c->gcblock && (c->gcblock->used_size 
>> <=
>> c->wbuf_pagesize)) {
>> +                       D1(printk(KERN_DEBUG "Block at 
>> 0x%08x completely"
>> +                               " obsoleted by GC. Moving 
>> to
>> erase_pending_list\n"
>> +                               , c->gcblock->offset));
>> +                       /* We're GC'ing an empty block? 
>> */
>> +                       list_add_tail(&c->gcblock->list,
>> + 
>> &c->erase_pending_list);
>> +                       c->gcblock = NULL;
>> +                       c->nr_erasing_blocks++;
>> +                       jffs2_erase_pending_trigger(c);
>> +               }
>> +       } else{
>> +               if (c->gcblock && !c->gcblock->used_size) 
>> {
>> +                       D1(printk(KERN_DEBUG "Block at 
>> 0x%08x completely"
>> +                               " obsoleted by GC. Moving 
>> to
>> erase_pending_list\n"
>> +                               , c->gcblock->offset));
>> +                       /* We're GC'ing an empty block? 
>> */
>> +                       list_add_tail(&c->gcblock->list,
>> + 
>> &c->erase_pending_list);
>> +                       c->gcblock = NULL;
>> +                       c->nr_erasing_blocks++;
>> +                       jffs2_erase_pending_trigger(c);
>> +               }
>>        }
>>        spin_unlock(&c->erase_completion_lock);
>>
>> --- a/fs/jffs2/nodelist.c       2008-09-16 
>> 20:48:12.000000000 +0530
>> +++ b/fs/jffs2/nodelist.c       2008-09-19 
>> 17:07:48.000000000 +0530
>> @@ -634,7 +634,11 @@ struct jffs2_raw_node_ref 
>> *jffs2_link_no
>>
>>        if (!jeb->first_node) {
>>                jeb->first_node = ref;
>> -               BUG_ON(ref_offset(ref) != jeb->offset);
>> +               if (c->mtd->flags == 
>> MTD_CAP_MLCNANDFLASH)
>> +                       BUG_ON(ref_offset(ref) !=
>> + 
>> jeb->offset +
>> c->wbuf_pagesize);
>> +               else
>> +                       BUG_ON(ref_offset(ref) != 
>> jeb->offset);
>>        } else if (unlikely(ref_offset(ref) != jeb->offset 
>> + c->sector_size
>> - jeb->free_size)) {
>>                uint32_t last_len = ref_totlen(c, jeb, 
>> jeb->last_node);
>>
>> --- a/fs/jffs2/nodemgmt.c       2008-09-16 
>> 20:48:12.000000000 +0530
>> +++ b/fs/jffs2/nodemgmt.c       2008-09-19 
>> 17:07:48.000000000 +0530
>> @@ -362,16 +362,25 @@ static int 
>> jffs2_do_reserve_space(struct
>>        }
>>
>>        if (!jeb) {
>> -
>>                ret = jffs2_find_nextblock(c);
>>                if (ret)
>>                        return ret;
>>
>>                jeb = c->nextblock;
>> +               if (c->mtd->flags == 
>> MTD_CAP_MLCNANDFLASH) {
>> +                       if (jeb->free_size != 
>> c->sector_size -
>> +                               c->cleanmarker_size - 
>> c->wbuf_pagesize) {
>> +                               printk(KERN_WARNING "Eep. 
>> Block 0x%08x taken
>> from free_list had free_size of 0x%08x!!\n", jeb->offset, 
>> jeb->free_size);
>> +                               goto restart;
>> +                       }
>> +               }
>>
>> -               if (jeb->free_size != c->sector_size - 
>> c->cleanmarker_size)
>> {
>> -                       printk(KERN_WARNING "Eep. Block 
>> 0x%08x taken from
>> free_list had free_size of 0x%08x!!\n", jeb->offset, 
>> jeb->free_size);
>> -                       goto restart;
>> +               else{
>> +                       if (jeb->free_size != 
>> c->sector_size -
>> + 
>> c->cleanmarker_size) {
>> +                               printk(KERN_WARNING "Eep. 
>> Block 0x%08x taken
>> from free_list had free_size of 0x%08x!!\n", jeb->offset, 
>> jeb->free_size);
>> +                               goto restart;
>> +                       }
>>                }
>>        }
>>        /* OK, jeb (==c->nextblock) is now pointing at a 
>> block which
>> definitely has
>> --- a/fs/jffs2/scan.c   2008-09-16 20:48:12.000000000 
>> +0530
>> +++ b/fs/jffs2/scan.c   2008-09-19 17:07:48.000000000 
>> +0530
>> @@ -534,7 +534,10 @@ static int jffs2_scan_eraseblock 
>> (struct
>>                }
>>        }
>>
>> -       buf_ofs = jeb->offset;
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
>> +               buf_ofs = jeb->offset + c->wbuf_pagesize;
>> +       else
>> +               buf_ofs = jeb->offset;
>>
>>        if (!buf_size) {
>>                /* This is the XIP case -- we're reading 
>> _directly_ from the
>> flash chip */ @@ -582,7 +585,10 @@ static int 
>> jffs2_scan_eraseblock (struct
>>        }
>>
>>        /* Now ofs is a complete physical flash offset as 
>> it always was...
>> */
>> -       ofs += jeb->offset;
>> +       if (c->mtd->flags == MTD_CAP_MLCNANDFLASH)
>> +               ofs += jeb->offset + c->wbuf_pagesize;
>> +       else
>> +               ofs += jeb->offset;
>>
>>        noise = 10;
>>
>> --- a/fs/jffs2/wbuf.c   2008-09-16 20:48:12.000000000 
>> +0530
>> +++ b/fs/jffs2/wbuf.c   2008-09-19 17:07:48.000000000 
>> +0530
>> @@ -873,6 +873,13 @@ int jffs2_flash_writev(struct 
>> jffs2_sb_i
>>                        vlen -= wbuf_retlen;
>>                        outvec_to += wbuf_retlen;
>>                        c->wbuf_ofs = outvec_to;
>> +                       if (c->mtd->flags == 
>> MTD_CAP_MLCNANDFLASH) {
>> +                               /* adjust write buffer 
>> offset,
>> +                                * else we get a non 
>> contiguous write bug
>> +                                */
>> +                               if (!(c->wbuf_ofs % 
>> c->sector_size))
>> +                                       c->wbuf_ofs = 
>> 0xffffffff;
>> +                       }
>>                        donelen += wbuf_retlen;
>>                        v += wbuf_retlen;
>>                }
>> --- a/include/mtd/mtd-abi.h     2008-09-16 
>> 20:48:12.000000000 +0530
>> +++ b/include/mtd/mtd-abi.h     2008-09-23 
>> 22:09:18.000000000 +0530
>> @@ -28,12 +28,14 @@ struct mtd_oob_buf {
>>  #define MTD_BIT_WRITEABLE      0x800   /* Single bits 
>> can be flipped */
>>  #define MTD_NO_ERASE           0x1000  /* No erase 
>> necessary */
>>  #define MTD_POWERUP_LOCK       0x2000  /* Always locked 
>> after reset */
>> +#define MTD_OOB_WRITEABLE      0x4000
>>
>>  // Some common devices / combinations of capabilities
>>  #define MTD_CAP_ROM            0
>>  #define MTD_CAP_RAM            (MTD_WRITEABLE | 
>> MTD_BIT_WRITEABLE |
>> MTD_NO_ERASE)
>>  #define MTD_CAP_NORFLASH       (MTD_WRITEABLE | 
>> MTD_BIT_WRITEABLE)
>>  #define MTD_CAP_NANDFLASH      (MTD_WRITEABLE | 
>> MTD_OOB_WRITEABLE)
>> +#define MTD_CAP_MLCNANDFLASH   (MTD_WRITEABLE)
>>
>>  /* ECC byte placement */
>>  #define MTD_NANDECC_OFF                0       // Switch 
>> off ECC (Not
>> recommended)
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
