Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137me5-0002HU-00
	for mtd-list@infradead.org; Thu, 29 Jun 2000 23:18:53 +0100
Received: from web5304.mail.yahoo.com ([216.115.106.113])
	by infradead.org with smtp (Exim 3.03 #1)
	id 137me4-0002HK-00
	for mtd@infradead.org; Thu, 29 Jun 2000 23:18:52 +0100
Message-ID: <20000629222128.18411.qmail@web5304.mail.yahoo.com>
Date: Thu, 29 Jun 2000 18:21:28 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: using MTD with 2.2.14
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Our group has a target board consisting of an ARM
processor and Intel Strataflash with an embedded Linux
OS running kernel 2.2.14.

Following David's advice from before, I would like to
use JFFS instead of ext2-on-FTL.  But I have noticed
in the mailing list that people are warned against
using 2.2.14 and should switch to 2.2.16.  

Currently this ins't possible for our project, so will
MTD (JFFS) work properly for me with 2.2.14?

For my compile, I start with the 2.2.14 kernel, copy
in compatmac.h from 2.2.16.  Now I am confused.  In
a previous email, David advised me to select the 
following options from 'make oldconfig':

   Memory Technology Device (MTD) support
   Common Flash Interface (CFI) support
   CFI support for Intel/Sharp Extended Command Set
chips
   CFI chips on memory bus support
   Direct blockdevice access to MTD devices
   Journalling Flash filesystem (JFFS) support

If I apply 'mtd-patch-2.2.16', I can enable these
with 'make oldconfig', but am I not supposed to use
this patch since it is for 2.2.16?

Also, I use this patch, and then when I compile I get
the following errors (I include only one section for
brevity, but all the errors relate to 
"get_module_symbol" and "put_module_symbol"):
drivers/mtd/mtdlink.o: In function `cfi_probe':
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:54:
undefined reference to `put_module_symbol'
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:54:
relocation truncated to fit: R_ARM_PC24
put_module_symbol
drivers/mtd/mtdlink.o: In function `check_cmd_set':
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:466:
undefined reference to `get_module_symbol'
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:466:
relocation truncated to fit: R_ARM_PC24
get_module_symbol
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:470:
undefined reference to `get_module_symbol'
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:470:
relocation truncated to fit: R_ARM_PC24
get_module_symbol
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:475:
undefined reference to `put_module_symbol'
/home/kelly/armbuild/linux/drivers/mtd/cfi_probe.c:475:
relocation truncated to fit: R_ARM_PC24
put_module_symbol

But these functions are in the 2.2.16 patch, aren't
they?  What am I doing wrong?

Thanks for any help,
   -- kelly


_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
