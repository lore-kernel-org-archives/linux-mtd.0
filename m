Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5Gru-00071L-BR
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2010 11:48:39 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: fix 4KB page onenand chip recognition
Date: Mon, 11 Oct 2010 14:47:32 +0300
Message-Id: <1286797652-13610-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: rohit.hs@samsung.com, kyungmin.park@samsung.com,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For 4Gb non-DDP chip it does not follow that it is always 4KB page chip.
The number of data buffers is checked and if it is equal to 1
we suppose that it is 4KB page onenand chip.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a2bb520..3684313 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3365,18 +3365,19 @@ static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 static void onenand_check_features(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
-	unsigned int density, process;
+	unsigned int density, process, numbufs;
 
 	/* Lock scheme depends on density and process */
 	density = onenand_get_density(this->device_id);
 	process = this->version_id >> ONENAND_VERSION_PROCESS_SHIFT;
+	numbufs = this->read_word(this->base + ONENAND_REG_NUM_BUFFERS) >> 8;
 
 	/* Lock scheme */
 	switch (density) {
 	case ONENAND_DEVICE_DENSITY_4Gb:
 		if (ONENAND_IS_DDP(this))
 			this->options |= ONENAND_HAS_2PLANE;
-		else
+		else if (numbufs == 1)
 			this->options |= ONENAND_HAS_4KB_PAGE;
 
 	case ONENAND_DEVICE_DENSITY_2Gb:
-- 
1.7.0.4
