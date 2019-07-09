Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E79C73C53
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:20:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0016020651
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvx5YwgN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uUstvd4n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0016020651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lvINqI+1PRH3NJVfc0kyWi/VKMRs58/iwlTC/IyCij4=; b=dvx5YwgNV80N81
	zUrtpzZiBzPHIrx+wZjc2JmZ3DE33v24KqyQYcRT0a2C38t1XsB1MIMQTpqelwkOKjQ9CDsFvaVWz
	swVByy0RXavf6pWAdx+8XEm+Z4XW/EiduBjbNKIK2wDa2eOCmo1saKvrf9GnwVDIGnTZT2poZVHhs
	Ie0z/IXjr2MdcOd7KOdJC91W3dhZ/zN3i6n5hekB7g3z8lv1Y1ttDxy53tHRqY2DzOzK1a/aczJwS
	HbgRMq++qwflCwMHxP+AUB504dfb5rvomISjpb+UgYjuCBJkpBF1IH1qV/Vw7Dplx6oqrElu1zet3
	hv55z+N+zsuGiivfiXCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hktnM-00037v-5R; Tue, 09 Jul 2019 17:20:48 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hktnJ-00037H-El
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 17:20:46 +0000
Received: by mail-pg1-x543.google.com with SMTP id o13so9768658pgp.12
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2019 10:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jwKlaDa3o/M8o865rN6UppbDUhfZfERAbVMcXJv9+M=;
 b=uUstvd4nTXrHG1PJRnuLzasKvFGHJuTA1VBg63W4rVmKsV7d2+lB7C3m2XWYIqS9SB
 x2+8EGDiI7h2ZpxMr91lNkwvoPjrja/2n8mCBLYY7KEyTKqWX4DXcH/WCqr8OcsS5q0O
 hKILFA+e1gdDOHN9BVaJa+J0STUi4uCjz3QcYw6gqpVzTPKxVG7dm6pZ2d48sON/qd+J
 rIE4Q6gs+9FXYBV/cMZIuj8lOnAgPVyK1IFScTqSqHpZkqahiDj/ZlQgQi2l78Bp0L9I
 k0ffX5TwWIqdbRQHlLhgaJl7CXNwolOrSkxQ3WTbsndysxMK5m2airg7CV3hR2Q1VKgc
 rSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jwKlaDa3o/M8o865rN6UppbDUhfZfERAbVMcXJv9+M=;
 b=K9a4ctlqg8yp7vZd53fZMLXE3locKSABqYA4M5gXhkX0zqAY1ji7ISdGnINunRUhHh
 vpdpKyLjwDhBDhem6T1kmrOIlmSjUewxsGY+rnC8l0ueTZiQzh8jGyv5Rr2MB97LcauM
 nBBiAd1QZeqUBsRvof7ViGIxzoh0pfn97pkdOhNtGwtxyQJXiffY3YuvyBqgIhikYVpr
 xTKk8cF3YRU4aO1aSwdQGHUtBvABGUMVfFGYzJkBIPq5L4+iQJtpaqvC5C+oPhi6sGQR
 293kH629AX/NY2pd3U9NYC4XamR6ISH5iyzYgmPcWMl9Lz5VDiHZfUHyABwHbKflRBG3
 swNg==
X-Gm-Message-State: APjAAAXg07QO3DadgfkVY3EmxTRFqBCSw7fJhDSfH40o8280WaxuJvPS
 VTN2wSPAZYbtYD3UXNz/srM=
X-Google-Smtp-Source: APXvYqxUYB3bVscQLKpwp3HJINKJwYQXN1X1EJq6MeAeaiardWSuEwDABRPKbO1U7JRKbKJfjBnLEA==
X-Received: by 2002:a17:90a:1904:: with SMTP id
 4mr1353522pjg.116.1562692844746; 
 Tue, 09 Jul 2019 10:20:44 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
 by smtp.gmail.com with ESMTPSA id n98sm3218979pjc.26.2019.07.09.10.20.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 10:20:43 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: ingenic: ingenic_nand: Add of_node_put() before
 return
Date: Tue,  9 Jul 2019 22:50:30 +0530
Message-Id: <20190709172030.13581-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_102045_513980_3569A4B2 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
index d7b7c0f13909..df214e7ddec8 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
@@ -418,6 +418,7 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 		ret = ingenic_nand_init_chip(pdev, nfc, np, i);
 		if (ret) {
 			ingenic_nand_cleanup_chips(nfc);
+			of_node_put(np);
 			return ret;
 		}
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
