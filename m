Received: from mail1.bemta12.messagelabs.com ([216.82.251.1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNFHN-0007Ln-AE
 for linux-mtd@lists.infradead.org; Mon, 16 Feb 2015 06:35:38 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 16 Feb 2015 17:35:07 +1100
Subject: UBIFS handling of erased page errors
Message-ID: <EACD232272DA4849B060F0828564D13B56E32C0D59@ntcex01.corp.netcomm.com.au>
Content-Language: en-AU
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


Hi all,


I've noticed that it is possible for UBIFS to become read-only
after an ECC error when reading an erased page.

This strikes my as odd - the page was erased, so it doesn't
contain important filesystem information. I expected UBI
to deal with this - torture the block, retire it if necessary.

Does this remount behaviour make sense? Could someone give
me an example where remounting read-only would serve a data
integrity purpose under those circumstances?

I have solved the underlying problem for now (see below), but I am
worrying that UBIFS may be a little too trigger-happy with the read-only
remounts. For many real-world applications, a read-only volume is
just as broken as an unmountable one.


Best regards,

Iwo


P.S.: Details

The background of all this is that I had a customer report a
system failure (UBIFS readonly and unusable). Looking at the log,
the issue was a NAND block with bit errors after erase:

> [   96.830000] UBI warning: ubi_io_read: error -74 (ECC error) while read=
ing 126976 bytes from PEB 352:4096, read only 126976 bytes, retry
> [   96.890000] UBI warning: ubi_io_read: error -74 (ECC error) while read=
ing 126976 bytes from PEB 352:4096, read only 126976 bytes, retry
> [   96.970000] UBI warning: ubi_io_read: error -74 (ECC error) while read=
ing 126976 bytes from PEB 352:4096, read only 126976 bytes, retry
> [   97.070000] UBI error: ubi_io_read: error -74 (ECC error) while readin=
g 126976 bytes from PEB 352:4096, read 126976 bytes
> [   97.080000] [<c000d6e4>] (unwind_backtrace+0x0/0x11c) from [<c020dfe4>=
] (ubi_io_read+0x210/0x320)
> [   97.090000] [<c020dfe4>] (ubi_io_read+0x210/0x320) from [<c020b550>] (=
ubi_eba_read_leb+0x354/0x488)
> [   97.100000] [<c020b550>] (ubi_eba_read_leb+0x354/0x488) from [<c020a37=
c>] (ubi_leb_read+0x108/0x170)
> [   97.110000] [<c020a37c>] (ubi_leb_read+0x108/0x170) from [<c0132350>] =
(ubifs_leb_read+0x28/0x88)
> [   97.120000] [<c0132350>] (ubifs_leb_read+0x28/0x88) from [<c013a9d4>] =
(ubifs_start_scan+0xb4/0x13c)
> [   97.120000] [<c013a9d4>] (ubifs_start_scan+0xb4/0x13c) from [<c013ad48=
>] (ubifs_scan+0x28/0x330)
> [   97.130000] [<c013ad48>] (ubifs_scan+0x28/0x330) from [<c0145084>] (la=
yout_in_gaps+0x100/0x528)
> [   97.140000] [<c0145084>] (layout_in_gaps+0x100/0x528) from [<c0145b88>=
] (ubifs_tnc_start_commit+0x6dc/0x760)
> [   97.150000] [<c0145b88>] (ubifs_tnc_start_commit+0x6dc/0x760) from [<c=
013e8b0>] (do_commit+0x1f8/0x884)
> [   97.160000] [<c013e8b0>] (do_commit+0x1f8/0x884) from [<c012cb14>] (ub=
ifs_sync_fs+0x64/0x88)
> [   97.170000] [<c012cb14>] (ubifs_sync_fs+0x64/0x88) from [<c00c7e9c>] (=
sync_fs_one_sb+0x28/0x2c)
> [   97.180000] [<c00c7e9c>] (sync_fs_one_sb+0x28/0x2c) from [<c00a7480>] =
(iterate_supers+0x6c/0xa8)
> [   97.190000] [<c00a7480>] (iterate_supers+0x6c/0xa8) from [<c00c7f90>] =
(sys_sync+0x44/0x90)
> [   97.200000] [<c00c7f90>] (sys_sync+0x44/0x90) from [<c00092c0>] (ret_f=
ast_syscall+0x0/0x2c)
> [   97.220000] UBIFS error (pid 278): ubifs_scan: corrupt empty space at =
LEB 732:60500
> [   97.230000] UBIFS error (pid 278): ubifs_scanned_corruption: corruptio=
n at LEB 732:60500=20
> [   97.230000] UBIFS error (pid 278): ubifs_scanned_corruption: first 819=
2 bytes from LEB 732:60500=20
> [   97.240000] 00000000: ffffffbf ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff  ................................
...                              ^ Bit error
> [   97.260000] UBIFS error (pid 278): ubifs_scan: LEB 732 scanning failed=
=20
> [   97.260000] UBIFS error (pid 278): do_commit: commit failed, error -11=
7
> [   97.270000] UBIFS warning (pid 278): ubifs_ro_mode: switched to read-o=
nly mode, error -117

Now, the real reason for this was a buggy MTD driver, which didn't
handle bit errors in erased pages at all. It's quite traditional, I've
seen variations of such bugs in several different MTD drivers.

But that doesn't mean that real ECC errors in erased pages are
impossible. So I've added some code to deliberately cause such
errors, in an attempt to reproduce the one above.

In a nutshell, I'm enabling some error injection code during the
ubifs_sync_fs() function call. The mtd-level code, when enabled,
finds the first fully erased page that is being read, and then
persistently reports ECC error on it.

I was, so far, unable to reproduce the error on the above code
path - in most cases, the block got tortured and marked as bad,
no read-only mount.

Here is a different case of read-only mounting triggered by
the error injection code:

[  299.610000] Page 121728, simulated erase error
[  299.620000] Page 121728, Uncorrectable bit errors
[  299.630000] UBI error: erase_worker: failed to erase PEB 1070, error -74
[  299.640000] UBI warning: ubi_ro_mode: switch to read-only mode
[  299.640000] [<c000d69c>] (unwind_backtrace+0x0/0x11c) from [<c0210584>] =
(erase_worker+0x3bc/0x41c)
[  299.650000] [<c0210584>] (erase_worker+0x3bc/0x41c) from [<c020f890>] (d=
o_work+0xa8/0xe4)
[  299.660000] [<c020f890>] (do_work+0xa8/0xe4) from [<c0211948>] (ubi_thre=
ad+0xd0/0x1a0)
[  299.670000] [<c0211948>] (ubi_thread+0xd0/0x1a0) from [<c0030610>] (kthr=
ead+0x80/0x8c)
[  299.680000] [<c0030610>] (kthread+0x80/0x8c) from [<c0009be8>] (kernel_t=
hread_exit+0x0/0x8)
[  299.680000] UBI error: do_work: work failed with error code -74
[  299.690000] UBI error: ubi_thread: ubi_bgt11d: work failed with error co=
de -74
[  299.710000] UBIFS error (pid 239): ubifs_leb_write: writing 2048 bytes t=
o LEB 1172:10240 failed, error -30
[  299.720000] UBIFS warning (pid 239): ubifs_ro_mode: switched to read-onl=
y mode, error -30

My error injection code control is subject to race conditions,
so the above is from a competing context to ubifs_sync_fs().
