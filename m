Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751A5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CzwPXmcnvVuMwwi9CqzHaZhFsZUoOr+c71XOQjVimA=; b=43khMi+cdTVN0g
	G1NXbg8emdvl+/t0E1Hc1vBeNjqDZllIyyo4GD0fCWGhAmBiqU9MRT1aZgA0gmJFNGOAW0PbhWHc8
	CqFGMOvrYBXobDq8Vft8V96046dieax3PzJ8Z+YXsnN4sm9k5LqDiyIuS0spNXiDi53Wr/G0hRYxq
	fbJoPEsaRYG6gGGFujHTBSjVi0qyOcrA13vDID4jpM30FqWJnTMTJ5vtFOj+c8jK2lpjwuYrt5MZP
	5GaBoDN9dNS6J4K6ASR2KBNpjUhHM5ryCY7cf0imaOofNLOtnC5KYAY1B15t51Wu/qMLvPDFTnGER
	2b39vVFboIRc+9+acZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFyTH-00AAIJ-Ii; Mon, 25 Jul 2022 13:50:07 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFyTE-00AA1I-0O
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 13:50:06 +0000
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26PDnTS1084640;
	Mon, 25 Jul 2022 22:49:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Mon, 25 Jul 2022 22:49:29 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26PDnSC0084630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 25 Jul 2022 22:49:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <a262d332-662d-57b9-b746-8d3779f4e878@I-love.SAKURA.ne.jp>
Date: Mon, 25 Jul 2022 22:49:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] mtd: core: check partition before dereference
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_065004_317599_7D994781 
X-CRM114-Status: UNSURE (   7.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

syzbot is reporting NULL pointer dereference at mtd_check_of_node() [1],
for mtdram test device (CONFIG_MTD_MTDRAM) is not partition.

Link: https://syzkaller.appspot.com/bug?extid=fe013f55a2814a9e8cfd [1]
Reported-by: syzbot <syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: ad9b10d1eaada169 ("mtd: core: introduce of support for dynamic partitions")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/mtd/mtdcore.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6fafea80fd98..a9b8be9f40dc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -559,6 +559,8 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 		return;
 
 	/* Check if a partitions node exist */
+	if (!mtd_is_partition(mtd))
+		return;
 	parent = mtd->parent;
 	parent_dn = dev_of_node(&parent->dev);
 	if (!parent_dn)
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
