Received: from ool-18be22cd.dyn.optonline.net ([24.190.34.205] helo=iral.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1705fA-0005bn-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Apr 2002 20:09:17 +0100
From: "Albert Rybalkin" <albertr@forbes.net>
To: linux-mtd@lists.infradead.org
Subject: mtd partitions on Sharp Zaurus
Date: Tue, 23 Apr 2002 19:08:45 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <20020423190845.486244B001@iral.com>
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

Hi, 

I'm new to linux and mtd, sorry if my post is misdirected... 

I have a Sharp Zaurus PDA with 16MB sharp flash rom. There's a linux
mtd chip driver `coolie_sharp.c` written by Sharp/Lineo for this
flash chip (there's two 8MB chips actually for total of 16MB in there).
This PDA comes with linux 2.4.6 kernel and initrd
that has root partition mounted as cramfs. Both zImage and initrd can
be flashed into the rom separately. Apparently, rom has some kind
of partitioning already. There's a boot loader in the flash rom, no
separate program to perform flashing. 

I have source code for most of the kernel (save for couple of
closed-source drivers for which I have binary KLMs). But I don't
have source code or any documentation on sharp boot loader/flash
program. 

With the sharp stock kernel I have a couple of mtd devices, i.e.: 

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00020000 "mtdrom"
mtd1: 02200000 00000400 "mtdram"
# 

Also, I have /dev/collie-fl that I think is a flash chip device. 

I've recompiled the kernel to remove cramfs and use jffs2 instead
for a root partition. 

But I'm in a complete dark as of how I need to partition flash rom
chip and map its partions to mtd block devices. Is there any user
space program exist that can enumerate and display existing partitions
which are already in the flash? Is there any documentation I can read
on how to partition flash?
Thanks,
 -albertr 
