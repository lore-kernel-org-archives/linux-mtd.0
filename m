Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62050C7115B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWHei+EetbsY+BFJcSOXKP0tCgaqvA2KaOe6g0bwQoo=; b=27B5J79hI4b+NP
	7O8crKFg1ocPumLWgIKOJaIIuufAKli5+PJqTxGFZATWwPrv0qFROx2OZoMQ7jpbkgcUXg/5PxfQz
	Yvu760npvgXDTd3lnvJQpSA+tKD3Xde0QpiFPI69NufjJteKKDrph8UAL/zFzVjlBWYwbO+jjP0fw
	mf5LnkYIl6lAzWKRDNuNAW5pNiKqrgIVX7fx0tRCz6FSooEvPV8NqtTvnoKz40OF4RngPe6WpfEfa
	DWHEopWFYyI/epQMvdJ2QQfTKcK5J2JkJc0DyyOXtmEKT6XZkWvsHv3/kXusYAyomNUygfgEj1Dv9
	mlvdfLst5aQcEC8BgxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqY-0000000AIUo-3ZBd;
	Wed, 18 Jun 2025 13:28:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhf-0000000A5Sc-2KZ4
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R6qXVseOPPuJ5E0CAH3U5o7t96lRH1dBWVZmLZ3LD0Y=; b=eg/F8lW4xjxquocSeGzd53x2CD
	XDc0FwOxQDp26AJXCh88k0BAnq+sdG8M8KpR1ILdORnKRrKNI41SVwzg5P9cA+dcZXegkVunc5fag
	2Hko0hoOtVobYLJmW6mJd8CdfHX+mz++JBbDWZTQqZYMAriBqRHYVSgx3dsXKHQaNXwBal8LRwrNI
	/kGT494tT4Mxj4RMY/mzPhVTxKvYCVQYzFJQEi9dsyt8m4ya27HtXwjY7iSWfwon3dXEgteWzp5ec
	XaVZTdPdvh8FQAalX8bnphjHbysYQqXOEcMYZDb/ef0mlGyez9K5YMHoC1greO4t5UwBk0ULpl69W
	avyFkVAQ==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhb-000000041gD-1Rrt
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6EC843858;
	Wed, 18 Jun 2025 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750248937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6qXVseOPPuJ5E0CAH3U5o7t96lRH1dBWVZmLZ3LD0Y=;
	b=e4ShVLLheA+3eQsj1pu9FXUneKRHpSXBeZ5oAVfS7gbfSQtf+/jZkmgl2uvbkzCwy8npyi
	fV/sUpMRCwPZEeAscsCc3OstMGw64Qb2MvtP8861XnaINA9Jf+83sIZLqvn3331Bw8QZCi
	gYOgZ/gyzOUgjKiWeW9tyIKubZA2Do8eDtamT1VpyP2m18bMN5ONhDCC2cYd4+z4W1p31n
	DoyH6DTy8uuPT6bWvQZrHphxjTVsYtXiGt2ZwbhTdDj+Igm1kXMoj/DWCJUXFPJECHSHlh
	MXqvdVNEErMh6UsaJpOodESBgseDXS5mSL9W51lyVmcBjCGx9Dcyo+YDXvIZ5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Jun 2025 14:14:20 +0200
Subject: [PATCH 3/8] mtd: spinand: Fix macro alignment
MIME-Version: 1.0
Message-Id: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-3-513202126013@bootlin.com>
References: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
In-Reply-To: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yogesh S <yogeshs@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeihohhgvghshhhssehtihdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtp
 hhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuffvnfhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_131539_551120_65DA96E4 
X-CRM114-Status: UNSURE (   8.11  )
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

No functional change, just a style fix to align with the other
macros all around.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 15eaa09da998cec3f4999ca805f7bfb6b881a5f7..28a013f4f4f38881bb9f762f2a8ca1e788d400a8 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -71,9 +71,9 @@
 
 #define SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
-			 SPI_MEM_OP_ADDR(2, addr, 1),			\
-			 SPI_MEM_OP_DUMMY(ndummy, 1),			\
-			 SPI_MEM_OP_DATA_IN(len, buf, 1))
+		   SPI_MEM_OP_ADDR(2, addr, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
 #define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
