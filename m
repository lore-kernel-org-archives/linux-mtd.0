Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkajf-0005rK-Lc
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 11:18:56 +0000
Message-ID: <4D493D95.6090005@keymile.com>
Date: Wed, 02 Feb 2011 12:18:45 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Numonyx NOR flash mutex problem when creating UBI volumes
Content-Type: text/plain;
	charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: Holger brunck <holger.brunck@keymile.com>, joakim.tjernlund@transmode.se,
	mboards@prograde.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,
we have on a powerpc based board with a new Numonyx P30 65nm 1GBit flash and
we see have problems with write errors when we create an ubi volume.

To find the problem I added few printk in the cfi_cmdset_0001.c
Adding a printk for erase suspend make the problem show always.
I expect a problem with the protection as discussed already in the thread
Numonyx NOR and chip->mutex bug?

I printed the time (using jiffies), the tid, the operation and address 
of the operation.


-bash-3.2# ubimkvol /dev/ubi0 -s 6MiB -N test_volume

  time   tid  operation               address of operation       my comments
--------------------------------------------------------------------------------- 

[0179][0209] do_erase_oneblock start adr=0x00000000             start 
erase block
[0187][0465] erase suspend           adr=0x01125000             erase 
suspend (strange adr)
[0191][0209] erase resumed           adr=0x00000000             erase 
resume  (correct adr)
[0199][0209] do_erase_oneblock end   adr=0x00000000             erase end
[1175][0465] 50000000.flash: buffer write error status 0xb0 
adr=0x01125400 len=0x400

program failed status (0xb0) ready & cmd sequence error

In addition I added all cmd sent to the flash in a buffer and print it 
in case of error.
Here is the log:

  time   tid  operation                                  my comments
--------------------------------------------------------------------------------- 

[0187][0209] do_erase_oneblock start adr=0x00000000     first thread  
Start with erasing adr=0
[0187][0209] map_write 0x50 to 0x00000000                             
Clr Status Reg
[0187][0209] map_write 0x20 to 0x00000000                      Block 
Erase adr=0
[0187][0209] map_write 0xd0 to 0x00000000                      Block 
Erase Confirm adr=0
[0187][0465] map_write 0xb0 to 0x01125000               second thread 
Erase suspend
[0191][0465] map_write 0x70 to 0x01125000                      Read 
Status Reg
[0191][0465] map_write 0xe8 to 0x01125000                             
Buffered Prog  adr=0x01125000
[0191][0209] map_write 0x70 to 0x00000000               first thread  
Read Status Reg
[0191][0209] map_write 0xd0 to 0x00000000                             
Resume (what!?!)
[0191][0209] map_write 0x70 to 0x00000000                             
Read Status Reg
[0199][0209] erase resumed 2b        adr=0x00000000                   
(Erase) Resumed Finsh
[0207][0209] do_erase_oneblock end   adr=0x00000000                   
Erase finished
[0207][0465] map_write 0x1ff to 0x01125000              second thread 
!!! contiune with Buffer Prog, write size
[0207][0465] map_write 0xc03c0000 to 0x01125000                       
write 512 word data to buf
[0207][0465] map_write 0xc03c0000 to 0x01125002
..
[0211][0465] map_write 0xc03c0000 to 0x011253fc
[0211][0465] map_write 0xc03c0000 to 0x011253fe
[0211][0465] map_write 0xd0 to 0x01125000                             
Buffered Prog Confirm
[1175][0465] map_write 0x50 to 0x01125000                  Clr Status Reg
[1175][0465] map_write 0x70 to 0x01125000                             
Read Status Reg
[1183][0465] 50000000.flash: buffer write error status 0xb0 
adr=0x01125400 len=0x0 (0x400)  Buffered Prog failed status (0xb0) ready 
& cmd sequence error

Conclusion:
I expect is a protection problem. A running erase is suspended due to 
write. But the write is not finished.
The erase is resumed in the middle of the buffered Prog preparation.

Do you have any ideas why this can happen?

Best Regards
Stefan Bigler
