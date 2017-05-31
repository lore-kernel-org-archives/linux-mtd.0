Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFzPP-0006zZ-72
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 08:55:17 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: fstests@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	richard@nod.at
Subject: [PATCH v2] Add UBIFS support to xfstests
Date: Wed, 31 May 2017 10:54:29 +0200
Message-Id: <20170531085433.26865-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,


this patch series attempts to add support for UBIFS to xfstests,
loosely based on the previous patches for xfstests-dev.

UBIFS is a filesystem for unmanaged flash memory devices. It works on
top of UBI (Unsorted Block Images) which is a wear leveling and volume
management layer on top of MTD (memory technology device) which
abstracts flash memory devices.

Since the semantics of MTD and UBI devices are drastically different
from normal block devices, they are exposed to user space as character
devices with ioctls for special operations.

The first patch adds helpers for dealing with character devices, the
second one actually adds the UBIFS support and goes into a little more
detail in its commit message on the quirks of UBIFS in contrast to
other file systems.

One notable quirk is the lack of needing an mkfs.ubifs tool. The kernel
component automatically formats empty UBI devices when mounting them
with '-t ubifs'.

There actually is an mkfs.ubifs, but it is mainly used for creating
images. Also, at the time of writing, it does not yet support the
recently added UBIFS extensions for file level encryption.

Instead of using the mkfs.ubifs tool, the _scratch_mkfs function is
patched to truncate the UBI volume instead, which also required some
changes to a few tests.

The last two patches modify existing tests to work with UBIFS, i.e. in
case of generic/398 to be more tolerant of returned error numbers and
in the last patch to also accept a local character device and properly
specify the filesystem type when remounting.


The patch series has been tested inside a Debian Jessie VM, using the 
UBIFS
kernel tree from git://git.infradead.org/linux-ubifs.git and nandsim 
emulating a nand flash device.


Changes from the last version:
 - Minor refactoring and verbose commentary added as requested
 - Added check for required utilities
 - Addition of a _require_local_device helper for some tests
   instead of completely removing the local device check
 - Broken up into more fine grained patch set and split away
   xfstests-bld patches which are currently still in progress


The necessity of an additional -ubifs switch was discussed but
auto detection of UBIFS formated UBI devices could not be reproduced
on my end and is unlikely to work with empty UBI volumes anyway.


David

[1] http://www.linux-mtd.infradead.org/nand-data/nanddata.html
