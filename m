From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 5/8] UBI: check max_beb_per1024 value in ubi_attach_mtd_dev
Date: Fri, 17 Aug 2012 16:35:21 +0200
Message-Id: <1345214124-5478-6-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

max_beb_per1024 shouldn't be negative, and a 0 value will be treated as
the default value.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/build.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 58fe53d..ec7311f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -855,6 +855,16 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	struct ubi_device *ubi;
 	int i, err, ref = 0;
 
+	if (max_beb_per1024 < 0)
+		return -EINVAL;
+
+	/*
+	 * A value of 0 is forced to the default value to keep the same
+	 * behavior between ubiattach command and module parameter
+	 */
+	if (!max_beb_per1024)
+		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
+
 	/*
 	 * Check if we already have the same MTD device attached.
 	 *
-- 
1.7.2.5
