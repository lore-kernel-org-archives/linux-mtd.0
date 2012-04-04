Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFP22-0005Hb-Gy
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 12:09:47 +0000
Received: by dadn15 with SMTP id n15so235560dad.16
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2012 05:09:42 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 Apr 2012 20:09:42 +0800
Message-ID: <CAHvCehVNgTgL+vY8SV1APN_xokogCM=Q+c7U1X9-_H1jn47Dpg@mail.gmail.com>
Subject: UBIFS recovery fail after power-cut
From: b w <wdjjwb@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list,
=A0=A0=A0=A0=A0=A0=A0 Using kernel 2.6.32 (which have already apply the lat=
est UBIFS
and UBI patches),nor flash.
UBIFS mount fail fail after an power cut due to recovery . Recovery
failed because after power cut ,the flash image is like this:
02ab3eb0h: 00 00 00 00 00 00 00 00 00 E6 0C 00 11 00 00 00
02ab3ec0h: 31 18 10 06 04 80 DE AF FF FF FF FF FF FF FF FF
02ab3ed0h: FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
02ab3ee0h: FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
02ab3ef0h: 05 89 AB CD EF 89 AB CD EF 20 00 00 00 00 00 00
02ab3f00h: FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
First,when ubifs_recover_leb call ubifs_scan_a_node,and found that in
0x02ab3ec8h
had a bad node type,so ubifs_scan_a_node return SCANNED_A_CORRUPT_NODE.
Then in ubifs_recover_leb,when call no_more_nodes this function return
0 (which i think
should be return 1).At last recovery failed,so mount failed too.

The flash device is S29GL01GP12TFI01. I try to reproduce the flash
image by power down,but
not success yet. I reproduce this problem using the flash image which
i dumped after the first problem happened.
I do not know how can reproduce this problem by power down. And also i
know is that this flash internal buffer size is 64 bytes.

I think in this situation, function no_more_nodes not work
correctly,we should fix it.

