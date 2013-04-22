Received: from mail-oa0-f48.google.com ([209.85.219.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UULnv-0007wL-DE
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 18:49:32 +0000
Received: by mail-oa0-f48.google.com with SMTP id f4so4554424oah.21
 for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2013 11:49:29 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 22 Apr 2013 20:49:29 +0200
Message-ID: <CADX2ZXM65XJb_ht6yQryBMyF=Bs3yQhHkQCjtM3QS_0JjtjyxA@mail.gmail.com>
Subject: corrupted empty space - again [corrected formating]
From: =?ISO-8859-2?Q?Micha=B3_Przep=B3ata?= <michal.przeplata@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem and all,

I am having some issues similar to the ones reported earlier by
others, on this and other lists (corrupted empty space), but
I cannot see reliable solution for this, hence I'm writing it
here for help. I hope you could point me to some solution.

To the point:
- I am using kernel 2.6.35 (with some patches up to 12.2010),
I know - it's old
- chip is Samsung K9F1G08U0D (128MB SLC, 2kB pages, layout is
using ECC for 4x512B subpages), SoC is Freescale i.mx28
- our device must be finished booting and running apps under 10s,
if this is not meet we are powered down (by backend device)
- I didn't run any MTD tests/bonnie++ yet for testing this
chip/MTD driver (could be useful for discovering other issue,
but I don't think it matters for case described below)
- on one of our devices we got UBIFS corruption for R/W data
partition (in empty space area), below is original bug report
log (without further debug messages):
(cut)
[    0.230000] UBI: attaching mtd1 to ubi0
[    0.230000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.230000] UBI: logical eraseblock size:    126976 bytes
[    0.230000] UBI: smallest flash I/O unit:    2048
[    0.230000] UBI: VID header offset:          2048 (aligned 2048)
[    0.230000] UBI: data offset:                4096
[    0.770000] UBI: attached mtd1 to ubi0
[    0.770000] UBI: MTD device name:            "gpmi-nfc-general-use"
[    0.770000] UBI: MTD device size:            117 MiB
[    0.770000] UBI: number of good PEBs:        940
[    0.770000] UBI: number of bad PEBs:         0
[    0.770000] UBI: max. allowed volumes:       128
[    0.770000] UBI: wear-leveling threshold:    4096
[    0.770000] UBI: number of internal volumes: 1
[    0.770000] UBI: number of user volumes:     3
[    0.780000] UBI: available PEBs:             0
[    0.780000] UBI: total number of reserved PEBs: 940
[    0.780000] UBI: number of PEBs reserved for bad PEB handling: 9
[    0.780000] UBI: max/mean erase counter: 407/123
[    0.780000] UBI: image sequence number: 0
[    0.780000] UBI: background thread "ubi_bgt0d" started, PID 30
(cut)
[    0.940000] VFS: Mounted root (squashfs filesystem) readonly on device 2=
54:0.
[    1.760000] UBIFS: recovery needed
[    1.810000] UBIFS: recovery completed
[    1.810000] UBIFS: mounted UBI device 0, volume 2, name "data"
[    1.810000] UBIFS: file system size:   76947456 bytes (75144 KiB,
73 MiB, 606 LEBs)
[    1.810000] UBIFS: journal size:       3809280 bytes (3720 KiB, 3
MiB, 30 LEBs)
[    1.810000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    1.810000] UBIFS: default compressor: zlib
[    1.810000] UBIFS: reserved for root:  3634417 bytes (3549 KiB)
[    3.460000] UBI error: ubi_io_read: error -74 while reading 126976
bytes from PEB 97:4096, read 126976 bytes
[    3.470000] UBIFS error (pid 86): ubifs_scan: corrupt empty space
at LEB 318:116009
[    3.490000] UBIFS error (pid 86): ubifs_scanned_corruption:
corruption at LEB 318:116009
[    3.490000] 00000000: ffffffdf ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[    3.490000] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
(cut)
[    3.560000] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[    3.560000] UBIFS error (pid 86): ubifs_scan: LEB 318 scanning failed
[    3.560000] UBIFS warning (pid 86): ubifs_ro_mode: switched to
read-only mode, error -117
[    3.560000] UBIFS error (pid 86): make_reservation: cannot reserve
137 bytes in jhead 2, error  -117
[    3.580000] UBIFS error (pid 86): do_writepage: cannot write page 1
of inode 1218, error -117
(cut)

It seems that:
a) error is of single bit-flip kind (read decay) (I don't suspect currently
unstable bits issue during erasing/writting)
b) our NAND driver doesn't protect our empty space (no wonder, as 13
bytes ECC used per 512B subpage should be left 0xFF until written
with real data)
c) as checked, this is the first empty-page (2kB) in this PEB,
previous page contains some data (and nothing shows that we have more
than one page corrupted)

I have tried of changing NAND/MTD driver to return -EUCLEAN instead of
-EBADMSG (to fix the problem below UBI layer, pretending that we have
correctable bit-flip). Results (with UBI debug turned on):

FAIL#1 - error was still there (UBIFS corruption when mounting data
partition, required for booting), scrubbing for this PEB was initiated
(ubi_wl_scrub_peb), but happend some time later, when left running after
artificially disconnecting backend (I guess it was scheduled to
ubi_bgt0d task)

FAIL#2 - it seems that PEB 97 was rewritten to PEB 89, however
corrupted empty space was also preserved (sic!) at the very same offset,
hence error is still there (confirmed with nanddump)

That means that further trying to fix that in NAND/MTD driver is futile.
Am I right?

Questions:

1) is there any chance that merging UBI/UBIFS recent source will make it
go away? It is 2.5 year of code development and aside of UBI/UBIFS probably
I would be forced to merge also other subsystems etc. which could result
in merging hell I would like to omit.
I have browsed thru the GIT tree and I see that some 2 years ago some set
of patches introduced 'corrupted PEBs list', that from what I understand,
would make this (and only this!) PEB read-only (unfortunately forever,
which will deplete pool of reserved PEBs sooner, which is also not that
nice). Would merging those patches make UBIFS continue with scanning, or
will this still be scheduled to bg task (ie. useless in this case)?

2) should I try to change UBI/UBIFS to deal with this problem? Ideally
would be if rewritting/recovering this PEB would happen immediately at the
time of discovery (in UBI layer). Alternatively, immediately at UBIFS
layer (in ubifs_scan function, when page is checked for containing
only 0xffffffff). Could you point me to an example that would be proper
for this?

3) what about a band-aid solution (commenting out =91goto corrupted;=92
line) explained in:
http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx
Does UBI/UBIFS does check also for all 0xFF in page before writing (not
as part of any =91extra checks=92 debugging)? If so, then maybe such a
quick-fix could be used (fixing ubifs_scan issue), but best followed with
some soon-to-happen recovery, that will recover this LEB and
erase/reuse the PEB?

Thanks for your help and time!

Regards,
Michal Przeplata
