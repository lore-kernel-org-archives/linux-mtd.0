From: Ben Shelton <ben.shelton@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com, richard@nod.at
Subject: [PATCH 0/3] mtd: use ONFI bad blocks per LUN to calculate UBIFS bad
 PEB limit
Date: Mon, 11 May 2015 10:19:53 -0500
Message-Id: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
Cc: Ben Shelton <ben.shelton@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For ONFI-compliant NAND devices, the ONFI parameters report the maximum number
of bad blocks per LUN that will be encountered over the lifetime of the device,
so we can use that information to get a more accurate (and smaller) value for
the UBIFS bad PEB limit.

These patches are ordered in terms of their dependencies, but ideally, all 3
would need to be applied for this to work as intended.

Jeff Westfahl (3):
  mtd: introduce function max_bad_blocks
  mtd: nand: implement 'max_bad_blocks' mtd function
  mtd: ubi: use 'max_bad_blocks' to compute bad_peb_limit

 drivers/mtd/mtdpart.c        | 12 ++++++++++++
 drivers/mtd/nand/nand_base.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c      | 10 ++++++++++
 include/linux/mtd/mtd.h      |  1 +
 4 files changed, 58 insertions(+)

-- 
2.4.0
