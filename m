Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FS0-0006DA-16
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:49:08 +0000
Subject: [PATCH linux-next v4 05/11] MIPS: bcm963xx: Update bcm_tag field
 image_sequence
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF5CC.20908@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:48:44 +0000
MIME-Version: 1.0
In-Reply-To: <566DF43B.5010400@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "dual_image" and "inactive_flag" fields should be merged into a single
"image_sequence" field.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: New patch.

 include/linux/bcm963xx_tag.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/linux/bcm963xx_tag.h b/include/linux/bcm963xx_tag.h
index 08e0133..161c7b3 100644
--- a/include/linux/bcm963xx_tag.h
+++ b/include/linux/bcm963xx_tag.h
@@ -12,8 +12,7 @@
 #define CHIPID_LEN		6	/* Chip Id Length */
 #define IMAGE_LEN		10	/* Length of Length Field */
 #define ADDRESS_LEN		12	/* Length of Address field */
-#define DUALFLAG_LEN		2	/* Dual Image flag Length */
-#define INACTIVEFLAG_LEN	2	/* Inactie Flag Length */
+#define IMAGE_SEQUENCE_LEN	4	/* Image sequence Length */
 #define RSASIG_LEN		20	/* Length of RSA Signature in tag */
 #define TAGINFO1_LEN		30	/* Length of vendor information field1 in tag */
 #define FLASHLAYOUTVER_LEN	4	/* Length of Flash Layout Version String tag */
@@ -72,10 +71,10 @@ struct bcm_tag {
 	char kernel_address[ADDRESS_LEN];
 	/* 128-137: Size of kernel */
 	char kernel_length[IMAGE_LEN];
-	/* 138-139: Unused at the moment */
-	char dual_image[DUALFLAG_LEN];
-	/* 140-141: Unused at the moment */
-	char inactive_flag[INACTIVEFLAG_LEN];
+	/* 138-141: Image sequence number
+	 * (to be incremented when flashed with a new image)
+	 */
+	char image_sequence[IMAGE_SEQUENCE_LEN];
 	/* 142-161: RSA Signature (not used; some vendors may use this) */
 	char rsa_signature[RSASIG_LEN];
 	/* 162-191: Compilation and related information (not used in OpenWrt) */
-- 
2.1.4

-- 
Simon Arlott
