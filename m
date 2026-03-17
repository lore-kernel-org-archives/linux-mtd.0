Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F4AFED9F0
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iIXGG88AfwLnBq5GP2cKDyBNrLaKLfF/6D8gNlRhToQ=; b=waGxO8w2Us6DMT
	TQSP2XLjV6Is/3S/UMz+0+h5nittQt7w7o+Lniiq0u7k6u5KFEabBd4mrMQ8i6/n8/RphOSR9JDO8
	d4+/6p8VcIp5Yc3PnYuw3g0MxlT62yG3LRy2exG+oZN6fJk1X92C8Otc3Bp6IJptgv0EbMfYFGyHf
	zoEuDJbJns9WjLFf3Fgh7WiFyx4BoQW+Dtui3LmMj1xYIKLeUN2rZKn/gy6yVBqaMg3q0QZCQqf3c
	dV43kgg+YxqsYiKMD8+XFP9IHPyXxHWpE32o5mjpQhSDxp5pUMOZ5I1833RgIfXhW5++JV0fRgh+P
	FVGOGB07sSAR5vsUQspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y33-00000006uwJ-01VF;
	Tue, 17 Mar 2026 17:17:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y2z-00000006uvo-2wQC
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 17:17:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 164074E426D5;
	Tue, 17 Mar 2026 17:17:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA7CC5FC9A;
	Tue, 17 Mar 2026 17:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3CE110450658;
	Tue, 17 Mar 2026 18:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773767853; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=15EiClnf19RhusewSb6oQE8g0GLpia2XVIfVvm497/8=;
	b=rR4kjMM07Z6WlgkMtP1ncX4bGSbIQs8ONxojI952qVaEjgOvs+woqZx48rpVg79dseea22
	sJyoL++pJNHJw6JB2MtF4jKgMng3bRVD81t1ElQgkyeh5q4UYTb52WR7D39FHzWGIWYlyk
	CmHhHgZt+f89G0WgWifQYa2I7w9cLfEFUW7jKLWXJKMQ8p1x8RTGbRLkuGzTSVTNbM5C9Y
	qCizG/4P5FdKxCGymNFlvUhW2RgEXclwsErR/2G/IlpHI/oJS1Gxmk141//In4QWo6RJnB
	QfoZPP7LlOv1nuuIWGcugQi3SUVEeq2Cf6lFHOGP8lJ97E1Ebvvf2Bj6GarA+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3] mtd: spi-nor: Rename spi_nor_spimem_check_op()
Date: Tue, 17 Mar 2026 18:17:22 +0100
Message-ID: <20260317171722.431171-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101737_872052_E4FC0E7E 
X-CRM114-Status: GOOD (  11.94  )
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

This helper really is just a little helper for internal purposes, and is
I/O operation oriented, despite its name. It has already been misused
in commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support"), so
rename it to clarify its purpose: it is only useful for reads and page
programs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
* Propose another helper name, more explicit (*_read_pp_op).

Changes in v2:
* Propose a new helper name, not including "page" in it.
---
 drivers/mtd/spi-nor/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 13201908a69f..1eee519c01e5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2345,15 +2345,15 @@ int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 }
 
 /**
- * spi_nor_spimem_check_op - check if the operation is supported
- *                           by controller
+ * spi_nor_spimem_check_read_pp_op - check if a read or a page program operation is
+ *                                   supported by controller
  *@nor:        pointer to a 'struct spi_nor'
  *@op:         pointer to op template to be checked
  *
  * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
  */
-static int spi_nor_spimem_check_op(struct spi_nor *nor,
-				   struct spi_mem_op *op)
+static int spi_nor_spimem_check_read_pp_op(struct spi_nor *nor,
+					   struct spi_mem_op *op)
 {
 	/*
 	 * First test with 4 address bytes. The opcode itself might
@@ -2396,7 +2396,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	if (spi_nor_protocol_is_dtr(nor->read_proto))
 		op.dummy.nbytes *= 2;
 
-	return spi_nor_spimem_check_op(nor, &op);
+	return spi_nor_spimem_check_read_pp_op(nor, &op);
 }
 
 /**
@@ -2414,7 +2414,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 
 	spi_nor_spimem_setup_op(nor, &op, pp->proto);
 
-	return spi_nor_spimem_check_op(nor, &op);
+	return spi_nor_spimem_check_read_pp_op(nor, &op);
 }
 
 /**
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
