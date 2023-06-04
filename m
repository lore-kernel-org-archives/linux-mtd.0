Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29533C7EE2A
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jun 2023 04:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oYNtNqehdVZ09PHU9WAi3ucV8ML39zIOwPAhuCr7Ph4=; b=ADzoqNPckamS9f
	fjO+koaFyoJk3Hhgs0Z7gYyUujyUBKUC0I9GRZA9KGjZlhbTbRTkrJ0fCLblPSUrc+hB9yrcaeIVi
	FolBg/ufRJq96f+vf9uFNNNLnqBok4ZEAU7/SfnDR960yYloCybFkkF46xrnG3a5ErIBsetmYlxPZ
	gxORCCHnHKoSrFXrdRAWiaojjlYkcLfKpTdDyvLPqJJZYbP9RnTWS5ATgEK+D3ssq+PJ398zNq+mf
	DHvviQ8XW/rvNsje7RhaxXq8nWHEpJYzSTSqZeqxcU7Y2DKar3/TmppXCH17lkAfG0rl8MSQj5lGe
	AG4EADSn2Q+5W8v06Zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5fZM-00BI67-0f;
	Sun, 04 Jun 2023 04:42:20 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5fZH-00BI4J-1g
	for linux-mtd@lists.infradead.org;
	Sun, 04 Jun 2023 04:42:17 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 5fZ4q5cPPbOsk5fZ4qqpwK; Sun, 04 Jun 2023 06:42:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1685853723;
	bh=/V3bb2t3S9ERy4bkX7WFDcRfY60GVE2pPffF3L5h38c=;
	h=From:To:Cc:Subject:Date;
	b=CfFUQY2teH7AsnaLHJL4lU6kx8XHXzOginGc3EugTHKqGjSBqn6frzcO2Ow4Oxq5N
	 u+MrEJcvu5TLU8KvNlRI/F3YR22pjozCHyQyF7xGZgy52CFqWTzLfrcdyxsTlAwewu
	 rfJ8QFZmH3oKkgsOkBkrcjBS3qE++cL9UuFQ9nO51UaoVxGio2Sgw483VEWPQRxOuC
	 bvQxV2Hp8AOU8SGgAiozPUWTIw71aYBGBU5NKp4PmDGK/Ww3de9LxfiKdklRNSvPnJ
	 kM4B2ySerIGcJl3bt02cQhgLgXdNyAAjF0WTA+KcU+0p40cqUyS+0JRIeSEQcpd0xt
	 0Cf2NTYAD05Gw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Jun 2023 06:42:03 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdpart: Drop useless LIST_HEAD
Date: Sun,  4 Jun 2023 06:42:01 +0200
Message-Id: <547248195d87d1240d6126d13eb1364b1a0b634d.1685853690.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_214215_815518_29A4971D 
X-CRM114-Status: UNSURE (   8.49  )
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

'tmp_list' is unused, so drop it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This was introduced in commit 46b5889cc2c5 ("mtd: implement proper partition handling")
---
 drivers/mtd/mtdpart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 85f5ee6f06fc..a46affbb037d 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -326,7 +326,6 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 static int __del_mtd_partitions(struct mtd_info *mtd)
 {
 	struct mtd_info *child, *next;
-	LIST_HEAD(tmp_list);
 	int ret, err = 0;
 
 	list_for_each_entry_safe(child, next, &mtd->partitions, part.node) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
