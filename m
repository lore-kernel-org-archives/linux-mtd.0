Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D56DC5478C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAl019+CCX8e2+aSUVpNrjnN96RIp2wo+8QKjxoNH4w=; b=3qqDLSBB4/Lpor
	T6Lj86S7om5VYucJB7aUf9KZyOoeA1qcDXBCXqpAFrQreMvwTNmkgaT0iHPMKRxZ+9DYMupyz7NcU
	WhbE23AOgvTKXq5u+w8Y1pz2mX1yIYUBN0djypyknbXCDCcEL91dP4naWzrzLMP/smxJyaeLaQbB0
	M1L5UfldqEBtSCGxQJuKfnTCEn5Y/27XEjlc34XfSGq9gc+Y0sHnS8Bstw/DitxHYy57+K9qiA2Qa
	HLQiusaN7bQidbltbxXfqBB5rDNo4KxVdfMOHUtScV17Biroo4Qd0eTmHnPeGO0JoJjeFMjgvdnSQ
	lgLMJSDtyvscv9EY5BtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdU9r-00000009EdM-1AuH;
	Fri, 23 Feb 2024 11:56:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdU9i-00000009EbK-2Bro
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 11:55:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA410C0011;
	Fri, 23 Feb 2024 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708689352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrEN5TvhX5/r3qsoC4vp32SJepM9NsZrN5JkiWr7IcI=;
	b=WcErOA83RYMMh38XrwuXrvfqtTUJltPjlqhY+/HmZTbFP2fAdAqOy4qsbSQki41OvsMtqX
	8sfLN+1QF1Yjn2CFuronLxOAB8Hsa+uJd/bnb0LqyKeaOZG956rLjxgeOzjbPwCvermdXs
	c6xpiH/6bvYXF3gAxTO/gLCAkTLWZvTUQqXCAaGOCG946zkc3cl3jUv5ZAKlikN/k4XMhF
	QStfP3iqMu8orfvVOP3hHSsck0cOaE162Ne3TQyYTz3APab4bzn3U8or2vvNbslWjiiguo
	Q9R8wsCLDKOwTGd8iSdjJhYcBQrCGMZHWyGRLYt5GBZEXBlt73Kzf0R1/hUQ1g==
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
Subject: [PATCH 3/3] mtd: rawnand: Ensure all continuous terms are always in sync
Date: Fri, 23 Feb 2024 12:55:45 +0100
Message-Id: <20240223115545.354541-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223115545.354541-1-miquel.raynal@bootlin.com>
References: <20240223115545.354541-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_035555_007328_0E13AD91 
X-CRM114-Status: GOOD (  13.36  )
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

While crossing a LUN boundary, it is probably safer (and clearer) to
keep all members of the continuous read structure aligned, including the
pause page (which is the last page of the lun or the last page of the
continuous read). Once these members properly in sync, we can use the
rawnand_cap_cont_reads() helper everywhere to "prepare" the next
continuous read if there is one.

Fixes: bbcd80f53a5e ("mtd: rawnand: Prevent crossing LUN boundaries during sequential reads")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
This is not 100% a fix but I believe it is worth backporting as there
may be corner cases which were not identified with the initial
implementation.
---
 drivers/mtd/nand/raw/nand_base.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d6a27e08b112..4d5a663e4e05 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1232,6 +1232,15 @@ static void rawnand_cap_cont_reads(struct nand_chip *chip)
 		chip->cont_read.pause_page = rawnand_last_page_of_lun(ppl, first_lun);
 	else
 		chip->cont_read.pause_page = chip->cont_read.last_page;
+
+	if (chip->cont_read.first_page == chip->cont_read.pause_page) {
+		chip->cont_read.first_page++;
+		chip->cont_read.pause_page = min(chip->cont_read.last_page,
+						 rawnand_last_page_of_lun(ppl, first_lun + 1));
+	}
+
+	if (chip->cont_read.first_page >= chip->cont_read.last_page)
+		chip->cont_read.ongoing = false;
 }
 
 static int nand_lp_exec_cont_read_page_op(struct nand_chip *chip, unsigned int page,
@@ -1298,12 +1307,11 @@ static int nand_lp_exec_cont_read_page_op(struct nand_chip *chip, unsigned int p
 	if (!chip->cont_read.ongoing)
 		return 0;
 
-	if (page == chip->cont_read.pause_page &&
-	    page != chip->cont_read.last_page) {
-		chip->cont_read.first_page = chip->cont_read.pause_page + 1;
-		rawnand_cap_cont_reads(chip);
-	} else if (page == chip->cont_read.last_page) {
+	if (page == chip->cont_read.last_page) {
 		chip->cont_read.ongoing = false;
+	} else if (page == chip->cont_read.pause_page) {
+		chip->cont_read.first_page++;
+		rawnand_cap_cont_reads(chip);
 	}
 
 	return 0;
@@ -3510,10 +3518,7 @@ static void rawnand_cont_read_skip_first_page(struct nand_chip *chip, unsigned i
 		return;
 
 	chip->cont_read.first_page++;
-	if (chip->cont_read.first_page == chip->cont_read.pause_page)
-		chip->cont_read.first_page++;
-	if (chip->cont_read.first_page >= chip->cont_read.last_page)
-		chip->cont_read.ongoing = false;
+	rawnand_cap_cont_reads(chip);
 }
 
 /**
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
