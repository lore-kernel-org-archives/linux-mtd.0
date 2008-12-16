Date: Tue, 16 Dec 2008 18:21:10 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, jaredeh@gmail.com
Subject: [PATCH 5/8] LPDDR added new pfow_base parameter
Message-ID: <alpine.LFD.2.00.0812161820060.15885@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need to supply additional parameter to mapping driver and tell
LPDDR drivers where PFOW window is in chip mapping.
It leads to necessity of map_info structure extendoing.

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Acked-by: Jared Hulbert <jaredeh@gmail.com>
---

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index aa30244..b981b87 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -223,6 +223,7 @@ struct map_info {
 	   must leave it enabled. */
 	void (*set_vpp)(struct map_info *, int);
 
+	unsigned long pfow_base;
 	unsigned long map_priv_1;
 	unsigned long map_priv_2;
 	void *fldrv_priv;
