Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDfLu-0005Lt-Ue
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 13:25:15 +0000
Received: by wf-out-1314.google.com with SMTP id 28so981787wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Dec 2008 05:25:13 -0800 (PST)
Message-ID: <627b7eea0812190525v7de037b5le65683e2e045dd81@mail.gmail.com>
Date: Fri, 19 Dec 2008 18:55:13 +0530
From: "Hemagiri C" <hemagiric@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs_rmdir pointer corruption in linux-2.6.21
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was testing the MTD driver on OneNAND using JFFS2 as the file
system, I was running the fsstress, but the kernel got crashed after
some time.
Kernel version : linux-2.6.21

The Dump Message shows the failure is at jffs2_rmdir, error message is
"Unable to handle kernel paging request at virtual address e852e00e".
I feel that there may be some pointer corruption during the
jffs2_lookup. Does any one has any idea about the failure?

Please find the following dump message.



/***************************************************************************************************************************************/
Count : 109360, Log : 2008-11-17 21:26:03:656 : Unable to handle
kernel paging request at virtual address e852e00e

Count : 109361, Log : 2008-11-17 21:26:03:656 : pgd = c2dd0000

Count : 109362, Log : 2008-11-17 21:26:03:656 : [e852e00e] *pgd=00000000

Count : 109363, Log : 2008-11-17 21:26:03:656 : Internal error: Oops: 1 [#1]

Count : 109364, Log : 2008-11-17 21:26:03:656 : Modules linked in:

Count : 109365, Log : 2008-11-17 21:26:03:656 : CPU: 0

Count : 109366, Log : 2008-11-17 21:26:03:656 : PC is at jffs2_rmdir+0x20/0x5c

Count : 109367, Log : 2008-11-17 21:26:03:656 : LR is at vfs_rmdir+0x80/0xc0

Count : 109368, Log : 2008-11-17 21:26:03:671 : pc : [<c00e9a24>]
lr : [<c0090f78>]    Not tainted

Count : 109369, Log : 2008-11-17 21:26:03:671 : sp : c36edefc  ip :
c36edf10  fp : c36edf0c

Count : 109370, Log : 2008-11-17 21:26:03:671 : r10: 40149dfc  r9 :
c36ec000  r8 : c0026e04

Count : 109371, Log : 2008-11-17 21:26:03:671 : r7 : 00000028  r6 :
c0cd728c  r5 : 00000000  r4 : c0cd728c

Count : 109372, Log : 2008-11-17 21:26:03:671 : r3 : 00000000  r2 :
e852e002  r1 : c3057e38  r0 : c0cd728c

Count : 109373, Log : 2008-11-17 21:26:03:703 : Flags: NzCv  IRQs on
FIQs on  Mode SVC_32  Segment user

Count : 109374, Log : 2008-11-17 21:26:03:703 : Control: C5387F

Count : 109375, Log : 2008-11-17 21:26:03:703 : Table: 82DD0000  DAC: 00000015

Count : 109376, Log : 2008-11-17 21:26:03:703 : Process fsstress (pid:
24248, stack limit = 0xc36ec248)

Count : 109377, Log : 2008-11-17 21:26:03:703 : Stack: (0xc36edefc to
0xc36ee000)

Count : 109378, Log : 2008-11-17 21:26:03:718 : dee0:
                                              c3057e38

Count : 109379, Log : 2008-11-17 21:26:03:718 : df00: c36edf28
c36edf10 c0090f78 c00e9a10 c3057e38 c3057e38 c3202000 c36edf94

Count : 109380, Log : 2008-11-17 21:26:03:718 : df20: c36edf2c
c009106c c0090f04 c35a9dac c0353f20 00031e67 00000002 c3202000

Count : 109381, Log : 2008-11-17 21:26:03:734 : df40: 00000010
00000000 00000000 00000001 00000001 00000000 c36edf80 c36edf68

Count : 109382, Log : 2008-11-17 21:26:03:734 : df60: c0086084
c0087b34 000003ec c2676360 c0363080 c36edfa4 c36edf84 beabee94

Count : 109383, Log : 2008-11-17 21:26:03:734 : df80: 4001e000
000105c0 c36edfa4 c36edf98 c00910c8 c0090fc4 00000000 c36edfa8

Count : 109384, Log : 2008-11-17 21:26:03:750 : dfa0: c0026c60
c00910bc beabee94 4001e000 402088c8 beabec0c 00000000 beabec0c

Count : 109385, Log : 2008-11-17 21:26:03:750 : dfc0: beabee94
4001e000 000105c0 00000009 4014c4c4 00009250 40149dfc beabebf4

Count : 109386, Log : 2008-11-17 21:26:03:781 : dfe0: 000199b0
beabe7d4 0000bc10 400ed754 20000010 402088c8 00000000 00000000

Count : 109387, Log : 2008-11-17 21:26:03:781 : Backtrace:

Count : 109388, Log : 2008-11-17 21:26:03:781 : [<c00e9a04>]
(jffs2_rmdir+0x0/0x5c) from [<c0090f78>] (vfs_rmdir+0x80/0xc0)

Count : 109389, Log : 2008-11-17 21:26:03:781 :  r4 = C3057E38

Count : 109390, Log : 2008-11-17 21:26:03:781 : [<c0090ef8>]
(vfs_rmdir+0x0/0xc0) from [<c009106c>] (do_rmdir+0xb4/0xf8)

Count : 109391, Log : 2008-11-17 21:26:03:796 :  r6 = C3202000  r5 =
C3057E38  r4 = C3057E38

Count : 109392, Log : 2008-11-17 21:26:03:796 : [<c0090fb8>]
(do_rmdir+0x0/0xf8) from [<c00910c8>] (sys_rmdir+0x18/0x1c)

Count : 109393, Log : 2008-11-17 21:26:03:796 :  r6 = 000105C0  r5 =
4001E000  r4 = BEABEE94

Count : 109394, Log : 2008-11-17 21:26:03:796 : [<c00910b0>]
(sys_rmdir+0x0/0x1c) from [<c0026c60>] (ret_fast_syscall+0x0/0x2c)

Count : 109395, Log : 2008-11-17 21:26:03:812 : Code: e5132010
e1a04000 e3520000 0a000007 (e592300c)
/***************************************************************************************************************************************/



--
Thanks and Regards
Hemagiri C
