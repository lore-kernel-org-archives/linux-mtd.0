Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F4FCCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbvNfKR2oOz97zKUf4C7Mi5DIOiXNmbfXOxncnXrcZQ=; b=bHHnmTU5YzbJYk
	vpqKBN0Pu5Jk4OqX0Ay1uTpxKb3339+mXTK3PHE904KqwtwLrvaQBpjOt8aA+0UXRi7vIDgFSH7yO
	brU5QeeRwQvYQb9ZC7JzbWblfzvNa3Rs0pOqBCklkFP7FVXx0e6ysQWVBD7ONLZxHeNMCboN3vRiI
	M7qUwin/dpajg5Wk+1npw8nlkOS/2IF79OJ0HsH41G5mcdIaFmhXlXVYd0pBO3qP4NWqBqbndEltR
	p7PmUEm0RuJb8EOh8RvyiItdBpCZ5S3+nhymj+14Q3juW2kSkNot9X1TSjElRG/pnp1+oywDkNNan
	w77cBH272bq9CT3Az1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvL-00000006UH0-47ad;
	Fri, 31 Oct 2025 17:28:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvB-00000006U6S-1jFB
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 02EE84E41447;
	Fri, 31 Oct 2025 17:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD44060704;
	Fri, 31 Oct 2025 17:28:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C81511818007;
	Fri, 31 Oct 2025 18:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IKJB1OCDKyocfIsQeZnwqEGivJeMVxUxOC96luFoKtE=;
	b=D9wXYUjtViGg2LSjRX1zVBy8SlAeLtMJ4AQoQdMrf24HMxh4/Zum5HZuq4v753py++w/P6
	NkMglFwXcW08ph/fUybCqovGEX1FwAYKstCn7AX8FSCerG/CKLM8dHdBEkXhlVmETR29uQ
	uH+daxj1yBf3bLBiBFNqsFK23UFVa7A7y+b1BCRZBCmm6kxJ9O/Ur9Mhrjge7WP4lrfDHU
	FH0pB7YP8hpQW1AY9VU/63s8IHtYDObID+QgjSV4JWKDRa7OOHYpo/8d1gBHyKqNK76zk9
	fuIJi7wW2ALGvZ5vNaiO1kqgpV27Sacmuo7VVoLfpPQ0sRxZT0a8s+tkTH4irQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:48 +0100
Subject: [PATCH 04/28] mtd: spinand: Fix kernel doc
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-4-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102817_586437_8DAF59D8 
X-CRM114-Status: UNSURE (   9.76  )
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

The @data buffer is 5 bytes, not 4, it has been extended for the need of
devices with an extra ID bytes.

Fixes: 34a956739d29 ("mtd: spinand: Add support for 5-byte IDs")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 927c10d7876958276a841a9f1278a74deeb89944..1c741145e49717169152854718f784e0e519ea92 100644
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
