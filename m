Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E952CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQsBKpiGBQQ5JowEpmGy9WmbTLhxLdFG27eF10PODPw=; b=17RytiP7/JqnBN
	ddXEV3ryoHLB2gQJFwhpuqP5PIql0sG4vwFEoP26A1JSrYWt97MXDNTyNmltwxSHrsvnoj6OGeAND
	mi9+jU7X/SmyENviQpL/pK+o16Ave1CHgPXT6b9lt+J7D7URAQ8y0BAMhnFd2/lnOlowexv/QQCju
	Vo3LFFc191Pm0KhSwmKdPeQujBjNUL60GdefQQjOFBEG/JuHLsZ/M9pA/22ecA+TQB5LzGeVs0A5v
	MFTXf9kpxwDKztzMmNcg4IeJftYnkMjSK3XPJFHi+iJI2qMMLQ30DtHWVOl0AfVT922KXQxY4m1s5
	DlmH1q19ILk4lw6f0jGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsC2-0000000EaT8-3QZe;
	Wed, 14 Oct 2026 06:10:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsC1-0000000EaSU-0zdl
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Oct 2026 06:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HU+Eb4UZtw6L9Gsa9JY/F8hNcQZDUPWTRzMQNp41osI=; b=f+h4btKj8idRqlAWqQFkobZBjR
	8ZOKZudMS3Ibr1wcplHHBpGIHajfAXwXNR2Y2TvRotspzCVYCLJ04dz3w90gTvrhhXzW+CLtNaEVx
	tneeKI+BZjzI5C6JfP5vu1AabMWA8J7BY6m2DAXzQZqVN4T11mO3EUdXmZ0X9QQ0bcLoVkiqUk95g
	e57rXasNrL3fPcRqfkPQPV5bWep7/8WO/efUohNRZr2X1mP//6WpTYLLaXEhwHZ55MixgHvG2sfMM
	C3JEdit/bFkbasdt5Jk8ntqOK/228qStxfoc+I0mLF6qm97JjiJGME+vT39WnJ2ov3+5AMcLgSRsh
	h2wMhoTw==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGsBw-0000000GNwk-49yI
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:10:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HU+Eb4UZtw6L9Gsa9JY/F8hNcQZDUPWTRzMQNp41osI=;
	b=kFxwD+jvBhurmi0BfsXBtIMbWcpgOX2OxN5te0ouEHcjkH6yGw1+zTcwTIvlHRjCpJX/q0mCL
	aVei36jKBKCOVwO+7h8dcGb2wXyGgFvUHzoKKEN46gv8gPPDh2m4whiVAZhO61vkGlBgtI1MwkG
	ytl80vIysMoRrl2JiG29ANA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j4L8L1c1tzRhQs;
	Wed, 14 Oct 2026 13:57:38 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E2A04056D;
	Wed, 14 Oct 2026 14:09:52 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 14:09:51 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 2/2] ubifs: tnc_delete: Don't update collapsed znodes if memory allocation fails
Date: Wed, 14 Oct 2026 14:02:52 +0800
Message-ID: <20261014060252.3531356-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014060252.3531356-1-chengzhihao1@huawei.com>
References: <20261014060252.3531356-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_071021_975558_1BC5DE39 
X-CRM114-Status: GOOD (  14.18  )
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

A collapsed znode is updated with 'znode->parent = NULL' before calling
insert_old_idx(), if a memory allocation failure happens, there will
exists non-root znode(without parent) in TNC, which leads a null-ptr-def
problem for TNC traversing, the details shown as:

 file: consists of many data nodes, TNC is:
                   znode_A (lv 2)
  	     /                         \
       znode_B (lvl 1)              znode (lv 1)
        /             \                 |
    znode_C(lv 0)...znode(lv 0)     znode (lv 0)
     |   |     |     |       |          |
  ino_1 ino_f dent dn_0 ... dn_i      dn_i+1

     P1
  truncate(file, 0)
   ubifs_setattr
    ubifs_jnl_truncate
     ubifs_tnc_remove_range
      tnc_delete // dn_* are removed
       do-while

  the TNC looks like:
          znode_A (lv 2, parent = NULL)
		|
	  znode_B (lvl 1, parent = znode_A)
		|
	  znode_C (lv 0, parent = znode_B)
	  |     |     |
	ino_1 ino_f dent

  tnc_delete will collapse the tree:
  // while (znode->child_cnt == 1 && znode->level != 0)
   // round 1
   zp = znode_A
   znode_B = get_znode(c, znode_A, 0)
   znode_B->parent = NULL
   znode_B->iip = 0
   insert_old_idx
   c->zroot = znode_B
   kfree(znode_A)
   // round 2
   zp = znode_B
   znode_C = get_znode(c, znode_B, 0)
   znode_C->parent = NULL
   znode_C->iip = 0
   ENOMEM = insert_old_idx
    return
   c->zroot = znode_C // skip

  the TNC looks like:
          znode_B (lv 1, parent = NULL)
		|
	  znode_C (lv 0, parent = NULL)
	  |     |     |
	ino_1 ino_f dent

      P2
  umount
   kill_ubifs_super
    ubifs_put_super
     ubifs_umount
      destroy_journal
       ubifs_tnc_close
        ubifs_destroy_tnc_tree
	 ubifs_destroy_tnc_subtree
	  znode_C = ubifs_tnc_postorder_first
	  if (zn == znode) // false, zn = znode_C, znode = znode_B
	  zn = ubifs_tnc_postorder_next(c, znode_C) // zn = NULL
	  for (n = 0; n < zn->child_cnt; n++) // null-ptr-def !

The root cause is that zroot & znode->parent updating is not atomic,
which could be interrupted by the insert_old_idx() failure, fix it by
making zroot & znode->parent updating together.

Reproducer is https://bugzilla.kernel.org/show_bug.cgi?id=222130.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 679afddadf82..c9480d963e4c 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2611,14 +2611,14 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 			znode = dirty_cow_znode(c, zbr);
 			if (IS_ERR(znode))
 				return PTR_ERR(znode);
-			znode->parent = NULL;
-			znode->iip = 0;
 			if (c->zroot.len) {
 				err = insert_old_idx(c, c->zroot.lnum,
 						     c->zroot.offs);
 				if (err)
 					return err;
 			}
+			znode->parent = NULL;
+			znode->iip = 0;
 			c->zroot.lnum = zbr->lnum;
 			c->zroot.offs = zbr->offs;
 			c->zroot.len = zbr->len;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
