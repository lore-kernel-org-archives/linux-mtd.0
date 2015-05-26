Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBni-0006w4-BL
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:09:38 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH v2 0/6] UBI: Some cleanup and check if a vol exists when
 fastmap attaching
Date: Tue, 26 May 2015 10:07:04 +0000
Message-ID: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
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

V2:
* change the commit message of PATCH 5. In normal cases, including unclean
  reboot and ECC scenario, there is no way to have two same vol_id saved in
  different slots in ubi->volumes[], so add_vol() in fastmap attach won't
  go wrong. Only if the on-flash fastmap is modified by hand, this issue
  may be triggered.
  Thanks Richard Weinberger for pointing this out.

* add two more cleanup.
  . add a helper function for updatting on-flash layout volumes. No
    semantic changes.

V1:
http://lists.infradead.org/pipermail/linux-mtd/2015-May/059355.html

Thanks,
Sheng

Sheng Yong (6):
  UBI: Fastmap: Use max() to get the larger value
  UBI: Fastmap: Remove unnecessary `\'
  UBI: Fastmap: Rename variables to make them meaningful
  UBI: Init vol->reserved_pebs by assignment
  UBI: Fastmap: Do not add vol if it already exists
  UBI: add a helper function for updatting on-flash layout volumes

 drivers/mtd/ubi/build.c   |  4 +--
 drivers/mtd/ubi/fastmap.c | 81 +++++++++++++++++++++++++----------------------
 drivers/mtd/ubi/vmt.c     |  4 +--
 drivers/mtd/ubi/vtbl.c    | 45 ++++++++++++++------------
 4 files changed, 72 insertions(+), 62 deletions(-)

-- 
1.8.3.4
