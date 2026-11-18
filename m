Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD360A260A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LumIym1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LxWSz0+I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8YWUeptLonCCaJNBtt9XAF0KdbAGakWxQSJHhdoHYDU=; b=4LumIym1dnQ/mzx4wrmQuvx1aj
	lWiC9ljaf3/NJBeOPj4oVZ29bAqtRsXoq1zgW7eFb4XhEsS+hrE4Dz7Kyz7UZoz+zqvULLd1tVzpX
	IoCqAuBkmsSqZ/0NW4rS1pswiWsNC3B4hhDXp+y4+ZIcqYRfQEbOzqrVm0YRnFhXMXIJvmQrzTnFa
	7YbQzcJaoS5PXO786a+RT3U51rImyE40LSeMPerNsbOXUfnf8zFYTcKdQ4FRI39HJjJZXKlK5K9it
	UeuQD2AxesyqGqmhDMiDYy+YjEu4fg6++1nzb3DyGEktC6ZsojgkxeK9Bk/2yNnWUdvHzBxig8z+y
	gVPfDhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9J-00000009i4O-1Qvq;
	Wed, 18 Nov 2026 17:08:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9H-00000009i2s-0bgs
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D442C4F77B;
	Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68FEA5FE9B;
	Wed, 18 Nov 2026 17:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E39311BC2A1E;
	Wed, 18 Nov 2026 18:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JPkbp5InV5FC7GB0gqDPgA6oAFNUik/9gOcMO+3HEE0=;
	b=LxWSz0+IyINs03TcW1uibwyfC69+6A5Y5CsmTZc1NrniJPJIxtQSpB2PJFVIF1/4MoPVyJ
	vufNtmLaGVhi9el1YTWu0ijjR7F+jIGne+N7YKbVigXBjCXsHjEgkh1SeCdSGWONrCyJjC
	yBY6OuT7eClS12P86+Hmcu9CPEClX3hb7SNIknqS+A43JaNvvfcg3XJ6BMBXPgg5XLaFd7
	QXpZsKoHm2GEcg5la/4uqPC/pqTa65JSIn0mTeP96tjFrkrNC3b2vvi6jFIltZLCBCUCJm
	283qblDbAjDUE3V1HrEpZYFkuqnXaeJR1kvuSL26QRMweIL/tC6GmptY8BAhHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:18 +0100
Subject: [PATCH v2 01/13] mtd: spinand: winbond: Fix an OOB layout
 inconsistency with W25NxxLW chips
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-1-55956313d6cb@bootlin.com>
References: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
In-Reply-To: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090843_361210_296FA72C 
X-CRM114-Status: GOOD (  11.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

W35NxxKV, KW, LV and LW have the same OOB layout pattern. Though, in the
KV and KW cases, they have been exposing the user data section that is
non protected. In the 08LW case, the choice has been to derive slightly
from this and to only expose the ECC protected user bytes.

Make sure 04LW which has been merged this cycle follows the 08LW
choice. All LV and LW chips should use the same layout.

Fixes: ea609469a3e3 ("mtd: spinand: winbond: add support for W25N04LW")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 810975808c97..49fa545a4113 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -836,7 +836,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
