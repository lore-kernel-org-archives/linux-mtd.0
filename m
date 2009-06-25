Received: from 82-71-36-240.dsl.in-addr.zen.co.uk ([82.71.36.240]
	helo=aardvark.hiddenengine.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJxjF-0003wd-ND
	for linux-mtd@lists.infradead.org; Thu, 25 Jun 2009 22:47:45 +0000
Received: from wolverine (unknown [192.168.0.104])
	by aardvark.hiddenengine.co.uk (Postfix) with ESMTPS id 85B083C056
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Jun 2009 23:42:51 +0100 (BST)
From: "Roger Lucas" <roger@hiddenengine.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: Longs spinlock on NOR reads
Date: Thu, 25 Jun 2009 23:41:19 +0100
Message-ID: <1F23C41C60CC4CA08789AE8461EF6044@wolverine>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

0123456789012345678901234567890123456789012345678901234567890123456789012345
6789

Dear MTD,

I am working with a customer with an embedded ARM-9 processor in a real time

system.  The system is running a stock 2.6.18 kernel and uses a NOR device
for 
its main storage.

We have noticed that when we perform large reads (> 32KB) from the FLASH
using
the /dev/mtdN device, the real-time performance of the system is impacted
and
interrupts get held off.  We did some digging and found that the kernel will

permit reads up to 128KB in size to be made via the mtd driver in a single
read
call.  This in turn passes through the mtd driver and ends up at the chip
code.
In our case, we are using the 'cfi_cmdset_0002.c' driver.  When the call
arrives
at cfi_amstsd_read(), since it is within the single NOR chip that we are
using,
a single call is made to do_read_onechip().  This function takes a spinlock,

performs the FULL memory copy and releases the spinlock.  It is the long 
duration of the spinlock over the full memory copy that is impacting our 
real-time performance.

If a NOR chip has ~70ns access time then an efficient memory subsystem
should 
be able to make ~10M accesses per second.  If the chip is 16-bits wide then 
a 128KB copy will ~7ms.  This is a long time to hold a spinlock in a 
real-time system.  We inspected the mtd driver code and it will only
fragment 
transfers over 128KB in length.

This problem does not occur with accesses to /dev/mtdblockN devices because 
they are automatically broken into 512 byte sectors.  It is a problem with
/dev/mtdN devices and also with JFFS2 operations.

We have a simple fix that splits up read accesses into 512 byte chunks
within
cfi_amdstd_read() and performs multiple calls to do_read_onechip() until the
full data length has been copied.  There is no change to the external API
and 
the overall performance does not seem to be noticeably degraded even though
a lot more calls to do_read_onechip() are required.

Before going through the process of submitting patches etc., is this a 
problem that has been identified or experienced before?  I have searched the
mailing list but not seen any obvious references...

If it seems a reasonable observation and fix, would you like me to post a 
patch?  I can only patch and test the 'cfi_cmdset_0002.c' driver but it 
would be a simple process for it to be applied to the other chips.

Best regards,

Roger 