error log:
[=A0=A0 35.290516] UBIFS error (pid 1110): ubifs_check_node: bad node type =
255
[=A0=A0 35.294516] UBIFS error (pid 1110): ubifs_check_node: bad node at
LEB 388:81472
[=A0=A0 35.302725] Call Trace:
[=A0=A0 35.302725]=A0 [<c1156ec3>] ubifs_check_node+0x21d/0x22e
[=A0=A0 35.307600]=A0 [<c115d6db>] ubifs_scan_a_node+0x139/0x297
[=A0=A0 35.311600]=A0 [<c116d894>] ubifs_recover_leb+0x12a/0x63e
[=A0=A0 35.311600]=A0 [<c108fdb4>] ? __slab_free+0x3d/0x1db
[=A0=A0 35.315337]=A0 [<c115e60e>] ubifs_replay_journal+0x7f5/0x14b7
[=A0=A0 35.319337]=A0 [<c1169a1c>] ? ubifs_lpt_init+0x528/0x8b2
[=A0=A0 35.319337]=A0 [<c1153471>] ubifs_fill_super+0xb31/0x198b
[=A0=A0 35.323828]=A0 [<c11553bc>] ubifs_get_sb+0x40f/0x493
[=A0=A0 35.327828]=A0 [<c10952d9>] vfs_kern_mount+0x80/0x115
[=A0=A0 35.330298]=A0 [<c1095415>] do_kern_mount+0x32/0xbe
[=A0=A0 35.330298]=A0 [<c10a55e0>] do_mount+0x550/0x5af
[=A0=A0 35.333543]=A0 [<c1399518>] ? do_page_fault+0x0/0x26e
[=A0=A0 35.333543]=A0 [<c107c544>] ? strndup_user+0x40/0x5f
[=A0=A0 35.338891]=A0 [<c10a56a0>] sys_mount+0x61/0x8f
[=A0=A0 35.342891]=A0 [<c1002b64>] sysenter_do_call+0x12/0x22
[=A0=A0 35.345633] found corruption - -3
[=A0=A0 35.345633] UBIFS error (pid 1110): ubifs_check_node: bad node type =
255
[=A0=A0 35.350654] UBIFS error (pid 1110): ubifs_check_node: bad node at
LEB 388:81472
[=A0=A0 35.359341] Call Trace:
[=A0=A0 35.359341]=A0 [<c1156ec3>] ubifs_check_node+0x21d/0x22e
[=A0=A0 35.363515]=A0 [<c116d99b>] ubifs_recover_leb+0x231/0x63e
[=A0=A0 35.367515]=A0 [<c108fdb4>] ? __slab_free+0x3d/0x1db
[=A0=A0 35.367515]=A0 [<c115e60e>] ubifs_replay_journal+0x7f5/0x14b7
[=A0=A0 35.371324]=A0 [<c1169a1c>] ? ubifs_lpt_init+0x528/0x8b2
[=A0=A0 35.375324]=A0 [<c1153471>] ubifs_fill_super+0xb31/0x198b
[=A0=A0 35.375324]=A0 [<c11553bc>] ubifs_get_sb+0x40f/0x493
[=A0=A0 35.379321]=A0 [<c10952d9>] vfs_kern_mount+0x80/0x115
[=A0=A0 35.383321]=A0 [<c1095415>] do_kern_mount+0x32/0xbe
[=A0=A0 35.383321]=A0 [<c10a55e0>] do_mount+0x550/0x5af
[=A0=A0 35.386657]=A0 [<c1399518>] ? do_page_fault+0x0/0x26e
[=A0=A0 35.390657]=A0 [<c107c544>] ? strndup_user+0x40/0x5f
[=A0=A0 35.390657]=A0 [<c10a56a0>] sys_mount+0x61/0x8f
[=A0=A0 35.393861]=A0 [<c1002b64>] sysenter_do_call+0x12/0x22
[=A0=A0 35.393861] unexpected bad common header at 388:81472
[=A0=A0 35.398954] UBIFS error (pid 1110): ubifs_recover_leb: corruptio -3
[=A0=A0 35.407615] UBIFS error (pid 1110): ubifs_check_node: bad node type =
255
[=A0=A0 35.409498] UBIFS error (pid 1110): ubifs_check_node: bad node at
LEB 388:81472
[=A0=A0 35.417522] Call Trace:
[=A0=A0 35.417522]=A0 [<c1156ec3>] ubifs_check_node+0x21d/0x22e
[=A0=A0 35.421699]=A0 [<c115d6db>] ubifs_scan_a_node+0x139/0x297
[=A0=A0 35.425699]=A0 [<c116dd3d>] ubifs_recover_leb+0x5d3/0x63e
[=A0=A0 35.425699]=A0 [<c108fdb4>] ? __slab_free+0x3d/0x1db
[=A0=A0 35.429345]=A0 [<c115e60e>] ubifs_replay_journal+0x7f5/0x14b7
[=A0=A0 35.429345]=A0 [<c1169a1c>] ? ubifs_lpt_init+0x528/0x8b2
[=A0=A0 35.434631]=A0 [<c1153471>] ubifs_fill_super+0xb31/0x198b
[=A0=A0 35.434631]=A0 [<c11553bc>] ubifs_get_sb+0x40f/0x493
[=A0=A0 35.439765]=A0 [<c10952d9>] vfs_kern_mount+0x80/0x115
[=A0=A0 35.443765]=A0 [<c1095415>] do_kern_mount+0x32/0xbe
[=A0=A0 35.443765]=A0 [<c10a55e0>] do_mount+0x550/0x5af
[=A0=A0 35.447007]=A0 [<c1399518>] ? do_page_fault+0x0/0x26e
[=A0=A0 35.447007]=A0 [<c107c544>] ? strndup_user+0x40/0x5f
[=A0=A0 35.451007]=A0 [<c10a56a0>] sys_mount+0x61/0x8f
[=A0=A0 35.454462]=A0 [<c1002b64>] sysenter_do_call+0x12/0x22
[=A0=A0 35.458825] UBIFS error (pid 1110): ubifs_scanned_corruption:
corruption at LEB 388:81472
[=A0=A0 35.463297] UBIFS error (pid 1110): ubifs_scanned_corruption: first
8192 bytes from LEB 388:81472
[=A0=A0 35.481198] UBIFS error (pid 1110): ubifs_recover_leb: LEB 388
scanning failed
mount: mounting ubi0 on /mtd3 failed: Structure needs cleaning
