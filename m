Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C92C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DO+zFBn9F+lLep1g3iW5EpAVfKlvILg2jShdpU9Astc=; b=Wtu4nwFhRsW+MG
	nrWFdUL146PpG2qg8W6Jpd80ivN0OTkwywfw300WbOVG0cjH87dqyvZmYqsqk9MyXvv3Jz15tptKY
	6MNnF7S6JDia+3B6fAp0etQ2Hyw0Ttzzwz3FtmNf1IGZGwiZDsXyrZZfZkeHfLHxrwEZiWdIMSaui
	R/qBiV1kcIZUhiI9VSaddvhK4zi6Pmpqmjp4j3ZrAL9L8c+OO7aBgJBRvR+txcrstTgcN9gm65mG8
	XElGk7Wpd24vsn5qnVWDYIDP51F82gOqPKE268Wguv+BQAQzuX7hzHn+yMXUjO1kdZd72fTL7NzP/
	U46ewrHhC46r2FP5cpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn9a-000fTm-W9; Fri, 22 Jul 2022 07:32:55 +0000
Received: from mail-m971.mail.163.com ([123.126.97.1])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn9X-000fSM-Pa
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 07:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ERumE
	dW4Zd6qlQYEct6GW3LcAxcw0D0ITMnR8G8AItU=; b=EVKXnhYwRPzGreSR6ntLl
	jrhc6daolicCf43oPnlUE+Pkm+v0y/rdB77pSCeuDXXcwrcTO/wvZT+HkaF94Sqo
	MSF0JwPGf5Jvuagl0iMzTGFIKuZme0L38oxFBCxwwmST4xWP5+Rk/6OiTQe6dteA
	rUU26tXNO/P61bjrRgt1Fo=
Received: from localhost.localdomain (unknown [112.97.59.29])
	by smtp1 (Coremail) with SMTP id GdxpCgB3cl2dUtpitxUZPw--.5903S2;
	Fri, 22 Jul 2022 15:32:46 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	richard@nod.at
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] ubi: Fix typo 'the the' in comment
Date: Fri, 22 Jul 2022 15:32:43 +0800
Message-Id: <20220722073243.73103-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: GdxpCgB3cl2dUtpitxUZPw--.5903S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyDtr43uFWkCw4DJrW8WFg_yoW8Ww4rp3
	yUZFW2qrWxJ3yDW3Z7Gw4kWrZxJayrZ3yfuFW2g34FgrWrJrWrAFyayFyrtrWUJF47Aa17
	XFy8A34kJFy09r7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEARh_UUUUU=
X-Originating-IP: [112.97.59.29]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbivx5GZFWB0jtjSwAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_003252_204574_7AF70C0A 
X-CRM114-Status: GOOD (  12.31  )
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

Replace 'the the' with 'the' in the comment.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/mtd/ubi/ubi.h | 4 ++--
 drivers/mtd/ubi/wl.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 55bae06cf408..330f9ffec3a7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -429,7 +429,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
 /**
  * sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
- * @e: the the physical eraseblock to erase
+ * @e: the physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
  *
  * This function returns zero in case of success and a negative error code in
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
