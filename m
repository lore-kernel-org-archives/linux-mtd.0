Received: from sm1.novariant.com ([76.238.142.74])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NAt03-0007wa-33
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 22:27:47 +0000
Subject: How to cleanup holes for successfully jffs2 booting with uboot?
From: Philippe Gagnon <philippe.gagnon@novariant.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 18 Nov 2009 17:24:09 -0500
Message-Id: <1258583049.29896.13.camel@NV20102.novariant.com>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm running uboot 1.3.4 and linux 2.6.29.2. I'm booting on a NOR flash
with a JFFS2 filesystem.

When updating the boot NOR flash files with new kernel, ramdisk and dtb
files, I have to cleanup the NOR jffs2 partition by triggering the jffs2
garbage collector (jffs2_gcd_mtd0) several times. Without cleaning the
jffs2 partition, sometimes uboot is unable to reboot.

My suspicion is that uboot doesn't support holes in the jffs2 boot
partition. I found a note in uboot that reinforces that doubt.

>From linux prompt, I would like to cleanup holes in the NOR jffs2
partition in a efficient manner. Right now, I'm triggering the jffs2
garbage collector (jffs2_gcd_mtd0) a lot of times. I'm also using
jffs2dump to inspect the JFFS2 partition. I stop to trigger the garbage
collector when the "jffs2dump -c /dev/mtd0 | grep name" gives a single
record for each file name. This process can last for several minutes
(from 2 to 20 minutes). This process duration is too long for our
application.

Any advices on how to better cleanup JFFS2 holes from linux prompt?

Anyone have similar issues with uboot and jffs2 boot partition? What is
your workaround?

Thanks in advance

Philippe Gagnon
