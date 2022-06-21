Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCEBC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jun 2022 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grpW8yXsaqx9wSel9sV+z9QVPCq7BOFPa9aXV8DiqMo=; b=HaYg9eTZd2/FmE
	sJRrZjPX4ew9jOX+WWuikgfUHqv5IpkatQ97Sq/9I9SuIFcqHi1QGJvIPtiUto2LyBD3MwfoQPntN
	0aR52snfkYNewVRKWrNwNGijZMDivwbu79ziR4YL8yRmS1GteG39ALFyy0tRClqkVmVoTzdBfKz7m
	wLh+tvXjrjV4n7IsnZhIbbjJ7+zBVnPydAuwgLReS6xc6PoBKQ8Q2XZNzghLnjr8OIJSTyGA6Kg9B
	ZYZJGupQVnfvBjEGMu3QMEWfufFz+E7PV9EQJ+sYuPi5ME0AEuz46cHaBnQGy5hN/YxbBHAb5TTPd
	JtqHIkxNWBSOfgeGYKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3aKR-004fx9-B0; Tue, 21 Jun 2022 09:37:47 +0000
Received: from smtpbg123.qq.com ([175.27.65.52] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3aKK-004fjX-RD
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2022 09:37:46 +0000
X-QQ-mid: bizesmtp67t1655804223tju3ecfs
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jun 2022 17:36:58 +0800 (CST)
X-QQ-SSF: 0100000000700030B000B00A0000000
X-QQ-FEAT: B0D4DPF8NcR5GZuJ2U5q3wJIJFnHVmNBA3+lnkqt0BNqvCom4ybXtKDqOCQ6v
	HQF96ApE8ce8LKYJnvG67ckRGM2RPxVVBquJRlcXjIiz9kFhEQjb3zzGLy1uPVr9R2Jv8qA
	ITejeTggLFSq44emH0LBWZJh7d4L+8RBvc4FCfXtyXLqG9Ol9dwKAu27J4h1TQ9g2Tsjp1Z
	B/e+k2o+hep+HvOWMup6UtjiMSfiKIuHU6mlH6CURjxCOnFZPz9qD7oPrEXSMWPSgvOEZ0u
	zCdb6Q1DQisuLWA5ZcA8lTLh/nHSZsEZ4RmNN6lVEdTfXqW0H+B+PAz27Sc/kHQ/HAfma7A
	9xSvEiE4fDik6e3wcY=
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiangjian@cdjrlc.com
Subject: [PATCH] ubi: remove unexpected word "the"
Date: Tue, 21 Jun 2022 17:36:56 +0800
Message-Id: <20220621093656.73074-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_023741_269286_9891D922 
X-CRM114-Status: GOOD (  10.01  )
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

* @dev: device object to make use of the the Linux device model
* @dev: UBI device object to use the the Linux device model

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
