Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJab1-0004Pz-L9
 for linux-mtd@lists.infradead.org; Sat, 01 Mar 2014 03:28:16 +0000
Received: by mail-la0-f50.google.com with SMTP id y1so3242843lam.37
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2014 19:27:50 -0800 (PST)
MIME-Version: 1.0
Sender: pladow@gmail.com
Date: Fri, 28 Feb 2014 19:27:50 -0800
Message-ID: <CAN8Q1Ed_o3xFK_xag76CbiSWNuM-rnSbGSFc5uZ7KjcA5kOXqQ@mail.gmail.com>
Subject: ECC Errors/Sub-page Read Failures
From: Peter LaDow <petela@gocougs.wsu.edu>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have been using a Samsung NAND part for several years (Samsung
K9WAG08U1D) without any problems.  We transitioned from 2.6 to the 3.0
kernel with a few tweaks to our NAND driver without any hiccups.  (Or
NAND controller is a custom part implemented in an FPGA with our own
NAND driver in the kernel).

However, Samsung has announced the end of life for the part.  However,
they have a revision (K9WAG08U1E) they claim is a drop-in replacement.
 But so far we are having trouble qualifying the part because of ECC
errors.  We made no changes to our kernel, driver, or NAND controller.
 The only change is the physical part.

Review of the datasheet says the only change was the maximum busy
pulse width (from 25us to 40us).  Our NAND controller already monitors
busy, so we don't think this is the issue.  We've queried Samsung
about any other changes, and they claim the parts are functionally
identical.

So, here's what we've done to try and figure things out.  I've
searched the archives and found mention of the MTD_TESTS, and I
recompiled the kernel with those modules and used them.  The notable
module with an error is mtd_subpagetest.  In the archives, I see
issues related to this failing (specifically the thread on 'Assistance
with debugging ubi_io_read' on 2012-03-15).  From that thread there
was mention of an issue with sub-page reads.

I've tried this using 3.0 and 3.10, and I get the same behavior.  So I
don't think Samsung added any functionality that isn't supported by
3.0.

So, first thing I so is format.

# ubiformat /dev/mtd1
uncorrectable error :
uncorrectable error :
....
uncorrectable error :
uncorrectable error :
ubiformat: 8 bad eraseblocks found, numbers: 8188, 8189, 8190, 8191, 16380, 1633
ubiformat: warning!: 16376 of 16376 eraseblocks contain non-ubifs data
ubiformat: continue? (yes/no)  yes
ubiformat: warning!: only 0 of 16376 eraseblocks have valid erase counter
ubiformat: erase counter 0 will be used for all eraseblocks
ubiformat: note, arbitrary erase counter value may be specified using -e option
ubiformat: continue? (yes/no)  yes
#

Now things seem to be ok.  I can do the format again:

# ubiformat /dev/mtd1
ubiformat: mtd1 (nand), size 2147483648 bytes (2.0 GiB), 16384
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 16383 -- 100 % complete
ubiformat: 16376 eraseblocks have valid erase counter, mean value is 0
ubiformat: 8 bad eraseblocks found, numbers: 8188, 8189, 8190, 8191,
16380, 16381, 16382, 16383
ubiformat: formatting eraseblock 16383 -- 100 % complete

Now I load the mtd_subpagetest module, and I get:

# insmod mtd_subpagetest.ko dev=1
=================================================
mtd_subpagetest: MTD device: 1
mtd_subpagetest: MTD device size 2147483648, eraseblock size 131072,
page size 2048, subpage size 512, count of eraseblocks 16384, pages
per eraseblock 64, OOB size 64
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: block 8188 is bad
mtd_subpagetest: block 8189 is bad
mtd_subpagetest: block 8190 is bad
mtd_subpagetest: block 8191 is bad
mtd_subpagetest: block 16380 is bad
mtd_subpagetest: block 16381 is bad
mtd_subpagetest: block 16382 is bad
mtd_subpagetest: block 16383 is bad
mtd_subpagetest: scanned 16384 eraseblocks, 8 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: written up to eraseblock 0
mtd_subpagetest: written up to eraseblock 256
mtd_subpagetest: written up to eraseblock 512
mtd_subpagetest: written up to eraseblock 768
mtd_subpagetest: written up to eraseblock 1024
mtd_subpagetest: written up to eraseblock 1280
mtd_subpagetest: written up to eraseblock 1536
...
mtd_subpagetest: written up to eraseblock 15872
mtd_subpagetest: written up to eraseblock 16128
mtd_subpagetest: written 16384 eraseblocks
mtd_subpagetest: verifying all eraseblocks
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC errormtd_subpagetest: error:
read failed at 0x0
mtd_subpagetest: error -74 occurred
=================================================
insmod: can't insert 'mtd_subpagetest.ko': Bad message

Now, things are back to the screwed up state.  If I re-run ubiformat,
I get the same error as before.  So this flopping between ubiformat,
mtd_subpagetest, ubiformat, etc causes these ECC errors to appear.

What boggles me is that things work just fine with our NAND controller
and driver with the earlier revision part, and suddenly fail with this
new part.  Samsung claims the flash layout is identical (OOB space is
the same), the level of ECC necessary is the same, etc.

Thanks,
Pete
