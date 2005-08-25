Received: from c-24-91-108-216.hsd1.ma.comcast.net ([24.91.108.216]
	helo=ahgu.homeunix.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8JqA-0005Qi-EI
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 11:40:34 -0400
Message-ID: <115601c5a98b$8b856290$1f1a12ac@atitech.com>
From: "ahgu" <ahgu@ahgu.homeunix.com>
To: <tglx@linutronix.de>
References: <10af01c5a978$c336df10$1f1a12ac@atitech.com>
	<1124977495.20120.111.camel@tglx.tec.linutronix.de>
Date: Thu, 25 Aug 2005 11:41:59 -0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"; reply-type=original
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: simulate a bad NAND block cause kernel hang
Reply-To: ahgu <ahgu@ahgu.homeunix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using 2.4.18 kernel.

jffs2_erase_failed(c, jeb);is the last function before the fault condition 
get triggered.
Where can I find the diff between 2.4.18 and 2.4.20?

void jffs2_erase_block(struct jffs2_sb_info *c, struct jffs2_eraseblock 
*jeb)
{
 int ret;
#ifdef __ECOS
       ret = jffs2_flash_erase(c, jeb);
       if (!ret) {
               jffs2_erase_succeeded(c, jeb);
               return;
       }
#else /* Linux */
 struct erase_info *instr;

 instr = kmalloc(sizeof(struct erase_info) + sizeof(struct 
erase_priv_struct), GFP_KERNEL);
 if (!instr) {
  printk(KERN_WARNING "kmalloc for struct erase_info in jffs2_erase_block 
failed. Refiling block for later\n");
  spin_lock(&c->erase_completion_lock);
  list_del(&jeb->list);
  list_add(&jeb->list, &c->erase_pending_list);
  c->erasing_size -= c->sector_size;
  c->dirty_size += c->sector_size;
  jeb->dirty_size = c->sector_size;
  spin_unlock(&c->erase_completion_lock);
  return;
 }

 memset(instr, 0, sizeof(*instr));

 instr->mtd = c->mtd;
 instr->addr = jeb->offset;
 instr->len = c->sector_size;
 instr->callback = jffs2_erase_callback;
 instr->priv = (unsigned long)(&instr[1]);

 ((struct erase_priv_struct *)instr->priv)->jeb = jeb;
 ((struct erase_priv_struct *)instr->priv)->c = c;

 /* NAND , read out the fail counter, if possible */
 if (!jffs2_can_mark_obsolete(c))
  jffs2_nand_read_failcnt(c,jeb);

 ret = c->mtd->erase(c->mtd, instr);
 if (!ret)
  return;

 kfree(instr);
#endif /* __ECOS */

 if (ret == -ENOMEM || ret == -EAGAIN) {
  /* Erase failed immediately. Refile it on the list */
  D1(printk(KERN_DEBUG "Erase at 0x%08x failed: %d. Refiling on 
erase_pending_list\n", jeb->offset, ret));
  spin_lock(&c->erase_completion_lock);
  list_del(&jeb->list);
  list_add(&jeb->list, &c->erase_pending_list);
  c->erasing_size -= c->sector_size;
  c->dirty_size += c->sector_size;
  jeb->dirty_size = c->sector_size;
  spin_unlock(&c->erase_completion_lock);
  return;
 }
 if (ret == -EROFS)
  printk(KERN_WARNING "Erase at 0x%08x failed immediately: -EROFS. Is the 
sector locked?\n", jeb->offset);
 else
  printk(KERN_WARNING "Erase at 0x%08x failed immediately: errno %d\n", 
jeb->offset, ret);

 jffs2_erase_failed(c, jeb);
}



----- Original Message ----- 
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "ahgu" <ahgu@ahgu.homeunix.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, August 25, 2005 9:44 AM
Subject: Re: simulate a bad NAND block cause kernel hang


> On Thu, 2005-08-25 at 09:27 -0400, ahgu wrote:
>> I forced the flash_erase function to fail. I expect the jffs2 will pick 
>> up
>> the return error and mark the block bad and put the bad block in a 
>> bad_block
>> list. But what I get is kernel failure:
>> I get similar error when I simulate a write error.
>> Am I doing the bad block simulation correctly? Is this a correct 
>> response?
>> What is supposed to happen when the NAND flash grow a bad block?
>
> JFFS2 should handle this.
>
> The oops trace is worthless, as it does not show the stack trace in
> human readable form (function names decoded)
>
> Make sure that CONFIG_KALLSYMS is set in your kernel .config file.
>
> Also information about kernel version and possibly applied MTD/JFFS2
> patches is missing.
>
>
> tglx
>
> 
