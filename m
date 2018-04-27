Received: from mail-he1eur01on0122.outbound.protection.outlook.com
 ([104.47.0.122] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBr8p-0003W1-MI
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 00:22:09 +0000
From: Jane Wan <Jane.Wan@nokia.com>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ties.bos@nokia.com, Jane Wan <Jane.Wan@nokia.com>
Subject: [PATCH 0/2] Fix fsl_ifc_nand reading ONFI parameters to meet ONFI spec
Date: Thu, 26 Apr 2018 17:19:54 -0700
Message-Id: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
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

Per ONFI specification (Rev. 4.0), if the CRC of the first parameter page
read is not valid, the host should read redundant parameter page copies
until it finds a valid copy.  If all three parameter pages have invalid
CRC values, the bit-wise majority may be used to recover the contents of
the parameter pages from the parameter page copies present.

The FSL NAND driver only reads the first page.  The first patch fixes the
driver to read all three parameter pages.  The second patch is the change
for using bit-wise majority to recover the contents of ONFI parameter.

Jane Wan (2):
  Fix FSL NAND driver to read all ONFI parameter pages
  Use bit-wise majority to recover the contents of ONFI parameter

 drivers/mtd/nand/fsl_ifc_nand.c |   10 ++++++----
 drivers/mtd/nand/nand_base.c    |   35 +++++++++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 8 deletions(-)

-- 
1.7.9.5
