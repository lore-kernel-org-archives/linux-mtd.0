Received: from natwar.webmailer.de ([192.67.198.70] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XiIa-0001J6-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 14:04:56 +0100
From: "Patrik Fuchs" <pfuchs@giga-stream.de>
To: <acurtis@onz.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: AW: Boot kernel right from JFFS2
Date: Thu, 25 Jul 2002 15:10:01 +0200
Message-ID: <MNEEJPPNAELHIHNGGLHOMEKICAAA.pfuchs@giga-stream.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <NCBBIINEHIPFGJPLBEIFGEJGDJAA.acurtis@onz.com>
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

Hello
I am sorry it took me so long to answer. ~> a lot of work!
I can already use jffs2 as root filesystem. I have created only two
partitions:
MTD0: JFFS2
MTD1: PPCBoot
I know the alternative to boot the kernel from a third partition. I ´ve got
this working too.
But I like to boot the kernel from the JFFS2 root filesystem. Say the kernel
image is in a directory named boot/images/compressedkernel.image within the
compressed kernel image.
Do you know how the ppcbootloader can handle this (copying the compressed
kernel image from the compressed JFFS image into RAM)? What kind of boot
arguments do I have to set?
Where and how can I look at the bios (You mean nodes, parent nodes and
inodenumbers....right?)?
Any help would be appreciated.
Thank you
Patrik
----------------------------------------------------------------------------
-------------------------------------------------

 Here are my basics: PPCBoot1.1.5, Walnut 405GP,
 8MB AMD NOR Flash with two partitions:
 MTD0 with JFFS2(root filesystem) on it and MTD1 with the bootloader
 PPCBoot1.1.5.
 Is it possible to boot a compressed kernel(Version 2.4.17) with ppcboot
 1.1.5 right from jffs2 as root filessystem residing on the first MTD
 partition?
----------------------------------------------------------------------------
-------------------------------------------------


We are not using ppcboot but this is what I did that seemed to make sense.
1. Create a minimum of 2 MTD partitions
2. Use the first MTD partition to store the compressed image. This is really
just a place holder and you never mount it.
3. You can either jump to the compressed image location if you are using the
embedded boot or copy it from flash into RAM, I assume this is something
that ppcboot can handle just fine.
4. Your default boot line will contain something like: root=/dev/mtdblock1.
Depending on your kernel, you may have to apply a patch so it recognizes
JFFS2 as a valid root file-system type. (I had this problem with HHL 2.0)

Using this approach eliminates the need for the BIOS to understand the
file-system structure. Of course there is also the initrd, mount jffs2 from
the ramdisk approach. Pick your poison.

Hope this helps...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
