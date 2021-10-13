Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16093C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 11:26:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 874C660527
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 11:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 874C660527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NotXD7B2hKS2q1WVP/8XJQubYvLczOxRUwC31EA+4EM=; b=imwRogo8tMQ8GP
	T88YqLV84arJw2QHJwpRO5w7Gtj6Ef+0LiTDUJoD8treH+m5w42ji+nVGU3y6zVxg9PgH0KTQVZva
	KQsh0VN5rp50GBMWyM3L5x/3zwVDZLCOni7S8GikNZJiKz1EPlMJHJL5uXUJ8CtgWY9v0Qh8/Jtem
	W1wlGjSLUOqsveAz3BMc5H0PvbEDBCX8pghKRQ2w4aisZE5ya1CptnhMEVxHONZDLO+Xpf83l/9ow
	iuBtKNXIsBgZmHJPqX3dxPSThkRv/H3eOfXEsY8DAAElaOi10jIITkp+sMOjto2IoOY1rQRa5vbLx
	uvR98ZYUMggg+yz2hsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1macOd-00GIdU-1u; Wed, 13 Oct 2021 11:26:07 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mabBF-00Fu4C-LH
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 10:08:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F02212000B;
 Wed, 13 Oct 2021 10:08:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: david.oberhollenzer@sigma-star.at
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils] mtd-tests: Read and write pages during speed tests
Date: Wed, 13 Oct 2021 12:08:07 +0200
Message-Id: <20211013100807.306920-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_030813_891683_371E3D5C 
X-CRM114-Status: GOOD (  12.31  )
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

The speed test does reads and writes of different sizes:
- eraseblock
- page
- two pages

At least this is the theory because, as opposed to the legacy kernel
module doing the same measurement, the userspace tool uses the subpage
size (hence accessing the same page 4, 8 or 16 times depending on the
subpage setting). Of course if the controller does not support subpages,
this issue is not visible.

Use mtd.min_io_size instead for non-NOR devices in order to get the
right bandwidth (at least one that fits the logs).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 0058269..2fc70a1 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -343,7 +343,7 @@ int main(int argc, char **argv)
 		puts("not NAND flash, assume page size is 512 bytes.");
 		pgsize = 512;
 	} else {
-		pgsize = mtd.subpage_size;
+		pgsize = mtd.min_io_size;
 	}
 
 	pgcnt = mtd.eb_size / pgsize;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
