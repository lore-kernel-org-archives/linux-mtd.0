Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9kyt-0004z2-ED
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 21:18:40 +0000
Received: by wyb28 with SMTP id 28so7542214wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 14:18:37 -0700 (PDT)
Message-ID: <4DA4C1AA.3030907@gmail.com>
Date: Tue, 12 Apr 2011 23:18:34 +0200
From: Leo <leo.costa77@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Numonyx NOR bug
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found a little problem with mtd drivers running on a LTIB linux 
distribution on a custom board equipped with a Freescale Coldfire and a 
Numonyx NOR Axcell M29EW flash memory. The do_erase_oneblock() function 
sometimes fails because the chip_good() functions returns zero reading a 
data word different from 0xffff. I spent some time debugging and finally 
I solved the problem adding a new chip state "FL_ERASE_STARTING" and 
setting it after the erase block command sequence as follows :

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

   chip->state = FL_ERASE_STARTING;

   INVALIDATE_CACHE_UDELAY(map, chip,
                        adr, len,
                        chip->erase_time);

   chip->state = FL_ERASING;
   chip->erase_suspended = 0;
   chip->in_progress_block_addr = adr;

   timeo = jiffies + (HZ*20);

   for (;;) {

This works because the Numonyx chip probably does not accept the erase 
suspend command during the erase block time-out (the 50 us after the 
command sequence has been sent and before the erase starts). In fact the 
INVALIDATE_CACHE_UDELAY() macro unlocks the mutex and lets 
reading/writing functions to suspend the erasing too soon calling the 
get_chip(). With the FL_ERASE_STARTING state get_chip() does not give 
the access to reading/writing functions during the 
INVALIDATE_CACHE_UDELAY() sleeping period (chip->erase_time).
Anyone into the same problem?

Thanks for reading!
Leonardo
