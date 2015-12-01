Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3ifs-0001cs-10
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 11:00:49 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v1 0/7] Add a mtd raid layer
Date: Tue, 1 Dec 2015 18:52:30 +0800
Message-ID: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
	I am here to release v1 of the mtd raid layer. It's a layer
shown as below:

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


Code:
	kernel:  https://github.com/yangdongsheng/linux  mtd_raid_v1 
	user  :  https://github.com/yangdongsheng/mtd-utils mtd_raid_v1

Thanx
Yang

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
 drivers/mtd/mtd_raid/core.c          | 1000 ++++++++++++++++++++++++++++++++++
 drivers/mtd/mtd_raid/ioctl.c         |  137 +++++
 drivers/mtd/mtd_raid/mtd_raid.h      |  264 +++++++++
 drivers/mtd/mtd_raid/raid0.c         |  136 +++++
 drivers/mtd/mtd_raid/raid1.c         |  156 ++++++
 drivers/mtd/mtd_raid/raid_io.c       |  449 +++++++++++++++
 drivers/mtd/mtd_raid/raid_single.c   |  156 ++++++
 drivers/mtd/nand/nandsim.c           |  312 ++++++-----
 include/uapi/mtd/mtd-raid-user.h     |   33 ++
 14 files changed, 2518 insertions(+), 144 deletions(-)
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
