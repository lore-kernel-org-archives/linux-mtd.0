Received: from e5.ny.us.ibm.com ([32.97.182.105])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bdv42-0001fy-6e
	for linux-mtd@lists.infradead.org; Fri, 25 Jun 2004 14:04:39 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.60.0406251337240.3573@localhost.localdomain>
References: <Pine.LNX.4.60.0406251337240.3573@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1088186673.8241.16.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Fri, 25 Jun 2004 13:04:33 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: couple problems with JFFS2 on a PPC-based embedded system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-06-25 at 12:45, Robert P. J. Day wrote:
>    i'm hoping this is the right place to ask a couple questions 
> regarding some weirdnesses using JFFS2 on a PPC-based embedded system.

yep, right place.

> 
>    first, some sudden errors that just cropped up during a boot on
> one of the boards:
> =============================================
> ...
> Waiting for write to complete timed out in do_write_oneword.<5>Write 
> of 2209
> byt
> es at 0x00737610 failed. returned -5, retlen 480

that is from the MTD flash driver, not JFFS2.  but still the right
place.

> Scheduling in interrupt
> kernel BUG at sched.c:564!
> Oops: Kernel Mode Software FPU Emulation, sig: 8
> NIP: C000E028 XER: 00000000 LR: C000E028 SP: C1581F10 REGS: c1581e60 
> TRAP:
> 1000
>     Not tainted
> MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
> TASK = c1580000[172] 'tar' Last syscall: 4
> last math 00000000 last altivec 00000000
> GPR00: C000E028 C1581F10 C1580000 0000001B 00001032 00000001 00000001
> FFFFFFFF
> GPR08: 00000000 C015A0C8 0000001B C1581E20 FA200000 1006D20C 00000000
> 00000000
> GPR16: 00000000 00000000 00000000 00000000 00009032 01581F40 00000000
> C0004670
> GPR24: C00043E0 10003CF0 100094B4 00000004 00000005 7FFFDAA8 00000000
> C1581F10
> Call backtrace:
> C000E028 C000468C 00000000 100411E8 10040A54 10040B04 10005F40
> 10007AD4 10009524 10004E4C 1000418C 10003D70 0FE70E88 00000000
> Kernel panic: Aiee, killing interrupt handler!
> In interrupt handler - not syncing
> =============================================

ksymoops is helpful for these.  without it, nobody can really make sense
of the addresses here.

> 
> upon reboot, then, we get:
> 
> jffs2_scan_inode_node(): Data CRC failed on node at 0x0071dc4c: Read
> 0x92d5b956,
>   calculated 0x571a911d
> jffs2_scan_inode_node(): Data CRC failed on node at 0x00737610: Read
> 0x17cf0524,
>   calculated 0x07b0d4c4

kinda expected since the write to flash didn't work.

[snip]

> 
> p.s.  given that this is a 2.4.22-pre8 kernel, should i download the 
> latest mtd kernel stuff and update?  the current drivers/mtd directory
> appears to be dated mar, 2002.  at least, that's the date in the 
> Makefile.

yes, updating to the latest stuff usually helps.  also, what flash chips
are you using, what board, etc?

josh
