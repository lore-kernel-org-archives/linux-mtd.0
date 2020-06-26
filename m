Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBBDC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:49:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F462080C
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WzDU6KNh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JO+3YWcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F462080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NG787wspyKIOV2H8V3bmyedg9H91UE/fpb2M+V8shmw=; b=WzDU6KNhSfPxeONot7CWBALdER
	ZjtrBMAAlLOFGOVEB20scTdwQhdNy+nXsqvS6cXjf18hZca/5nDkEr5Ap2gUbnX484lX0GLgVhosW
	j/EYnWDstGkeyfN5j8vvpf2mKPxsy9hjuXQTeejJqWE/q3OD/q6E2DT2Suk8TZGIpWcPOtRANwDa+
	g8S3IcH5XHLd4fnPo/nMifkoGnjekdI6DctQW+RbRjfO6CjB3fOPpf6TEu2frFlQrDK9SN5rQ2wWk
	h/KBqBryFbLDOX6q4Wv6uaj3FMA3GFb7vmEXzlLdJ/1FQd/ii8I4Bjp/0034KXqkhhjah03blk7Cl
	nofGtzrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomq8-0004PG-1T; Fri, 26 Jun 2020 11:48:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolNM-0000z2-Ey
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=5MdcPGn1c/q6nOIQpmnZIWCqiLGnx28BmTMjQnup4vQ=; b=JO+3YWcUdW5AsIa8MB9ZrrjCnm
 g3qqcBtNiv8f7CYCGMP/050N1WqlDcL/vK7onwaI1RY5HG7su6xVfbmbpGAlJCUg1VTRJZ6go0VtM
 cG3LfQoR3JQmhidxUhQpMRVuHoYNBIYs3OtS36wXxbQ34DZbdGnWE5SJx/CxbRzDeL1snR5SGzu1s
 FYuZPV1wVsIrBTQNBPvBthJH96a8Fsio0wQhCGhzOUA9qple8iXp02NRiwGSNvRiFDCOD0G2BBYx5
 Y/WDhWvjhwQoo31gI+edvp1tzLfOBgdfdiC4slnXchBeO1Iiiiv2NmgPqotbQkZxVaY/WG/W8o4IW
 XDWevFDA==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joiGw-0001nV-74
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 06:55:40 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0F72020000C;
 Fri, 26 Jun 2020 06:55:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: xway: Fix build issue
Date: Fri, 26 Jun 2020 08:55:11 +0200
Message-Id: <20200626065511.16424-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_075538_355924_D7BE9AC4 
X-CRM114-Status: GOOD (  11.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This MIPS driver does not support COMPILE_TEST yet and failed to build
under my radar.

Replace 'mtd' chich is not defined in the scope of xway_nand_remove()
by nand_to_mtd(chip). The mistake has been added in the long series
dropping nand_release().

Tested with a 7.3.0 MIPS GCC toolchain built with Buildroot.

Fixes: 9fdd78f7bcda ("mtd: rawnand: xway: Stop using nand_release()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 94bfba994326..29255476afdb 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -224,7 +224,7 @@ static int xway_nand_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
-	ret = mtd_device_unregister(mtd);
+	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
