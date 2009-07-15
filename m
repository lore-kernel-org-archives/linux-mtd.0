Received: from e8.ny.us.ibm.com ([32.97.182.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQu5X-0005aR-Am
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 02:19:25 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e8.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6EMJCK1018296
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2009 18:19:12 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n6F2JIjI255330
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2009 22:19:18 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6F2JHkB013181
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2009 22:19:18 -0400
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Date: Wed, 15 Jul 2009 07:49:03 +0530
Message-Id: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
Subject: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Subrata Modak <subrata@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Following fix is inspired by David Howells fix few days back:
http://lkml.org/lkml/2009/7/9/109,

Signed-off-by: Subrata Modak<subrata@linux.vnet.ibm.com>,
---

--- a/fs/ubifs/commit.c	2009-05-20 10:44:12.000000000 +0530
+++ b/fs/ubifs/commit.c	2009-07-15 05:39:06.000000000 +0530
@@ -510,7 +510,7 @@ int dbg_check_old_index(struct ubifs_inf
 	int lnum, offs, len, err = 0, uninitialized_var(last_level), child_cnt;
 	int first = 1, iip;
 	struct ubifs_debug_info *d = c->dbg;
-	union ubifs_key lower_key, upper_key, l_key, u_key;
+	union ubifs_key uninitialized_var(lower_key), upper_key, l_key, u_key;
 	unsigned long long uninitialized_var(last_sqnum);
 	struct ubifs_idx_node *idx;
 	struct list_head list;

---
Regards--
Subrata
