Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSnrN-0001rw-V4
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 09:41:23 +0000
Message-ID: <4D088B81.2000804@nokia.com>
Date: Wed, 15 Dec 2010 11:33:53 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to
	onenand_chip
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>	<20101213122057.20685.68480.sendpatchset@ahunter-work.research.nokia.com>
	<AANLkTi=0W8NuF3SNhWwjwDZtuCzyOM8219_pXG=9pU6O@mail.gmail.com>
In-Reply-To: <AANLkTi=0W8NuF3SNhWwjwDZtuCzyOM8219_pXG=9pU6O@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 From ece28a7fdec36fb40d60d35a5639326871c162f6 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Fri, 19 Feb 2010 15:39:52 +0100
Subject: [PATCH V2 2/7] mtd: OneNAND: add enable / disable methods to onenand_chip

Add enable / disable methods called from get_device() / release_device().
These can be used, for example, to allow the driver to prevent the voltage
regulator from being put to sleep while OneNAND is in use.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
  drivers/mtd/onenand/onenand_base.c |    4 ++++
  include/linux/mtd/onenand.h        |    2 ++
  2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index c38bf9c..5639e43 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -948,6 +948,8 @@ static int onenand_get_device(struct mtd_info *mtd, int new_state)
  		if (this->state == FL_READY) {
  			this->state = new_state;
  			spin_unlock(&this->chip_lock);
+			if (new_state != FL_PM_SUSPENDED && this->enable)
+				this->enable(mtd);
  			break;
  		}
  		if (new_state == FL_PM_SUSPENDED) {
@@ -974,6 +976,8 @@ static void onenand_release_device(struct mtd_info *mtd)
  {
  	struct onenand_chip *this = mtd->priv;
  
+	if (this->state != FL_PM_SUSPENDED && this->disable)
+		this->disable(mtd);
  	/* Release the chip */
  	spin_lock(&this->chip_lock);
  	this->state = FL_READY;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 6da3fe3..ae418e4 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -118,6 +118,8 @@ struct onenand_chip {
  	int (*chip_probe)(struct mtd_info *mtd);
  	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
  	int (*scan_bbt)(struct mtd_info *mtd);
+	int (*enable)(struct mtd_info *mtd);
+	int (*disable)(struct mtd_info *mtd);
  
  	struct completion	complete;
  	int			irq;
-- 
1.7.0.4
