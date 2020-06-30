Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29C1C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:58:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28C52083E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEOlRJKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28C52083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4f2ye/UtesFtIBnR/eA/h72C11yC0NkhOdt8MFSX7zk=; b=oEOlRJKsMa8ubxW2dAv/tz55l
	WI+PiE4sLEH1CvuTjD/VlDwDtaLN9mlpyV0L+SxmygKsuX7MsVzF+wP48Hmppfya3V+d9nx4uVVz+
	9qdd+mgoXN3KdRNUVK7o1zrcs+oKhx51QI6q9WwrNgKMn0VSYxjUUqIzyRBX/NQwgS8e7gSCkxERm
	NVOwwpbOS8382cJUQRfwCdeb3oF73U8xjWIpAgy7+9/Cssn63L5mtKBHjcWM//nozyEaRW5LWYVMe
	N9ZfoxEKwyN2uK48HftaDIztlnncOv6iHfRmAFEpPI7rXxUDn6xhTFZXoK5CNfZZLra1JMBAW9qYg
	nQcvVAm6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqFpt-0008BW-47; Tue, 30 Jun 2020 12:58:05 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqFpj-000886-BC
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 12:57:56 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EDF25D4331963481D348;
 Tue, 30 Jun 2020 20:57:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 20:57:36 +0800
From: Hou Tao <houtao1@huawei.com>
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] ubifs: ensure only one in-memory xattr inode is created
Date: Tue, 30 Jun 2020 21:04:38 +0800
Message-ID: <20200630130438.141649-4-houtao1@huawei.com>
X-Mailer: git-send-email 2.25.0.4.g0ad7144999
In-Reply-To: <20200630130438.141649-1-houtao1@huawei.com>
References: <20200630130438.141649-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
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
Cc: houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ubifs may create two in-memory inodes for one xattr if
there are concurrent ubifs_xattr_get() and ubifs_xattr_set(),
as show in the following case:

ubifs_xattr_get()              ubifs_xattr_set()
                                 // the first created inode A
                                 // fill inode A
                                 ubifs_new_inode()
                                 ubifs_jnl_update()
                                   // mapping xattr name to inum
                                   ubifs_tnc_add_nm()
                                   // add xattr inode node
                                   ubifs_tnc_add()

  // find inum through xattr name
  ubifs_tnc_lookup_nm()
  iget_xattr()
    ubifs_iget()
      // not found in hash table
      // so create a new inode B
      // and keep it in hash table
      iget_locked()
      // find xattr inode node
      // fill inode B
      ubifs_tnc_lookup
      unlock_new_inode
                                 // inode A is also inserted into
                                 // hash table

If we update the xattr value afterwards, only the values in inode A will
be updated. So when we ty to remove the xattr name, and in the same
time get the xattr name, ubifs_xattr_get() may return the stale value
in inode B, as show in the following case:

ubifs_xattr_get()              ubifs_xattr_remove()

// get xattr inum
ubifs_tnc_lookup_nm()
				// return inode A
				iget_xattr()
				clear_nlink()
				remove_xattr()
				iput()
				  evict()
				    ubifs_evict_inode()
				    remove_inode_hash()
// return inode B
// return a stale xattr value
iget_xattr()

Fix it by moving insert_inode_hash() before ubifs_jnl_update(),
but after the initialization of inode is completed, so only
one inode is created for xattr value.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/ubifs/xattr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 82be2c2d2db5..10fcb454bb01 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -133,6 +133,15 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	inode->i_size = ui->ui_size = size;
 	ui->data_len = size;
 
+	/*
+	 * Ensure iget_xattr() in ubifs_xattr_get() will find the inode
+	 * instead of creating a new one.
+	 * The initialization of xattr inode is completed here, so using
+	 * insert_inode_hash() instead of insert_inode_locked(). The
+	 * latter can lead to iget_xattr() return -ESTALE.
+	 */
+	insert_inode_hash(inode);
+
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = current_time(host);
 	host_ui->xattr_cnt += 1;
@@ -156,7 +165,6 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	mutex_unlock(&host_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
-	insert_inode_hash(inode);
 	iput(inode);
 	return 0;
 
-- 
2.25.0.4.g0ad7144999


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
