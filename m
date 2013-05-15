Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcWiS-0001TM-2O
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 08:05:41 +0000
Message-ID: <1368605277.13665.36.camel@sauron.fi.intel.com>
Subject: Re: corrupted empty space - again
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Przep=C5=82ata?= <michal.przeplata@gmail.com>
Date: Wed, 15 May 2013 11:07:57 +0300
In-Reply-To: <CADX2ZXMgE_Zfj157vgymj0K4MmHddCYqrj=qDUYLmcWj_kk7WQ@mail.gmail.com>
References: <CADX2ZXMgE_Zfj157vgymj0K4MmHddCYqrj=qDUYLmcWj_kk7WQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-22 at 16:19 +0200, Michał Przepłata wrote:
> Hello Artem,
> 
> I am having some issues similar to the ones reported earlier by
> others, on this and other
> lists (corrupted empty space), but I cannot see reliable solution for
> this, hence I'm writing it here for help.
> I hope you could point me to some solution.
> 
> To the point:
> - I am using kernel 2.6.35 (with some patches up to 12.2010), I know - it's old
> - chip is Samsung K9F1G08U0D (128MB SLC, 2kB pages, layout is using
> ECC for 4x512B subpages),
>   SoC is Freescale i.mx28
> - our device must be finished booting and running apps under 10s, if
> this is not meet we are
>   powered down (by backend device)
> - I didn't run any MTD tests/bonnie++ yet for testing this chip/MTD
> driver (could be useful
>   for discovering other issue, but I don't think it matters for case
> described below)
> - on one of our devices we got UBIFS corruption for R/W data partition
> (in empty space area),
>   below is original bug report log (without further debug messages):
> (cut)
> [    0.230000] UBI: attaching mtd1 to ubi0
> [    0.230000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    0.230000] UBI: logical eraseblock size:    126976 bytes
> [    0.230000] UBI: smallest flash I/O unit:    2048
> [    0.230000] UBI: VID header offset:          2048 (aligned 2048)
> [    0.230000] UBI: data offset:                4096
> [    0.770000] UBI: attached mtd1 to ubi0
> [    0.770000] UBI: MTD device name:            "gpmi-nfc-general-use"
> [    0.770000] UBI: MTD device size:            117 MiB
> [    0.770000] UBI: number of good PEBs:        940
> [    0.770000] UBI: number of bad PEBs:         0
> [    0.770000] UBI: max. allowed volumes:       128
> [    0.770000] UBI: wear-leveling threshold:    4096
> [    0.770000] UBI: number of internal volumes: 1
> [    0.770000] UBI: number of user volumes:     3
> [    0.780000] UBI: available PEBs:             0
> [    0.780000] UBI: total number of reserved PEBs: 940
> [    0.780000] UBI: number of PEBs reserved for bad PEB handling: 9
> [    0.780000] UBI: max/mean erase counter: 407/123
> [    0.780000] UBI: image sequence number: 0
> [    0.780000] UBI: background thread "ubi_bgt0d" started, PID 30
> (cut)
> [    0.940000] VFS: Mounted root (squashfs filesystem) readonly on device 254:0.
> [    1.760000] UBIFS: recovery needed
> [    1.810000] UBIFS: recovery completed
> [    1.810000] UBIFS: mounted UBI device 0, volume 2, name "data"
> [    1.810000] UBIFS: file system size:   76947456 bytes (75144 KiB,
> 73 MiB, 606 LEBs)
> [    1.810000] UBIFS: journal size:       3809280 bytes (3720 KiB, 3
> MiB, 30 LEBs)
> [    1.810000] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [    1.810000] UBIFS: default compressor: zlib
> [    1.810000] UBIFS: reserved for root:  3634417 bytes (3549 KiB)
> [    3.460000] UBI error: ubi_io_read: error -74 while reading 126976
> bytes from PEB 97:4096, read 126976 bytes
> [    3.470000] UBIFS error (pid 86): ubifs_scan: corrupt empty space
> at LEB 318:116009
> [    3.490000] UBIFS error (pid 86): ubifs_scanned_corruption:
> corruption at LEB 318:116009
> [    3.490000] 00000000: ffffffdf ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> [    3.490000] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> (cut)
> [    3.560000] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff  ................................
> [    3.560000] UBIFS error (pid 86): ubifs_scan: LEB 318 scanning failed
> [    3.560000] UBIFS warning (pid 86): ubifs_ro_mode: switched to
> read-only mode, error -117
> [    3.560000] UBIFS error (pid 86): make_reservation: cannot reserve
> 137 bytes in jhead 2, error -117
> [    3.580000] UBIFS error (pid 86): do_writepage: cannot write page 1
> of inode 1218, error -117
> (cut)
> 
> It seems that:
> a) error is of single bit-flip kind (read decay) (I don't suspect currently
>     unstable bits issue during erasing/writting)
> b) our NAND driver doesn't protect our empty space (no wonder, as 13
> bytes ECC used
>     per 512B subpage should be left 0xFF until written with real data)
> c) as checked, this is the first empty-page (2kB) in this PEB,
> previous page contains
>     some data (and nothing shows that we have more than one page corrupted)
> 
> I have tried of changing NAND/MTD driver to return -EUCLEAN instead of
> -EBADMSG (to fix
> the problem below UBI layer, pretending that we have correctable
> bit-flip). Results (with UBI debug turned on):
> FAIL#1 - error was still there (UBIFS corruption when mounting data
> partition, required for booting),
>   scrubbing for this PEB was initiated (ubi_wl_scrub_peb), but happend
> some time later, when
>   left running after artificially disconnecting backend (I guess it
> was scheduled to ubi_bgt0d task)
> FAIL#2 - it seems that PEB 97 was rewritten to PEB 89, however
> corrupted empty space was
>   also preserved (sic!) at the very same offset, hence error is still
> there (confirmed with nanddump)
> 
> That means that further trying to fix that in NAND/MTD driver is
> futile. Am I right?
> 
> Questions:
> 1) is there any chance that merging UBI/UBIFS recent source will make
> it go away? 

No.

> 2) should I try to change UBI/UBIFS to deal with this problem? Ideally
> would be if rewritting/recovering
>    this PEB would happen immediately at the time of discovery (in UBI
> layer). Alternatively, immediately
>    at UBIFS layer (in ubifs_scan function, when page is checked for
> containing only 0xffffffff).
>    Could you point me to an example that would be proper for this?

Currently UBI/UBIFS assume that drivers fix-up bit-flips in erased
areas.

Why the fact that the driver does not protect the empty space does not
worry you? Isn't it a flaw? If you have empty space with too many
bit-flips, and write useful data there which you then cannot read, isn't
it a problem?

To me it really sounds like it is job of MTD layer and/or the driver to
protect the empty space. Probably MTD may provide some generic methods
which could be used by those drivers which do not have own protection?

> 3) what about a band-aid solution (commenting out ‘goto corrupted;’
> line) explained in:
>    http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx
>    Does UBI/UBIFS does check also for all 0xFF in page before writing
> (not as part of any ‘extra checks’
>    debugging)? If so, then maybe such a quick-fix could be used
> (fixing ubifs_scan issue), but best
>    followed with some soon-to-happen recovery, that will recover this
> LEB and erase/reuse the PEB?

I think this is a bad idea, because this way you also ignore real
corruptions, instead of noticing them right away.

-- 
Best Regards,
Artem Bityutskiy
