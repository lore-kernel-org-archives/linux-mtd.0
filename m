Received: from [202.181.134.4] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACy5h-0005Xn-IG
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 10:18:41 +0100
Message-ID: <3F98EE07.20006@hectrix.com>
Date: Fri, 24 Oct 2003 17:16:55 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Setting up compressed rootfs on DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am used to running a DOC patched grub firmware on my DOC 2000 (16MB)
with nftl, following the instructions of Karim's book. Since the space
is running out, I am interested in using a compressed root fs.

I followed mtd-jffs-HOWTO.txt (1.16) to build a compressed root fs on
DOC. That is, I copied my root fs to a ramdisk, dd'd it through gzip to
a compressed gz file, dd'd it to an offset of 1MB on /dev/mtd0 and
rdev'd the kernel image (967KB) about the offset and the device to be
used. Then I came to a problem of how to install the kernel on the DOC.

The HOWTO says I can use any boot loader, like lilo, to install the
kernel, or just place the kernel on the device and boot from it
directly. I got confused here, as I am used to using a grub firmware,
which hooks to int 19h as a bios extension. When it is booted, it
understands the DOC and can load my kernel image from my root fs on the
ext2 partition on the DOC.

But in here, how should I install my kernel image? I tried dd'ing it to
the start of my DOC, like creating a boot floppy, but it doesn't seem
like a boot device to the bios. Should I still install a grub firmware
and a small partition for storing my kernel image, and then dd my
compressed root fs after the partition? Or is there any other more
clever ways?

Selwyn
