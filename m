Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0C6D3748A
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Dec 2025 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Zr518EvbSqADVRHKOOsi61wOUyuFdRs/NRnkBvRrZ0=; b=x57L3O/L7vNgE2
	G69F4YRvAiatFo5XclsFvf+PJTu8Rc/dF7du27MU67ScCPaOY9KZX/qchGlyAgHHyJGbvmhqbpCJ+
	rNDgtPGW+COohxPj4FO5/7MBp9/IxAKGt1nwqrJVKCatCCpdsHiSubo9MRN6DnLJtfGmjpFcZX85m
	vTyjIuDOgTzaT9kQYVNhYueMo71/uxW1b7ejNXPtaLOSHXfmINwnZ9MHO4BHvEm+hMgMyxN+aB+en
	o69fnUgdeGLG5/rdPwbmVhsa8HRs2D54kV36bGOf6nh67ed7/0jNmjAYAqJsjA9EEOFAb0QSLpi68
	JVYI3w+1QKAg4R1fKi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbeo-00000009xTC-3ZLy;
	Fri, 05 Dec 2025 19:39:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRben-00000009xQn-1KaZ
	for linux-mtd@bombadil.infradead.org;
	Fri, 05 Dec 2025 19:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GsPfW5nIrd5pUnvoNUZwEFGa4mbzSWlHyDo81A+WvbQ=; b=NR0ZkGyUdzyLbbh4ltL+PZnBvu
	hDuq8PNYjYA7oVXDuyKD1P1vr5c5mTD1dgtEVH1QkXdZzq2CvKd9rTqd3Hk5X9OHTSraYxO73Yhoi
	4SXI2sLEq/bTOP6ajPubQH2+y+6+wXe0gBKPoqO8S7z23xIvuIxrwTUKrbJYn0Js4fc9BmoGoOO8s
	nMvZ6M3+SbY9ay9P0zTWKo6DwLTLDUuQAt7hm8bTABFZwkvTkyasO71mypD0P0JDnUEJpQabjRzHJ
	IlJ/znB6KdiF0UMX1d/ywDNpOwqJ/q2XriNiYdC0a9N9TyUg+9tZzPCx7YsD43qecYQuC/Vf8bGjk
	SLXIK5ng==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRanB-00000006hBV-42Dz
	for linux-mtd@lists.infradead.org;
	Fri, 05 Dec 2025 18:44:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 175F4C19651;
	Fri,  5 Dec 2025 19:39:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EB41606AC;
	Fri,  5 Dec 2025 19:39:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38787102F18E2;
	Fri,  5 Dec 2025 20:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764963582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GsPfW5nIrd5pUnvoNUZwEFGa4mbzSWlHyDo81A+WvbQ=;
	b=kdl8sj1F1iOIT4hz0E2OFm3VYpUtyMOasoawoaUZOU4bJdRlkRuR/L5h2wxiuywE2ulpU1
	5OJsczM5hBpkRyWlluHcWhpAP9Jo1VA34C6Ta5XZEbFakxra7daw+eYFGAI3ZAQyDCXr+9
	sKVUGXfn+6U4Jct+kwy0Grz5r0LOFHCH1qngzo+s4h5axTMBDKD7I7GT52IIKRSp7P41CF
	hymHESESD6jzDg3HlGIZL/4XbLYln7uigDGjCQopihp5DB26Anl+7TKEr0z2s3HJzZm5VA
	zoaJb+dPuaZVhvkpJX33okuFuRxUxr1mYSCU1IcvS8jmEfF6xFk3PHMPh7QwZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 05 Dec 2025 20:38:53 +0100
Subject: [PATCH RFC 2/8] mtd: spinand: Expose spinand_op_is_odtr()
MIME-Version: 1.0
Message-Id: <20251205-winbond-v6-18-rc1-cont-read-v1-2-01bc48631c73@bootlin.com>
References: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
In-Reply-To: <20251205-winbond-v6-18-rc1-cont-read-v1-0-01bc48631c73@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_184434_048212_167477EB 
X-CRM114-Status: UNSURE (   9.32  )
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

This helper is going to be needed in a vendor driver, so expose it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index f19150740979..3765fcc95c4a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1300,7 +1300,7 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
-static bool spinand_op_is_odtr(const struct spi_mem_op *op)
+bool spinand_op_is_odtr(const struct spi_mem_op *op)
 {
 	return op->cmd.dtr && op->cmd.buswidth == 8;
 }
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index eb8ae164b3aa..a90e873cf693 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -944,6 +944,8 @@ static inline void spinand_set_of_node(struct spinand_device *spinand,
 	nanddev_set_of_node(&spinand->base, np);
 }
 
+bool spinand_op_is_odtr(const struct spi_mem_op *op);
+
 int spinand_match_and_init(struct spinand_device *spinand,
 			   const struct spinand_info *table,
 			   unsigned int table_size,

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
