Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3933C4360F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABBF2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TccI2m5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABBF2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKgv7Ummu/gn+Rk+QRxD8KMVENGdnn7VbU+uaGX9ijM=; b=TccI2m5k0pqLSj
	uxF4cXc+/1z1EsPdNyYC3O8VFIp74FctTYK8iFkxAjK1SKIjre09kTRKaw9S447cXW4gppqGRqzVt
	OO1S+2o4fBIZWV+Xkqabv1QZySTJL8sGbnh9iJ0Dj7/CXgGZ0+k+GLRSf71+lRlOHnJ9HAKLk2V4y
	3aK8KGqOtHKINOThAUmzi7CcQA4F7kdWFQw0M+6L460tN+l+wpypT1Kd4mMLkpdLHR9EYwUAquJV6
	orvEdg9u019J9QGBzPW0iW9REWFkGZDfqU1Okkp0iGGCACYkDIiv9M3XxhNmpGNWYELIZeAfU6hvg
	JWnex0XAwioKbmqpNV4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwOwi-0007pT-Fr; Wed, 20 Feb 2019 10:17:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwOwV-0007TL-82
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 10:17:34 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 448AA253C4D8CD2A68AA;
 Wed, 20 Feb 2019 18:17:25 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Feb 2019
 18:17:16 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] jffs2: handle INO_STATE_CLEARING in jffs2_do_read_inode()
Date: Wed, 20 Feb 2019 18:21:33 +0800
Message-ID: <20190220102133.7878-3-houtao1@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
In-Reply-To: <20190220102133.7878-1-houtao1@huawei.com>
References: <20190220102133.7878-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_021731_572497_C06488CD 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For inode that fails to be created midway, GC procedure may
try to GC its dnode, and in the following case BUG() will be
triggered:

CPU 0                       CPU 1
in jffs2_do_create()        in jffs2_garbage_collect_pass()

jffs2_write_dnode succeed
// for dirent
jffs2_reserve_space fail

			    inum = ic->ino
			    nlink = ic->pino_nlink (> 0)

iget_failed
  make_bad_inode
    remove_inode_hash
  iput
    jffs2_evict_inode
      jffs2_do_clear_inode
        jffs2_set_inocache_state(INO_STATE_CLEARING)

			    jffs2_gc_fetch_inode
			      jffs2_iget
			        // a new inode is created because
			        // the old inode had been unhashed
			        iget_locked
			      jffs2_do_read_inode
			        jffs2_get_ino_cache
				// assert BUG()
				f->inocache->state = INO_STATE_CLEARING

Fix it by waiting for its state changes to INO_STATE_CHECKEDABSENT.

Fixes: 67e345d17ff8 ("[JFFS2] Prevent ino cache removal for inodes in use")
Cc: stable@vger.kernel.org
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/readinode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 389ea53ea487..0bae0583106e 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1328,6 +1328,7 @@ int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 
 		case INO_STATE_CHECKING:
 		case INO_STATE_GC:
+		case INO_STATE_CLEARING:
 			/* If it's in either of these states, we need
 			   to wait for whoever's got it to finish and
 			   put it back. */
-- 
2.16.2.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
