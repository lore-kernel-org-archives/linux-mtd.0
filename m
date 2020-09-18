Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9400C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:31:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBF623600
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="okkYyeCV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jReexNxf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FBF623600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UKGl5dbJ+AOAUNnqCEN7uyghxIEX+RZw9W6puAklwac=; b=okkYyeCV/SOk4XPlCVxMECq5L
	aaDXViXDG70CcWF2hhE0VWEwXpWFjrZNJ2Cwi7chRAv2rVAmzGSNGmsKoMvu/rIh1roJigMSq1XWT
	/x0f1UUx1ULiGs2l7woJe3uW11jTAIu2Lbj7u0VSt3OXq+lT7M2PqZu9A/a4RL91nkNUnj9BpVxLP
	xyKpv7Ndivp3jeuqP1fcrEhHle9MbaZE0EV/sgnunNWoJ1cWmIXBTUY0aVcq2PDmmlK4kaGO2ucED
	ukoammw8E9VoL2YHzsFeyka2wpXV3iamOsttdUw94ZBMjNhKUX1H4T6AUufUESVoj5jyn3+/SVMpm
	9PD/1wkpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ6AC-0008GB-BT; Fri, 18 Sep 2020 02:30:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5sl-0007LY-8e
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:12:17 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D285235F7;
 Fri, 18 Sep 2020 02:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395133;
 bh=wNT+wgEq/onrFLwV6Wt3Ns5n98d+k00SFhxfTWKd6eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jReexNxf/jTkO7B11xFG9CsQGWYvRZQ7OFGiBZ2sqhwTbMkdwV5rpyw+Wt0rPUCXH
 V4mTOHr0bsWIzrFFlhIHl//B2mZyLGi9M651mwAkG1FHgTswzAox1IKyUx10qwEqDv
 wm4V73ELKQAh2mhH1PTUeinfXm9DUSwRP9uN0gwg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 203/206] ubi: fastmap: Free unused fastmap anchor
 peb during detach
Date: Thu, 17 Sep 2020 22:07:59 -0400
Message-Id: <20200918020802.2065198-203-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_221215_456743_33679F73 
X-CRM114-Status: GOOD (  14.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Hou Tao <houtao1@huawei.com>,
 syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Hou Tao <houtao1@huawei.com>

[ Upstream commit c16f39d14a7e0ec59881fbdb22ae494907534384 ]

When CONFIG_MTD_UBI_FASTMAP is enabled, fm_anchor will be assigned
a free PEB during ubi_wl_init() or ubi_update_fastmap(). However
if fastmap is not used or disabled on the MTD device, ubi_wl_entry
related with the PEB will not be freed during detach.

So Fix it by freeing the unused fastmap anchor during detach.

Fixes: f9c34bb52997 ("ubi: Fix producing anchor PEBs")
Reported-by: syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/ubi/fastmap-wl.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 13efebb400225..e08f6b4637dda 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -48,6 +48,13 @@ static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root)
 	return victim;
 }
 
+static inline void return_unused_peb(struct ubi_device *ubi,
+				     struct ubi_wl_entry *e)
+{
+	wl_tree_add(e, &ubi->free);
+	ubi->free_count++;
+}
+
 /**
  * return_unused_pool_pebs - returns unused PEB to the free tree.
  * @ubi: UBI device description object
@@ -61,8 +68,7 @@ static void return_unused_pool_pebs(struct ubi_device *ubi,
 
 	for (i = pool->used; i < pool->size; i++) {
 		e = ubi->lookuptbl[pool->pebs[i]];
-		wl_tree_add(e, &ubi->free);
-		ubi->free_count++;
+		return_unused_peb(ubi, e);
 	}
 }
 
@@ -370,6 +376,11 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 	return_unused_pool_pebs(ubi, &ubi->fm_pool);
 	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
 
+	if (ubi->fm_anchor) {
+		return_unused_peb(ubi, ubi->fm_anchor);
+		ubi->fm_anchor = NULL;
+	}
+
 	if (ubi->fm) {
 		for (i = 0; i < ubi->fm->used_blocks; i++)
 			kfree(ubi->fm->e[i]);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
