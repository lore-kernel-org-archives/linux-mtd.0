Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNH8F-0003ud-2q
 for linux-mtd@lists.infradead.org; Mon, 16 Feb 2015 08:34:20 +0000
Message-ID: <1424075632.2573.225.camel@sauron.fi.intel.com>
Subject: Re: UBIFS handling of erased page errors
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Mon, 16 Feb 2015 10:33:52 +0200
In-Reply-To: <EACD232272DA4849B060F0828564D13B56E32C0D59@ntcex01.corp.netcomm.com.au>
References: <EACD232272DA4849B060F0828564D13B56E32C0D59@ntcex01.corp.netcomm.com.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iwo,

On Mon, 2015-02-16 at 17:35 +1100, Iwo Mergler wrote:
> I've noticed that it is possible for UBIFS to become read-only
> after an ECC error when reading an erased page.

Yep, the assumption we have had was that erased regions are ready to use
and free of bit-flips.

> This strikes my as odd - the page was erased, so it doesn't
> contain important filesystem information. I expected UBI
> to deal with this - torture the block, retire it if necessary.

I guess this is what it will do if the driver returns -EIO when write()
is invoked.

> Does this remount behaviour make sense?

Yes, this is a healthy reaction to an unexpected error. Better than
ignore it. So the answer is - it does make sense.

But I guess what you actually meant is more like "is this behaviour
ideal?" or "could we do better?". I think yes, we could do better.

>  Could someone give
> me an example where remounting read-only would serve a data
> integrity purpose under those circumstances?

The point here is that "those circumstances" are not programmed into
UBIFS logic. Therefore, UBIFS uses its default "unexpected error" logic.

> > [   96.830000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 352:4096, read only 126976 bytes, retry
> > [   96.890000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 352:4096, read only 126976 bytes, retry
> > [   96.970000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 352:4096, read only 126976 bytes, retry
> > [   97.070000] UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 352:4096, read 126976 bytes
> > [   97.080000] [<c000d6e4>] (unwind_backtrace+0x0/0x11c) from [<c020dfe4>] (ubi_io_read+0x210/0x320)
> > [   97.090000] [<c020dfe4>] (ubi_io_read+0x210/0x320) from [<c020b550>] (ubi_eba_read_leb+0x354/0x488)
> > [   97.100000] [<c020b550>] (ubi_eba_read_leb+0x354/0x488) from [<c020a37c>] (ubi_leb_read+0x108/0x170)
> > [   97.110000] [<c020a37c>] (ubi_leb_read+0x108/0x170) from [<c0132350>] (ubifs_leb_read+0x28/0x88)
> > [   97.120000] [<c0132350>] (ubifs_leb_read+0x28/0x88) from [<c013a9d4>] (ubifs_start_scan+0xb4/0x13c)
> > [   97.120000] [<c013a9d4>] (ubifs_start_scan+0xb4/0x13c) from [<c013ad48>] (ubifs_scan+0x28/0x330)
> > [   97.130000] [<c013ad48>] (ubifs_scan+0x28/0x330) from [<c0145084>] (layout_in_gaps+0x100/0x528)
> > [   97.140000] [<c0145084>] (layout_in_gaps+0x100/0x528) from [<c0145b88>] (ubifs_tnc_start_commit+0x6dc/0x760)
> > [   97.150000] [<c0145b88>] (ubifs_tnc_start_commit+0x6dc/0x760) from [<c013e8b0>] (do_commit+0x1f8/0x884)
> > [   97.160000] [<c013e8b0>] (do_commit+0x1f8/0x884) from [<c012cb14>] (ubifs_sync_fs+0x64/0x88)
> > [   97.170000] [<c012cb14>] (ubifs_sync_fs+0x64/0x88) from [<c00c7e9c>] (sync_fs_one_sb+0x28/0x2c)
> > [   97.180000] [<c00c7e9c>] (sync_fs_one_sb+0x28/0x2c) from [<c00a7480>] (iterate_supers+0x6c/0xa8)
> > [   97.190000] [<c00a7480>] (iterate_supers+0x6c/0xa8) from [<c00c7f90>] (sys_sync+0x44/0x90)
> > [   97.200000] [<c00c7f90>] (sys_sync+0x44/0x90) from [<c00092c0>] (ret_fast_syscall+0x0/0x2c)
> > [   97.220000] UBIFS error (pid 278): ubifs_scan: corrupt empty space at LEB 732:60500
> > [   97.230000] UBIFS error (pid 278): ubifs_scanned_corruption: corruption at LEB 732:60500 
> > [   97.230000] UBIFS error (pid 278): ubifs_scanned_corruption: first 8192 bytes from LEB 732:60500 
> > [   97.240000] 00000000: ffffffbf ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> ...                              ^ Bit error
> > [   97.260000] UBIFS error (pid 278): ubifs_scan: LEB 732 scanning failed 
> > [   97.260000] UBIFS error (pid 278): do_commit: commit failed, error -117
> > [   97.270000] UBIFS warning (pid 278): ubifs_ro_mode: switched to read-only mode, error -117

So here UBIFS scans an LEB. It encounters an ECC error.

Ideally, it should:
1. Keep scanning
2. Pick all good nodes
3. Look at the error, figure out that this is just corrupt free page at
the end of LEB
4. Recover the LEB.

I think step 3 should be implemented. Right now it will not even go to
the step #2.

> Now, the real reason for this was a buggy MTD driver, which didn't
> handle bit errors in erased pages at all. It's quite traditional, I've
> seen variations of such bugs in several different MTD drivers.

Yes, many people told this. The easiest solution for everyone so far was
to fix/hack the driver. UBIFS assumes free space is ECC-protected. You
need to either satisfy this assumption or improve UBIFS to not assume
it.

> But that doesn't mean that real ECC errors in erased pages are
> impossible. So I've added some code to deliberately cause such
> errors, in an attempt to reproduce the one above.

> I was, so far, unable to reproduce the error on the above code
> path - in most cases, the block got tortured and marked as bad,
> no read-only mount.

Your back-trace shows a very rare case. A sync operation caused writes.
This caused commit. Commit started laying out indexing nodes. Namely, it
started finding out where in the flash indexing data will be written.

And the situation was rare and unfortunate, so there was very little
free space on flash, not enough to write indexing nodes. But there was a
lot of dirty space. So UBIFS used the "in-the-gaps" method for writing
indexing nodes (we cannot do the traditional GC in this case). The
method is about picking an indexing LEB which contains some used data,
but also has a lot of dirty data (the gaps in this case), and the method
is about putting the new index nodes into those gaps.

Anyway, the method found such an LEB, and started scanning it. And there
you hit the error.

This situation is quite rare, because "in-the-gaps" is the last resort
slow method. To trigger it more often, you need to use a nearly full
file-system. Or, just force the in-the-gap method, there is a debugfs
knob for this. Just switch it on and UBIFS will choose the slow
in-the-gaps a lot more often.

HTH,
Artem.
