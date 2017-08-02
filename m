Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcsqS-0005AZ-5o
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 12:33:50 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH] mtd: blkdevs: Fix mtd block write failure
Date: Wed,  2 Aug 2017 18:03:05 +0530
Message-Id: <1501677185-1308-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All the MTD block write requests are failing with
following error messages

    mkfs.ext4  /dev/mtdblock0

    print_req_error: I/O error, dev mtdblock0, sector 0
    Buffer I/O error on dev mtdblock0, logical block 0,
    lost async page write

The control is going to default case after block write request
because of missing return.

Fixes: commit 2a842acab109 ("block: introduce new block status code type")
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f336a9b..9ec8f03 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -113,6 +113,7 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
 			if (tr->writesect(dev, block, buf))
 				return BLK_STS_IOERR;
+		return BLK_STS_OK;
 	default:
 		return BLK_STS_IOERR;
 	}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
