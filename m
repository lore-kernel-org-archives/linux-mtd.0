Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0x4D-0004z7-0y
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 11:42:25 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mAEBfT7P030499
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2008 13:42:22 +0200
Subject: JFFS2 oopses in 2.6.28-rc4
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2008 13:39:37 +0200
Message-Id: <1226662777.16925.74.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

JFFS2 dies when I run the integrity test with todays Linus's tree.
I do not have time to dig this, so I just send a bugreport.

Top commit: 58e20d8d344b0ee083febb18c2b021d2427e56ca

How to reproduce.

1. Load nandsim:
modprobe nandsim first_id_byte=3D0xec second_id_byte=3D0xa1
third_id_byte=3D0x00 fourth_id_byte=3D0x15

2. mount JFFS2:
sudo mount -t jffs2 mtd0 /mnt/jffs2/

3. Download mtd-utils.git from git://git.infradead.org/mtd-utils.git
4. $ cd mtd-utils/fs-tests
5. $ make
6. $ cd integck

7. Configure integck:
$ export TEST_FILE_SYSTEM_MOUNT_DIR=3D/mnt/jffs2
$ export TEST_FILE_SYSTEM_TYPE=3Djffs2

8. Run it:
$ ./integck

JFFS2 oopes:

BUG: unable to handle kernel paging request at f77fe000
IP: [<c022b0a6>] crc32_le+0x36/0xe2
Oops: 0000 [#1] PREEMPT SMP
last sysfs file: /sys/devices/pci0000:00/0000:00:1c.4/0000:02:00.0/irq
Modules linked in: jffs2 zlib_deflate lzo_decompress lzo_compress
nandsim nand nand_ids nand_ecc mtd nfsd lockd sunrpc exportfs

Pid: 2856, comm: jffs2_gcd_mtd0 Not tainted (2.6.28-rc4-ubifs-2.6 #4)
OptiPlex 745
EIP: 0060:[<c022b0a6>] EFLAGS: 00010206 CPU: 0
EIP is at crc32_le+0x36/0xe2
EAX: 7764391e EBX: 7764391e ECX: 3fceac41 EDX: 00000001
ESI: f77fdffc EDI: ffffff8f EBP: f084fdf4 ESP: f084fde0
 DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
Process jffs2_gcd_mtd0 (pid: 2856, ti=3Df084e000 task=3Def1f35d0
task.ti=3Df084e000)
Stack:
 3fffffe3 f6ba9174 ffffffd3 ffffff8f f084febc f084fee0 f8d13e27 00000012
 00000000 ffffff8f f084fe30 f084fe78 c6afc5e0 f4cbf0a0 f084fe38 c018d797
 f4cbf8d0 f0859f74 eea509e0 00000001 00000007 f4cbf8d0 f084fea4 f8d15e00
Call Trace:
 [<f8d13e27>] ? jffs2_garbage_collect_live+0xcb5/0x1047 [jffs2]
 [<c018d797>] ? iget_locked+0x2a/0x12d
 [<f8d15e00>] ? jffs2_iget+0xe/0x30d [jffs2]
 [<c01456ff>] ? lock_release_non_nested+0x108/0x214
 [<f8d146cf>] ? jffs2_garbage_collect_pass+0x516/0x69b [jffs2]
 [<f8d146ff>] ? jffs2_garbage_collect_pass+0x546/0x69b [jffs2]
 [<c014375d>] ? trace_hardirqs_on+0xb/0xd
 [<c03af384>] ? _spin_unlock_irq+0x22/0x40
 [<f8d15a7d>] ? jffs2_garbage_collect_thread+0xa7/0x16f [jffs2]
 [<c0120fa8>] ? finish_task_switch+0x5d/0xac
 [<c0103dd8>] ? restore_nocheck_notrace+0x0/0xe
 [<c01436d4>] ? trace_hardirqs_on_caller+0xa0/0x11e
 [<c0226fd4>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c0103dd8>] ? restore_nocheck_notrace+0x0/0xe
 [<f8d159d6>] ? jffs2_garbage_collect_thread+0x0/0x16f [jffs2]
 [<f8d159d6>] ? jffs2_garbage_collect_thread+0x0/0x16f [jffs2]
 [<c0104b43>] ? kernel_thread_helper+0x7/0x14
Code: 89 cf f6 c2 03 0f 85 96 00 00 00 31 c0 83 ff 03 0f 97 c0 85 c0 74
62 89 f8 c1 e8 02 89 45 ec 83 ea 04 89 55 f0 89 d6 89 c1 89 d8 <33> 46
04 0f b6 d0 c1 e8 08 33 04 95 e0 41 3c c
EIP: [<c022b0a6>] crc32_le+0x36/0xe2 SS:ESP 0068:f084fde0
---[ end trace 2dbc5d34ac351bdd ]---

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
