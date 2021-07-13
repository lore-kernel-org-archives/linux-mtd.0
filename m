Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBFAC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693C4610D1
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693C4610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7st+jwjuk8Mxy9Zb5+twRwopRGoUpc6l5L2vwgHDxA=; b=fvCMTqP/0oODoc
	ZV0FQw40Q8yxbM5SpC02G+t6rTOio7qRxkAXeLRQjKfjtqK82d9LQKbl6ZH45hNkJnDvmOgCwY51T
	mZLZAuhcKgGk8gwxL/7W61+QdZKVT3tnsYIGYaTote2Dr+0yICV/deddxdvh3mEqNgx/lS7BgQpNO
	LkRgveBX5Wmu3Z03Dy3I6cJ2uY8zarWcVhJO3jPlS9RfJ/Yyrz63FTN5yzIsI65HXzBQWo+6A78Fu
	oOUyaagN1JEjOQufHby53dD0meUQ1qgKZWdG2m1w0InR8D+Y6LXpDFP2jVNrhhUgEfQekjta2oZz0
	0scBgJKqym/IEWsICevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Exq-009hE2-Qf; Tue, 13 Jul 2021 09:44:30 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ExR-009h1r-6l
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 09:44:06 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 9DA34C64D7; Tue, 13 Jul 2021 10:44:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1626169443; bh=IywHMobrUb8qp8Iq30AbYfag8Ooa+FNEbB8vW4vlP+8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=otQkW/ZYaxVwo6OMaEOP92yr27/DmFSEBM837sXxCppMxBW8yJSQYAQcDPlpzlcXY
 paeAyQdAjOCVhyQzJpyTZUW1nPLHZsm5YKbZ9KP+HOrM8c4+6gv1/9FPAL9R14/zIT
 OXnmCQmDcIVgGQlaSP52e5+ZV6ueh1gHBKMdMVwJG+3crrPkoBOFwJKBMxgV6CkbKR
 oFOy4gbmNjIZM8la7hv6Gqz+2keakEfpOhbFoVHdWoYT3d6BNGA/or7TXgVKP6RazI
 U3F+OiDq/HVpixyOYlDtNZroeuq0VaJ2hPVhHeQLQOWKTO36OcXdGcXrb6Pu6srk64
 BTYt2Zd+tK0rw==
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: rfd_ftl: add discard support
Date: Tue, 13 Jul 2021 10:44:01 +0100
Message-Id: <cdc2b33790398d42f310af350298c1e781a50991.1626169090.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_024405_454669_33C2962C 
X-CRM114-Status: GOOD (  12.38  )
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

I proposed this change 16 years ago before discard was a feature in
the block layer: https://lwn.net/Articles/162776/

Now that the block layer has discard, we can finally merge this change.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 7b243f2b2fa3..7f5f6d247cae 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -705,6 +705,34 @@ static int rfd_ftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *
 	return rc;
 }
 
+static int rfd_ftl_discardsect(struct mtd_blktrans_dev *dev,
+			       unsigned long sector, unsigned int nr_sects)
+{
+	struct partition *part = (struct partition *)dev;
+	u_long addr;
+	int rc;
+
+	while (nr_sects) {
+		if (sector >= part->sector_count)
+			return -EIO;
+
+		addr = part->sector_map[sector];
+
+		if (addr != -1) {
+			rc = mark_sector_deleted(part, addr);
+			if (rc)
+				return rc;
+
+			part->sector_map[sector] = -1;
+		}
+
+		sector++;
+		nr_sects--;
+	}
+
+	return 0;
+}
+
 static int rfd_ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
 	struct partition *part = (struct partition*)dev;
@@ -786,6 +814,7 @@ static struct mtd_blktrans_ops rfd_ftl_tr = {
 
 	.readsect	= rfd_ftl_readsect,
 	.writesect	= rfd_ftl_writesect,
+	.discard	= rfd_ftl_discardsect,
 	.getgeo		= rfd_ftl_getgeo,
 	.add_mtd	= rfd_ftl_add_mtd,
 	.remove_dev	= rfd_ftl_remove_dev,
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
