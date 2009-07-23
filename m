Received: from oul111-200.netplaza.fi ([80.75.107.200] helo=gulp.u--3.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MU3Vw-0005Z8-54
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 18:59:40 +0000
Date: Thu, 23 Jul 2009 20:59:28 +0200
From: erno@gulp.u--3.com
To: debian-arm@lists.debian.org
Subject: UBIFS fails & crashes on SheevaPlug
Message-ID: <20090723185928.GA1612@gulp.u--3.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I installed Debian on my SheevaPlug following instructions at 
<http://www.cyrius.com/debian/kirkwood/sheevaplug/> and everything 
seemed to work fine until...

I wanted to try UBIFS on the built-in flash and followed
the instructions for formatting the internal flash
at http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS
except I made an empty image (no -r parameter for mkfs.ubifs).
After the ubiattach command it complained about a read-only fs
and some error messages from the kernel had appeared in the log:

[  190.500000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[  190.510000] UBI: logical eraseblock size:    129024 bytes
[  190.520000] UBI: smallest flash I/O unit:    2048
[  190.520000] UBI: sub-page size:              512
[  190.530000] UBI: VID header offset:          512 (aligned 512)
[  190.530000] UBI: data offset:                2048
[  191.630000] UBI error: ubi_io_write: error -5 while writing 512 bytes 
to PEB 4054:512, written 0 bytes
[  191.630000] UBI warning: ubi_eba_write_leb: failed to write VID 
header to LEB 2147479551:0, PEB 4054
[  191.640000] UBI: try another PEB
[  191.650000] UBI error: ubi_io_write: error -5 while writing 512 bytes 
to PEB 4053:512, written 0 bytes
[  191.660000] UBI warning: ubi_eba_write_leb: failed to write VID 
header to LEB 2147479551:0, PEB 4053
[  191.670000] UBI: try another PEB
[  191.670000] UBI error: ubi_io_write: error -5 while writing 512 bytes 
to PEB 4052:512, written 0 bytes
[  191.680000] UBI warning: ubi_eba_write_leb: failed to write VID 
header to LEB 2147479551:0, PEB 4052
[  191.690000] UBI: try another PEB
[  191.690000] UBI error: ubi_io_write: error -5 while writing 512 bytes 
to PEB 4051:512, written 0 bytes
[  191.700000] UBI warning: ubi_eba_write_leb: failed to write VID 
header to LEB 2147479551:0, PEB 4051
[  191.710000] UBI warning: ubi_ro_mode: switch to read-only mode
[  191.720000] UBI error: autoresize: cannot auto-resize volume 0

Shortly after this the machine stopped answering ssh/ping and rebooted 
(I had panic on oops and reboot on panic turned on). I didn't have the 
serial console hooked up now so I didn't see messages, but the last time 
I tried it there was some slab corruption oops after the ubiattach 
attempt.

The previous time it was using the stock lenny kernel, this time
it was linux-image-2.6.30-1-kirkwood_2.6.30-3_armel.deb from
http://people.debian.org/~tbm/orion/.

I also get messages like this on boot:

[    4.420000] uncorrectable error : <3>uncorrectable error : 
<3>end_request: I/O error, dev mtdblock0, sector 0
[    4.430000] Buffer I/O error on device mtdblock0, logical block 0
[    4.440000] uncorrectable error : <3>uncorrectable error : 
<3>end_request: I/O error, dev mtdblock0, sector 0
[    4.440000] Buffer I/O error on device mtdblock0, logical block 0
[    4.480000] uncorrectable error : <3>uncorrectable error : 
<3>end_request: I/O error, dev mtdblock0, sector 0

but I'm hopeful it's because something is trying to automatically
access the builtin flash which is in limbo state?

Any ideas welcome,
Erno
