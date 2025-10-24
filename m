Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E75CCD1BF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGZ+nPdICXgiF9vOUi4TdKUZ8p/9qUKOjS5G8wueei0=; b=YAvOTyUt9Zab0u
	THEFxlaxvSiox+iRPIcYWpScO7InORdE1gASy0oufP8qAH76ztABeov2Ypyc7xVIhqJ5GGithYGjK
	/JpnUvGrFTJtrBxgu18esQA0Pj3HJShQCZMvYDG4JmvleAvOPybmBaoSE4e7ovJ9smrRKqEr7UbGU
	5/Z+mmQUXGPU5mUBdHM4SjabjSbglO9wn/vvCCDAFnmLrqu96hpgm3UPozF9SmpIUtyJlip6NcjUP
	EC/z7sobowuhzUcBlG1uddpSB5eM93dLJy3uf2uXfX+M+9CQx/6T7QlbmgdYE2EPxDeTJm+W2YQat
	B+MPZLzxRhYTmkKTiKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5dU-00000007u4i-1zAg;
	Fri, 24 Oct 2025 00:26:28 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5dR-00000007u42-2MVB
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 00:26:27 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 187592C0220;
	Fri, 24 Oct 2025 13:19:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1761265189;
	bh=L4QwmTgTcJEAaK2M3tB5ezRq7uzaVfAc3OY7SGjM9l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6vzN5kpj/oFnfzMShiXYaLkRq+8kBIrQRPL+sS0S2VwZ9vuLhC2O4hLq+8qz7dJj
	 ymrce+WvSBGxWkd+6+/om0jAiVzp6jh58xMKZJrE9OU8cAAbnBBWgdFcH8guSGnAFP
	 1l2+JZYVdqln6Qj+FoQ94YtTUoaxt3bB0hFpHYAJRcfmf+VxE4zhwwgiEd3hgOiV3d
	 JVW7oIO5J4Kgc1bqYItz7A1lIMQSYMd5jZJI9NCL0gQMQNl2v1/lx+uaVMyXIABSlF
	 JENE8MHm8o9UK7AT/o9Qmovpcwuc1YhwU47HufzVmS0A2mT2135sy/U4PS73T5W++u
	 OWiDZ92Ovo0LA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68fac6240001>; Fri, 24 Oct 2025 13:19:48 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.16])
	by pat.atlnz.lc (Postfix) with ESMTP id E371413ED0C;
	Fri, 24 Oct 2025 13:19:48 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id E37602A0433; Fri, 24 Oct 2025 13:19:48 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Elad Nachman <enachman@marvell.com>
Subject: [PATCH v0 1/2] Revert "mtd: rawnand: marvell: fix layouts"
Date: Fri, 24 Oct 2025 13:19:41 +1300
Message-ID: <20251024001943.29557-2-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024001943.29557-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20251024001943.29557-1-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=NbFF1HD4 c=1 sm=1 tr=0 ts=68fac624 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=x6icFKpwvdMA:10 a=7ObwLiBfByo8Q1K0N5QA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_172626_078545_8BED80DD 
X-CRM114-Status: UNSURE (   9.08  )
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

This reverts commit e6a30d0c48a1e8a68f1cc413bee65302ab03ddfb.

This change resulted in the 8bit ECC layouts having the incorrect amount
of read/write chunks, the last spare bytes chunk would always be missed.

Fixes: e6a30d0c48a1 ("mtd: rawnand: marvell: fix layouts")
Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/marvell_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 303b3016a070..38b7eb5b992c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -290,13 +290,16 @@ static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] = {
 	MARVELL_LAYOUT( 2048,   512,  4,  1,  1, 2048, 32, 30,  0,  0,  0),
 	MARVELL_LAYOUT( 2048,   512,  8,  2,  1, 1024,  0, 30,1024,32, 30),
 	MARVELL_LAYOUT( 2048,   512,  8,  2,  1, 1024,  0, 30,1024,64, 30),
-	MARVELL_LAYOUT( 2048,   512,  16, 4,  4, 512,   0, 30,  0, 32, 30),
+	MARVELL_LAYOUT( 2048,   512,  12, 3,  2, 704,   0, 30,640,  0, 30),
+	MARVELL_LAYOUT( 2048,   512,  16, 5,  4, 512,   0, 30,  0, 32, 30),
 	MARVELL_LAYOUT( 4096,   512,  4,  2,  2, 2048, 32, 30,  0,  0,  0),
-	MARVELL_LAYOUT( 4096,   512,  8,  4,  4, 1024,  0, 30,  0, 64, 30),
-	MARVELL_LAYOUT( 4096,   512,  16, 8,  8, 512,   0, 30,  0, 32, 30),
+	MARVELL_LAYOUT( 4096,   512,  8,  5,  4, 1024,  0, 30,  0, 64, 30),
+	MARVELL_LAYOUT( 4096,   512,  12, 6,  5, 704,   0, 30,576, 32, 30),
+	MARVELL_LAYOUT( 4096,   512,  16, 9,  8, 512,   0, 30,  0, 32, 30),
 	MARVELL_LAYOUT( 8192,   512,  4,  4,  4, 2048,  0, 30,  0,  0,  0),
-	MARVELL_LAYOUT( 8192,   512,  8,  8,  8, 1024,  0, 30,  0, 160, 30),
-	MARVELL_LAYOUT( 8192,   512,  16, 16, 16, 512,  0, 30,  0,  32, 30),
+	MARVELL_LAYOUT( 8192,   512,  8,  9,  8, 1024,  0, 30,  0, 160, 30),
+	MARVELL_LAYOUT( 8192,   512,  12, 12, 11, 704,  0, 30,448,  64, 30),
+	MARVELL_LAYOUT( 8192,   512,  16, 17, 16, 512,  0, 30,  0,  32, 30),
 };
 
 /**
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
