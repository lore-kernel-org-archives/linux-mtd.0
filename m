Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62D5C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 04:57:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981DF2072D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 04:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOZRfZL0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981DF2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUjN/siVWb3G9k2o0m6taL3TVI9YethfIWlgYa41YwI=; b=rOZRfZL0IaJ+8iVCoBqcyyufn
	avXwJEMji4QatryiIyEWvx1swRGfBeZPF/eBzzGGWL//TxPdSXlrrhDip/8RlBCSp5vnYlTtpUVYn
	VWO38NDdz+hIcsTYRHVUMF5mtL/05WALEPqr/bPGyF3qrdVNEn2vE6mnovs5s2DekR/DyMrYmpPrb
	cU20+0al5T2702dIiqJkTL+oqyRoR8eTpVtrdTHsjtv7pPq3Lbj8NR2BXsTUfRWGauPkXiMpOMcgh
	hMImKeSKK48PaaOn324R6meGmlZaR+zkEx90DBVmCNCeKw35mgn100N5TOxJ8/WD9wVeRWg6Gsq6J
	maeHORDkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAR1F-0003fC-VY; Tue, 25 Aug 2020 04:57:14 +0000
Received: from smtprelay0233.hostedemail.com ([216.40.44.233]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAR1D-0003e5-A9
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2020 04:57:12 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 7D2D418224D86;
 Tue, 25 Aug 2020 04:57:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: offer77_2f11fd827059
X-Filterd-Recvd-Size: 1989
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Aug 2020 04:57:09 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/29] mtd: Avoid comma separated statements
Date: Mon, 24 Aug 2020 21:56:12 -0700
Message-Id: <ae92f4c0507c470d9461886410dc7030192f9014.1598331149.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_005711_438312_2101300F 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mtd/devices/lart.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 56f50d27b7fd..aecd441e4183 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -436,7 +436,10 @@ static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retle
 	 {
 		int gap = BUSWIDTH - (from & (BUSWIDTH - 1));
 
-		while (len && gap--) *buf++ = read8 (from++), len--;
+		while (len && gap--) {
+			*buf++ = read8 (from++);
+			len--;
+		}
 	 }
 
    /* now we read dwords until we reach a non-dword boundary */
@@ -518,7 +521,10 @@ static int flash_write (struct mtd_info *mtd,loff_t to,size_t len,size_t *retlen
 		i = n = 0;
 
 		while (gap--) tmp[i++] = 0xFF;
-		while (len && i < BUSWIDTH) tmp[i++] = buf[n++], len--;
+		while (len && i < BUSWIDTH) {
+			tmp[i++] = buf[n++];
+			len--;
+		}
 		while (i < BUSWIDTH) tmp[i++] = 0xFF;
 
 		if (!write_dword (aligned,*((__u32 *) tmp))) return (-EIO);
-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
