Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bjzuj-0007js-E6
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 08:28:10 -0400
Received: from [10.1.1.113] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	12 Jul 2004 08:28:07 -0400
Date: Mon, 12 Jul 2004 08:23:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407120809110.10442@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: eraseall causes kernel panic with newer kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   i've been fighting with this all weekend, so i hope someone here can 
give me a pointer (or two).  in a nutshell, with older 2.4.22-pre8 
kernel, define single large 8M filesystem on second (user) 8M flash on 
850DE-based board, boot and get:

...
JFFS2 version 2.1. (C) 2001 Red Hat, Inc...
...
Synergy Flash device: 800000 at e0000000     <-- that's user flash
Synergy Flash device: 10000 at fc000000      <-- ignore that one
  Amd/Fujitsu Extended Query Table v1.3 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
  Amd/Fujitsu Extended Query Table v1.3 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
Creating 1 MTD partitions on "user flash":
0x00000000-0x00800000 : "check image area"   <-- looks good, 8M fs
...

# ls -l /dev/mtd
crw-rw-rw-    1 root     root      90,   0 Dec 31  1969 0
cr--r--r--    1 root     root      90,   1 Dec 31  1969 0ro

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00010000 "check image area"   <-- again, looks good
mtd1: 00010000 00010000 "secsi sector"

# eraseall /dev/mtd/0
Erased 8192 Kibyte @ 0 -- 100% complete.
#

   in short, it all worked.  now, move up to 2.4.25 kernel (and clean 
up the maps file to get rid of cruft), and try the same thing:

...
Registering user flash device at: e0000000, size: 800000  <-- OK
uflash: Found 1 x16 devices at 0x0 in 16-bit mode
  Amd/Fujitsu Extended Query Table at 0x0040
uflash: CFI does not contain boot bank location. Assuming top. ???
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code 
brokenness.
Creating 1 MTD partitions on "uflash":
0x00000000-0x00800000 : "ufs"             <-- again, looks good
...

# ls -l /dev/mtd
crw-rw-rw-    1 root     root      90,   0 Dec 31  1969 0
cr--r--r--    1 root     root      90,   1 Dec 31  1969 0ro

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00010000 "ufs"             <-- good ...

   so apart from that weird boot bank location diagnostic, it sure 
looks like i've defined my flash chip properly, no?

# eraseall /dev/mtd/0
Erasing 64 Kibyte @ 0 --  0 % complete.Oops: kernel access of bad 
area, sig: 11
NIP: C000DD78 XER: 00000000 LR: C000DD74 SP: C0433D90 REGS: c0433ce0 
TRAP: 0300dMSR: 00001032 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00000000, DSISR: 0000017E
TASK = c0432000[36] 'eraseall' Last syscall: 54
last math 00000000 last altivec 00000000
GPR00: 00001032 C0433D90 C0432000 00000001 00009032 00000001 C00D02D8 
00000018
GPR08: C00D02D8 00000000 00000000 C0433DE0 00010000 10018E20 00000000 
00000000
GPR16: 00000000 00000000 00000000 00000000 00009032 C00EEED0 C00EEED0 
00000000
GPR24: 00000000 C00EEED0 00000000 00000003 00000001 C05ED7A4 00000000 
C0433D90
Call backtrace:
C000D7B0 C0097060 C0099C14 C00980D0 C009819C C0091440 C0092C60
C0047A4C C000447C 0FF13EF8 10000688 0FEBCE88 00000000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing


   seriously baffled here, and this has been absolutely consistent.
help?

rday

p.s.  note the different diagnostics from cfi_cmdset_0002.  is this 
something i have to deal with?

