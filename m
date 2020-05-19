Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C94C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:17:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CDF7206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IDtryJMI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fjyo3WAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CDF7206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NFRgJ4c3GWr4eHt9ww8r8rTlsXGCVp9siMs3hLOEqQ=; b=IDtryJMIPoaDM6
	01RHLnD+AB+/KW2PPR90LvtkxxV7TcTYVOYeQJM9fWQHUe4xe1ua7AuhUuhHiwCcdQrFsD6SoLydn
	zpnTa0bT756AGBwf93RZRyBp5tg8AUBFNVYdSiYXXF+3ZwAzRQ6ZFRzbdS3aSzifRDKf81w/p1979
	YhWrbWPhyDS/CRXAELy9duDCq8Seq8Iv9gWQ9VrWgOs9NmJh+b3aMEaQYp76+qTFxJTcpcYbKTpkj
	69Rq99gcEL/7SyNd6iepLX5Rua3XgaoLMagUFxLGPz8FwamBewkoZqcL4j+jgXHGsupGLTmJooQKd
	3JJE4Fk5B8jRq+DVvKLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb27r-00079C-F6; Tue, 19 May 2020 13:17:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1sV-0002kD-Jl
 for linux-mtd@bombadil.infradead.org; Tue, 19 May 2020 13:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=w7dX0eAHu2QZFVy9cHzVHBH66yZ0qTP1DanCWxs5aHw=; b=Fjyo3WAFPp83kibjN77Qs3A42d
 h8uk4WrKra1qzrvgyrFTtWy5+KcSHJeLe0gn5fQoT/3aV77yMR0HeXnE8jKJQEXozIO5YyGVFyIa0
 aKa2yZMxz2Qgg4HtXgv99vzXhlRsOPiFJ4tOcRt7/OuRc14r39g3UdrhTcEq+ztg2OYZIbaWaL0cx
 l6R9jb0D/+5uZptRMWfNeQJue+zADLsh82NcRfUnAyt7eaEwpClxlmDa+UWHyBk9KRqISYUXF7beS
 dzwo1bgmvioNb3JRp8BEfNB6heHdhgGhSBl8INNJl23mBJZih9fKRfZP872VvxSGIEqFdE095HOxe
 SrIeas5g==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1sR-0002KJ-UO
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:01:50 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3AE26FF803;
 Tue, 19 May 2020 13:01:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 40/62] mtd: rawnand: pasemi: Fix the probe error path
Date: Tue, 19 May 2020 15:00:13 +0200
Message-Id: <20200519130035.1883-41-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-1-miquel.raynal@bootlin.com>
References: <20200519130035.1883-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_140148_173912_5FE3DB9E 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand_cleanup() is supposed to be called on error after a successful
call to nand_scan() to free all NAND resources.

There is no real Fixes tag applying here as the use of nand_release()
in this driver predates by far the introduction of nand_cleanup() in
commit d44154f969a4 ("mtd: nand: Provide nand_cleanup() function to free NAND related resources")
which makes this change possible, hence pointing it as the commit to
fix for backporting purposes, even if this commit is not introducing
any bug.

Fixes: d44154f969a4 ("mtd: nand: Provide nand_cleanup() function to free NAND related resources")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/nand/raw/pasemi_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 9cfe7395172a..be40b2f32237 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -146,7 +146,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_lpc;
+		goto out_cleanup_nand;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -154,6 +154,8 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	return 0;
 
+out_cleanup:
+	nand_cleanup(chip);
  out_lpc:
 	release_region(lpcctl, 4);
  out_ior:
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
