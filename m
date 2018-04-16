Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f86q7-0007Yg-UP
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2018 16:18:50 +0000
To: linux-mtd@lists.infradead.org, buildroot@busybox.net,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Timothy Redaelli (Arch)" <timothy.redaelli@gmail.com>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.0.2 is released
Message-ID: <278ba797-ccb3-fdc0-290f-50f4642ab66d@sigma-star.at>
Date: Mon, 16 Apr 2018 18:18:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

mtd-utils-2.0.2 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
0.2.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
0.2.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.0.2


This release contains mainly bug fixes and cleanups that have accumulated
since the release of mtd-utils 2.0.1.


Changes from 2.0.1 to 2.0.2:

Features:
 - libmtd: Add support to access OOB available size
 - mkfs.ubifs: Allow root entry in device table

Fixes:
 - Fix unit-test header and file paths for out of tree builds
 - Fix unit test mockup for oobavail sysfs file
 - misc-utils: flash_erase: Fix Jffs2 type flash erase problem
 - libmtd_legacy: Fix some function description mismatches
 - mtd-utils: ubifs: fix typo in without_lzo definition
 - mtd: tests: check erase block count in page test
 - mtd: unittests: Stop testing stat() calls
 - mtd: unittests: Decode arg size from ioctl request
 - mtd: unittests: Use proper unsigned long type for ioctl requests
 - mtd: tests: Fix check on ebcnt in nandpagetest
 - ubi-utils: ubicrc32: process command line arguments first
 - nandbiterrs: Fix erroneous counter increment in for loop body
 - jittertest: Use the appropriate versions of abs()
 - Mark or fix switch cases that fall through
 - mkfs.ubifs: ignore EOPNOTSUPP when listing extended attributes
 - misc-utils: initialize "ip" in docfdisk to NULL
 - mkfs.ubifs: Apply squash-uids to the root node

Cleanup:
 - ubi-utils: ubiformat.c: convert to integer arithmetic
 - mtd-utils: common.c: convert to integer arithmetic
 - Run unit test programs through "make check"
 - Enable more compiler warning flags, fix warnings
 - Add no-return attribute to usage() style functions
 - Remove self-assignments of unused paramters
 - tests: checkfs: Remove unused source file from makefiles
 - ubi-tests: io_update: fix missleading indentation
 - Add ctags files to .gitignore
 - libscan: fix a comment typo in libscan.h
 - libmtd: fix a comment typo in dev_node2num



Raw short log since the 2.0.1 release:


Andrea Adami (2):
      mtd-utils: common.c: convert to integer arithmetic
      ubi-utils: ubiformat.c: convert to integer arithmetic

Balint Reczey (3):
      mtd: unittests: Use proper unsigned long type for ioctl requests
      mtd: unittests: Decode arg size from ioctl request
      mtd: unittests: Stop testing stat() calls

David Engraf (1):
      mkfs.ubifs: Allow root entry in device table

David Oberhollenzer (14):
      ubi-tests: io_update: fix missleading indentation
      misc-utils: initialize "ip" in docfdisk to NULL
      tests: checkfs: Remove unused source file from makefiles
      Remove self-assignments of unused paramters
      Add no-return attribute to usage() style functions
      Mark or fix switch cases that fall through
      jittertest: Use the appropriate versions of abs()
      Enable further warning flags, address new warnings
      nandbiterrs: Fix copy & paste fail
      ubi-utils: ubicrc32: process command line arguments first
      Run unit test programs through "make check"
      Fix unit test mockup for oobavail sysfs file
      Fix unit-test header and file paths for out of tree builds
      Release mtd-utils-2.0.2

Koen Vandeputte (1):
      mtd-utils: ubifs: fix typo in without_lzo definition

Paul HENRYS (1):
      mtd: tests: Fix check on ebcnt in nandpagetest

Pavel Roskin (1):
      mkfs.ubifs: ignore EOPNOTSUPP when listing extended attributes

Rock Lee (2):
      libmtd: fix a comment typo in dev_node2num
      libscan: fix a comment typo in libscan.h

Romain Izard (1):
      mkfs.ubifs: Apply squash-uids to the root node

Stefan Agner (1):
      mtd: tests: check erase block count in page test

Uwe Kleine-K=C3=B6nig (1):
      Add ctags files to .gitignore

Xiaolei Li (3):
      libmtd: Add support to access OOB available size
      libmtd_legacy: Fix some function description mismatches
      misc-utils: flash_erase: Fix Jffs2 type flash erase problem


Regards,

David
