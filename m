Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNTxl-0006K6-Ct
 for linux-mtd@lists.infradead.org; Fri, 29 Aug 2014 21:44:05 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/3] UBI: block: Some fixes for static volumes
Date: Fri, 29 Aug 2014 18:42:27 -0300
Message-Id: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This patchset addresses some issues found when using static volumes
and playing with volume resize, update, and truncate operations.

The first patch changes the block interface to use the volume 'used_bytes'
which is the actual data size. It fixes a current issue with static volumes
which produces a nasty error when they are read past the data offset.

$ cat /dev/ubiblock0_0 > /dev/null
UBI error: ubiblock_read_to_buf: ubiblock0_0 ubi_read error -22
end_request: I/O error, dev ubiblock0_0, sector 9536
Buffer I/O error on device ubiblock0_0, logical block 2384
[snip]

It's an annoying error, but on the other side, it should never be produced
if the block is used to mount a file system, so I'm not sure it's serious
enough to go the -stable.

The second and third patches add the required changes for the block interface
to catch the "volume updated" notification. For static volumes, the
'used_bytes' parameter can be changed when updating the volume.

Comments and feedback welcome!

Ezequiel Garcia (3):
  UBI: block: Fix block device size setting
  UBI: block: Add support for the UBI_VOLUME_UPDATED notification
  UBI: Dispatch update notification if the volume is updated

 drivers/mtd/ubi/block.c | 24 ++++++++++++++++++------
 drivers/mtd/ubi/cdev.c  |  4 +++-
 2 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.0.1
