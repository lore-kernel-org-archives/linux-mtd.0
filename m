Received: from mail.nanometrics.ca ([206.191.47.130])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJaME-0007kJ-N7
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2004 12:27:43 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>
From: David Ho <DavidHo@nanometrics.ca>
Date: Mon, 18 Oct 2004 12:28:14 -0400
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: JFFS2 behaviour when large number of files are created.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>





Hi all,

I have a snapshot of the CVS MTD/JFFS2 code from Sept 22 patched into a
2.4.24 kernel.  In the process of running a varied set of applications on
the system, a program was creating a large number of small files each less
than 1KB.  The Linux card is powered up for a short period of time to dump
data to persistent storage, then it is powered down for until the next data
dump.  As the sytem is run, the mount is becoming slower to a point that
the watchdog is reset the card.

It appears that JFFS2 is bad for certain usage patterns.  Creating large
number of files is one.  What other usage patterns should I avoid?

Creating a large file?
Removing and updating a large file?

Also , the kernel is crashing at one instance in gc.c.  Is this a known
problem in 2.4?

Checked all inodes but still 0x406868 bytes of unchecked space?
kernel BUG at gc.c:139!
Oops: Kernel Mode Software FPU Emulation, sig: 8
NIP: C009DBF4 XER: 00000000 LR: C009DBF4 SP: C7DADEF0 REGS: c7dade40 TRAP:
1000
   Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c7dac000[8] 'jffs2_gcd_mtd2' Last syscall: -1
last math 00000000 last altivec 00000000
GPR00: C009DBF4 C7DADEF0 C7DAC000 00000018 00001032 00000001 00000000
C01C0000
GPR08: 000010F4 C0191590 00000000 C7DADE10 42008024 1001E76C 07FFC000
007FFF16
GPR16: 00000000 00000001 007FFF00 07FFABA0 00000000 FFFFFFFF 07FBADE8
00000002
GPR24: 00000000 C7FA5918 00000000 C7FA5928 C7DADFB8 C7DB32C0 C7FA58F4
C7FA5928
Call backtrace:
C009DBF4 C00A0E20 C0006D00

Regards,
David Ho
