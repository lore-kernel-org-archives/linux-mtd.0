Received: from saturn.open-widgets.com ([209.251.101.200]
	helo=saturn.billgatliff.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AhkvJ-0002Gp-Dq
	for linux-mtd@lists.infradead.org; Sat, 17 Jan 2004 07:31:13 +0000
Received: from billgatliff.com (meta-adsl-71.mtco.com [207.179.223.71])
	by saturn.billgatliff.com (Postfix) with ESMTP id 9E9F44E0004
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Jan 2004 01:29:01 -0600 (CST)
Message-ID: <4008E43E.3080009@billgatliff.com>
Date: Sat, 17 Jan 2004 01:29:02 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Using mtdparts= right?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guys:


I need a quick sanity check here.  I'm giving this to my arm-linux 
2.4.21-rmk1 kernel (and the MTD code it contains, I'm not running from 
CVS sources):

root=/dev/mtdblock0 mtdparts=csb337-nor:1536000@0x8d43c(root)ro ...

I've added a maping for "csb337-nor", which starts at the first physical 
address of flash and contains the whole flash.  My romfs root image 
starts at an offset of 0x8d43c from the beginning of that flash.

I get this during boot:

...
CSB337-NOR: 0x00800000 at 0x10000000
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
mtd: Giving out device 0 to NOR flash on CSB337
CSB337-NOR: using command line partition definition
Creating 1 MTD partitions on "NOR flash on CSB337":
0x0008d43c-0x0020443c : "root"
mtd: Giving out device 1 to root
...

Then I get this:

...
NetWinder Floating Point Emulator V0.97 (double precision)
mtdblock_open
ok
mtdblock: read on "NOR flash on CSB337" at 0x0, size 0x400
mtdblock_release
ok
Kernel panic: VFS: Unable to mount root fs on 1f:00


I have romfs turned on, and I've stepped through a lot of code in the 
kernel during boot.  What I've noticed is that get_sb_bdev() is 
returning EBUSY.  I also don't understand why MTD is reading 0x400 bytes 
from the start of flash, when it should be getting the superblock from 
0x8d43c.

Ideas?  I'm on my way to step through get_sb_bdev() now...


Thanks!


b.g.

-- 
Bill Gatliff
Embedded GNU, Linux, and other board support packages.
bgat@billgatliff.com
