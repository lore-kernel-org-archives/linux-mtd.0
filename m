Received: from kuumail.barco.com ([32.58.34.195])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgKpq-0005bU-5e
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 14:18:07 +0000
Content-Class: urn:content-classes:message
Subject: JFFS2: Kernel 2.6.24.2 Ooops during excessive write test
From: "Martin Creutziger" <martin.creutziger@barco.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2008 16:17:52 +0200
Message-ID: <1206973072.6190.16.camel@KARCLT0275>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I did some searching in the archive already and did not find anything,
so I just post it myself in the hope that somebody can help me.

I am doing some excessive write tests on a PPC405EP running kernel
2.6.24.2 at the moment. At irregular intervals, the "space accounting
superblock info" gets "screwed" and I'd like to know why this happens
and if it is fixable. And if not, that information might help me to
decide whether or not this affects the planned application.

Thanks for the help,

Martin Creutziger


And here comes the dmesg-output:

# dmesg
: del c19e8638 (ino #1625698)
Verifying erase at 0x00160000
Writing erased marker to block at 0x00160000
[JFFS2 DBG] (58) jffs2_link_node_ref: Last node at c19e775c is
(fffffffe,0000000
0)
[JFFS2 DBG] (58) jffs2_link_node_ref: New ref is c19e775c (fffffffe
becomes 0016
0003,00000000) len 0xc
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x13480 bytes at 0x4cb80
jffs2_write_dirent(ino #1, name at *0xc143b700
"factory.settings.backup.2"->ino=20
#1625714, name_crc 0x4e53b671)
jffs2_add_physical_node_ref(): Node at 0x4cb80(2), size 0x44
[JFFS2 DBG] (17634) jffs2_link_node_ref: Last node at c1b4b614 is
(0004c347,c1b4
b608)
[JFFS2 DBG] (17634) jffs2_link_node_ref: New ref is c1b4b620 (fffffffe
becomes 0
004cb82,00000000) len 0x44
JFFS2 error: (17634) __jffs2_dbg_acct_sanity_check_nolock: eeep, space
accountin
g superblock info is screwed.
JFFS2 error: (17634) __jffs2_dbg_acct_sanity_check_nolock: free
0xfff21a80 + dir
ty 0x142a90 + used 0x17b728 + erasing 0x020000 + bad 0x000000 + wasted
0x0003d4=20
+ unchecked 0x000000 !=3D total 0x200000.
------------[ cut here ]------------
Kernel BUG at c00f1e78 [verbose debug info unavailable]
Oops: Exception in kernel mode, sig: 5 [#1]
PREEMPT=20
NIP: c00f1e78 LR: c00f1e78 CTR: c0129588
REGS: c1991c30 TRAP: 0700   Not tainted  (2.6.24.2-pico4-MCRE)
MSR: 00029030 <EE,ME,IR,DR>  CR: 44028024  XER: 00000000
TASK =3D c181d7f0[17634] 'exe' THREAD: c1990000
GPR00: c00f1e78 c1991ce0 c181d7f0 000000cb 00000001 00000001 00000000
c0240000=20
GPR08: 00000004 c1990000 c0270000 c1990000 24028022 00040000 00000000
100c0000=20
GPR16: 00000001 00000000 100a32e2 00000000 7fccbbb0 c1911000 00000000
00000000=20
GPR24: 000ceb77 c19e8698 00000044 00000002 00200000 c01e0000 c191ec00
c191ec00=20
NIP [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
LR [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
Call Trace:
[c1991ce0] [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
(unreliab
le)
[c1991d10] [c00e6ecc] jffs2_add_physical_node_ref+0x188/0x1cc
[c1991d40] [c00ea990] jffs2_write_dirent+0x3d0/0x430
[c1991da0] [c00eb398] jffs2_do_link+0x124/0x1c4
[c1991de0] [c00e4664] jffs2_rename+0x11c/0x318
[c1991e20] [c0078564] vfs_rename+0x248/0x354
[c1991e60] [c00787ec] sys_renameat+0x17c/0x1e8
[c1991f40] [c0002c70] ret_from_syscall+0x0/0x3c
Instruction dump:
38bd1740 811f0040 3863a4c4 813f0050 815f0054 839f003c 801f0048 817f005c=20
90010008 9161000c 93810010 4bf2f4a1 <0fe00000> 48000000 80010034
bb810020=20
note: exe[17634] exited with preempt_count 1
BUG: scheduling while atomic: exe/17634/0x10000002
Call Trace:
[c1991990] [c0008a00] show_stack+0x58/0x180 (unreliable)
[c19919c0] [c001b7ac] __schedule_bug+0x54/0x68
[c19919e0] [c01d8cb0] schedule+0x74/0x39c
[c1991a20] [c001d0c0] __cond_resched+0x24/0x50
[c1991a40] [c01d94c0] cond_resched+0x40/0x54
[c1991a50] [c0059d14] unmap_vmas+0x500/0x584
[c1991ad0] [c005f5bc] exit_mmap+0x70/0x118
[c1991af0] [c001dd2c] mmput+0x3c/0xe8
[c1991b10] [c0022b58] exit_mm+0xf0/0x104
[c1991b30] [c002317c] do_exit+0x1cc/0x720
[c1991b60] [c000373c] _exception+0x0/0xf8
[c1991b80] [c0003774] _exception+0x38/0xf8
[c1991c20] [c000326c] ret_from_except_full+0x0/0x4c
[c1991ce0] [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
[c1991d10] [c00e6ecc] jffs2_add_physical_node_ref+0x188/0x1cc
[c1991d40] [c00ea990] jffs2_write_dirent+0x3d0/0x430
[c1991da0] [c00eb398] jffs2_do_link+0x124/0x1c4
[c1991de0] [c00e4664] jffs2_rename+0x11c/0x318
[c1991e20] [c0078564] vfs_rename+0x248/0x354
[c1991e60] [c00787ec] sys_renameat+0x17c/0x1e8
[c1991f40] [c0002c70] ret_from_syscall+0x0/0x3c
JFFS2 error: (58) __jffs2_dbg_acct_sanity_check_nolock: eeep, space
accounting s
uperblock info is screwed.
JFFS2 error: (58) __jffs2_dbg_acct_sanity_check_nolock: free 0xfff41aac
+ dirty=20
0x142a90 + used 0x17b734 + erasing 0x000000 + bad 0x000000 + wasted
0x0003d4 + u
nchecked 0x000000 !=3D total 0x200000.
------------[ cut here ]------------
Kernel BUG at c00f1e78 [verbose debug info unavailable]
Oops: Exception in kernel mode, sig: 5 [#2]
PREEMPT=20
NIP: c00f1e78 LR: c00f1e78 CTR: c0129588
REGS: c1a0bd70 TRAP: 0700   Tainted: G      D  (2.6.24.2-pico4-MCRE)
MSR: 00029030 <EE,ME,IR,DR>  CR: 44004024  XER: 00000000
TASK =3D c1875ba0[58] 'pdflush' THREAD: c1a0a000
GPR00: c00f1e78 c1a0be20 c1875ba0 000000c8 00000001 00000001 00000000
c0240000=20
GPR08: 00000004 c1a0a000 c0270000 c1a0a000 24004022 00040000 01fa8300
00000000=20
GPR16: 00000001 ffffffff 00000000 007fff00 01fa1f4c 01f3f978 01fa6824
ffffffff=20
GPR24: c191ecbc c1a0be80 c191ecf0 00000000 00200000 c01e0000 c19b6e3c
c191ec00=20
NIP [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
LR [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
Call Trace:
[c1a0be20] [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
(unreliab
le)
[c1a0be50] [c00efbe8] jffs2_erase_pending_blocks+0x4c0/0xaa8
[c1a0bed0] [c00f1270] jffs2_write_super+0x4c/0x60
[c1a0bef0] [c006df98] sync_supers+0xac/0x130
[c1a0bf10] [c0051b70] wb_kupdate+0x44/0x12c
[c1a0bf80] [c0052ea8] pdflush+0x188/0x280
[c1a0bfd0] [c0037f5c] kthread+0x4c/0x88
[c1a0bff0] [c0004d50] kernel_thread+0x44/0x60
Instruction dump:
38bd1740 811f0040 3863a4c4 813f0050 815f0054 839f003c 801f0048 817f005c=20
90010008 9161000c 93810010 4bf2f4a1 <0fe00000> 48000000 80010034
bb810020=20
------------[ cut here ]------------
Badness at c0022fdc [verbose debug info unavailable]
NIP: c0022fdc LR: c000373c CTR: c0129588
REGS: c1a0bbc0 TRAP: 0700   Tainted: G      D  (2.6.24.2-pico4-MCRE)
MSR: 00029030 <EE,ME,IR,DR>  CR: 48004024  XER: 20000000
TASK =3D c1875ba0[58] 'pdflush' THREAD: c1a0a000
GPR00: 00000001 c1a0bc70 c1875ba0 00000005 00000001 00000001 00000000
c0240000=20
GPR08: 00000001 00000000 c0270000 c1a0a000 48004024 00040000 01fa8300
00000000=20
GPR16: 00000001 ffffffff 00000000 007fff00 01fa1f4c 01f3f978 01fa6824
ffffffff=20
GPR24: c191ecbc c1a0be80 c191ecf0 00000000 00200000 00030001 c1875ba0
00000005=20
NIP [c0022fdc] do_exit+0x2c/0x720
LR [c000373c] _exception+0x0/0xf8
Call Trace:
[c1a0bc70] [00029030] 0x29030 (unreliable)
[c1a0bca0] [c000373c] _exception+0x0/0xf8
[c1a0bcc0] [c0003774] _exception+0x38/0xf8
[c1a0bd60] [c000326c] ret_from_except_full+0x0/0x4c
[c1a0be20] [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
[c1a0be50] [c00efbe8] jffs2_erase_pending_blocks+0x4c0/0xaa8
[c1a0bed0] [c00f1270] jffs2_write_super+0x4c/0x60
[c1a0bef0] [c006df98] sync_supers+0xac/0x130
[c1a0bf10] [c0051b70] wb_kupdate+0x44/0x12c
[c1a0bf80] [c0052ea8] pdflush+0x188/0x280
[c1a0bfd0] [c0037f5c] kthread+0x4c/0x88
[c1a0bff0] [c0004d50] kernel_thread+0x44/0x60
Instruction dump:
4e800020 7c0802a6 7d800026 9421ffd0 bf410018 91810014 90010034 7c7f1b78=20
7c5e1378 800203b4 3120ffff 7d090110 <0f080000> 54290024 3c60c020
8009000c=20
note: pdflush[58] exited with preempt_count 1
BUG: scheduling while atomic: exe/17634/0x10000002
Call Trace:
[c1991a40] [c0008a00] show_stack+0x58/0x180 (unreliable)
[c1991a70] [c001b7ac] __schedule_bug+0x54/0x68
[c1991a90] [c01d8cb0] schedule+0x74/0x39c
[c1991ad0] [c001d0c0] __cond_resched+0x24/0x50
[c1991af0] [c01d94c0] cond_resched+0x40/0x54
[c1991b00] [c00227f8] put_files_struct+0x94/0xe8
[c1991b30] [c002318c] do_exit+0x1dc/0x720
[c1991b60] [c000373c] _exception+0x0/0xf8
[c1991b80] [c0003774] _exception+0x38/0xf8
[c1991c20] [c000326c] ret_from_except_full+0x0/0x4c
[c1991ce0] [c00f1e78] __jffs2_dbg_acct_sanity_check_nolock+0x138/0x154
[c1991d10] [c00e6ecc] jffs2_add_physical_node_ref+0x188/0x1cc
[c1991d40] [c00ea990] jffs2_write_dirent+0x3d0/0x430
[c1991da0] [c00eb398] jffs2_do_link+0x124/0x1c4
[c1991de0] [c00e4664] jffs2_rename+0x11c/0x318
[c1991e20] [c0078564] vfs_rename+0x248/0x354
[c1991e60] [c00787ec] sys_renameat+0x17c/0x1e8
[c1991f40] [c0002c70] ret_from_syscall+0x0/0x3c



DISCLAIMER:
Unless indicated otherwise, the information contained in this message is =
privileged and confidential, and is intended only for the use of the =
addressee(s) named above and others who have been specifically =
authorized to receive it. If you are not the intended recipient, you are =
hereby notified that any dissemination, distribution or copying of this =
message and/or attachments is strictly prohibited. The company accepts =
no liability for any damage caused by any virus transmitted by this =
email. Furthermore, the company does not warrant a proper and complete =
transmission of this information, nor does it accept liability for any =
delays. If you have received this message in error, please contact the =
sender and delete the message. Thank you.
