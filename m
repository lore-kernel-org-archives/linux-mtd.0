From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 0/2] Fix some function description mismatches
Date: Wed, 28 Mar 2018 17:13:56 +0800
Message-ID: <1522228438-64034-1-git-send-email-xiaolei.li@mediatek.com>
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

This patch fixes some function description mismatches.

Changes relative to:
--------------------

tree	: https://github.com/bbrezillon/linux-0day
branch	: nand/next
commit	:
	'commit ba4150b1ec2a ("mtd: rawnand: s3c2410: enhance the probe
	function error path")'

Xiaolei Li (2):
  mtd: Fix some function description mismatches in mtdcore.c
  mtd: nand: Fix some function description mismatches in core.c

 drivers/mtd/mtdcore.c   |  8 ++++----
 drivers/mtd/nand/core.c | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.9.1
