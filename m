Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12QT49-0004y6-00
	for mtd-list@infradead.org; Thu, 02 Mar 2000 10:42:45 +0000
Received: from [202.112.136.2] (helo=dns.pubnic.buaa.edu.cn)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12QT45-0004y0-00
	for mtd@infradead.org; Thu, 02 Mar 2000 10:42:42 +0000
Received: from pita ([210.78.131.227]) by dns.pubnic.buaa.edu.cn (8.7.5/8.7.3) with SMTP id SAA28001 for <mtd@infradead.org>; Thu, 2 Mar 2000 18:47:09 +0800
Message-ID: <000d01bf8433$91592400$5800a8c0@pita>
From: "jyllyj" <pfrl@sina.com>
To: <mtd@infradead.org>
Subject: Re: Booting from the flash
Date: Thu, 2 Mar 2000 18:37:35 +0800
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:
    It appears that nftl_format deletes M-Systems' firmware.  I
    remember that David wrote something about fixing that.
    doc_loadbios seems to destroy the partition entirely.  Neither M-
    Systems' drivers nor MTD drivers can recognize anything on the
    flash after doc_loadbios.

    Is there a way to boot from a DOC2000 flash using MTD drivers?

    [BTW:  I was only successful at creating a 2.3 kernel with MTD
    drivers.  2.2 kernels don't seem to work.  I think I have an idea what
    could be wrong, and I'll try to test it soon]
in my case I had some experience about it
1:get mtd-20000131 release and grub from GNU's CVS

2:change doc_stage1.S like this
.......
   3. Return, and wait for our INT 18h to be called.
 */

  /* Store the DiskOnChip segment */
 movw %ds, %cs:doc_seg

  /* Find top of memory */
 xorw %ax, %ax
 movw %ax, %ds
 movw 0x0413, %ax

  /* Set up our shiny net INT 18h handler */



  /* Steal 1K from the top */
 decw %ax
 movw %ax,0x0413

  /* Generate segment address */
 shlw $6,%ax
 movw %ax,%es

  /* Debug: print the address at which we're installing */
 pushw %cs
 popw %ds

  /* Copy ourself into the new segment we've just reserved */
 movw $0x80, %cx
 cld
 xorw %si,%si
 xorw %di,%di
 rep
 movsw

 xorw %ax, %ax
 movw %ax, %ds

 movw %es,0x0062
 movw $int18,0x0060
........

3:compile grub

4:cp /cvs/grub/stage2/pre_stage2  /mtd-20000131/grub/

5:compile mtd-20000131

6:inmod mtd
    insmod doc2000

7: cd /mtd-20000131/grub
doc_loadbios /dev/mtd0 grub_firmware

8:reboot into dos
i use int18 just for test.so you must make a floppy to boot it
in my case like it
    in dos
    debug
-a
-xxxx:100 int 18
-
-w 100 0 0 1
-q
i write 512 byte to floppy boot sector.just to execute int 18 interrupt at
floppy boot stage

9:reboot and use floppy boot.if all is ok.you can execute into grub command
interface

Is someone dealing with that grub boot from DOC? i 'm hacking grub code but
only
can do something that "periphery" because I can't read ntfl's partition in
doc.is anyone
doing it? some advice?

David Woodhourse,how are you ?





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
