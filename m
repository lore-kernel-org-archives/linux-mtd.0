Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HsiDR-0005Tb-Eg
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 12:37:07 -0400
Subject: JFFS2 panic in 2.6.22-rc3
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 28 May 2007 18:36:28 +0200
Message-Id: <1180370188.1468.112.camel@gentoo-jocke.transmode.se>
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

Got this when booting with JFFS2 rootfs:
jffs2_scan_eraseblock(): Node at 0x02bff96c {0x1985, 0xe002, 0x00000000) has invalid CRC 0x80024289 (calculated 0xd55ea7b7)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff974: 0x8002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff98c: 0x4644 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff990: 0x4644 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff994: 0x4644 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff9a4: 0x0600 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff9a8: 0xea20 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff9ac: 0x4c21 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff9b0: 0x785e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02bff9b4: 0x310a instead
Further such events for this erase block will not be printed
PHY: e0102320:1a - Link is Up - 100/Full
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 140k init
PHY: e0102320:18 - Link is Up - 100/Full
argh. node added in wrong place
Unable to handle kernel paging request for data at address 0xffffffee
Faulting instruction address: 0xc00d4fbc
Oops: Kernel access of bad area, sig: 11 [#1]
TMCUTU
NIP: c00d4fbc LR: c00dca80 CTR: c0140b8c
REGS: cfcf9d00 TRAP: 0300   Not tainted  (2.6.22-rc3)
MSR: 00009032 <EE,ME,IR,DR>  CR: 84000428  XER: 20000000
DAR: ffffffee, DSISR: 20000000
TASK = c07d8be0[191] 'getty' THREAD: cfcf8000
GPR00: c00dca80 cfcf9db0 c07d8be0 cff66400 ffffffea 06b55340 cfcf1f28 3872ddb1 
GPR08: 00000000 00000000 00000000 465b1d21 00000000 10078b2c 0fffd100 007fff87 
GPR16: 00000001 ffffffff 00000000 0fff79d8 00000000 c0250000 cfcf9e08 00000000 
GPR24: cff66400 00000002 cfcf9ee0 cff54a38 c0230848 ffffffea cff66400 c024f4b4 
NIP [c00d4fbc] jffs2_mark_node_obsolete+0x1c/0x508
LR [c00dca80] jffs2_do_setattr+0x29c/0x654
Call Trace:
[cfcf9db0] [c07ec000] 0xc07ec000 (unreliable)
[cfcf9e00] [c00dca80] jffs2_do_setattr+0x29c/0x654
[cfcf9e40] [c00dce4c] jffs2_setattr+0x14/0x24
[cfcf9e50] [c00738bc] notify_change+0x2b0/0x2f8
[cfcf9e80] [c005ab80] sys_fchmodat+0xc0/0xdc
[cfcf9f40] [c000f0e8] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xff5e428
    LR = 0x1003f584
Instruction dump:
38210020 7c0803a6 4e800020 4bf2f069 4bffffe8 9421ffb0 7c0802a6 bf61003c 
7c9d2379 7c7e1b78 90010054 41820450 <809d0004> 548007be 2f800001 419e0364

This don't happen on 2.6.20, the Magic bitmask 0x1985 not found at .. is printed but no panic.
Don't know how I got the corruption in the first place.

 Jocke
