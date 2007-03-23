Subject: Re: NAND flash file system and JFFS2 problem
From: David Woodhouse <dwmw2@infradead.org>
To: Jakub =?UTF-8?Q?Bedn=C3=A1=C5=99?= <bednar.jakub@centrum.cz>
In-Reply-To: <200703220926.22574@centrum.cz>
References: <200703220926.22574@centrum.cz>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Mar 2007 12:26:17 +0000
Message-Id: <1174652777.20505.160.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-22 at 09:26 +0100, Jakub Bednář wrote:
> Hi,
>       I've spent long time reading all about mtd devices and I'd like 
> to check if I understood correctly.
> 
> 1.) The NFTL is usable ONLY for DOC, not for normal NAND flashes.
>       Thats why nftl_format prints unrecognized erase size 0x20000
> 
> 2.) FTL is usable ONLY with NOR flashes, that's why the ftl_format
>        ends with an error on trying to erase bad block on NAND in dmesg.
> 
> 3.) So there should be used JFFS2 on NAND, there is no good and reliable
>        way to run ext2 on NAND.

All correct, although you could also try yaffs or logfs.

> I've also encountered a problem.
>         I'm using kernel 2.6.16.20 from buildroot on DBAu1550 like board.
>         When running destroy test on Samsung NAND where I had ext2, 
>         I was using programs from busybox placed on NOR flash (jffs2) /dev/mtdblock0. 
>         Links like dd, cp, md5sum.
> 
>         NAND was mounted on /mnt/. After creating a 45MB file /mnt/file0 with dd
>         from /dev/zero  and running md5sum, something got wrong and all the links
>         from NOR jffs2 stopped working with lot's of errors in CRC codes. I wasnt writting
>         to the NOR jffs2 but I have it mounted rw.  After rebooting the NOR jffs2 is ok again!
> 
>         So maybe it mess up in RAM???  What can couse this trouble?

It's hard to say without seeing the errors. It sounds like the physical
access to the NOR flash got screwed up somehow, so you couldn't read it
correctly.

-- 
dwmw2
