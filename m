Received: from h209-139-192-234.gtconnect.net ([209.139.192.234]
	helo=marmot.intrinsyc.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193hi4-0001yg-Lo
	for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2003 20:27:44 +0100
Message-Id: <200304101926.h3AJQ8b05913@marmot.intrinsyc.com>
From: Chris Sperandeo <csperandeo@intrinsyc.com>
To: linux-mtd@lists.infradead.org, tglx@linutronix.de
Date: Thu, 10 Apr 2003 12:26:08 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 8bit
Subject: JFFS2 on NAND reboot problems
Reply-To: csperandeo@intrinsyc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have pulled the latest from CVS server, applied the changes and retested.   
There seems to be no change in behaviour.  Any other suggestions?

Regards,

Chris

On Thursday 10 April 2003 02:20, Chris Sperandeo wrote:
> Hi,
>
> Wondering if anyone has experienced a bug described as follows.
>
> I am using the linux powerpc kernel 2.4.21-pre2.  We are using a March
> 09 2003 snapshot for MTD/JFFS2 from
> http://www.linux-mtd.infradead.org/.
>
> After rebooting the device we occasionally receive the following: ...
Could you please upgrade to latest CVS and try again ?

--
Thomas 
________________________________________________________________________
linutronix - competence in embedded & realtime linux http://www.linutronix.de
mail: tglx@linutronix.de

Hi,

Wondering if anyone has experienced a bug described as follows.

I am using the linux powerpc kernel 2.4.21-pre2.  We are using a March 09
2003 snapshot for MTD/JFFS2 from http://www.linux-mtd.infradead.org/.

After rebooting the device we occasionally receive the following:

*********************************
jffs2_get_inode_nodes(): CRC failed on node at 0x00d8a9c0: Read 0xffffffff,
calculated 0x4deb59e5

jffs2_get_inode_nodes(): Data CRC failed on node at 0x00d89a8c: Read
0xbaa193f5, calculated 0xcdd1fe6c Checked all inodes but still 0x1c20 bytes
of unchecked space? kernel BUG at gc.c:140!
Oops: Exception in kernel mode, sig: 4
NIP: C00A0420 XER: 00000000 LR: C00A0420 SP: C033FF10 REGS: c033fe60 TRAP:
0700
 Not tainted
MSR: 00009030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c033e000[8] 'jffs2_gcd_mtd1' Last syscall: -1
last math 00000000 last altivec 00000000
PLB0: bear= 0x00000000 acr=   0x00000000 besr=  0x00000000
PLB0 to OPB: bear= 0x00000000 besr0= 0x00000000 besr1= 0x00000000

GPR00: C00A0420 C033FF10 C033E000 00000018 00001030 00000001 00000020 C01F0000
GPR08: 00003DA8 C01A5D04 00000000 C033FE30 82004028 1001F598 00FE4100 007FFF2F
GPR16: 00000000 00000001 007FFF00 FFFFFFFF 00FDF920 00000000 00F9F548 00000002
GPR24: 00000000 C01AB4AC 00000000 FFFFFFFF 00000000 C035CDB8 C03CF0F8 
C03CF0C4 Call backtrace: C00A0420 C00A3790 C0006F00
**********************************

It appears that something has gone wrong with the garbage collection thread
(at least that is one of the theories).  Inserting a delay before actually
rebooting the device seems to remedy the problem somewhat but does not make
the problem dissappear.

Is it possible that the garbage collection thread is not given enough time to
do its works before the device is rebooted?

Any solution or suggestions on what avenues to a solution would be greatly
appreciated.

Regards,

Chris
