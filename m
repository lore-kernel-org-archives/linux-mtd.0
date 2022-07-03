Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945D0C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Jul 2022 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3F4v4N8ozBF5OgkvXm/eAFEOYATxavYgL8j+q0qVWp0=; b=DFrXDkqE3tklNh
	pgIRARXYFZ9+oYiR1RCBAn0qDk4L2ScQzPIDUnLQOGAD+ZScw2UIoiPTvkRLg6zddpe5hYWnfolTV
	Qo6oIB3eUXEiNdGYNvcko7NtpqwyLqHhAYI1+MsKwTK7pN+/WoW9/V0ja6U7sL8FlrX3OirtFWLjR
	22iruVhVPErozgHVVHYzjBO81LJAbUq9eFP2YuCIuAQzRhyxlhAEg3aLKBoqVCtZ7G2CsVHSphPQU
	kcLkUveNU4QC5JaNKJRNKu59td+11LjXGrTykfD03VQGMTczaYrc5uMkFA9MG1i1eTOJh9Ik4QYXQ
	A4G7zgsR0t4k3hhe0QKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7wM2-00EzFh-Mv; Sun, 03 Jul 2022 09:57:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7wLz-00EzEC-9i
	for linux-mtd@lists.infradead.org; Sun, 03 Jul 2022 09:57:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id fw3so11695396ejc.10
        for <linux-mtd@lists.infradead.org>; Sun, 03 Jul 2022 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/C/3kmvKdwcy11chQHgeLWo3vKWTC13H+vJEKZUg6aQ=;
        b=gBAkdTMLRxz7uh4sx7BVV/ieaiZ2UurFW8df0aRzdrmm+6mymLplAIGLfLrkf7mAc/
         +J3dXmRTlXNfz6Cwxl7B66XZHKinkj6ENi4e1jJtq4P8KeLeh2jVvAK5+4rzzQA3Ual+
         y68Upda7iibOz+Z5akchFLLJTTiF3a5Aq1D0rEYDJqiJU4v4GUZtffoS+95U/+V9ScFN
         7s8KL9bV9rjSg0ye4a09cSf59E698eISK3j0+4S6kxZMKT9W1GzT+QCQT8O0JfWD+hQn
         3yonRCNrZSOki5V9DgbM49GOB4gBskyGajTrLE2xg1+qdSs9ZrIRSu/wr0SKpmH4Gjjr
         LZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/C/3kmvKdwcy11chQHgeLWo3vKWTC13H+vJEKZUg6aQ=;
        b=G0VkiycJYYmWO9TY2vhTW2jzsgToa7sczEr6PSPv90QB+CNAA+PxnL4ey6ptvKDfiY
         59fszsDuANdTyyz5GRBATsMxL7cUO2VqOpPBa4HzoBvRdIuW8EnpOa7XrENNflbNYZ3S
         9DYNFeD89n5lJjzURVn4ObeG72+YBNbR7yXZNClAGMV/7FSKPos1SBB7IXAfrhecZdXL
         CI5mcowUfV6M88GvWDq7qA8NpjjMV6ui7ujJMY/ETJLvWoLQ3FQnytCzhkwFaViLtx4F
         jxJ4Ptw4EXJzCPDS3mKxxz4a0X3RfxO9G+BWJ6Tji1G958iPn1a4SL1ZNgxBQ3k+wJZJ
         UF/Q==
X-Gm-Message-State: AJIora8FpGSM0iAOkB+TSmTrfcG/9JEFJQ/7yUHS/v8M+5zYnCqb+KmV
	C8u5Or2AqtjANs1pBCKUgAw=
X-Google-Smtp-Source: AGRyM1sH6Rrxv1tF4lmThvYcgtG1sG3EVo7pQGOczrqcukLwu4ZUnCWj9eopFnPQEYP42FfYurzk/A==
X-Received: by 2002:a17:907:a421:b0:726:ee5f:718a with SMTP id sg33-20020a170907a42100b00726ee5f718amr22866229ejc.368.1656842240662;
        Sun, 03 Jul 2022 02:57:20 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id m7-20020a056402050700b004356c0d7436sm18455030edv.42.2022.07.03.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 02:57:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <oliver.sang@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: core: fix NULL pointer dereference with mtd_check_of_node
Date: Sun,  3 Jul 2022 11:56:31 +0200
Message-Id: <20220703095631.16508-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_025723_396574_F693BFA4 
X-CRM114-Status: GOOD (  11.59  )
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

Actually check if mtd dev have a parent to fix NULL pointer dereference
kernel panic in mtd_check_of_node.

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: ad9b10d1eaad ("mtd: core: introduce of support for dynamic partitions")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6fafea80fd98..48a357fcf2ed 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -558,8 +558,12 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 	if (dev_of_node(&mtd->dev))
 		return;
 
-	/* Check if a partitions node exist */
+	/* Make sure we have a parent */
 	parent = mtd->parent;
+	if (!parent)
+		return;
+
+	/* Check if a partitions node exist */
 	parent_dn = dev_of_node(&parent->dev);
 	if (!parent_dn)
 		return;
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
