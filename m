Received: from sccmmhc92.asp.att.net ([204.127.203.212])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgiMi-0005Za-JU
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 09:16:35 -0400
From: jmrobert5@mchsi.com
To: linux-mtd@lists.infradead.org
Date: Thu, 18 May 2006 13:08:00 +0000
Message-Id: <051820061308.1998.446C71B000096E03000007CE219791336303010CD2079C080C03BFCA9B9D0A0D019D0306@mchsi.com>
Subject: DoC 2000 and Grub 0.92 not Booting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

We have used DoC and MTD code and patches before on a system that is a PC104
booting from a DoC 2000.  We were using 12Mb and 16Mb parts.  Building Grub 0.92
and kernel 2.4 once we got it working we just gave the codeover to production
for duplication. No Problems.  I remember it took us a long time to get it all
working.  Unfortunately notes and scribbles have been lost in more than 1 move
since then.

Now for Rev 2.0.  This time I have DoC 2000 32, 48 and 96 Mb parts.  Series 2200
and 2202.

I cannot get Grub to Boot.  This is the most common error I get:
A few 
"_DoC_WaitReady  timed out..."
followed by
"Sorry, we don't support UnitSizeFactor of !=1 yet"

Whereupon it then drops to the Grub commandline prompt.  But dc0,0 is not
available.  I have 2 ext2 formatted partitions, neither of which are visible.
Once I got it to just go to grub command line.  But still the partitions were
not available.

I thought is was because theres no (or corrupted) NFTL Header, so I rebuilt a
DoC and used nftl_format, but I get the same error.

Heres my process:
Host 1.  Linux 2.4.31
patch and compile Grub-0.92 with Mtd utils 20060505 snapshot
compile the utils.
ftp grub_firmware and utils to Host 2

Host 2 Linux 2.6.12
DoC in ISA socket card
1. Boot DOS from floppy with MSys tools (5.1.4)
2. DFORMAT /WIN:d000 /BDKL0:98304
3. PowerOff restart
4. Boot to Linux 2.6.12
5. doc_loadbios /dev/mtd0 grub_firmware
6. PowerOff restart
7. Boot to Linux 2.6.12
8. fdisk /dev/nftla
    setup 2 linux partitions
9. mke2fs -i 1024 /dev/nftla1  (and 2)
10. Copy my system to each partition
11. Power off, remove DoC, insert into PC104 and see the error above.


I will happily update the Grub patches and even move these patches up to Grub
0.97, but I'll need help, as I don't understand all the intricacies...

Anything else I can try???

--
Joe Robertson
Yamaha YZF600R Thundercat
