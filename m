Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C22AC5472F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoLUetW9EtjIQ2gzeY1/7znf6nhIlzKXMbYRI0YMEAc=; b=vB1hmxFrTE0BJI
	q2jyIJHUtg3uyb0oxZQSmtodxHLWGogmhfSiRgmBvyjj39GL/cfSyEQtBL6WZSHZN9t04CeHEVoHg
	PmoHciET3V86Ir9WywNwU9Ags1BZRAUcK8GHJAghNb7FShQ3pyTlOxX9X77wlz1UhGF95lnL06FFp
	gF1DLEJ6qAZhu9ZZw+GMVrp3Y83VtYhxQASdyQ0oOKJIwyR9o3TCr4LT0ZY4XkLaHaBLq+8tfvJwS
	OFOlrYp2ArzQkNB5ok8Y3sz3vZf1YQM8C40oM/yaTCbpw13yaZ9jEOm2+WDhisdFDwMjneBIP/c9D
	HnVmS1mQlqWpGk28iM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWN9-00000006lzr-24ra;
	Mon, 26 Aug 2024 09:50:51 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ5-00000006kVg-1pKK
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B652C0015;
	Mon, 26 Aug 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9exzuhNDtOFF1BGIt5WXtjzKQyp4RZNzffQLZrxD/cw=;
	b=Qx8ts0EeiIT2wFDuNttGiVc/rjDBh2FO8aE0TeAaxYcorSdqBcKm1NKtXgZB5OopW8juYx
	n1kHKvXo4IqiaddGlTYutdZPMRHDQ6Q8un7H21bPpbJzZONpzXW6/eP1KUUCvlTsNuQmev
	VjW3hKct7ALXuCBNAXzjHZuPM1YGZezhkV82+hwZ8jDDqWbAAGfbuZdeRGCzv8jQfYIPZq
	4SkDq0B4gbgqkiRCeB9XnJrQlA066y8gpjNndlhpFPOO2pt367HI/eHWV52Xy4IN2ogj43
	icLSqwdNodF+Ct/UnlKzKDn4ANs8ZGkaxAXtVTgo0Q6AGEjnU9X3UCW4ov+2Vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 09/10] mtd-tests: flash_speed: Drop read_eraseblock_by_page()
Date: Mon, 26 Aug 2024 11:46:28 +0200
Message-ID: <20240826094629.19065-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024639_721903_A6D22CE1 
X-CRM114-Status: GOOD (  11.11  )
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

The read_eraseblock_by_2pages() has been generalized so it became
read_eraseblock_by_npages(), but there is no limitation (besides 0)
regarding the number of pages. Hence, drop the _by_page() helper and
replace it with the _by_npages(), using 'npages = 1'.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 6df0568..1064491 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -233,24 +233,6 @@ static int write_eraseblock_by_2pages(int ebnum)
 	return err;
 }
 
-static int read_eraseblock_by_page(int ebnum)
-{
-	void *buf = iobuf;
-	int i, err = 0;
-
-	for (i = 0; i < pgcnt; ++i) {
-		err = mtd_read(&mtd, fd, ebnum, i * pgsize, iobuf, pgsize);
-		if (err) {
-			fprintf(stderr, "Error reading block %d, page %d!\n",
-					ebnum, i);
-			break;
-		}
-		buf += pgsize;
-	}
-
-	return err;
-}
-
 static int read_eraseblock_by_npages(int ebnum)
 {
 	int i, n = pgcnt / npages, err = 0;
@@ -454,7 +436,8 @@ int main(int argc, char **argv)
 
 	/* Read all eraseblocks, 1 page at a time */
 	puts("testing page read speed");
-	TIME_OP_PER_PEB(read_eraseblock_by_page, 1);
+	npages = 1;
+	TIME_OP_PER_PEB(read_eraseblock_by_npages, npages);
 	printf("page read speed is %ld KiB/s\n", speed);
 
 	/* Write all eraseblocks, 2 pages at a time */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
