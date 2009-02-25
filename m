Received: from ey-out-1920.google.com ([74.125.78.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcLgL-0006FU-En
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 15:28:24 +0000
Received: by ey-out-1920.google.com with SMTP id 4so20371eyg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Feb 2009 07:28:20 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 25 Feb 2009 16:28:20 +0100
Message-ID: <87c084000902250728h6f231484x72728780e5f5669f@mail.gmail.com>
Subject: Error on mounting jffs2 partition
From: saravanan chanemouganandam <chanemouganandam@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a jffs2 mtd partition mounted to /mnt/rw. After performing file
operations like mv, cp, rm into the partition and on next reboot,
the system failed to mount the jffs2 mtd partition. It throws the
following error while trying to mount
...
JFFS2 error: (2162) jffs2_link_node_ref: Adding new ref c3d769b8 at
(0x00000000-0x00000030) not immed
iately after previous (0x00000000-0x00000000)
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3f10000
[00000000] *pgd=03f0d031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.26.2 #56)
pc : [<c00c0d54>]    lr : [<c002fb6c>]    psr: 60000013
sp : c3f0fbe4  ip : c020830c  fp : c3f0fc14
r10: c3e85600  r9 : 00000006  r8 : c3eda1b0
r7 : 00000030  r6 : c3e85000  r5 : c3d769b8  r4 : c3e85600
r3 : 00000000  r2 : a0000013  r1 : 00000001  r0 : 00000096
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 000039ff  Table: 03f10000  DAC: 00000015
Process mount (pid: 2162, stack limit = 0xc3f0e260)
Stack: (0xc3f0fbe4 to 0xc3f10000)

Does doing file operations corrupt the jffs2 mtd partition ? Why I get
jffs2 error on the next mount of jffs2 partition ?
