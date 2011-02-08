Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkPh-0000H8-Lf
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:03:14 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/5] mtd: OneNAND: return read error for 4KiB page read
Date: Tue,  8 Feb 2011 12:02:38 +0200
Message-Id: <1297159362-8407-2-git-send-email-adrian.hunter@nokia.com>
In-Reply-To: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
References: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When reading using the 4KiB page read function, I/O
errors could be ignored if more than 1 page was read
at a time.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index bac41ca..38e6d76 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1132,6 +1132,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			onenand_update_bufferram(mtd, from, !ret);
 			if (ret == -EBADMSG)
 				ret = 0;
+			if (ret)
+				break;
 		}
 
 		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
-- 
1.7.0.4
