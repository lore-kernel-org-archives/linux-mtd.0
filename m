Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0017DC48BF6
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Feb 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ue0Gmgp2SiAC0/V5OcQDJ0yHZsjXRKnp6JZoH+1NRKQ=; b=Wxuq9uB9i047Lt
	zH89ThNAzyDO6WCYpsLGrah0TdUlozQI8cSRvt5rmLmg73BgP0pfIb8poLkjJQuqQNGzEOGSyja9t
	RDILbzkCHb5Qyxg0WfGUbzsMvNM7M0n2369MiB1l6DvnhGjuuH0aA60DDkcWoqwCD0adn8dMalYuO
	X+QutSm2z55Xtbxpc9R6P+dzBdT4jbYlulARmcQv4GpHklQ74aoCA0jABhM1V84gVlfmYqfe/otE+
	PpO7pv/HHwe7IqnVpZtCpgQYai5aEn+6HAcW0siKJoX9RADQZGG63O8MDs1JHXl2tZvZMagMaE9YH
	PhG6rs/AzvXc/P1z+Nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdsPB-0000000Cy2g-2kYz;
	Sat, 24 Feb 2024 13:49:29 +0000
Received: from out-187.mta0.migadu.com ([91.218.175.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdsP9-0000000Cy0F-0nO8
	for linux-mtd@lists.infradead.org;
	Sat, 24 Feb 2024 13:49:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708782564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=guC0tYSOwFj1pljxieRsXWQDCfWw7SO6MADQAq4Sld4=;
	b=cN54ul6ZprO/8c3ofBnudyuJRGjlWOQvkwVm6ErCNTDcq2HD4uCRdXdBHHUR5xWM2uAuj4
	ZITj0g7dnScatjMKsRQMp5dPS0/DGVKa4BZNITsV0bg8dHJfPz3pVSBtG+kXWBN5TgGpI9
	lwssAhdk2oMJ+UdqcPWjozXihH9TeAQ=
From: chengming.zhou@linux.dev
To: dwmw2@infradead.org,
	richard@nod.at,
	jack@suse.cz,
	chuck.lever@oracle.com,
	dave.kleikamp@oracle.com,
	amir73il@gmail.com
Cc: zhouchengming@bytedance.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	Xiongwei.Song@windriver.com,
	chengming.zhou@linux.dev
Subject: [PATCH] jffs2: remove SLAB_MEM_SPREAD flag usage
Date: Sat, 24 Feb 2024 13:49:15 +0000
Message-Id: <20240224134915.829634-1-chengming.zhou@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_054927_407346_18CCE64F 
X-CRM114-Status: UNSURE (   7.87  )
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
 fs/jffs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index f99591a634b4..aede1be4dc0c 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -387,7 +387,7 @@ static int __init init_jffs2_fs(void)
 	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
 					     sizeof(struct jffs2_inode_info),
 					     0, (SLAB_RECLAIM_ACCOUNT|
-						SLAB_MEM_SPREAD|SLAB_ACCOUNT),
+						SLAB_ACCOUNT),
 					     jffs2_i_init_once);
 	if (!jffs2_inode_cachep) {
 		pr_err("error: Failed to initialise inode cache\n");
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
