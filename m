Received: from [63.109.252.174] (helo=nikunj)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Hk4d-0003Cf-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2001 11:40:02 +0100
To: linux-arm-kernel@lists.arm.linux.org.uk 
Subject: Kernel 2.4.5 dumped on executing Ghostscript.
Cc: ndadhania@yahoo.com, jffs-dev@axis.com, linux-mtd@lists.infradead.org
From: nikunj@bindaas.org (Nikunj A. Dadhania)
Date: 04 Jul 2001 16:10:46 +0530
Message-ID: <868zi53rkh.fsf@bindaas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I am using v2.4.5 with patch-2.4.5-rmk7 and diff-2.4.5-rmk7-np1 patches

Earlier i used v2.4.2 with patch-2.4.2-rmk2 and diff-2.4.2-rmk2-np2 patches.

And I also patched the kernel with mtd. 
I am using jffs2 on the flash. Earlier i used jffs2 with 2.4.2 with no 
problems, but since i have switched to 2.4.5 I m getting lot of  
messages like this:

jffs2_scan_empty(): Empty block at 0xXXXXXXXX end at 0xXXXXXXXX (with 0x20031985)! Marking dirty

I partitioned jffs2 using 2.4.2. Is this the reason of this warnings? 
Sometimes it gives kernel panic also during giving warnings.

The dump follows:

--------------------------------------------------------------------------

jffs2_scan_empty(): Empty block at 0x017c0000 ends at 0x017c0000 (with 0x20031985)! Marking dirty
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0204000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: 0
CPU: 0
pc : [<00000000>]    lr : [<c02ba578>]
sp : c01fddb0  ip : 00000007  fp : c01fde18
r10: 017ff740  r9 : c01fde54  r8 : c01e8ac4
r7 : 00000000  r6 : c032c940  r5 : 00000000  r4 : c01fdcd0
r3 : 00000000  r2 : 00000019  r1 : 00000000  r0 : 00000000
Flags: nzcv  IRQs on  FIQs on  Mode USER_26  Segment kernel
Control: C020717F  Table: C020717F  DAC: 0000001D
Process swapper (pid: 1, stackpage=c01fd000)
Kernel panic: Attempted to kill init!

---------------------------------------------------------------------------

Please guide me in this regard.

Thanks in advance.

regards,

Nikunj A. Dadhania

PS: I am not subscribed to the list. Please reply personally.
