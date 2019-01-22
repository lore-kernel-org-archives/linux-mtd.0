Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2007C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF89320879
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtK7ZZfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF89320879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iQ1jeqvCAjbFQWrlHyHxb9l+BLAv6w5xarzQYJE1lKg=; b=qtK7ZZfStF75ie
	yyI+v3sPyFVHbaloO9M66XIATQ4Y9qbbtTsl6gRpXxLU4qj1Be0fysQHU5x1hFV+AQsxvC7zXrXVX
	mPjwSJvIYGFKI9RQjBkmAiS63qALL4CUqZsSK13cIan+2F9QAs3RKK5h96Ni9rBJayKxr0wYU0w7d
	Ko43phUnRPb9I+WR9Leyy+TKntuICDnQVxg16ZI2WhWcbSWNlhmnlp3yKi/ZBCrk/KW+mqz1WIaEX
	gyyJkt/WbHPqqvtXXa8si/1hZbtADqSeLHEepF8yLXnAsmZCDTmPk4cy+pbw7IltPAdVV3JY/sivH
	eJ4GnoKhw1cjnuFAzAyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gluRC-00050N-9u; Tue, 22 Jan 2019 11:41:50 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gluR9-0004zd-20
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 11:41:48 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 8B30120898; Tue, 22 Jan 2019 12:41:45 +0100 (CET)
Received: from localhost.localdomain
 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id 3FA8E206DC;
 Tue, 22 Jan 2019 12:41:35 +0100 (CET)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v4 1/2] mtd: partitions: clarify __mtd_del_partition() name
Date: Tue, 22 Jan 2019 12:41:33 +0100
Message-Id: <20190122114134.8199-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_034147_570183_D5324350 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

__mtd_del_partition() is a helper that must be called after the
partition lock has been taken. As there are already a few similar names
(mtd_del_partitions(), del_mtd_partitions(), __mtd_del_partitions()),
make this clear by renaming the helper mtd_del_partition_locked().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v3:
=================
* Fix typo in commit log: s/ben/been/.

Changes since v2:
=================
* New patch.

 drivers/mtd/mtdpart.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b6af41b04622..32beb9c2641f 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -627,20 +627,20 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 EXPORT_SYMBOL_GPL(mtd_add_partition);
 
 /**
- * __mtd_del_partition - delete MTD partition
+ * mtd_del_partition_locked - delete MTD partition
  *
  * @priv: internal MTD struct for partition to be deleted
  *
  * This function must be called with the partitions mutex locked.
  */
-static int __mtd_del_partition(struct mtd_part *priv)
+static int mtd_del_partition_locked(struct mtd_part *priv)
 {
 	struct mtd_part *child, *next;
 	int err;
 
 	list_for_each_entry_safe(child, next, &mtd_partitions, list) {
 		if (child->parent == &priv->mtd) {
-			err = __mtd_del_partition(child);
+			err = mtd_del_partition_locked(child);
 			if (err)
 				return err;
 		}
@@ -670,7 +670,7 @@ int del_mtd_partitions(struct mtd_info *mtd)
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if (slave->parent == mtd) {
-			ret = __mtd_del_partition(slave);
+			ret = mtd_del_partition_locked(slave);
 			if (ret < 0)
 				err = ret;
 		}
@@ -688,7 +688,7 @@ int mtd_del_partition(struct mtd_info *mtd, int partno)
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if ((slave->parent == mtd) &&
 		    (slave->mtd.index == partno)) {
-			ret = __mtd_del_partition(slave);
+			ret = mtd_del_partition_locked(slave);
 			break;
 		}
 	mutex_unlock(&mtd_partitions_mutex);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
