Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22FC282D0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sK70tQ+iTCjUA5CCWho7Iw92WoueZeFQU0t7/0fplmk=; b=0dSLc7gwC0GOWQ
	HtCP1xSO9E66sB7qcxePaf62d6vqk0g5taIIotB8km0QO4Jh2NFDZfTHNy+vkZJE6acPUljqoK4bj
	20rIMRJxHOj07YuA0YJAdxz9VyOYeyNmYZy+OwRT5+bSl1s5AsY08YK+/pDqp0vN6DfzWySsOCG9K
	tuzsiRyTI/GFrPLXHfhd6tYEXi5faJC2mex1ZfAS+YnnTAlUZ5HnNfYXnN5b1aTlHyyW+rVoOQC/Q
	0nz4MlPtXsUJNWJCkpDYSsfJ4yo00tP7pIoM8NrZqrxn4Ui4JFDcpclOaVjdlacAjsUmi0Wgl6BzB
	MJbJmt/DvJ6Gx9ThNNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR56-00000004X4K-2zyo;
	Tue, 04 Mar 2025 12:09:04 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQ5q-00000004KJo-1ppK
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 11:05:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1B374429E;
	Tue,  4 Mar 2025 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741086340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YMY1KfHKxpFJKz15CNAWnliL2SN+E7l8ARJPYeyWYnI=;
	b=Tf5Nj9jroTH5NS6TKTad/fDNHw9lEH/A0bWMyOj3R8hZiXEcbhaih3bfJa4muCDW3DWOj4
	yUJVcJJcbrFTcUkYKV0jYvr4y5kypFFdIHDCg5jPMGyPt5ngQHAjm1Lafv8OjR9s0ReSyx
	csxjnAg7MJD1L41BkD42HQSnc8LpR51aKIdJtbqA7W5ZLD4845qbTpgP9i010Cgfaqw7Yu
	A3xI2Thm2lESgSvBDEX6OEbGY8OPazi24tiFViTDrZFOXux0U3IOFrPPko7wvjFJAKskgM
	u6ACPsFXy/9TPmaESW1q8eYLBWh7FB7cBPGbEz642PGKhPKBYJWg6lZolgseyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Cheng Ming Lin <linchengming884@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: spinand: Improve spinand_info macros style
Date: Tue,  4 Mar 2025 12:05:39 +0100
Message-ID: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddukeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetfeduleefjeffheevleeggfdtvdduhfdugeeuieejveejiedvhfdugfettdehnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_030546_626785_E7FFD700 
X-CRM114-Status: GOOD (  10.15  )
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

Let's assume all these macros should not have a trailing coma, this way
the caller can use a more formal and usual C writing style, as reflected
in the Macronix driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 10 +++++-----
 include/linux/mtd/spinand.h     |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index c9abac46ed05..1ef08ad850a2 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -187,7 +187,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_CONT_READ(macronix_set_cont_read),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
 					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF4GE4AD",
@@ -200,7 +200,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_CONT_READ(macronix_set_cont_read),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
 					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF1G24AD",
@@ -328,7 +328,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_CONT_READ(macronix_set_cont_read),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
 					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF2G14AC",
@@ -378,7 +378,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_CONT_READ(macronix_set_cont_read),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
 					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF2GE4AC",
@@ -424,7 +424,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_CONT_READ(macronix_set_cont_read),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
 					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF1GE4AC",
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5837a09ab9d8..1e748958dad4 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -502,10 +502,10 @@ struct spinand_info {
 	}
 
 #define SPINAND_SELECT_TARGET(__func)					\
-	.select_target = __func,
+	.select_target = __func
 
 #define SPINAND_CONT_READ(__set_cont_read)				\
-	.set_cont_read = __set_cont_read,
+	.set_cont_read = __set_cont_read
 
 #define SPINAND_FACT_OTP_INFO(__npages, __start_page, __ops)		\
 	.fact_otp = {							\
@@ -526,8 +526,8 @@ struct spinand_info {
 	}
 
 #define SPINAND_READ_RETRY(__read_retries, __set_read_retry)		\
-	.read_retries = __read_retries,				\
-	.set_read_retry = __set_read_retry,
+	.read_retries = __read_retries,					\
+	.set_read_retry = __set_read_retry
 
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
