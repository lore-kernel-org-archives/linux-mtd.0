Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGokL-0004vW-00
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:44:18 +0000
Received: by mail-wm0-x242.google.com with SMTP id k15so19632808wmh.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:43:56 -0700 (PDT)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/5] Extends block2mtd and ubi drivers
Date: Fri,  2 Jun 2017 17:43:37 +0200
Message-Id: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series extends block2mtd and ubi drivers to better handle
read-only devices and allow to load UBI image from local file which was
created for nand device.

Tested for Nokia N900 with Maemo 5 rootfs ubifs image
(rootfs_RX-51_2009SE_21.2011.38-1_PR_MR0) which has erase size 128k,
write size 2k and nand subpage shift 2.

$ losetup -r /dev/loop0 rootfs_RX-51_2009SE_21.2011.38-1_PR_MR0.ubifs
$ echo -n /dev/loop0,131072,2048,2 > /sys/module/block2mtd/parameters/block2mtd
$ ubiattach -p /dev/mtd0
$ mount /dev/ubi0_0 /mnt/ubi -t ubifs
...
$ umount /dev/ubi0_0
$ ubidetach -p /dev/mtd0
$ echo -n del=/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd
$ losetup -d /dev/loop0

Pali Rohár (5):
  mtd: block2mtd: Check for valid user supplied erase size
  mtd: block2mtd: Add support for specifying MTD write size and subpage
    shift
  mtd: block2mtd: Fallback to read-only mode
  mtd: block2mtd: Add support for deleting block2mtd mapping
  ubi: Allow to use read-only UBI volume with not enough PEBs

 drivers/mtd/devices/block2mtd.c |  129 ++++++++++++++++++++++++++++++---------
 drivers/mtd/ubi/vtbl.c          |   14 +++--
 2 files changed, 110 insertions(+), 33 deletions(-)

-- 
1.7.9.5
