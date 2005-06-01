Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DdTTW-0001zY-P2
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2005 09:41:40 -0400
Date: Wed, 1 Jun 2005 15:41:30 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050601134130.GA19482@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there!

I have intel K3 devices on my Board and the linux Kernel needs to unlock
them.
I found
http://lists.infradead.org/pipermail/linux-mtd/2005-April/012431.html
and incorporated the provided diff into a daily-mtd-cvs snapshot from
20050530 in 2.6.11.
However, this code Oopses in cfi_intelext_unlockall():

static void cfi_intelext_unlockall(struct mtd_info *mtd)
{
#if 1
        int i;
        for (i = 0; i <= mtd->numeraseregions; i++) {
                printk("mtd->numeraseregions %x\n", mtd->numeraseregions);
                int j;
                printk("rumms\n");
                printk("mtd->eraseregions[0].numblocks %x\n", 
                                mtd->eraseregions[i].numblocks);
                printk("bumms\n");
...

The printk("mtd->eraseregions[0].numblocks %x\n", 
				mtd->eraseregions[i].numblocks);

causes The Oops. How is that possible?
Also weird is that mtd->numeraseregions is 0.


Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank              
 Intel/Sharp Extended Query Table at 0x0031             
Using buffer write method                  
  Feature/Command Support:      01E6
     - Chip Erase:              unsupported
     - Suspend Erase:           supported  
     - Suspend Program:         supported
     - Legacy Lock/Unlock:      unsupported
     - Queued Erase:            unsupported
     - Instant block lock:      supported  
     - Protection Bits:         supported
     - Page-mode read:          supported
     - Synchronous read:        supported
     - Simultaneous operations: unsupported
  Supported functions after Suspend: 01    
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0007           
     - Lock Bit Active:      yes  
     - Valid Bit Active:     yes
     - Unknown Bit 2 Active: yes
  Vcc Logic Supply Optimum Program/Erase Voltage: 3.3 V
cfi_cmdset_0001: Erase suspend on write enabled        
number of CFI chips: 1                         
devsize              16777216
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
mtd->numeraseregions 0              
rumms                 
Unable to handle kernel NULL pointer dereference at virtual address 00000008

After that I tried another approach like that in message
http://lists.infradead.org/pipermail/linux-mtd/2005-April/012396.html 
so the for loop went away in a replacement for the oneliner which calls
cfi_intelext_unlock(). This function is called and Oopses at
cfi_varsize_frob(mtd, do_printlockstatus_oneblock,
                ofs, len, 0);
imediately.

What can be the cause of that?
Has anybody Intel K3 unlocking working and if yes, how is his or her map
driver looking?

Regards, konsti
