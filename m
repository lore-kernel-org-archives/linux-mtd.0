Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDm4-0004ND-QC
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:08:01 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 11/11] mtd: Kbuild: remove reference to MTD_PARTITIONS
Date: Tue, 19 Jul 2011 10:06:16 -0700
Message-ID: <1311095176-5407-12-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/maps/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 891a9e6..1b0d56c 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -254,7 +254,6 @@ config MTD_BCM963XX
 config MTD_LANTIQ
 	tristate "Lantiq SoC NOR support"
 	depends on LANTIQ
-	select MTD_PARTITIONS
 	help
 	  Support for NOR flash attached to the Lantiq SoC's External Bus Unit.
 
-- 
1.7.0.4
