Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C3FC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jun 2022 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HTjQ5QyQ6Qhf1FY6FlcGlvO8v53X258gG9s1F7rL9kg=; b=NtxiD5VHAxFTwE
	Jb03uC3DepHCrQcOnW5rpWhuor2leiBjzclEhjKiQZ1bYOOjDFu2IXzumWlwlWVo+KGf9pl/tiOTU
	M7FBMpEjJiz/xvyg8Ufpe3WYLhe+8rRGt1fFCfrH5WYJAkAYIwWrf4aUuU3Or98hPBx42N2yAr918
	D570sIAngCUJZjTZ8AbIvQ8Ac3HF9BwCq+GIf/9WAFNMrlRaB1/Z4N1Mvk0aIH55nDhznf6XgN1bF
	eDwg7635U5Tjwf9Zbzz7pODBN3IZvC1bPZ9zj7IA8fsC/QknLcrBKWElqDCy5omi0eBpnd2klIh+K
	MAva8+IJ52rKH4GeS9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Zp4-004VrK-JV; Tue, 21 Jun 2022 09:05:22 +0000
Received: from smtpbg123.qq.com ([175.27.65.52] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZnC-004UcC-Hd
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2022 09:03:31 +0000
X-QQ-mid: bizesmtp77t1655802173t1ri4ivs
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jun 2022 17:02:48 +0800 (CST)
X-QQ-SSF: 0100000000700030B000D00A0000000
X-QQ-FEAT: Nl5n8N+tNREYhL6DlX3QgejGBUg/1T8dAw1RA/MPS9qmCEmaZDlr0i2vhY4IA
	624ll/Pu2H867IKkUPRUEa9SID5HYzJO5qF7mjz3dNoCQQsaew4fn9aNdORTwvA7EXR35g4
	fosJTuHGRrWRf8/VzwMK8CktOxnVYebz+dtRxFCDVXsQ+W/lUhX3iJT+RxhzTI/z/OaOJDC
	/wA224EEpLKVIZfN939AtzkGlfh/YRdWMd1NqClbVxE5tSnZth7gf74woyQ13/UjhyWo0nR
	WthYOFfBuYzJZ0xrMFunuChzO3EG6ZRxT6AvSXUcl4le4P80fADgbwFF0YJe0xwvm2eXcrg
	GQXgNnHxmS3s3DMIp3kInOq6EO/eQ==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiangjian@cdjrlc.com
Subject: [PATCH] ubi: remove unexpected word "the"
Date: Tue, 21 Jun 2022 17:02:47 +0800
Message-Id: <20220621090247.67359-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_020326_972023_2D61E9B8 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

there is an unexpected word "the" in the comments that need to be removed

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/mtd/ubi/ubi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 078112e23dfd..d9039e7f6703 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
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
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
