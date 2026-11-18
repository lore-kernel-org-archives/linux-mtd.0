Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA0606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SCyuWmQc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nUTZeBlw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SIPTc448RddWIJjXpRR8s3ipauacv22zix7Ige4NLaY=; b=SCyuWmQcsGanh3xZPaCO0a8Ye2
	+y+FrBqUNO3HNDZpo+vzvdEhbd9SbZcs+8Em/k02VlLAGsKlG/LXSd5ysZLClbPY43YQABp60rCto
	X0EUubDDnKJ6B0UyYxaHQIFXtIJByb15ZCYT0mln34msw1bjRz42Vb/ZmtStKXiDzRE0xByIAwXuP
	B17QT2TrfaHH6OsDdqP0emhvtOaT1ZhFRlsYv/qe+Wa2h3pI13kNI6JNvNXi5kD+/WULHqES3CUgq
	RGzUHRRYw1DHHMT7dBqzOh2xNy+OYF47wHO+s5G5WZcv+ezVI17upXkIsjnyrPIsAVD+mvf7vbmJm
	JvKBUs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9Y-00000009iJz-3mOT;
	Wed, 18 Nov 2026 17:09:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9U-00000009iCe-25rv
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B24DF4E41635;
	Wed, 18 Nov 2026 17:08:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E5C95FE9B;
	Wed, 18 Nov 2026 17:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AD8F11BC2A16;
	Wed, 18 Nov 2026 18:08:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zuwtQreioMN9a5/vq15KRQ/7PNwROXYeLsoq2rsSsZE=;
	b=nUTZeBlwK3MB814qyTjsDdU3LDC5t3oE2F5FUWnqyewYE+S5xYCKdd5YHeBN8GkZYU/YiS
	CiD2p3X1w918zK+N3U3mjnfhiV8jV7GYLRz7PRGZMA6UcpblnOXLYZXZySGhvwRs6aZP4y
	vXbhHNnT5GkZM4tNWB04Yn6g2XuJ8MYRfLxTzz4cEZ3qgW1+g19qXQGPuTYKAMEkSwKANT
	IVJk7LBMJW3P5ZuegAonAKt5gO91BHHNhDSvWui5Dx3SE0xzvoTb6Z9BHOC42ISOAVfcle
	J4OHHnYgTrNybwVWFKPJ7UiHR9+9Wtsi5yBCBQ4qPN03tee6KDpiu9/+aEg7Cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:25 +0100
Subject: [PATCH v2 08/13] mtd: spinand: winbond: Add basic support for
 W25N04LV
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-8-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_090856_697495_82A49071 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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

$ nandbiterrs -i /dev/mtd0
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/2
Read reported 2 corrected bit errors
Successfully corrected 2 bit errors per subpage
Inserted biterror @ 0/0
Read reported 3 corrected bit errors
Successfully corrected 3 bit errors per subpage
Inserted biterror @ 1/7
Read reported 4 corrected bit errors
Successfully corrected 4 bit errors per subpage
Inserted biterror @ 1/5
Read reported 5 corrected bit errors
Successfully corrected 5 bit errors per subpage
Inserted biterror @ 1/2
Read reported 6 corrected bit errors
Successfully corrected 6 bit errors per subpage
Inserted biterror @ 1/0
Read reported 7 corrected bit errors
Successfully corrected 7 bit errors per subpage
Inserted biterror @ 2/6
Read reported 8 corrected bit errors
Successfully corrected 8 bit errors per subpage
Inserted biterror @ 2/5
Failed to recover 1 bitflips
Read error after 9 bit errors per page

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 8f29b5a2bd47..7c963adac954 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -856,6 +856,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+	SPINAND_INFO("W25N04LV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8b, 0x23),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
