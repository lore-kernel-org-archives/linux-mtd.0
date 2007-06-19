Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I0dJE-0000co-49
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 08:59:49 -0400
Subject: Re: JFFS2 OOPS in linus tree
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1181819720.30670.367.camel@gentoo-jocke.transmode.se>
References: <1181819720.30670.367.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Jun 2007 14:59:31 +0200
Message-Id: <1182257971.2969.66.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-06-14 at 13:15 +0200, Joakim Tjernlund wrote:
> Two times I have gotten this OOPS at boot:
> 
> argh. node added in wrong place
> Unable to handle kernel paging request for data at address 0xffffffee
> Faulting instruction address: 0xc00d5244
> Oops: Kernel access of bad area, sig: 11 [#1]
> TMCUTU
> NIP: c00d5244 LR: c00dcd34 CTR: c014145c
> REGS: cfd23d00 TRAP: 0300   Not tainted  (2.6.22-rc4)
> MSR: 00009032 <EE,ME,IR,DR>  CR: 84000428  XER: 20000000
> DAR: ffffffee, DSISR: 20000000
> TASK = cff6a0f0[201] 'getty' THREAD: cfd22000
> GPR00: c00dcd34 cfd23db0 cff6a0f0 cff2d000 ffffffea 02c885c4 c060e524 4671100e 
> GPR08: 00000000 00000000 00000000 46713eb7 00000000 10078b2c 0fffd100 007fff87 
> GPR16: 00000001 ffffffff 00000000 0fff79d8 00000000 c0250000 cfd23e08 00000000 
> GPR24: cff2d000 00000002 cfd23ee0 cff8ea38 cff62aac ffffffea cff2d000 c024b4b4 
> NIP [c00d5244] jffs2_mark_node_obsolete+0x1c/0x508
> LR [c00dcd34] jffs2_do_setattr+0x29c/0x654
> Call Trace:
> [cfd23db0] [c07ec000] 0xc07ec000 (unreliable)
> [cfd23e00] [c00dcd34] jffs2_do_setattr+0x29c/0x654
> [cfd23e40] [c00dd100] jffs2_setattr+0x14/0x24
> [cfd23e50] [c0073818] notify_change+0x28c/0x2c0
> [cfd23e80] [c005ac70] sys_fchmodat+0xc0/0xdc
> [cfd23f40] [c000f148] ret_from_syscall+0x0/0x38
> --- Exception: c01 at 0xff5e428
>     LR = 0x1003f584
> Instruction dump:
> 38210020 7c0803a6 4e800020 4bf2ede1 4bffffe8 9421ffb0 7c0802a6 bf61003c 
> 7c9d2379 7c7e1b78 90010054 41820450 <809d0004> 548007be 2f800001 419e0364 
> Node totlen on flash (0x00000006) != totlen from node ref (0x00000090)
> 
> I can't reproduce it, but I figured I should report it.

Keep getting these oops on 2.6.22-{rc4,rc5}. Once it stayed and didn't
go away until I booted a 2.6.20 kernel and swapped back afterwards to
2.6.22-rcX.

I get these traces on boot too:
jffs2_scan_eraseblock():
Node at 0x02c87e44 {0x1985, 0xe002, 0x00000006) has invalid CRC 0x4a400110 (calculated 0x3c3d0282)
...
jffs2_scan_eraseblock():
Node at 0x06997cac {0x1985, 0xc002, 0x00000006) has invalid CRC 0x4a400110 (calculated 0x3c3d0282)
...
jffs2_scan_eraseblock():
Node at 0x073617c4 {0x1985, 0xe002, 0x00000006) has invalid CRC 0x08410102 (calculated 0x3c3d0282)

To repeat, boot a JFFS2 root fs enabled board, do reboot -f
Repeat few times.

Don't have time to track this down ATM as I have to find a few other bugs in our 2.6.20
kernel. I do think JFFS2 is broken in 2.6.22 though

 Jocke
