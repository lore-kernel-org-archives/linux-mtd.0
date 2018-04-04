Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3hkz-0001xQ-32
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 12:43:23 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 4/9] mtd: nand: qcom: fix null pointer access for erased
 buffer detection
Date: Wed,  4 Apr 2018 18:12:20 +0530
Message-Id: <1522845745-6624-5-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

parse_read_errors can be called with only oob buf also in which
case data_buf will be NULL.  If data_buf is NULL, then don’t
treat this page as completely erased in case of ECC uncorrectable
error.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 57c16a6..0ebcc55 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1607,9 +1607,11 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 			if (host->bch_enabled) {
 				erased = (erased_cw & ERASED_CW) == ERASED_CW ?
 					 true : false;
-			} else {
+			} else if (data_buf) {
 				erased = erased_chunk_check_and_fixup(data_buf,
 								      data_len);
+			} else {
+				erased = false;
 			}
 
 			if (erased) {
@@ -1652,7 +1654,8 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 			max_bitflips = max(max_bitflips, stat);
 		}
 
-		data_buf += data_len;
+		if (data_buf)
+			data_buf += data_len;
 		if (oob_buf)
 			oob_buf += oob_len + ecc->bytes;
 	}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
