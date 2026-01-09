Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7423D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVvJmIittZ68r79Razs2dyFrRcb1yRo5VbsKvjQyXHM=; b=bVkE+Xw84am2gb
	4FmHgt/AJIG3m0gWbbTKFt2F32eVlz+ileo3bV6F+Bwx5OaAU16zk7Njkn7RVxSjikd8zWic/Q2/a
	6uWP8YlGzWAIlhi5EkPYwtciVM9U2mRgLL8xgXV8lBExobvs6slQqcWM58EUdQFDb1KKlK2Y2ahsl
	NSw/s0ILaRDRpn46vSfiCM6lP3IkYaBQPBYTLdkDiapXTSPppDZGatv+jqnAu24EL6XSmAjW4z5J1
	0ut40Er5cpL2iQv6xPOGPRU+WSGVq2P/QzVVTKEgOKr5LBIgdrhzulWAsjsPvBVe6Q08gF3Irpu2R
	0zRdI58exhytkLeq6cVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG86-00000002ls0-2onF;
	Fri, 09 Jan 2026 17:18:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG81-00000002lnp-3JeZ
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5CA094E42027;
	Fri,  9 Jan 2026 17:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D26F606C6;
	Fri,  9 Jan 2026 17:18:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82F87103C89AB;
	Fri,  9 Jan 2026 18:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XlR+uDRIZQQiUnMwB6JtAAy6JempSPfArezroNR9cWY=;
	b=nHAa5EOEVMqlzmMHeNj4UzlNVt1C+N8UH6t0j0exFoQZHiSVrYFoPEtvBhpw8zR03kDnRT
	0XM8C+gSY2zr3jUzjXh6b4VrrUzvg47sZe6MBTDQ/Dfx6wlDCNo9GUGzBb2thYOM+5o6Df
	3WVtXwy/NR0pK+3vVja72N8NLE90CBk3g+mVoYNpZBRWxuPAGWOvc24wvP9TaMj0RVBltX
	0aekYJ0/e3wBeMFNZvE9oF/YZKkTYuakwri/uYZzIGVqDARnsB9MKnSzSJZzp43GSA+TQ7
	rDp/lsHO1U8hXBI0WLKKM0iOlCREZlV0BlC5GSLVdCLcfOAxDvdmBc7Vd2wRUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:02 +0100
Subject: [PATCH v2 04/27] mtd: spinand: Fix kernel doc
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-4-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091825_972861_B4B65421 
X-CRM114-Status: GOOD (  10.19  )
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

The @data buffer is 5 bytes, not 4, it has been extended for the need of
devices with an extra ID bytes.

Fixes: 34a956739d29 ("mtd: spinand: Add support for 5-byte IDs")
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ce76f5c632e1..049d55c38d52 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -287,7 +287,7 @@ struct spinand_device;
 
 /**
  * struct spinand_id - SPI NAND id structure
- * @data: buffer containing the id bytes. Currently 4 bytes large, but can
+ * @data: buffer containing the id bytes. Currently 5 bytes large, but can
  *	  be extended if required
  * @len: ID length
  */

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
