Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jp8i1-0004Ek-Ef
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 21:10:25 +0000
Message-ID: <4810F73A.5000305@users.sourceforge.net>
Date: Thu, 24 Apr 2008 23:10:18 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>	<1208011719.2698.19.camel@pmac.infradead.org>	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
	<Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org,
	David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey Korolev wrote:
>>>> The problem is related to introduction  of write_begin and write_end
>>>> functions instead of original prepare_write & commit_write. The kernel
>>>> panic has disappeared when we rolled back write_begin and write_end
>>>> changes in JFFS2. We tried to fix it - but it seems problem is bit
>>>> tough for us.
> 
> Seems the problem is overcome. See the patch in message "[PATCH] JFFS2
> Fix of panics caused by wrong condition for hole fragcreation in
> write_begin". Validation is done. The problem does not take palce if to apply the patch. 

I've been getting a bunch of these panics while testing the erase suspend issue.
I'm using current mtd-2.6.git.

[    4.251504] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[    4.261504] pgd = c3cd8000
[    4.271504] [00000000] *pgd=03d9b031, *pte=000010cf, *ppte=0000100e
[    4.291504] Internal error: Oops: 3cd981f [#1]
[    4.291504] Modules linked in:
[    4.291504] CPU: 0    Not tainted  (2.6.25-1 #5)
[    4.291504] PC is at jffs2_write_end+0x54/0x264
[    4.291504] LR is at generic_file_buffered_write+0x19c/0x668
[    4.291504] pc : [<c00daa84>]    lr : [<c005baa8>]    psr: 60000013
[    4.291504] sp : c3c99d18  ip : c3c99d68  fp : c3c99d64
[    4.291504] r10: c3c98000  r9 : c3c99db8  r8 : 00000000
[    4.291504] r7 : c02934e0  r6 : c38208e8  r5 : 0007c000  r4 : 00001000
[    4.291504] r3 : 00001000  r2 : 0007c000  r1 : 00000000  r0 : c35d2440
[    4.291504] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[    4.291504] Control: 03cd917f  Table: 03cd917f  DAC: 00000015
[    4.291504] Process swap (pid: 358, stack limit = 0xc3c98260)
[    4.291504] Stack: (0xc3c99d18 to 0xc3c9a000)
[    4.291504] 9d00:                                                       0007b000 00001000
[    4.291504] 9d20: c3c99d38 00001000 0007c000 00000000 c3503e00 c1fa7000 00000000 00001000
[    4.291504] 9d40: 0007c000 00000000 00001000 00000000 c3c99db8 c3c98000 c3c99df8 c3c99d68
[    4.291504] 9d60: c005baa8 c00daa3c 00001000 00001000 c02934e0 c3c99dfc c3820980 c3c99ebc
[    4.291504] 9d80: c35d2440 c3820980 c01ba6e0 c38208e8 0001c000 00001000 00000000 c01ba6e0
[    4.291504] 9da0: c3c99dd8 c35d2440 c3c99dd4 c3c99db8 c003aed0 c003a96c c3c99f40 00000001
[    4.291504] 9dc0: 0001c000 00004000 c3c99dfc c02934e0 00000000 c38208e8 00060000 00000000
[    4.291504] 9de0: 00000000 00000001 00020000 c3c99e74 c3c99e00 c005c3b4 c005b91c 00060000
[    4.291504] 9e00: 00000000 c3c99f04 00020000 00000000 c3c99f04 c3c99f40 c3c99ebc 0005ffff
[    4.291504] 9e20: 00000000 c35d2440 c3820980 00000000 00000001 c3c99e74 c3c99e44 c005b5a4
[    4.291504] 9e40: c005b140 00000000 00020000 c3820954 c3c99ebc c38208e8 00060000 00000000
[    4.291504] 9e60: 00000001 c3c99f40 c3c99eb0 c3c99e78 c005c4a0 c005bf80 00020000 00000000
[    4.291504] 9e80: c35d2440 c3820980 c3c99ebc c35d2440 c3c99f80 00000004 c0020c64 c3c98000
[    4.291504] 9ea0: 40035138 c3c99f60 c3c99eb8 c0078194 c005c434 00060000 00000000 c3c99ec8
[    4.291504] 9ec0: c0113da0 00000000 00000001 ffffffff c35d2440 00000000 00000000 00000000
[    4.291504] 9ee0: 00000000 c3c39080 00000000 00000000 00000000 c3c39080 c0049ec0 c3c99efc
[    4.291504] 9f00: c3c99efc 00060000 00000000 00000031 c3c99f60 c023dd5c ce92ad14 00020000
[    4.291504] 9f20: c3c71090 c3c99f54 c3c99f34 c3c99f5c c3c99f3c c004d9b0 c002b5ac c35d2440
[    4.291504] 9f40: 40842c08 00020000 c35d2440 40842c08 c3c99f80 c3c99f7c c3c99f64 c00789e8
[    4.291504] 9f60: c00780e0 c35d2440 00060000 00000000 c3c99fa4 c3c99f80 c0078f28 c0078940
[    4.291504] 9f80: 00060000 00000000 00000000 00020000 00060000 00020000 00000000 c3c99fa8
[    4.291504] 9fa0: c0020ac0 c0078ee8 00020000 00060000 00000004 40842c08 00020000 00000000
[    4.291504] 9fc0: 00020000 00060000 00020000 00000004 005e1064 407e2c08 40035138 becb50b4
[    4.291504] 9fe0: 00000000 becb5080 000036c4 400e0ec0 60000010 00000004 3ac9b6c3 0dd9cf30
[    4.291504] Backtrace:
[    4.291504] [<c00daa30>] (jffs2_write_end+0x0/0x264) from [<c005baa8>] (generic_file_buffered_write+0x19c/0x668)
[    4.291504] [<c005b910>] (generic_file_buffered_write+0x4/0x668) from [<c005c3b4>] (__generic_file_aio_write_nolock+0x440/0x4b0)
[    4.291504] [<c005bf74>] (__generic_file_aio_write_nolock+0x0/0x4b0) from [<c005c4a0>] (generic_file_aio_write+0x7c/0xf0)
[    4.291504] [<c005c428>] (generic_file_aio_write+0x4/0xf0) from [<c0078194>] (do_sync_write+0xc0/0x114)
[    4.291504] [<c00780d4>] (do_sync_write+0x0/0x114) from [<c00789e8>] (vfs_write+0xb4/0xdc)
[    4.291504]  r6:c3c99f80 r5:40842c08 r4:c35d2440
[    4.291504] [<c0078934>] (vfs_write+0x0/0xdc) from [<c0078f28>] (sys_write+0x4c/0x7c)
[    4.291504]  r6:00000000 r5:00060000 r4:c35d2440
[    4.291504] [<c0078edc>] (sys_write+0x0/0x7c) from [<c0020ac0>] (ret_fast_syscall+0x0/0x2c)
[    4.291504]  r6:00020000 r5:00060000 r4:00020000
[    4.291504] Code: e1a08a28 e2111001 e0883003 e50b3040 (05811000)
[    4.291504] Kernel panic - not syncing: Fatal exception
