Received: from web21002.mail.yahoo.com ([216.136.227.56])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BUdED-0007Jd-Hd
	for linux-mtd@lists.infradead.org; Sun, 30 May 2004 23:12:58 -0400
Message-ID: <20040531031229.87538.qmail@web21002.mail.yahoo.com>
Date: Sun, 30 May 2004 20:12:29 -0700 (PDT)
From: kas turi <inox_kas@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Floating point exception
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
  I have merged the latest JFFS2 filesystem, mtd
drivers and block drivers on my 2.4.7 timesys linux
kernel. The snap shot I have used for merging is
"mtd-snapshot-20040527.tar". I am running this kernel
on my 8270 Powerpc board with AM29LV128ML flash chip.
The bus width is 32, interleave is 2 and flash size is
32M. The kernel boots up with JFFS2 as the root file
system.
  All the file operations such as list, copy and
delete are working fine. Finally when I issue a
shutdown to boot  my board I get an exception:
floating point used in kernel (task=c5158000,
pc=ff000104)
Oops: Exception in kernel mode, sig: 4
NIP: FF020000 XER: 20000000 LR: FF000104 SP: C5159DE0
REGS: c5159d30 TRAP: 0700MSR: 00083002 EE: 0 PR: 0 FP:
1 ME: 1 IR/DR: 00
TASK = c5158000[931] 'shutdown' Last syscall: 114
last math 00000000 last altivec 00000000
GPR00: 00001032 C5159DE0 C5158000 001DF1D4 FF000104
00001002 00003854 C01E3459
GPR08: 00000013 C01E0000 0000C000 80000088 24022088
1001B608 10000000 7FFFFB48
GPR16: 10010000 00000000 00000000 00000004 00009032
05159F40 00000000 C0004070
GPR24: C0003DE0 7FFFFEDD 30029C78 00000008 C01BBBEC
C5158000 00000000 FF000104
Call backtrace:
7FFFFEDD 816100A8

The same kernel with 1.5 years old snapshot of JFFS2
works fine. Any idea what could be the issue.

Thanks in advance. 


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 
