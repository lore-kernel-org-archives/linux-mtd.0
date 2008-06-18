Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91ry-0001jT-Oc
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 17:54:55 +0000
Date: Wed, 18 Jun 2008 19:54:46 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080618175446.GG10271@logfs.org>
References: <20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
	<20080617164629.GG28448@logfs.org>
	<20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
	<20080618174034.GA10271@logfs.org>
	<20080618175253.GD10271@logfs.org>
	<20080618175342.GE10271@logfs.org>
	<20080618175416.GF10271@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080618175416.GF10271@logfs.org>
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH 0/4] [MTD][MTDPART] Fix a division by zero bug

Spotted and debugged by Atsushi Nemoto <anemo@mba.ocn.ne.jp>

When detecting a partition beyond the end of the device, skip most of
the initialisation, in particular those bits causing a division by zero.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 drivers/mtd/mtdpart.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c1a8916..bd51dba 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -420,11 +420,12 @@ static int add_one_partition(struct mtd_info *master,
 
 	/* let's do some sanity checks */
 	if (slave->offset >= master->size) {
-			/* let's register it anyway to preserve ordering */
+		/* let's register it anyway to preserve ordering */
 		slave->offset = 0;
 		slave->mtd.size = 0;
 		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
 			part->name);
+		goto out_register;
 	}
 	if (slave->offset + slave->mtd.size > master->size) {
 		slave->mtd.size = master->size - slave->offset;
@@ -484,6 +485,7 @@ static int add_one_partition(struct mtd_info *master,
 		}
 	}
 
+out_register:
 	if (part->mtdp) {
 		/* store the object pointer (caller may or may not register it*/
 		*part->mtdp = &slave->mtd;
-- 
1.5.3.5
