Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5728C54E49
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFnGrwXHQu+sXSer1BO6ALXAaNdFukHggr+QaSBd2EI=; b=P80uF/mRuaboAD
	mGyijkVeJHe0YYMzGm8hVAMa89BX8GZ4gjyCVczvaCFvG2KJHdLcfbCL70DQ6lluAMjdm4KWjuKcI
	J6/6cj5z6ZX6u9Svd5nWNm+/hdFpwdtT4N5GZUt2M4TdVOVZf/o+j6q29P0NeIoNDHfhj4V6AE3v2
	mcZ0DjakuyPY+6ax0wc/YPDLNPLCpp+ilkZb5cO7Z1O0GykYG1irvpvfMioyKmqSLQil0pOw1mNiN
	hhm2G7k8Nbs64pMYoi86V7th7s/Sih1eo5B7wVNh5Bxp/2KJpCf2ETv9A0W2qtCuy01LUGtvo+3JA
	l3mhi57527U9EiteHpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdU9n-00000009Ed2-2QRU;
	Fri, 23 Feb 2024 11:55:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdU9i-00000009Eb6-2CEI
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 11:55:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4346C000F;
	Fri, 23 Feb 2024 11:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708689351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4210C3c5/SylTjU8kMcKJ8rayKT+noKE9Ryn/irxAf4=;
	b=UFx60bkBHZlF+wkEHc5QTPSi2NpXroDmzbuuIXrzKVe354ejrZBovIMSPZRo6tBE40iDNO
	Y6Llgyj0XbyKGukMznIskWUIvlwo7Y5nIMGj8Bgc31qAWBcVwTPXQEzmcXh5NvhTQUpDwF
	NAT4PCkdel0TIhKqwjnYU7zeAJFqaU7Q6mLg2S7T7q08zhFlNmCUZHdY/8fJLitMjMDevf
	AAw1x8hyySlvU78yzROME+P2GRHXNBXpAU03gqromS7k1Vse0Scs1hXcLd3jGUX1jDD+R0
	WFgz9a3Rs5qM6uFPp6DD6pRnP/v9/0zWlCS0yv/XkPnk9KZ4Mj5gRgjhNSiOyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] mtd: rawnand: Add a helper for calculating a page index
Date: Fri, 23 Feb 2024 12:55:44 +0100
Message-Id: <20240223115545.354541-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223115545.354541-1-miquel.raynal@bootlin.com>
References: <20240223115545.354541-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_035554_828538_C128D8B0 
X-CRM114-Status: GOOD (  13.51  )
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

For LUN crossing boundaries, it is handy to know what is the index of
the last page in a LUN. This helper will soon be reused. At the same
time I rename page_per_lun to ppl in the calling function to clarify the
lines.

Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
This is a dependency for the next patch, so I Cc'd stable on it as well.
---
 drivers/mtd/nand/raw/nand_base.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index bcfd99a1699f..d6a27e08b112 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1211,19 +1211,25 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 	return nand_exec_op(chip, &op);
 }
 
+static unsigned int rawnand_last_page_of_lun(unsigned int pages_per_lun, unsigned int lun)
+{
+	/* lun is expected to be very small */
+	return (lun * pages_per_lun) + pages_per_lun - 1;
+}
+
 static void rawnand_cap_cont_reads(struct nand_chip *chip)
 {
 	struct nand_memory_organization *memorg;
-	unsigned int pages_per_lun, first_lun, last_lun;
+	unsigned int ppl, first_lun, last_lun;
 
 	memorg = nanddev_get_memorg(&chip->base);
-	pages_per_lun = memorg->pages_per_eraseblock * memorg->eraseblocks_per_lun;
-	first_lun = chip->cont_read.first_page / pages_per_lun;
-	last_lun = chip->cont_read.last_page / pages_per_lun;
+	ppl = memorg->pages_per_eraseblock * memorg->eraseblocks_per_lun;
+	first_lun = chip->cont_read.first_page / ppl;
+	last_lun = chip->cont_read.last_page / ppl;
 
 	/* Prevent sequential cache reads across LUN boundaries */
 	if (first_lun != last_lun)
-		chip->cont_read.pause_page = first_lun * pages_per_lun + pages_per_lun - 1;
+		chip->cont_read.pause_page = rawnand_last_page_of_lun(ppl, first_lun);
 	else
 		chip->cont_read.pause_page = chip->cont_read.last_page;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
