Received: from eu1sys200aog118.obsmtp.com ([207.126.144.145])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM1DY-0004jj-Sj
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 18:41:17 +0000
From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
To: shiraz.hashim@st.com
Subject: [PATCH 3.6.0-] mtd/spear_smi: use module_platform_driver macro
Date: Wed, 10 Oct 2012 19:39:59 +0100
Message-Id: <1349894399-9715-1-git-send-email-srinivas.kandagatla@st.com>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 srinivas.kandagatla@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Srinivas Kandagatla <srinivas.kandagatla@st.com>

This patch removes some code duplication by using
module_platform_driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
---
 drivers/mtd/devices/spear_smi.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 6796036..e5f0699 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1129,18 +1129,7 @@ static struct platform_driver spear_smi_driver = {
 	.suspend = spear_smi_suspend,
 	.resume = spear_smi_resume,
 };
-
-static int spear_smi_init(void)
-{
-	return platform_driver_register(&spear_smi_driver);
-}
-module_init(spear_smi_init);
-
-static void spear_smi_exit(void)
-{
-	platform_driver_unregister(&spear_smi_driver);
-}
-module_exit(spear_smi_exit);
+module_platform_driver(spear_smi_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ashish Priyadarshi, Shiraz Hashim <shiraz.hashim@st.com>");
-- 
1.7.0.4
