Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aKcY-0001bi-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 19:24:22 +0100
Message-ID: <000701c23988$ff62dd80$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Cc: "Jobb" <joakim.tjernlund@lumentis.se>
References: <20020731121648.GA18892@wohnheim.fh-wedel.de>  <20020731115703.GB28984@wohnheim.fh-wedel.de> <20020731103419.GA23749@wohnheim.fh-wedel.de> <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com> <2881.1028115952@redhat.com> <4164.1028116749@redhat.com>  <6102.1028117866@redhat.com>
Subject: Oops when unlinking stale file
Date: Thu, 1 Aug 2002 20:26:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

When unlinking(in the stable branch) a stale file I got this:

JFFS2: Total scan time: 20.19 sec
Eep. Child "lumentis~" (ino #242) of dir ino #11 doesn't exist!
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 52k init 4k openfirmware

.....


jffs2_read_inode() on nonexistent ino 242
Oops: kernel access of bad area, sig: 11
NIP: C007FB54 XER: E000997F LR: C007FA98 SP: C516DDD0 REGS: c516dd20 TRAP: 0300
Using defaults from ksymoops -t elf32-little -a unknown
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c516c000[211] 'unlink' Last syscall: 10
last math 00000000 last altivec 00000000
GPR00: 00000000 C516DDD0 C516C000 00009032 00001032 0000000C C516DCF4 00000000
GPR08: C7DFA000 C5197DD0 C7C5D000 00000000 03E40000 100206E0 00000000 100AEED0
GPR16: 100BA9D0 10010000 10010000 00000000 00009032 0516DE80 00000000 C0002838
GPR24: C0002560 00000000 C7F3B2A0 C52E2BA0 C7A96070 C7A96180 C5197EE0 C7C5D290
Call backtrace:
C007FA98 C007FBC0 C0040FE8 C004113C C0002670 100004F4 0FED9DBC
00000000
Warning (Oops_read): Code line not seen, dumping what data is available

>>???; c007fb54 <jffs2_do_unlink+2e0/338>   <=====
Trace; c007fa98 <jffs2_do_unlink+224/338>
Trace; c007fbc0 <jffs2_unlink+14/24>
Trace; c0040fe8 <vfs_unlink+17c/1e8>
Trace; c004113c <sys_unlink+e8/194>
Trace; c0002670 <ret_from_syscall_2+0/44>
Trace; 100004f4 Before first symbol
Trace; 0fed9dbc Before first symbol
Trace; 00000000 Before first symbol
