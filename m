Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7fry-00005N-3q
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 08:49:38 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <shengyong1@huawei.com>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, <linux-cris-kernel@axis.com>,
 <starvik@axis.com>, <jesper.nilsson@axis.com>, <jschultz@xes-inc.com>,
 <ard.biesheuvel@linaro.org>, <asierra@xes-inc.com>,
 <colin.king@canonical.com>, <fabf@skynet.be>,
 <linux-mtd@lists.infradead.org>, <dmitry.torokhov@gmail.com>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 0/7] MTD RAID layer
Date: Sat, 12 Dec 2015 16:41:00 +0800
Message-ID: <1449909667-7759-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,
	This is V2 for MTD RAID.

Changelog:
	- v1: http://lists.infradead.org/pipermail/linux-mtd/2015-December/063818.html
		- refactored the mtd_raid_create() to make it to be easily
		  used for multi-chips drivers.
		- fix a performance problem in small operation size.

I found there are some drivers is using mtd_concat currently, I
am here to suggest my mtd raid to you guys. Please give a try of
it. I believe that probably provides some good choices to you.

Code:
	kernel:  https://github.com/yangdongsheng/linux  mtd_raid_v2
	user  :  https://github.com/yangdongsheng/mtd-utils mtd_raid_v2

Design for MTD RAID:
---------      -------------
|  ubi  |      |  mtdchar  |
---------      -------------
   |                |
   v                v
----------------------------
|        MTD RAID          |    <----- a new layer here (drivers/mtd/mtd_raid/*)
----------------------------
           |
           v
   ----------------
   |   mtd driver |
   ---------------- 

Of course, that's optional.

There are two ways to use mtd raid.
(1). For multi-chips driver:

	   /dev/mtd0
|--------------------------------|
|  ----------------------------  |
|  |        MTD RAID          |  |
|  ----------------------------  |
|      |             |           |
|      v             v           |
|  -----------   -----------     |
|  | mtd_info|   | mtd_info|     |
|  -----------   -----------     |
|--------------------------------|

When a driver have multiple chips, we can use mtd raid framework to build
them into a raid array and expose a mtd device. There are some drivers
are using mtd_concat, we can do the same thing with mtd_single. At the same
time, mtd raid provides more choices to them, such as raid0 or raid1.

(2). For user:

           /dev/mtd2
|--------------------------------|
|  ----------------------------  |
|  |        MTD RAID          |  |
|  ----------------------------  |
|      |             |           |
|      v             v           |
|  -----------   -----------     |
|  |/dev/mtd0|   |/dev/mtd1|     |
|  -----------   -----------     |
|--------------------------------|

we have a user tool for mtd raid, and user can use it to build raid array.

Example:
	# mtd_raid create --level=0 /dev/mtd0 /dev/mtd1 /dev/mtd2 /dev/mtd3
	# mtdinfo /dev/mtd4
	mtd4
	Name:                           mtdraid0-1
	Type:                           nand
	Eraseblock size:                65536 bytes, 64.0 KiB
	Amount of eraseblocks:          8192 (536870912 bytes, 512.0 MiB)
	Minimum input/output unit size: 512 bytes
	Sub-page size:                  256 bytes
	OOB size:                       16 bytes
	Character device major/minor:   90:8
	Bad blocks are allowed:         true
	Device is writable:             true

There are 4 mtd devices simulated by nandsim, then we create a raid0 with
them.
---------------------------------------------------------------------------
| device| size |  throughput (dd if=/dev/mtdX of=/dev/null bs=1M count=10)|
|--------------------------------------------------------------------------
| mtd0  | 128M |  14.0 MB/s						  |
|--------------------------------------------------------------------------
| mtd1  | 128M |  14.0 MB/s						  |
|--------------------------------------------------------------------------
| mtd2  | 128M |  14.0 MB/s						  |
|--------------------------------------------------------------------------
| mtd3  | 128M |  14.0 MB/s						  |
|--------------------------------------------------------------------------
| mtd4  | 512M |  51.1 MB/s						  |
---------------------------------------------------------------------------

Also we can use raid1 to get a mirror for robustness.

TODO:
	In this framework, we can implement more raid levels. The most useful
one I think is raid5/6, which would do a parity and fixup work in reading. That's
important for MLC or TLC. Raid-level is refered to:

https://en.wikipedia.org/wiki/Standard_RAID_levels 

Dongsheng Yang (7):
  mtd: nandsim: remove the abuse of reference to globle variable.
  mtd: nansim: add support of multi devices.
  mtd: mtd_raid: Init a new layer of MTD RAID
  mtd: mtd_raid: introduce raid single implementation
  mtd: mtd_raid: introduce raid0 implementation
  mtd: mtd_raid: introduce raid1 implementation
  mtd: mtd_raid: implement ioctl for mtd raid

 Documentation/ioctl/ioctl-number.txt |    1 +
 drivers/mtd/Kconfig                  |    2 +
 drivers/mtd/Makefile                 |    1 +
 drivers/mtd/mtd_raid/Kconfig         |   12 +
 drivers/mtd/mtd_raid/Makefile        |    3 +
 drivers/mtd/mtd_raid/core.c          | 1103 ++++++++++++++++++++++++++++++++++
 drivers/mtd/mtd_raid/ioctl.c         |  194 ++++++
 drivers/mtd/mtd_raid/mtd_raid.h      |  273 +++++++++
 drivers/mtd/mtd_raid/raid0.c         |  136 +++++
 drivers/mtd/mtd_raid/raid1.c         |  156 +++++
 drivers/mtd/mtd_raid/raid_io.c       |  449 ++++++++++++++
 drivers/mtd/mtd_raid/raid_single.c   |  156 +++++
 drivers/mtd/nand/nandsim.c           |  312 +++++-----
 include/uapi/mtd/mtd-raid-user.h     |   33 +
 14 files changed, 2687 insertions(+), 144 deletions(-)
 create mode 100644 drivers/mtd/mtd_raid/Kconfig
 create mode 100644 drivers/mtd/mtd_raid/Makefile
 create mode 100644 drivers/mtd/mtd_raid/core.c
 create mode 100644 drivers/mtd/mtd_raid/ioctl.c
 create mode 100644 drivers/mtd/mtd_raid/mtd_raid.h
 create mode 100644 drivers/mtd/mtd_raid/raid0.c
 create mode 100644 drivers/mtd/mtd_raid/raid1.c
 create mode 100644 drivers/mtd/mtd_raid/raid_io.c
 create mode 100644 drivers/mtd/mtd_raid/raid_single.c
 create mode 100644 include/uapi/mtd/mtd-raid-user.h

-- 
1.8.4.2
