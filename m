Received: from 69.37.115.40.ded.snet.net ([69.37.115.40] helo=www.necii.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ceawy-0003hx-LJ
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 10:20:26 -0500
In-Reply-To: <1103066223.3406.82.camel@tglx.tec.linutronix.de>
To: tglx@linutronix.de
Message-ID: <OFF0986582.CD5BFAE1-ON85256F6B.0050207B-85256F6B.00544174@necii.com>
From: MQuicquaro@necii.com
Date: Wed, 15 Dec 2004 10:19:17 -0500
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 - mtd - nand flash works....except....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>






Ok. Thanks.  My problem must be elsewhere then.
>From what you say, jffs2 will never do subsector writes.
Is that correct?  Is there a configuration option maybe that
controls this?

My problem is that, in my 2 MB kernel MTD partition, I place
my 750K kernel.  There is like a 50-50% chance that when I
write this kernel, when I boot the system, it reports a CRC error.
If I diff the file with a known good one it shows no differences.
Hmm, maybe I have a problem with my U-boot reading NAND.

If anyone has any ideas please let me know.
Thanks.
- Mike

Here is the output:

U-Boot 1.0.2 (Dec 10 2004 - 21:31:52)
CPU:   MPC870ZPnn at 50 MHz: 8 kB I-Cache 8 kB D-Cache FEC present
Board: NEC Infrontia, Inc. - DSX rev. 1.0 DRAM:  (16 MB SDRAM) 16 MB
FLASH:  1 MB
AMD AM29LV800B (8 Mbit, bottom boot sect)
  Size: 1 MB in 19 Sectors
  Sector Start Addresses:
    FE000000 (RO) FE004000 (RO) FE006000 (RO) FE008000 (RO) FE010000 (RO)
    FE020000 (RO) FE030000      FE040000      FE050000      FE060000
    FE070000      FE080000      FE090000      FE0A0000      FE0B0000
    FE0C0000      FE0D0000      FE0E0000      FE0F0000
In:    serial
Out:   serial
Err:   serial
NAND:  16 MB
Net:   FEC ETHERNET
Hit any key to stop autoboot:  0
NAND read: device 0 offset 0, size 2097152 ...  2097152 bytes read: OK
### JFFS2 loading 'vmlinux.pkg' to 0x100000
Scanning JFFS2 FS: . done.
### JFFS2 load complete: 750562 bytes loaded to 0x100000
## Booting image at 00100000 ...
   Image Name:   Linux kernel for PQ2FADS
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    750498 Bytes = 732.9 kB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... Bad Data CRC
=>



                                                                           
             Thomas Gleixner                                               
             <tglx@linutronix.                                             
             de>                                                        To 
                                       MQuicquaro@necii.com                
             12/14/2004 06:17                                           cc 
             PM                        linux-mtd@lists.infradead.org       
                                                                   Subject 
                                       Re: jffs2 - mtd - nand flash        
             Please respond to         works....except....                 
             tglx@linutronix.d                                             
                     e                                                     
                                                                           
                                                                           
                                                                           
                                                                           




On Tue, 2004-12-14 at 18:09 -0500, MQuicquaro@necii.com wrote:
> Just about everything seems to be working great as far as I can see
> except subsector writing.

Subsector writes are not permitted in the nand driver.

I'm curious why you don not get an error on write.

Hmm, someone should fix nandtest and remove the subsector stuff.

tglx
