From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v3] Improve MTK NAND driver
Date: Tue, 24 Apr 2018 10:11:06 +0800
Message-ID: <1524535867-32413-1-git-send-email-xiaolei.li@mediatek.com>
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

This patch fixes some MTK NAND driver DT binding description errors.

Changes relative to:
--------------------
tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
	'commit ba4150b1ec2a ("mtd: rawnand: s3c2410: enhance the probe
	 function error path")'

Patch v3:
  - Remove max_sector_size change. It is uselees now.
  - Remove maximize_fdm_ecc new caps patch. Send a patch series for this
    change in the future.
  - Remove MTK NAND Controller maintainers entry patch. This patch was
    accepted in patch v2.

Patch v2:
  - Add new nfc capability instead of defining new DT property.
  - Remove not backward compat patches about nand-ecc-maximize.

Xiaolei Li (1):
  dt-bindings: mtd: mtk-nand: Update properties description

 Documentation/devicetree/bindings/mtd/mtk-nand.txt | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
1.9.1
