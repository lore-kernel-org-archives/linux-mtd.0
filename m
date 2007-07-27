Received: from mtagate2.de.ibm.com ([195.212.29.151])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IEPuj-0002IQ-GL
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 09:31:46 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id l6RDVItT209374
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 13:31:18 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l6RDVAqX2150494
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 15:31:18 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l6RDUsAC027501
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 15:30:54 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][MTD] CORE: sysfs support for mtd
Date: Fri, 27 Jul 2007 15:30:07 +0200
References: <1676.216.31.211.11.1185386926.squirrel@webmail.ics.uci.edu>
In-Reply-To: <1676.216.31.211.11.1185386926.squirrel@webmail.ics.uci.edu>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707271530.08809.alexs@linux.vnet.ibm.com>
Cc: sid@ics.uci.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Siddharth,

On Wednesday 25 July 2007, sid@ics.uci.edu wrote:
> 
> This patch adds sysfs support for mtd. It exports some of the members of the mtd_info structure
> into the user space via sysfs. The idea is to use sysfs as an alternative to using mtd ioctl(). 
> The following information from mtd_info struct [mtd.h] is exported as files:
> 
> - size              : Partition size
> - erasesize         : Size of erase block
> - writesize         : Page size
> - type              : On of the following -> Absent, RAM, ROM, NOR Flash, NAND Flash, Data flash
> - bbt               : List of bad blocks from device specific block_isbad() function
> - numeraseregions   : Number of erase regions
> 
> The master mtd partition appears as a directory under sysfs as /sys/devices/mtd. For each mtd
> partition (i.e., for each slave mtd found in mtdpart.c), a file under /sys/devices/mtd directory
> by name mtdN (N = partition number) is generated. A struct kobject kobj is added as member of
> struct mtd_info mtd [mtd.h] to enable mtd_info to become part of the kobjects hierarchy. The
> attributes to be exported are added as struct mtd_attr [mtdpart.c]. A soft link from
> /sys/bus/platform/devices/mtd points to /sys/deevices/mtd. Additional attributes can be added by
> adding an entry to the mtd_default_attrs[] structure [mtdpart.c]
> 
> It would be nice if the patch could be tested. I have tested it on a MIPS based board with NAND
> flash. (Please bear with me if the patch does not appear correctly. This is my first patch to the
> list and I have tested by sending the patch to myself as per the FAQs).

I have applied this patch to my tree and tried to compile it, but I get
lots of compile errors. Maybe you created it on an outdated kernel?!

/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c: In function `mtd_sysfs_rd_ecctype':
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:111: error: structure has no member named `ecctype'
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:112: error: `MTD_ECC_NONE' undeclared (first use in this function)
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:112: error: (Each undeclared identifier is reported only once
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:112: error: for each function it appears in.)
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:113: error: `MTD_ECC_RS_DiskOnChip' undeclared (first use in this function)
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:114: error: `MTD_ECC_SW' undeclared (first use in this function)
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:116: error: structure has no member named `ecctype'
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c: In function `mtd_sysfs_rd_eccsize':
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:122: error: structure has no member named `eccsize'
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c: In function `add_mtd_partitions':
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:510: warning: assignment from incompatible pointer type
/home/schmidta/git/ubi-2.6/drivers/mtd/mtdpart.c:511: error: invalid use of undefined type `struct subsystem'

Regards,
Alex
