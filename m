Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0C8C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 14:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49986218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 14:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I+zUY1HK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWucNY3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49986218A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zr+gqIjZ/q6KUjd1II9a6NvlcZ1KX/K4kZByfbB0tzo=; b=I+z
	UY1HKHwO/+0Bx9P1z2md9eYP9N1lyAqppSc/jF8MqUYDWAcuNVQfVoRIuP99NbZm6tO+MWb9FZCwg
	NS8bcDf0CwwFRVjI4GY1XK/DNWiPi3c7xlE63yp//fxNQlf7q35xXqro2V6j+Xbf9q38Db05Q/46N
	S2KK/wnH3S1LMGfazbm7LSCQvNxdKq/180eLFgb1q1/EfE+xWpMoM8SiXw04E+lrcdnHA0IgDrlQd
	RiAViTn4Nfh5vA8jUwKDxgvW+nYC/47bzLWHk0NptoHVjwwZ7Ro1nMAvG5dq+jCFo1Cj/0OovAu/b
	UIleSVkpl4XJeY5jwrARx9RJEci74yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmgHg-0006lK-BV; Thu, 24 Jan 2019 14:47:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmgHd-0006kv-H8
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 14:47:10 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46025218A2;
 Thu, 24 Jan 2019 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548341229;
 bh=iZclcKa5g26Pl2zoG6lTC0ltR2bbVGtV5aWhI6L6zFs=;
 h=From:To:Cc:Subject:Date:From;
 b=LWucNY3z94QNy2bDe7Z6agOazQykBrZEGOX7MMtG8KWMbFMZdhirTiHQoP5+YcHs4
 j1muKTvejYLNW1ZKpWF4mGw0NG7O812V2n1wiTkrO6ltoNIdeuI1NrTiRuPB5MGi2h
 UsXapy+RO61FtFOgW7qe+hc7y3agJkN0dJ5lRWIU=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: Fix the error/cleanup path in spinand_init()
Date: Thu, 24 Jan 2019 15:46:54 +0100
Message-Id: <20190124144654.27626-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_064709_629350_57E87002 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The manufacturer specific initialization has already been done when
block unlocking takes place, and if anything goes wrong during this
procedure we should call spinand_manufacturer_cleanup().

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/nand/spi/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf37da19663..fa87ae28cdfe 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1016,11 +1016,11 @@ static int spinand_init(struct spinand_device *spinand)
 	for (i = 0; i < nand->memorg.ntargets; i++) {
 		ret = spinand_select_target(spinand, i);
 		if (ret)
-			goto err_free_bufs;
+			goto err_manuf_cleanup;
 
 		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
 		if (ret)
-			goto err_free_bufs;
+			goto err_manuf_cleanup;
 	}
 
 	ret = nanddev_init(nand, &spinand_ops, THIS_MODULE);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
