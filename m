Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K24Ce-0003gD-AF
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 12:59:28 +0000
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m4UCxE0f024524
	for <linux-mtd@lists.infradead.org>; Fri, 30 May 2008 15:59:26 +0300
Message-ID: <483FF972.9010707@nokia.com>
Date: Fri, 30 May 2008 15:56:18 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] [MTD] nandsim: fix size bug
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index bb885d1..b28d760 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -511,7 +511,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	}
 
 	if (ns->options & OPT_SMALLPAGE) {
-		if (ns->geom.totsz < (32 << 20)) {
+		if (ns->geom.totsz <= (32 << 20)) {
 			ns->geom.pgaddrbytes  = 3;
 			ns->geom.secaddrbytes = 2;
 		} else {
-- 
1.5.2.5
