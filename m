Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GLiJm-0005TC-V6
	for linux-mtd@lists.infradead.org; Fri, 08 Sep 2006 16:31:00 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1GLiZU-0000aK-7N
	for linux-mtd@lists.infradead.org; Fri, 08 Sep 2006 17:47:12 +0200
Message-ID: <45018BE6.5040102@kernelconcepts.de>
Date: Fri, 08 Sep 2006 17:27:34 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Again 2.6.18-RC6 XScale P30 issues
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

Hi, me again ...
I am sorry to bother you again, but I still have issues withe the P30
flashes.
Now that I can write to the chips I tested it a little more. After a
fresh write of a clean rootfs I can create and delete files almost fine
(I just get very few CRC errors but everything else works OK, also the
files are intact).

But after creating and deleting files and a reboot I get:

----------
[42949375.760000] Write of 68 bytes at 0x00cf91d0 failed. returned -30,
retlen 0
[42949375.770000] Not marking the space at 0x00cf91d0 as dirty because
the flash driver returned retlen zero
[42949375.780000] Write of 68 bytes at 0x00cf91d0 failed. returned -30,
retlen 0
[42949375.780000] Not marking the space at 0x00cf91d0 as dirty because
the flash driver returned retlen zero
ifup: /var/run/ifstate: Read-only file system

............

Starting telnetd...
Starting slideshow with images from the internal flash...
Starting pid 695, console /dev/ttyS0: '/bin/sh'

Processing /etc/profile... Done
[@colineator /]#cd
[@colineator /root]#ls -l
-rw-r--r--    1 0        0         5242880 Jan  1 00:14 blub
[@colineator /root]#rm blub
[42949387.590000] Write of 44 bytes at 0x00cf91d0 failed. returned -30,
retlen 0
[42949387.600000] Not marking the space at 0x00cf91d0 as dirty because
the flash driver returned retlen zero
[42949387.610000] Write of 44 bytes at 0x00cf91d0 failed. returned -30,
retlen 0
[42949387.620000] Not marking the space at 0x00cf91d0 as dirty because
the flash driver returned retlen zero
rm: unable to remove `blub': Read-only file system
----------------

So something is still wrong. At runtime the filesystem seems to be OK
but after a reboot it seems to be defect. Only way to recover is to
reflash the rootfs.

I am quite desperate right now.
For the new approach I took the Mainstone MTD mapping driver and
modified it for the single two-chip configuration. But I did not change
anything beyond that.

Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
