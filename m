Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvNEC-0003Yh-KB
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 09:57:25 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH 0/4] UBI: Fastmap: Some cleanup and check if a vol exists
 when attaching
Date: Thu, 21 May 2015 09:56:01 +0000
Message-ID: <1432202165-22351-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, folks,

PATCH 1-3 do some cleanup.

PATCH 4 checks if a volume already exists when fastmap doing attach.
ubi_write_fastmap() does not guarantee if two volumes have the same vol
ID. So fastmap should check it when attaching, and if something is wrong,
scan_all() could try to attach instead of fastmap.

thanks,
Sheng

Sheng Yong (4):
  UBI: Fastmap: Use max() to get the larger value
  UBI: Fastmap: Remove unnecessary `\'
  UBI: Fastmap: Rename variables to make them meaningful
  UBI: Fastmap: Do not add vol if it already exists

 drivers/mtd/ubi/build.c   |  4 +--
 drivers/mtd/ubi/fastmap.c | 81 +++++++++++++++++++++++++----------------------
 2 files changed, 46 insertions(+), 39 deletions(-)

-- 
1.8.3.4
