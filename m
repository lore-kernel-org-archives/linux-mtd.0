Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmaeY-0005Zx-CU
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 12:06:14 -0400
Received: from mailgate.cabletime.com ([80.177.138.66] helo=cabletime.com)
	by anchor-post-30.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1BmaeV-00040W-0U
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 17:06:07 +0100
From: Andy Hawkins <a.hawkins@cabletime.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1090253165.2295.31.camel@adh>
Mime-Version: 1.0
Date: 19 Jul 2004 17:06:05 +0100
Content-Transfer-Encoding: 7bit
Subject: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We're trying to write to NOR flash on our custom board. We can
successfully read without problem, but when we try to write we get the
following (apologies about the wrapping):

Unlocking flash.Oops: kernel access of bad area, sig: 11
NIP: C00CE4B8 XER: 00000000 LR: C00CE438 SP: C7769E10 REGS: c7769d60
TRAP: 0800d
MSR: 00009030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DEAR: C8C0E002, ESR: 00800000
TASK = c7768000[170] 'fw_setenv' Last syscall: 54
last math 00000000 last altivec 00000000
PLB0: bear= 0x00000000 acr=   0x00000000 besr=  0x00000000
PLB0 to OPB: bear= 0x00000000 besr0= 0x00000000 besr1= 0x00000000

GPR00: 00000000 C7769E10 C7768000 00000000 C016657C 00000001 0000000E
00000000
GPR08: 00000020 C900E000 00001FFF 00000000 00000000 1001B8EC 00000000
00000000
GPR16: 00000000 00000000 00000000 00000000 00009032 C00CE380 00000000
C7769E88
GPR24: C0190000 C03BB740 C7769E88 C03BB778 C016657C 00000000 C018B440
FFC00002
Call backtrace:
C00CE3D4 C00CDDAC C00CE550 C00C3CEC C00C4DD4 C004C33C C000457C
7FFFFC30 100016A8 10001448 10002B7C 0FEB6D84 00000000

The backtrace information points to the crash being in
do_xxlock_oneblock (if I'm reading the System.map correctly).

The relevant bits of System.map are below

c00c3c80 t part_unlock
c00c3cf0 t part_sync
c00c4c2c t mtd_ioctl
c00c55d0 t mtd_notify_add
c00cdbdc t cfi_amdstd_varsize_frob
c00cde3c t cfi_amdstd_erase_varsize
c00ce380 t do_xxlock_oneblock
c00ce4d8 t cfi_amdstd_lock_varsize
c00ce51c t cfi_amdstd_unlock_varsize
c00ce560 t cfi_amdstd_destroy

The flash is a M29W320DB.

I'm using a relatively old snapshot, but comparing with the current
snapshot shows that function hasn't changed.

Can anyone offer any advice? I have access to a BDI-2000 if any low
level debugging is required.

Many thanks.

Andy
