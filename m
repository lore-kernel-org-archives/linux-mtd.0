Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E82C77B76
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vds3JGYkAjgmT+Zdw2ngRJ+qWMiYYSQQgjg7g1/R2lo=; b=TRQF1guEcUFsJj
	3d3mhir+82eIT0y2NFPoA0q3VPSL30dm/gxPrwI7R9hkAX5R2WyWpCaUF4fJZGtFv+6Vt/dx55RgW
	MouuFwped2xEIWCC3hMGEmCc5Qp8/MgORht0LQR7lE/aIVylHI+VF6FlA2HSVY846kbKc09oRIsCY
	OUHOHGF9OKb7Di+zOR0+N29FnGSe+wVc9LT9tC1Im2PFBG3j2xIA1wfpCcQv36xTZinsqKmiWdHj8
	vOnaonJWsOzptQ8v9apbqjqZEWNzFjaRvk5Pe8fkjcHZvcRQTdePRss/d6MMNSDav/liSNsb0vxsi
	eN4p3VvkvxkJqlEempig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poVuK-00Haic-2X;
	Mon, 17 Apr 2023 20:57:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poVuG-00Hai6-1r
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 20:57:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2AE562A68;
	Mon, 17 Apr 2023 20:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0F9C4339B;
	Mon, 17 Apr 2023 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681765019;
	bh=GsJ+PxyTSnYDGmLARig0264/+VJ67ApwAzYJ119+iSo=;
	h=From:To:Cc:Subject:Date:From;
	b=nNatzqFHmOQ057sTK5UQ0wFqiCQjllH8w0mjnxyxRPlfJsHBhuPXHefHqjInEH4AF
	 nulbc2rGyqnAWGzjW6V0YKevxeCLXOL8eAXvgSNhRb+ukhcMvfqKY1urg0P2VRvXWg
	 3hxjk0TJmgcsKe++pVJcahc2qD9SjKYg2jhlP5UGERc8J3BodkS2nHWW9YKCAMKsdU
	 nj6Z486FHooltVb23ucWjyx4fcaOFIl0c6m6X0u7FI4sP5lYW+cIbC/uFhbhkM1k1N
	 lyN4WUD9hNmoI/z2V2LQnnlAuMuMII3zGoxtafcFjdpbESky0FBzIz/httvFFSFlaX
	 2U9g4u1Uci3Cg==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtdchar: mark bits of ioctl handler noinline
Date: Mon, 17 Apr 2023 22:56:50 +0200
Message-Id: <20230417205654.1982368-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_135700_653599_A16FEEB3 
X-CRM114-Status: GOOD (  13.95  )
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

From: Arnd Bergmann <arnd@arndb.de>

The addition of the mtdchar_read_ioctl() function caused the stack usage
of mtdchar_ioctl() to grow beyond the warning limit on 32-bit architectures
with gcc-13:

drivers/mtd/mtdchar.c: In function 'mtdchar_ioctl':
drivers/mtd/mtdchar.c:1229:1: error: the frame size of 1488 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Mark both the read and write portions as noinline_for_stack to ensure
they don't get inlined and use separate stack slots to reduce the
maximum usage, both in the mtdchar_ioctl() and combined with any
of its callees.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/mtdchar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 01f1c6792df9..8dc4f5c493fc 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -590,8 +590,8 @@ static void adjust_oob_length(struct mtd_info *mtd, uint64_t start,
 			    (end_page - start_page + 1) * oob_per_page);
 }
 
-static int mtdchar_write_ioctl(struct mtd_info *mtd,
-		struct mtd_write_req __user *argp)
+static noinline_for_stack int
+mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_write_req req;
@@ -688,8 +688,8 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 	return ret;
 }
 
-static int mtdchar_read_ioctl(struct mtd_info *mtd,
-		struct mtd_read_req __user *argp)
+static noinline_for_stack int
+mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_read_req req;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
