Received: from [203.115.19.131] (helo=matrix.mediasolv.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15iolG-0004Hb-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 04:07:55 +0100
Message-ID: <000e01c13f27$2f029f60$941373cb@mediasolv.com>
From: "Kugan" <kugan@mediasolv.com>
To: <linux-mtd@lists.infradead.org>, <jffs-dev@axis.com>
References: <F1BED55F35F4D3118C0F00E0295CFF4D995554@webmail.mediatrix.com> <26220.995294549@redhat.com> <3B52FE8B.8F2736C6@daniel.com>
Subject: jffs & amd_flash.c
Date: Sun, 16 Sep 2001 20:16:38 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi All
I am new to this mailing list.
I have uClinux 2.0.38 kernel running on Atmel EB63 Evaluation board, there I
have ATMEL AT491604 90 TC flash.  I have partitioned the flash with pnc2000.
after mounting the jffs when i try to create a file on the partitione it is
going into this function and adding the task to waiq and calling and
schedule and seems it is struck there,
Where does this waitq consumed and what could be the mistake????
Thanx in Advance

Kugan

tatic int write_one_word(struct map_info *map, struct flchip *chip,
     unsigned long adr, __u32 datum)
{
 unsigned long timeo = jiffies + HZ;
 struct amd_flash_private *private = map->fldrv_priv;
 DECLARE_WAITQUEUE(wait, current);
 int ret = 0;
 int times_left;

retry:
 spin_lock_bh(chip->mutex);

 if (chip->state != FL_READY){
  printk("%s: waiting for chip to write, state = %d\n",
         map->name, chip->state);
  set_current_state(TASK_UNINTERRUPTIBLE);
  add_wait_queue(&chip->wq, &wait);

  spin_unlock_bh(chip->mutex);

  schedule();
  remove_wait_queue(&chip->wq, &wait);
  printk(KERN_INFO "%s: woke up to write\n", map->name);
  if(signal_pending(current))
   return -EINTR;

  timeo = jiffies + HZ;

  goto retry;
 }

 chip->state = FL_WRITING;

 adr += chip->start;
 ENABLE_VPP(map);
 send_cmd(map, chip->start, CMD_PROGRAM_UNLOCK_DATA);
 wide_write(map, datum, adr);

 times_left = 500000;
 while (times_left-- && flash_is_busy(map, adr, private->interleave))

  if (current->need_resched) {
   spin_unlock_bh(chip->mutex);
   schedule();
   spin_lock_bh(chip->mutex);
  }
 }

 if (!times_left) {
  printk(KERN_WARNING "%s: write to 0x%lx timed out!\n",
         map->name, adr);
  ret = -EIO;
 } else {
  __u32 verify;
  if ((verify = wide_read(map, adr)) != datum) {
   printk(KERN_WARNING "%s: write to 0x%lx failed. "
          "datum = %x, verify = %x\n",
          map->name, adr, datum, verify);
   ret = -EIO;
  }
 }

 DISABLE_VPP(map);
 chip->state = FL_READY;
 wake_up(&chip->wq);
 spin_unlock_bh(chip->mutex);

 return ret;
}
