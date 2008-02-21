Received: from smtp2.sssup.it ([193.205.80.100] helo=smpt2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JSGVI-0004rH-CH
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 18:50:45 +0000
Message-ID: <47BDC7EF.5060603@gandalf.sssup.it>
Date: Thu, 21 Feb 2008 19:50:23 +0100
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: Mangesh Edake <m_edake@yahoo.com>
Subject: Re: JFFS2 as rootfs on DataFlash
References: <389154.92868.qm@web50802.mail.re2.yahoo.com>
In-Reply-To: <389154.92868.qm@web50802.mail.re2.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mangesh Edake wrote:
Hi
> Hi Michel,
>
> Many thanks for your reply. 
>
> I tried with removing -s 0x210 option, so command now
> looks like,
> mkfs.jffs2 -p -l -e 0x2100 -n -d /home/me/rootdir -o
> jffs2.img
>
> At the same time I added erase command in the u-boot
> as suggested by you. But unfortunately the result is
> same...
>
> However I found that dataflash driver in u-boot
> doesnot deal with extra 16-bytes (oob) and doesnot
> write any JFFS2 specific magic bitmask, node crc,
> cleanmarker etc. info to the oob. But the nand flash
> (legacy) driver does the same in u-boot. Also
> kernel-mtd driver for at45 dataflash is missing with
> read_oob, write_oob functions whereas mtd-nand uses
> those routines. So my concern is, while copying the
> jffs2 image to dataflash is it necessory to write
> jffs2 specific info in oob region..? My assumption is,
> this info should be present in image itself and
> mkfs.jffs2 must take care of this while creating an
> image. (Please corret me if I'm wrong...)
> I've also seen code of nandwrite (mtd utility) where
> it uses -j option that takes care of jffs2_oobinfo.
>   
No,
using in linux flash_eraseall to clean your partition. Maybe start from 
a ramdisk.
It is the only partinion? If no, you must remember to align it at a 
block size.
Example my partionin start from 0x131400

setenv bootargs console=ttyS0,115200 mem=8M rootfstype=jffs2 
root=/dev/mtdblock1
rw mtdparts=spi0.1-AT45DB321x:1221k(ARMboot)ro,-@1221k(root)

For the creation use:
mkfs.jffs2 -d romfs -l -p -e 0x2100 -v -n -o images/ramdisk.img > log.txt

Let me know!!

Regards Michael
