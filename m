Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1Yv0-0007TF-Vu
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 10:34:40 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 0/2] mtd: nand: optimize subpage writes
Date: Mon, 30 Jun 2014 16:03:59 +0530
Message-ID: <1404124441-26038-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch cleans and fixes nand_write_subpage_hwecc() for devices supporting
subpages. Devices supporting subpage write must support NAND_CMD_RNDIN(0x80)

As per datasheet following devices support above command
Macronix	MX30LF1G08	Figure 13. AC Waveforms for Random Data In (For Page Program)
Samsung		K9F1G08U0E	Figure 4.9 Page Program Operation with Random Data Input
Micron		MT29F[2G|4G]xx	Section RANDOM DATA INPUT 85h
Spansion	S34ML[xx]G2	Figure 6.11 Page Program Operation with Random Data Input
Toshiba		TC58NVG1S3ETAI0	Section: Random Column Address Change in Auto Page Program Operation

- This series needs testing with multiple drivers and above devices to check
  full compliance and working of subpage writes.
- Use 'ubiformat -s <subpage-size>' option to format a UBIFS image on subpages
  supporting device

Pekon Gupta (2):
  mtd: nand: clean nand_write_subpage_hwecc to reduce local variables
  mtd: nand: refactor nand_write_subpage_hwecc to write only relevant
    subpage data

 drivers/mtd/nand/nand_base.c | 51 +++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

-- 
1.8.5.1.163.gd7aced9
