Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5309DC71148
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLb1Niuy5rOG3Fbl6YD6gYPBQ17y1ijAmtBgHgS1MN8=; b=Go8rneOu38BT1W
	oyN2/H6wMswfuBMI9GN1xXQAenQohxSZOL5irqyfFO2MGJnje0g0aw3wa4WIJwOjLT2ozfCDQHSqd
	+qifFs5xh03TRr1P8GAqLF9dj+XmiAu4nTgDn2nshl1w55ayPdilO17CxtSB9ipml1xdf4K2ZoGr5
	JTdXUBjw9rxNxHpcZ8IZkem83GGLbysX9Ewn0TkRJZkSYDoo7oCDXAMb1TB3LJ9erdGajVcPEovlE
	GgYVELKmvvLpR8Lg9qOAtjB7q8qYVH9hWfSMWMGOWCYvo06ngBdnyzzDG4u5kXx0vaSfqcqiIjvKQ
	S7P7Mq/bKzefB6qiqDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9w8-0000000HQ66-2DF4;
	Fri, 13 Jun 2025 19:19:36 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8yV-0000000HHkN-3gJw
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 18:18:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF193442A4;
	Fri, 13 Jun 2025 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749838677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zu2HhPe64NDOF5VlWgz8G6tLY3Is6YRXvV1QblpwZPo=;
	b=EYp7KNOpPfc2FMo6vv5bSZ+3g8VMlr4k5GqF2q+kCQ8Z8h6doba1Yhtw2sQnKqhNpsbPpp
	pfQ2enFK3Y4TKERwOQC3tvY5NwbUbkLy/ETRTmO0FotzojsGVgPH+AZazSAkpE+Hrhi+7I
	oyLctctQXM5UBuAGkltm3PdnjmAVtiTwg01NCYdE/kO7Yq5cz/bSkEGJxmWHhi8hq7ffNK
	GA86aeW3SH82gfiBYDxAGxd//8gBN62tw+bvYxJTD4UwjqpQGUHuWR0S3e9tAo6tJYkO8s
	OE+B+hDIOu4qXOBqg7ln2cgYPY/Zt9LNp+b8fyrNZCh0J3JXjfbteT7elo9vVw==
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
Subject: [PATCH 2/3] mtd: spinand: winbond: Increase maximum frequency on an octal operation
Date: Fri, 13 Jun 2025 20:17:47 +0200
Message-ID: <20250613181748.1270842-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613181748.1270842-1-miquel.raynal@bootlin.com>
References: <20250613181748.1270842-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuffegveetveekgeekheelteetfffhffefgfelueelveejtdegleeguedtkeegleenucfkphepvdgrtddumegtsgdurgemvdefmegsjedvvdemrgdutdgrmeelfhgvkeemudgsiegvmeelledtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudgrmedvfeemsgejvddvmegruddtrgemlehfvgekmedusgeivgemleeltddupdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_111800_678995_E63F3DCF 
X-CRM114-Status: GOOD (  10.52  )
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

The default number of dummy cycles is 16 in octal I/O mode (1S-8S-8S),
and with this default configuration the maximum frequency is higher than
what is being advertised. There are higher and lower frequency
possibilities, which involve making changes in the number of dummy
cycles through the VCR register. At this stage, let's just describe the
default configuration correctly. There should be no functional change.

Fixes: 1ac5ff2f2ad6 ("mtd: spinand: winbond: Add octal support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 2808bbd7a16e..0756966b4e3c 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -25,7 +25,7 @@
 
 static SPINAND_OP_VARIANTS(read_cache_octal_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 2, NULL, 0, 105 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 16, NULL, 0, 86 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 16, NULL, 0, 162 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_8S_OP(0, 1, NULL, 0, 133 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
