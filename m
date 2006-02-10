Received: from wnpgmb02-group-smtpout.mts.net ([142.161.130.102]
	helo=mx-mtaout02.mts.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7fYV-00012G-BM
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 16:11:54 -0500
Received: from wnpgmb02-c600c.mts.net ([172.17.170.22])
	by mx-mtaout02.mts.net with ESMTP
	id <20060210211150.YGJW1253.mx-mtaout02.mts.net@wnpgmb02-c600c.mts.net>
	for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2006 15:11:50 -0600
From: bogdan antonovici <bantonovici@priority.mb.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1139605727.24845.10.camel@rd-lab>
Mime-Version: 1.0
Date: 10 Feb 2006 15:08:47 -0600
Content-Transfer-Encoding: 7bit
Subject: i need a mtd tree release which works with 2.4.24 kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Can anyone specify a mtd tree release which works with linux kernel
2.4.24 (arch mpc860)?

I tried different cvs revisions but i either get:

jffs2_read_inode(): No data nodes found for ino #

when i use early revisions or i get a system crash:


MTD_open
MTD_read
Oops: kernel access of bad area, sig: 11
NIP: C000DDB8 XER: 00000000 LR: C000DDB0 SP: C0CF9E00 REGS: c0cf9d50
TRAP: 0dMSR: 00001032 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00000000, DSISR: 0000013E
TASK = c0cf8000[24] 'cat' Last syscall: 3
last math 00000000 last altivec 00000000
GPR00: 00001032 C0CF9E00 C0CF8000 00000001 00009032 00000001 C0CDBFFC
FFFFFF
GPR08: FFFFFFFF 00000000 FFFFFFFF 00000001 00002000 1005AED8 00000000
000000
GPR16: 00000000 00000000 00000000 00000000 00009032 00002000 C0CDA000
C01B1B
GPR24: C0160000 C0160FC0 C01B1B70 00000001 00000003 C01B1B88 00000000
C0CF9E
Call backtrace:
00000000 C00B5CC0 C00B3A00 C00B33FC C00ADE1C C00AE9F8 C0035538
C00040DC 1003465C 1002F7E4 100091E0 1000355C 10003198 0FE6EDA0
00000000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing

when i use revisions from mtd release(or around).

Thank you.

Bogdan
