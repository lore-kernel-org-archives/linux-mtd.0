From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: add BLKPG API based repartition support
Date: Fri, 17 Sep 2010 13:31:40 +0300
Message-Id: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: dwmw2@infradead.org, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


    Add support for mtd repartition based on the block
    device BLKPG interface:
    BLKPG_ADD_PARTITION - for partition creation;
    BLKPG_DEL_PARTITION - for partition delete

    The usage is based on BLKPG ioctl called with
    struct blkpg_ioctl_arg argument. This structure includes the
    reference to struct blkpg_partition discribing the
    partition name, offset and length for partition creation
    and partition number for its deletion.

    Disadvantage: there is no implementation for mtd
    flags control. The flags are always borrowed from
    the master device.

Roman Tereshonkov (2):
  mtd: prepare partition add and del functions for ioctl requests
  mtd: add BLKPG API based repartition support

 drivers/mtd/mtdchar.c          |   62 ++++++++++++++++-
 drivers/mtd/mtdpart.c          |  154 +++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/partitions.h |    5 ++
 3 files changed, 201 insertions(+), 20 deletions(-)
