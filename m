Received: from mailserv.intranet.gr ([146.124.14.106])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJu1L-0003Z5-D2
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 09:27:27 -0400
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.13.1/8.13.1) with ESMTP id i9JDS7Q3002623
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Oct 2004 16:28:07 +0300 (EEST)
Message-ID: <41751511.2060607@intracom.gr>
Date: Tue, 19 Oct 2004 16:22:25 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: David Ho <DavidHo@nanometrics.ca>
References: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>
In-Reply-To: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 behaviour when large number of files are created.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Ho wrote:

>
>
>Hi all,
>
>I have a snapshot of the CVS MTD/JFFS2 code from Sept 22 patched into a
>2.4.24 kernel.  In the process of running a varied set of applications on
>the system, a program was creating a large number of small files each less
>than 1KB.  The Linux card is powered up for a short period of time to dump
>data to persistent storage, then it is powered down for until the next data
>dump.  As the sytem is run, the mount is becoming slower to a point that
>the watchdog is reset the card.
>
>It appears that JFFS2 is bad for certain usage patterns.  Creating large
>number of files is one.  What other usage patterns should I avoid?
>
>Creating a large file?
>Removing and updating a large file?
>
>Also , the kernel is crashing at one instance in gc.c.  Is this a known
>problem in 2.4?
>
>Checked all inodes but still 0x406868 bytes of unchecked space?
>kernel BUG at gc.c:139!
>Oops: Kernel Mode Software FPU Emulation, sig: 8
>NIP: C009DBF4 XER: 00000000 LR: C009DBF4 SP: C7DADEF0 REGS: c7dade40 TRAP:
>1000
>   Not tainted
>MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
>TASK = c7dac000[8] 'jffs2_gcd_mtd2' Last syscall: -1
>last math 00000000 last altivec 00000000
>GPR00: C009DBF4 C7DADEF0 C7DAC000 00000018 00001032 00000001 00000000
>C01C0000
>GPR08: 000010F4 C0191590 00000000 C7DADE10 42008024 1001E76C 07FFC000
>007FFF16
>GPR16: 00000000 00000001 007FFF00 07FFABA0 00000000 FFFFFFFF 07FBADE8
>00000002
>GPR24: 00000000 C7FA5918 00000000 C7FA5928 C7DADFB8 C7DB32C0 C7FA58F4
>C7FA5928
>Call backtrace:
>C009DBF4 C00A0E20 C0006D00
>
>Regards,
>David Ho
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>  
>
I can confirm the same behaviour on 2.4.28 + latest snapshot.

Now what?

Any ideas for a workaround?

Regards

Pantelis
