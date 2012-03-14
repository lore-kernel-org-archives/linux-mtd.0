Received: from eu1sys200aog103.obsmtp.com ([207.126.144.115])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXT-0002lu-Gx
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:25 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 05/13] nand/fsmc: Flip the bit only if the error index is <
 4096
Date: Wed, 14 Mar 2012 11:47:11 +0530
Message-ID: <bd939b7baf9eadce1ee78eb13d901d016c65b462.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ECC can correct upto 8 bits in 512 bytes data + 13 bytes ecc. This means that
the algorithm can correct a max of 8 bits in 4200 bits ie the error indices can
be from 0 to 4199. Of these 0 to 4095 are for data and 4096 to 4199 for ecc.

The driver flips the bit only if the index is <= 4096. This is a bug since the
data bits are only from 0 to 4095.

This patch modifies the check as < 4096

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 3f33103..745db62 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -654,7 +654,7 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 		change_bit(0, (unsigned long *)&err_idx[i]);
 		change_bit(1, (unsigned long *)&err_idx[i]);
 
-		if (err_idx[i] <= chip->ecc.size * 8) {
+		if (err_idx[i] < chip->ecc.size * 8) {
 			change_bit(err_idx[i], (unsigned long *)dat);
 			i++;
 		}
-- 
1.7.0.4
