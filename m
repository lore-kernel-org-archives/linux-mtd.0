Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1504CEDD90
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFx/x5Kw9axctM4PDykXOjdY8jo9PPFf9K2z8Kj3oHU=; b=eVib/J4/i+7TY2
	G8V/Z8DXajVOJEYZxPBSQSPy9qciAwfa5pjXG/WcVtvCiBZfphlDRJMYWEPkorPw4kPYSG5pkd+SQ
	eHCJoZXmzKOITyJQFhPQtwkiWdhemaucYciTHhO4co6LEffUyRIu6UGLuh2uTFbCBujKucXAONNWe
	B2ATh3pkUJMHdi4BJM+p8t6j3JZWctm47VBVqvFo63jb1cnLknJ6+6ynf7GknaWGcqHm6VEXAPU2y
	lQiQxPdpruyBOySMHxJ6AuR2AnGc94hqpFEqbxZskbEuQyFyF5u4xc5hAoaM2Ey5WZQa8aMeeWUCC
	p1x49iIEYFIxIf32IN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8v-00000009HmO-2FFV;
	Wed, 09 Oct 2024 12:50:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8o-00000009Hf3-1xoa
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 12:50:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 812F31C000E;
	Wed,  9 Oct 2024 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728478206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nj9cxdGrSN2tidNwVJuzf/Z5wAXggXQ/i1EVpcPmXk=;
	b=V+GysyJMNatO0QXDjXF85W7rS9Q99j89i7FdmUAbqzRUyIrgVH1hYc26b5ZrAt/cLe/sg+
	/fZSHvJuB+xClv88yvvaXK4ywj3MuowLBq3NsZT1EaOtpqLnNv2jHysOgM5MHDlAwuS0oI
	5tPJI+Qkx7GX5Dju5dRGmngP+AnCZO6+Ed8kcH7H1EdEZXVyVlIucUlV58a1B7fUCS3uVa
	VtjECnHwNq6PJFyZN5UoF8E5GsXHh+zMF7+86GfM/RXtImSS15pgZ3qYK1Pb0iFjfP4R+r
	l5MERiTOvoKIYpsRcb94yAZZpW4Ke2HQzh7XGEeysdLaV3BRR/ED77GBcn6iog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/4] mtd: spi-nand: winbond: Ignore the last ID characters
Date: Wed,  9 Oct 2024 14:50:01 +0200
Message-ID: <20241009125002.191109-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-1-miquel.raynal@bootlin.com>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055010_745183_86C29BDF 
X-CRM114-Status: GOOD (  10.71  )
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

The last 4 characters in Winbond's branding indicate:
- the package type (ZE/SF/TB),
- the temperature grade (I/J),
- special options, typically the continuous read vs. page read feature
  support and its default (G/T/F/R),

None of these information impact us, at the software level (well, the
continuous read mode by default is impacting, but is already handled
gracefully by disabling it in the initialization phase), so let's get
rid of it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b611bf7e8f0..a987df1755c6 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -181,7 +181,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N02JWZEIF",
+	SPINAND_INFO("W25N02JW",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
@@ -199,7 +199,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N02KWZEIR",
+	SPINAND_INFO("W25N02KW",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
@@ -217,7 +217,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
-	SPINAND_INFO("W25N01GWZEIG",
+	SPINAND_INFO("W25N01GW",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
