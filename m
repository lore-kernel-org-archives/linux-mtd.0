Received: from smtp003.mail.ukl.yahoo.com ([217.12.11.34])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlOze-0002Z3-DS
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 07:36:14 -0400
Message-ID: <447D7F83.1000500@yahoo.fr>
Date: Wed, 31 May 2006 13:35:31 +0200
From: jfaslist <jfaslist@yahoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: I/O errors from do_erase_oneblock()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a question on the chips/cfi_cmdset0002.c:do_erase_oneblock()  
function (see below). It is probably a stupid question but I can't find 
the answer:

-What is the use of  INVALIDATE_CACHE_UDELAY (seems to be just a call to 
cfi_udelay() ) . I guess I don't understand the reason for having this 
delay, plus the HZ*20 delay in the following for(;;) loop.
-After the function do a "add_wait_queue" and "schedule", what code is 
going to send a "wake_up()" to end the wait?

My problem is that on erase, I get I/O errors coming  from this 
function. I have added call to cfi_udelay() (up to 12ms) and that seems 
to solve the problem (even though ST Micro claims worst case is 6ms). 
But I  prefer to understand what's going on. I have a suspicion that 
chip_ready() may be ending the for(;;) loop too soon causing chip_good() 
to fail.

My geometry is:
-interleave = 4
-bankwidth = 8 (64b)
p/n = ST MICRO M29DW640

I use the  MTD code from linux-2.6.15

Thanks for the help,
-jf simon


static int __xipram do_erase_oneblock(struct map_info *map, struct 
flchip *chip, unsigned long adr, int len, void *thunk)
{
        struct cfi_private *cfi = map->fldrv_priv;
        unsigned long timeo = jiffies + HZ;
        DECLARE_WAITQUEUE(wait, current);
        int ret = 0;

        adr += chip->start;

        spin_lock(chip->mutex);
        ret = get_chip(map, chip, adr, FL_ERASING);
        if (ret) {
                spin_unlock(chip->mutex);
                return ret;
        }

        DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
               __func__, adr );

        XIP_INVAL_CACHED_RANGE(map, adr, len);
        ENABLE_VPP(map);
        xip_disable(map, chip, adr);

        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
        cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
        map_write(map, CMD(0x30), adr);

        chip->state = FL_ERASING;
        chip->erase_suspended = 0;
        chip->in_progress_block_addr = adr;
 

     INVALIDATE_CACHE_UDELAY(map, chip,
                                adr, len,
                                chip->erase_time*500);

        timeo = jiffies + (HZ*20);

        for (;;) {
                if (chip->state != FL_ERASING) {
                        /* Someone's suspended the erase. Sleep */
                        set_current_state(TASK_UNINTERRUPTIBLE);
                        add_wait_queue(&chip->wq, &wait);
                        spin_unlock(chip->mutex);
                        schedule();
                        remove_wait_queue(&chip->wq, &wait);
                        spin_lock(chip->mutex);
                        continue;
                }
                if (chip->erase_suspended) {
                        /* This erase was suspended and resumed.
                           Adjust the timeout */
                        timeo = jiffies + (HZ*20); /* FIXME */
                        chip->erase_suspended = 0;
                }

                if (chip_ready(map, adr)) {
                        xip_enable(map, chip, adr);
                        break;
                }

                if (time_after(jiffies, timeo)) {
                        xip_enable(map, chip, adr);
                        printk(KERN_WARNING "MTD %s(): software timeout\n",
                                __func__ );
                        break;
                }

                /* Latency issues. Drop the lock, wait a while and retry */
                UDELAY(map, chip, adr, 1000000/HZ);
        }
        /* Did we succeed? */
        if (!chip_good(map, adr, map_word_ff(map))) {
                /* reset on all failures. */
                map_write( map, CMD(0xF0), chip->start );
                /* FIXME - should have reset delay before continuing */

                ret = -EIO;
        }

        chip->state = FL_READY;
        put_chip(map, chip, adr);
        spin_unlock(chip->mutex);
        return ret;
}

                                    


	

	
		
___________________________________________________________________________ 
Yahoo! Mail réinvente le mail ! Découvrez le nouveau Yahoo! Mail et son interface révolutionnaire.
http://fr.mail.yahoo.com
