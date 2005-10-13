Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQ4HT-0006cl-E8
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2005 10:43:50 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.101.118])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 13 Oct 2005 14:41:24 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 8484D62EC
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Oct 2005 16:40:29 +0200 (CEST)
Message-ID: <434E7211.6020709@gmail.com>
Date: Thu, 13 Oct 2005 16:41:21 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: /dev/mtd* not there with latest MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm using a modified 2.6.11 kernel running on a Hynix eval board with 
NOR flash. Using the existing MTD works fine (CONFIG_MTD_BLOCK and 
CONFIG_MTD_CHAR enabled), MTD is using a custom map and is running fine. 
U-Boot uses nfsroot.

Today I patched in the latest CVS snapshot (2005-10-10). Kernel is 
starting without problems (MTD debug level 3):

 > H720x-MTD probing 32bit FLASH
 > H720X: Found 2 x16 devices at 0x0 in 32-bit bank
 >  Intel/Sharp Extended Query Table at 0x0031
 > Using buffer write method
 > cfi_cmdset_0001: Erase suspend on write enabled
 > cmdlinepart partition parsing not available
 > Using builtin partition table
 > Creating 5 MTD partitions on "H720X":
 > 0x00000000-0x00080000 : "ArMon"
 > mtd: Giving out device 0 to ArMon
 > 0x00080000-0x000c0000 : "Env"
 > mtd: Giving out device 1 to Env
 > 0x000c0000-0x00240000 : "Kernel"
 > mtd: Giving out device 2 to Kernel
 > 0x00240000-0x00640000 : "Ramdisk"
 > mtd: Giving out device 3 to Ramdisk
 > 0x00640000-0x02000000 : "jffs2"
 > mtd: Giving out device 4 to jffs2

But: there is no /dev/mtd* or /dev/mtdblock* at all!
There are no changes to u-boot or some other kernel config, only the new 
MTD source.

Patching the kernel with 2005-06-21 CVS results in having only 
/dev/mtdblock*, but no /dev/mtd*!..... very confusing.

I would be glad if someone could help, I can provide more information if 
needed.

Regards,
Bernhard
