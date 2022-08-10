Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD4C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fpLqe2+os5thjY5C5ZFEGwZ0YkYbP2vc3hjtPo5RPI8=; b=gsNVPs6letoAT3
	+XiKeKiRqHzoGor3ccxAboCR5H2kgUXp1lRDJ/I+VkrTjIeIqXNdDEJ47+1lYF9Rk4zcK7WTrtgv4
	yHMljNrjsZb5ICS+/Q996IlI7v3EsezV2TWE0vRfbRhlpnmmT3XQ5d6EblI0jFF/ebHHs3V9+eg+f
	rS0hEnIBycjhsg2p3B15mNLxD8dJIqjLfWfJc6NT2S700OaPs+vjNb4wCTFKsJMfzvCB7mekYJzSX
	cok8LJV0s9kNvxEVvh7FSVOSPQWp6yVDkNzcor1qxOfDOLM1SzZLXRwYYX4E9o57OtK+i0+mYReCj
	lekdfrXIfCxH3rpyFneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLltD-00C3tM-W8; Wed, 10 Aug 2022 13:36:52 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLls5-00C3JE-6M
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:35:42 +0000
X-QQ-mid: bizesmtp87t1660138534t671eein
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:35:32 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: YHTLUubWl24Slu4pVAID6bxJUflmsmt+JbUdJbjA0TwZHDJ+hVF/dgy7djQt8
	zQ8R6YlY51wydDSXpBqU7MrNG4ng2aoBZbZIdHNpAAj3EaC+XxDzuqeF90Yb9TRkvK38S5p
	wwyxjOafxM7wr33uxjAPpkQzYdTUn3iMcbFg2R+hhvQmgqNVFy4RS2+qJZD4sKUHHwniD9A
	ATMK2tptX7EwlqhfFUfwZieEoiBlJevNeEqvQARWx5uBQeTCB7EMgxCu2DRKCFHvuAXBISy
	M3EDxH6CaV1p5YzYIkg37IaMSpUqS32NSgUkZFcLP3z8e0KUpXxkfwI9RBOLCoE949aLGbx
	3Ksscsn0pvTzwKw+meqSYguo3swl9lXjZrR2JqzkfpUKPWtTw98Rbc+XFuKls5pCO05/Tyx
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] mtd/ubi: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:35:26 +0800
Message-Id: <20220810133526.2958-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_063541_709638_C982D205 
X-CRM114-Status: GOOD (  11.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

 Delete the redundant word 'also'.
 Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/ubi/ubi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 078112e23dfd..0110eb3d4db6 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -86,7 +86,7 @@ void ubi_err(const struct ubi_device *ubi, const char *fmt, ...);
  * Error codes returned by the I/O sub-system.
  *
  * UBI_IO_FF: the read region of flash contains only 0xFFs
- * UBI_IO_FF_BITFLIPS: the same as %UBI_IO_FF, but also also there was a data
+ * UBI_IO_FF_BITFLIPS: the same as %UBI_IO_FF, but also there was a data
  *                     integrity error reported by the MTD driver
  *                     (uncorrectable ECC error in case of NAND)
  * UBI_IO_BAD_HDR: the EC or VID header is corrupted (bad magic or CRC)
@@ -281,7 +281,7 @@ struct ubi_eba_leb_desc {
 
 /**
  * struct ubi_volume - UBI volume description data structure.
- * @dev: device object to make use of the the Linux device model
+ * @dev: device object to make use of the Linux device model
  * @cdev: character device object to create character device
  * @ubi: reference to the UBI device description object
  * @vol_id: volume ID
@@ -439,7 +439,7 @@ struct ubi_debug_info {
 
 /**
  * struct ubi_device - UBI device description structure
- * @dev: UBI device object to use the the Linux device model
+ * @dev: UBI device object to use the Linux device model
  * @cdev: character device object to create character device
  * @ubi_num: UBI device number
  * @ubi_name: UBI device name
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
