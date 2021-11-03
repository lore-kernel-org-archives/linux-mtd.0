Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F7CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 03:59:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B7361058
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 03:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48B7361058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yeah.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mqrsmISoVBiF22WaNlZIMM4VEbllfPOlqMmq7GwxFLU=; b=R4Sk/DFIG+ah/9
	Dh9NstTsX7rJZRQRZFxBj1Lu90aZonRiirhbLZERriNVBYGT6M/UpUq95OJ+byjG2FdYkf20Nn3me
	ytAHIR3o8zovIqlvxd9QhgDkPvPtIOZcri98UQljvmwBzWlT5K8pRAH6C9oDPORMqQNrI92VQ9pfB
	aOiuHGEMiaHcIBFNnzBupIVgrUqrUcwqLHCp5wwekOlzdwgzZkJQ9Ue6VPJxO8Y0ZZI6s9hfq7RGE
	xCbPxIgUifDzo7ikbvxFBTbvafav5HwOIfPoTuIC4NLAKFT9MMrM4Uw0RiiEsc5NgAAMOP7yxZBiz
	y0cD7VQJqcDmHi+RS9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi7Pr-0041No-2F; Wed, 03 Nov 2021 03:58:23 +0000
Received: from mail-177132.yeah.net ([123.58.177.132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi7Pn-0041NV-Bp
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 03:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=From:Subject:Date:Message-Id; bh=i1RbSsROJXm8l/bfEh
 1qUHBSEl+F2M7z8WY9+J0AWjI=; b=mAQgnRkcDqV10c3xYaLRHyp1n0jSv9WIx1
 +FHZdLoy6hMiKSWV82kQPSam3+Fuv6DN+1QWzYTrUiqj+wmMGPR09aNMTYJfCUxs
 xA5FW4D5cIsHML31vYLjRwpHFeUXOHjnC3alnKvK8HtVQYARK+47Z0fmSqmk0SQB
 zf2f47TSk=
Received: from localhost.localdomain (unknown [60.29.152.2])
 by smtp2 (Coremail) with SMTP id C1UQrAC3tzvKCIJhc7uiTA--.55426S2;
 Wed, 03 Nov 2021 11:58:04 +0800 (CST)
From: YongjianXion <yongjianxiao@yeah.net>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 YongjianXion <yongjianxiao@yeah.net>
Subject: [PATCH] Fixed a crash caused by CONFIG_JFFS2_FS_WBUF_VERIFY not
 allocating memory to Wbuf_Verify under UBI.
Date: Wed,  3 Nov 2021 11:57:11 +0800
Message-Id: <1635911831-38364-1-git-send-email-yongjianxiao@yeah.net>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: C1UQrAC3tzvKCIJhc7uiTA--.55426S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr18trWUXw43Aw4fAw17trb_yoW3ZFgEka
 9rAFyxKrWUJF4rCa4DA39Fv34kWw4rtFs3WF1xtF4YkrWktr98Ar9Fvw1fWrWUWay8WFZ3
 ta4kZrW8Jr1YqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRiL05UUUUU==
X-Originating-IP: [60.29.152.2]
X-CM-SenderInfo: p1rqwyxldq5x1dr65vtdko0vbw/1tbiFgxA4l6Njz3KKwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_205819_721378_5192C206 
X-CRM114-Status: UNSURE (   5.91  )
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

Signed-off-by: YongjianXion <yongjianxiao@yeah.net>
---
 fs/jffs2/wbuf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index c6821a50..59d6169 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1342,9 +1342,19 @@ int jffs2_ubivol_setup(struct jffs2_sb_info *c) {
 	pr_info("write-buffering enabled buffer (%d) erasesize (%d)\n",
 		c->wbuf_pagesize, c->sector_size);
 
+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
+	if (!c->wbuf_verify) {
+		kfree(c->wbuf);
+		return -ENOMEM;
+	}
+#endif
 	return 0;
 }
 
 void jffs2_ubivol_cleanup(struct jffs2_sb_info *c) {
+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+	kfree(c->wbuf_verify);
+#endif
 	kfree(c->wbuf);
 }
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
