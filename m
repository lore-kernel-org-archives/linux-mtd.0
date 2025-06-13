Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9FDC7114A
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL6WEPCMB385fHlDyo/4hjvz9N0NRtA+PRMidk9wK/E=; b=PIEi+Y0NGRI66w
	t63DyKD7f+tQzTR+6Aon/BWLzHl9TnqBlECdaPWxbFm8AOFapTqR9qMXbSV5VeRn0dUs+X0LvLkdb
	RgKxOUOisZrD0uYRnjOKhpO/jnWaUWBq6z+yRq2NliFbsVkfOHYiukYshoq3kCfOOGXE3TV2r80ED
	yRgy0xepEMFv6a6syTH3wcI6XH+oUvMOK9RmIOWt0zwTUtXvlApZgcJH0172WdUB9Xy75bBtSAetb
	ktwBwzd8NIott+jNSEwLfmyrwvdvUa19Ny8oyX1PPWyAFukkcec/VxG+rCUzcWgl8dL9tbtM7MoQE
	di+NOk5ZwEDgj9ocJlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9w8-0000000HQ6E-48jY;
	Fri, 13 Jun 2025 19:19:36 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8yW-0000000HHmB-2IoV
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 18:18:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDF2A442AC;
	Fri, 13 Jun 2025 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749838678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qg85hsKDhKW6bCbwt3f6vjV/N4iDn68DcYzAFEFPqHQ=;
	b=FAWrv9eyKFU0Y+droALI/9LJ8Qbi56bSYXDfHUDLVrdoKPwj3fdw467Q0CfrmoukXC0Ar6
	Wo1htRXSFCmQxxUTYYaf6tBX36IdyPuVeQV7G0LbrWqOKHnEHHpcXBRYK8V+ARGFSo9WjU
	4p8mvUwGy6rUCKfp1EeQ8/wPyvKd+rLZZixEE6zwfLsxhN/cihBgX6CgAElGP1bqQ6eku1
	aZj3EeB98umMloEvOCnwr9Felc68Ud0oOFyd6rXyIf6qHUHO232WXqgogoBqpWmUbJXe/o
	+JKjLXZ6t7qBuFHTYC541KOPGDj4zk72zWpU8+tfip9ndVX5V79ysQ4Q0jb9yw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] mtd: spinand: winbond: Prevent unsupported frequencies on dual/quad I/O variants
Date: Fri, 13 Jun 2025 20:17:48 +0200
Message-ID: <20250613181748.1270842-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613181748.1270842-1-miquel.raynal@bootlin.com>
References: <20250613181748.1270842-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuffegveetveekgeekheelteetfffhffefgfelueelveejtdegleeguedtkeegleenucfkphepvdgrtddumegtsgdurgemvdefmegsjedvvdemrgdutdgrmeelfhgvkeemudgsiegvmeelledtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudgrmedvfeemsgejvddvmegruddtrgemlehfvgekmedusgeivgemleeltddupdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_111800_870778_9953C5AB 
X-CRM114-Status: UNSURE (   9.61  )
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

Dual and quad capable chips natively support dual and quad I/O variants
at up to 104MHz (1-2-2 and 1-4-4 operations). Reaching the maximum speed
of 166MHz is theoretically possible (while still unsupported in the
field) by adding a few more dummy cycles. Let's be accurate and clearly
state this limit.

Fixes: 1ea808b4d15b ("mtd: spinand: winbond: Update the *JW chip definitions")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 0756966b4e3c..b7a28f001a38 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -42,11 +42,11 @@ static SPINAND_OP_VARIANTS(update_cache_octal_variants,
 static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4D_4D_OP(0, 8, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 104 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_2D_2D_OP(0, 4, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_2D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 104 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
