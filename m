Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TgW6K-00046V-GX
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2012 07:42:33 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: mxc_nand: reorder part_probes to let cmdline
 override other sources
Date: Thu,  6 Dec 2012 08:42:28 +0100
Message-Id: <1354779748-28869-2-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
References: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The cmdline is the easiest to change source of information. Thus
let it take precedence over 'RedBoot' and 'ofpart'. This makes the
mxc_nand driver to be in sync with all other NAND drivers that support
'cmdlinepart' partition parsing.

Also change 'const char *' to 'const char const *' as advised by checkpatch.pl

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/mxc_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d316324..fb98775 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -266,7 +266,8 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
 	}
 };
 
-static const char *part_probes[] = { "RedBoot", "cmdlinepart", "ofpart", NULL };
+static const char const *part_probes[] = {
+	"cmdlinepart", "RedBoot", "ofpart", NULL };
 
 static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
 {
-- 
1.7.2.5
