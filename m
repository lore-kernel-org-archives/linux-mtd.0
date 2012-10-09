From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH 11/11] nand: Increase the ecc placement locations to 640
Date: Tue, 9 Oct 2012 16:14:53 +0530
Message-ID: <67e0aae3b23f37feb30789f5c6cb342b5684911a.1349778821.git.vipin.kumar@st.com>
In-Reply-To: <cover.1349778820.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few devices like H27UBG8T2CTR have a writesize/oobsize of 8KB/640B.
This means that the maximum oobsize has gone up to 640 bytes and consequently
the maximum ecc placement locations have also gone up to 640.

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 include/linux/mtd/mtd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 81d61e7..f9ac289 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -98,7 +98,7 @@ struct mtd_oob_ops {
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
-#define MTD_MAX_ECCPOS_ENTRIES_LARGE	448
+#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
 /*
  * Internal ECC layout control structure. For historical reasons, there is a
  * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
-- 
1.7.11.4
