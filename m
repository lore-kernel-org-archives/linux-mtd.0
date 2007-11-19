Received: from smtp005.mail.ukl.yahoo.com ([217.12.11.36])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IuDcl-0003XO-E8
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 15:53:49 -0500
Message-ID: <4741F7D1.7090305@yahoo.fr>
Date: Mon, 19 Nov 2007 21:53:37 +0100
From: obelix0 <obelix0@yahoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: CramFS and "Unable to mount root fs on unknown-block(0,0)"
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody !

I would like to compile a 2.6.9 linux kernel for my flash.

Please look at my config file :
...
CONFIG_CMDLINE="rootfstype=jffs2 root=/dev/mtdblock/2 ro 
mtdparts=phys_mapped_flash:1m(firmware)ro,1m(kernel),20m(root),-(jffs2)"
CONFIG_CRAMFS=y
...

to have this schema on flash :
- 1Mo for firmware in read only
- 1Mo for Kernel in read only
- 20Mo for root file system in read only CramFS
- 14Mo for file system in read and write
- and ramFS for /tmp /etc /var

is it the right way to build the flash ?

I compiled my kernel and when I started, I had this error message :
------------------------------------------------------------------------------------------------------------
Now booting the kernel
Linux version 2.6.9-elinos-111 (gcc version 3.2.3 (ELinOS V3.1 3.2.3-35 
2005-07-04)) #1 Mon Nov 19 11:27:47 CET 2007
Kernel command line: rootfstype=cramfs root=/dev/mtdblock/2 ro 
mtdparts=phys_mapped_flash:1m(firmware)ro,1m(kernel)ro,20m(root)ro,-(jffs2)
...
physmap flash device: 4000000 at f0000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
...
4 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 4 MTD partitions on "phys_mapped_flash":
0x00000000-0x00100000 : "firmware"
0x00100000-0x00200000 : "kernel"
0x00200000-0x01600000 : "root"
0x01600000-0x04000000 : "jffs2"
...
Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(0,0)
------------------------------------------------------------------------------------------------------------

I compiled with cramfs in kernel, not as module, I checked my config 
file, I searched on the web but I haven't got any idea !

thanks for your help

Obelix
