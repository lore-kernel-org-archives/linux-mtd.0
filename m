Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690F1C5478C
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Feb 2024 13:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4KvlXvcPF3sCEksbqOcIqMHPVoTUXI1DtUAMz+ms3NI=; b=qU8/dj7pDKAZKe
	KueXJwH631bDxMne/6gKnJq5pniVgyBB3sZRPPM8odcWIfm9tezZ/aQb+kNLo7LqJAky31ICRYxby
	fnlVC38YCUTyLyjwDMod7qknB0IaZM0zHTlTal9a3nQB+tYlKOpiDWe0NzjYLz4yOQx7Ds5InAZ1b
	Pz2tVJV3zedxrFTVS8J2BLRnq0BI8paq60fTwPArgGDWcGj4ev5kuEwPCraBdbvY6M3xgPrYehZPV
	vDWt7BipVfP/0YGr/Juff1FVbZOXV6988cW5edpSZG7fcdO49mCdW99rQqSUhhK5Lk2WAyXX/twVA
	kj7FtL5YeJ2k8iAUHaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdsS9-0000000CzAQ-0rnH;
	Sat, 24 Feb 2024 13:52:33 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdsS6-0000000Cz8I-1T2J
	for linux-mtd@lists.infradead.org;
	Sat, 24 Feb 2024 13:52:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708782748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=URTB6rIWK/XPxRdAWncFE1qTwzE1f3lanP0572+Z/9s=;
	b=GsrWa2qoDfJGxu2TTHaWuOK9G9PAz7e3ZFqKC1y/RVkFjvDZzpxngfDyWPUHtkB6mCSf9d
	++vFoldKPsG2M8FsluhNQjO7pvS7fIdyPvZXaPlgfKi+GNWmDawTCFrIR7rjRDUzeIaO2X
	pz/tdDyWBiLwppsBcW7jbq+6WLSt11U=
From: chengming.zhou@linux.dev
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	Xiongwei.Song@windriver.com,
	chengming.zhou@linux.dev,
	Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH] ubifs: remove SLAB_MEM_SPREAD flag usage
Date: Sat, 24 Feb 2024 13:52:17 +0000
Message-Id: <20240224135217.830331-1-chengming.zhou@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_055230_563920_6780B39A 
X-CRM114-Status: UNSURE (   8.05  )
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

From: Chengming Zhou <zhouchengming@bytedance.com>

The SLAB_MEM_SPREAD flag is already a no-op as of 6.8-rc1, remove
its usage so we can delete it from slab. No functional change.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 fs/ubifs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f780729eec06..8ae7648021a8 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2433,8 +2433,8 @@ static int __init ubifs_init(void)
 
 	ubifs_inode_slab = kmem_cache_create("ubifs_inode_slab",
 				sizeof(struct ubifs_inode), 0,
-				SLAB_MEM_SPREAD | SLAB_RECLAIM_ACCOUNT |
-				SLAB_ACCOUNT, &inode_slab_ctor);
+				SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT,
+				&inode_slab_ctor);
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
