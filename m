Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiQVH-0000AN-0F
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 13:03:39 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 4 Jan 2012 08:03:37 -0500
Subject: RE: I need help analyzing a failed UBIfs (resolved)
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33254FA3C59@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD33254FA3C54@dekaexchange07.deka.local>
 <0A40042D85E7C84DB443060EC44B3FD33254FA3C58@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33254FA3C58@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All:

  (Self-answered question)

  Based on the debug stack trace below, I conclude
  that my failed block *IS* composed of buds in
  the Wandering Journal.

  Any dissent?

                                    Atlant

 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

[   16.998114] UBI error: ubi_io_read: error -74 (ECC error) while reading =
516096 bytes from PEB 1715:8192, read 516096 bytes
[   17.009997] Call Trace:
[   17.012659] [cf831ad0] [c0008f88] show_stack+0x4c/0x16c (unreliable)
[   17.019402] [cf831b10] [c030a9bc] ubi_io_read+0x21c/0x434
[   17.025107] [cf831b70] [c0308e2c] ubi_eba_read_leb+0x17c/0x42c
[   17.031382] [cf831bb0] [c0306d28] ubi_leb_read+0x14c/0x1a0
[   17.037212] [cf831be0] [c01e1638] ubifs_leb_read+0x2c/0xa4
[   17.043037] [cf831c00] [c01e9a8c] ubifs_start_scan+0xe8/0x200
[   17.049110] [cf831c30] [c02016a0] ubifs_recover_leb+0xb0/0xb28
[   17.055296] [cf831c80] [c01eb0a4] replay_buds+0x8e8/0xb84               =
 <=3D=3D=3D
[   17.061035] [cf831d20] [c01ebb98] ubifs_replay_journal+0x858/0x1358     =
 <=3D=3D=3D
[   17.067653] [cf831da0] [c01dbe60] ubifs_fill_super+0x1108/0x2180
[   17.074033] [cf831e00] [c01dd6ac] ubifs_get_sb+0x1d4/0x3d4
[   17.079836] [cf831e80] [c00c0adc] vfs_kern_mount+0x70/0x190
[   17.085742] [cf831eb0] [c00c0c4c] do_kern_mount+0x40/0x100
[   17.091565] [cf831ed0] [c00da8ec] do_mount+0x680/0x820
[   17.097033] [cf831f30] [c00dab1c] sys_mount+0x90/0xd0
[   17.102384] [cf831f60] [c04f1aac] do_mount_root+0x30/0xc0
[   17.108107] [cf831f70] [c04f1be8] mount_block_root+0xac/0x240
[   17.114206] [cf831fb0] [c04f1ef4] prepare_namespace+0x68/0x1c8
[   17.120381] [cf831fd0] [c04f126c] kernel_init+0x150/0x164
[   17.126117] [cf831ff0] [c0012390] original_kernel_thread+0x4c/0x68
[   17.138694] UBIFS error (pid 1): ubifs_recover_leb: corruptio -3
[   17.145111] UBIFS error (pid 1): ubifs_scanned_corruption: corruption at=
 LEB 1408:458752
[   17.153728] UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 by=
tes from LEB 1408:458752
[   17.175760] UBIFS error (pid 1): ubifs_recover_leb: LEB 1408 scanning fa=
iled
[   17.194746] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(=
0,0)

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Atlant Schmidt
Sent: Monday, January 02, 2012 14:12
To: linux-mtd@lists.infradead.org
Subject: I need help analyzing a failed UBIfs

Folks:

  I've been asked to analyze a 2GB NAND flash that contains
  a single volume UBIfs file system that has developed an
  uncorrectable ECC error in one PEB (which is apparently
  in use storing a LEB).

  The one thing I'd really like to determine is:

    o Is the failed LEB part of the UBIfs "Wandering
      Journal" or is it storing actual, fully-committed
      parts of the data volume such as iNodes, directories,
      or file data extents?*

  Looking at a data dump of the volume (from the MTD
  level), is there an easy way to determine this?
  For example, "All the Journal LEBs are listed in
  a table at..."**

                          Atlant


 * I'm assuming that LEBs are either fully-allocated to
   the Wandering Journal or fully-available to the "data
   volume"; if this assumption is incorrect, I'm sure
   someone will correct me!

** I have a Perl script that I wrote that helps me automate
   this and could easily extend my script to do more analysis
   if I knew what I was looking for.



This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
