Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ED0C5472E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSE+i2mJ9ddsoQ2jOzan13FvEuwXMjWApmeFsuISu20=; b=mT5VgbN9M4rdGg
	RrPW3Px7wAycpa+vQjhPrMBQhHwtW1xjRlAr1YMhJsADBIAtYbu9j0krA62uk4Oyv6CBRzUF4MNn5
	sCB1DZ/nB9u8gRXR5b54AUOKkWCXcSiQyh+JqNahkblqg0DDk5xQRpXYNXSCZgche+5Tyiko0lTIx
	2i5p1M6Xetwv9DiNuxU9lmg2phQ3fnAXzirPYwlo+zKb6g51GhDAthSiEAACWJgqdOZKmmgv/Oi8T
	it+SXIE6fKAF2HpBzmC80J0K2HILWBg37MIC+kZN/PY4LkK+iZfQ3DLLDaQ8LBlDo1/FcJxeip53k
	ptDx+c/ZRjBLPfc/IYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMt-00000006lnM-3aft;
	Mon, 26 Aug 2024 09:50:35 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ0-00000006kT1-3ShP
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D13C3C0009;
	Mon, 26 Aug 2024 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4Q0/2jgc6LZIODwosP5WDugdKaSA0UY1CaE5Fcrrz4=;
	b=DiUNd4c9FB+H2Zx83vRytN2l+t6Xb5ZCxCjyWto5ln92x5sIrlqej+y/IBKQBjZoYlWzAB
	xSnoctbDTYLV+yJF8PRZewB6GQllT8RGyrHTA5dv3YhpNvg+OG/Scbu6oX1gCZ8X21/pnk
	tRWWPEEi42M5xAMHxAj5RK9DgYYmVjuJzZsHwW/Y4Jtr4nITKZ7Vp0NA3SUSli2tP8qTiC
	zNml9yMNCDbmCXK4bsQVNqZyftiC5UbXhLu4pNzTE4JC83PCcK7+Axjf88ln/kgScSMu7i
	lInRbEl9qoRUftb7pI0mCQKiZAIcqoO+pagnXIP8YLu2v1UbUrn3FTy4YiD1Yg==
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
Subject: [PATCH mtd-utils 02/10] nand-utils: nanddump: Explicitely use the page size when relevant
Date: Mon, 26 Aug 2024 11:46:21 +0200
Message-ID: <20240826094629.19065-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024635_039831_C8CF83E9 
X-CRM114-Status: GOOD (  11.08  )
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

Using bs when skipping the bad sector is abusive as what we want is
using the size of a block and the size of a page. The fact that bs
currently is the size of a page is misleading here, has I intend to make
this amount grow.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 nand-utils/nanddump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 346af1e..a3e6e92 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -458,7 +458,7 @@ int main(int argc, char * const argv[])
 			/* skip bad block, increase end_addr */
 			if (bb_method == skipbad) {
 				end_addr += mtd.eb_size;
-				ofs += mtd.eb_size - bs;
+				ofs += mtd.eb_size - mtd.min_io_size;
 				if (end_addr > mtd.size)
 					end_addr = mtd.size;
 				continue;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
