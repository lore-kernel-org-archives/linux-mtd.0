Received: from chello080110132030.102.11.vie.surfer.at
	([80.110.132.30] helo=mail.hurricane.at ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0mjI-00008A-Gf
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 19:17:28 +0000
Date: Tue, 9 Mar 2004 20:14:15 +0100 (CET)
From: Matthias Gorjup <mgorjup@norik.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.10.10403092009150.21570-100000@mail.hurricane.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Writing 4k blocks to flashB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we are trying to optimize the speed of writing large files to flash
(Fujitsu MBM29LV650, 8 MB, 16bit). After using strace to see how long and
how often system calls are being performed, we have found out that writing
to flash is being done in 4kB large blocks and that each write
takes between 0.15 and 0.3 sec. Can we optimize this figures? Would it
make sense to modify mtd to write larger blocks to flash? Which files do
we need to change for this modification?

Best Regards

Matthias Gorjup
Norik Systems
www.norik.com
