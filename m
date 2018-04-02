From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH] Add sysfs attribute for mtd OOB available size
Date: Mon, 2 Apr 2018 16:20:09 +0800
Message-ID: <1522657210-56833-1-git-send-email-xiaolei.li@mediatek.com>
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

This patch adds one new sysfs node named oobavail to expose mtd OOB
available size.

Changes relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : mtd/next
commit  :
	'commit 097ccca726ff ("mtd: nand: Fix some function
	 description mismatches in core.c")'

Xiaolei Li (1):
  mtd: Add sysfs attribute for mtd OOB available size

 Documentation/ABI/testing/sysfs-class-mtd |  8 ++++++++
 drivers/mtd/mtdcore.c                     | 10 ++++++++++
 2 files changed, 18 insertions(+)

-- 
1.9.1
