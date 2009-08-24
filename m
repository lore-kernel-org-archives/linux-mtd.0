Received: from smtp2e.orange.fr ([80.12.242.111])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfXTd-0007rR-De
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 11:12:45 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: util-linux-ng@vger.kernel.org
Subject: [PATCH 0/3] Add support for UBI and UBIFS
Date: Mon, 24 Aug 2009 13:11:53 +0200
Message-Id: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Here is some patchs to add support for UBI and UBIFS in libblkid.

UBIFS works on top of UBI volumes, there are 3 subsystems involved:
  * MTD subsystem, which provides uniform interface to access flash chips.
    MTD provides an notion of MTD devices (e.g., /dev/mtd0) which basically represents raw flash;
  * UBI subsystem, which is a wear-leveling and volume management system for flash devices;
    UBI works on top of MTD devices and provides a notion of UBI volumes (e.g.m /dev/ubi0_0);
  * UBIFS file system, which works on top of UBI volumes.

The first patch add support for UBI volumes, which are represented as char devices in /dev/.
This allow to probe for UBIFS filesystem on UBI volumes.

Thanks,

Corentin Chary (3):
  blkid: add UBI volume support
  blkid: add ubifs support
  blkid: add UBIFS test image to blkid test suite

 shlibs/blkid/src/blkidP.h            |    1 +
 shlibs/blkid/src/devname.c           |   56 +++++++++++++++-
 shlibs/blkid/src/probe.c             |    5 +-
 shlibs/blkid/src/probers/Makefile.am |    3 +-
 shlibs/blkid/src/probers/probers.h   |    1 +
 shlibs/blkid/src/probers/ubifs.c     |  122 ++++++++++++++++++++++++++++++++++
 tests/expected/blkid/low-probe-ubifs |    5 ++
 tests/ts/blkid/images/ubifs.img.bz2  |  Bin 0 -> 937 bytes
 8 files changed, 190 insertions(+), 3 deletions(-)
 create mode 100644 shlibs/blkid/src/probers/ubifs.c
 create mode 100644 tests/expected/blkid/low-probe-ubifs
 create mode 100644 tests/ts/blkid/images/ubifs.img.bz2
