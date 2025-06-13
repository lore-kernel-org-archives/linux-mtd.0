Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D4C71136
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ffiL9DVAm5RsS22zm6lmMYZ94uqaUkVfyyVqFqMwN1o=; b=dHTMm2rE2ziTjT
	cw53F5DDnaXeTuiGQGvR/dQIGxXQeHqSnmJtQpJUCTKT/EwWGKQe3iyM/FGeE8iIWmfzf0bJOBFdf
	0gtuUFc4r+MXou5aNtnHv84Ej5KNbgCI5lsgizaEBkRmi7f8FLP2y03ybGVMwPhTH7ZJdXEfjlErD
	QHIrkpACG4bkb1Ggd1Jz1FnjNZNPeQzEz14/cY7tlXVIvGN6K8jLkI1DHuicYHN5aW2LBBx4M8xvB
	M5vYwrVnYgQ+hEHvnyOjKq8wfuO9OQXiEuzYmrlN5Qp4ycsSj+xGWgUa8/s79Ky9N+N5PehLtXRt5
	vj/EuNFoGh1xk2tTDVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9w7-0000000HQ5x-3Yso;
	Fri, 13 Jun 2025 19:19:35 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8yV-0000000HHiG-0xZi
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 18:18:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEAEA442A3;
	Fri, 13 Jun 2025 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749838676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A6FU6SDX17aNoN9IEiJOQ14OoPG5LsdEowjWPMC4qis=;
	b=EYY16kp8QCmJNQdvBcaIjmCNYUvmdtonw/HtqEgIDjdj5xqFniRybwzuJKvTW1hXNsgewC
	9rBQ9eVjgzfCtqe9fz/wucIeosUTFP00S6FVkLjeh9cGkfog7JWiOcR1BsMShoRZjsDs2i
	VO8cgiV9OwqjqsrPCISsyVU7ZoJw2ZoiuSgK/732rZUCLCM56741lQY6Gk6ITyzy04ZA5p
	G3DYlUx+pClnN7uBEaNZcZV3IuBm7SDehRQAb4DXa54G3UdkkKCiB2QRMkm7avLfABmThG
	9J+F3U9kxpkbN+nw55FRctez267FnH18sbyUhr1JM9E6UivLie1MwRkm7fiZTw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andreas Dannenberg <dannenberg@ti.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] mtd: spinand: winbond: Fix W35N number of planes/LUN
Date: Fri, 13 Jun 2025 20:17:46 +0200
Message-ID: <20250613181748.1270842-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteefudelfeejffehveelgefgtddvudfhudegueeijeevjeeivdfhudfgtedtheenucfkphepvdgrtddumegtsgdurgemvdefmegsjedvvdemrgdutdgrmeelfhgvkeemudgsiegvmeelledtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudgrmedvfeemsgejvddvmegruddtrgemlehfvgekmedusgeivgemleeltddupdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_111759_416178_C38C8F36 
X-CRM114-Status: GOOD (  10.86  )
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

There's been a mistake when extracting the geometry of the W35N02 and
W35N04 chips from the datasheet. There is a single plane, however there
are respectively 2 and 4 LUNs. They are actually referred in the
datasheet as dies (equivalent of target), but as there is no die select
operation and the chips only feature a single configuration register for
the entire chip (instead of one per die), we can reasonably assume we
are talking about LUNs and not dies.

Reported-by: Andreas Dannenberg <dannenberg@ti.com>
Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
Fixes: 25e08bf66660 ("mtd: spinand: winbond: Add support for W35N02JW and W35N04JW chips")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 19f8dd4a6370..2808bbd7a16e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -289,7 +289,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
-		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 2, 1, 1),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
 					      &write_cache_octal_variants,
@@ -298,7 +298,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
-		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 4, 1, 1),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
 					      &write_cache_octal_variants,
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
