Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GJ7Ru-0004gR-9m
	for linux-mtd@lists.infradead.org; Fri, 01 Sep 2006 12:44:39 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1GJ7gB-0002DV-RO
	for linux-mtd@lists.infradead.org; Fri, 01 Sep 2006 13:59:25 +0200
Message-ID: <44F81C58.1030203@kernelconcepts.de>
Date: Fri, 01 Sep 2006 13:41:12 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem with strata flash in 2 x 16bit config
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!
I have a little bit of an issue here and am already quite despereate...

We have a PXA270 based board here running a Linux kernel 2.6.10 which is
to almost 100% based on the Mainstone kernel. Also the board is mostly
based on Mainstone.

The board contains, besides other less important stuff, two Intel Strata
 flash chips (64MByte each) in 32-bit (2 x 16) data bus configuration
connected to CS0 and the appropriate address bus lines. The address bus
and CS0 are both equally connected to both flash chips. The data bus is
connected D0-D15 to chip one and D16-D31 to chip two.

In general the flash chips are detected properly and can be read
properly (programmed via BLOB). But as soon as I write to a flash
partition from a booted Linux system I get chip timeouts and other MTD
errors. (see buttom of email for some log output...)

According to other mailinglists and patches this configuration should be
supported by MTD if 32-bit banksize (CONFIG_MTD_MAP_BANK_WIDTH_4) and
CONFIG_MTD_CFI_I2 is enabled, correct?
This is enabled in our kernel config.

Is there anything else that needs to be taken care of to properly enable
32-bit data bus width with two chips? The bankwidth is detected
properly, but just to make sure I already hard-coded this in the
map_info struct. But still no proper write.

This is the first time we use a 32-bit configuration so I am not very
experienced with this - the 16-bit config worked quite well ;)


If anyone has a hint for me I would be very happy ;)
And if desired I would gladly post my experience and potential solution
here too.

Many thanks in advance!

Cheers
  nils faerber


Some logged messages...
Kernel startup:
(yes, I know, we did not make that kernel, the author used the PXA270
on-chip map-driver as template...)
---
Probing Intel PXA27x On-Chip ROM at physical address 0x00000000 (32-bit
bankwidth)
Intel PXA27x On-Chip ROM: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
No RedBoot partition table detected in Intel PXA27x On-Chip ROM
cmdlinepart partition parsing not available
Using static partitions on Intel PXA27x On-Chip ROM
Creating 4 MTD partitions on "Intel PXA27x On-Chip ROM":
0x00000000-0x00040000 : "Bootloader"
0x00040000-0x00240000 : "Kernel"
0x00240000-0x01240000 : "Filesystem"
0x01240000-0x01740000 : "User"
---


Writing to root-fs:
---
[root@Linux /root]#dd if=/dev/zero of=./blub2 bs=1k count=1k
Waiting for chip to be ready timed out. Status afd908
Write of 68 bytes at 0x00dd2f0c failed. returned -5, retlen 0
Not marking the space at 0x00dd2f0c as dirty because the flash driver
returned retlen zero
Waiting for chip to be ready timed out. Status afd908
Write of 68 bytes at 0x00dd2f0c failed. returned -5, retlen 0
Not marking the space at 0x00dd2f0c as dirty because the flash driver
returned retlen zero
dd: ./blub2: Input/output error
---
and from here on the root-fs is damaged.


Writing to the fourth yet unused "User" partition:
---
[root@Linux /root]#dd if=/dev/zero of=/dev/mtdblock3 bs=1k count=1
1+0 records in
1+0 records out
[root@Linux /root]#dmesg
Node CRC 00800080 != calculated CRC 4bf2ff8d for node at 000d4704
-sh: dmesg: Input/output error
---
and after that the root-fs is effectively broken. Sometimes it works
again after reboot.
