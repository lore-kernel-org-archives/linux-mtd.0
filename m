Return-Path: <SRS0=UES7=CM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E9EC433E7
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 03:43:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F562072A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 03:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="epwZnAuw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="1r0dvYdK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F562072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6U0z5Oc3d46QswOQmpQwjKSCajgPEUmAeD82u2yhL0M=; b=epwZnAuwuBM80jDJAFSkBEXhK4
	3j6MvWp9V+XfzZ7flfIdib9RvT42LIqUjzGF1h9jHfeuqAbZOOz+smnZnupKS0YM/rBqU2qfjkS4h
	zo2vxSp1Lz7LGLHbJZcgli7NM9wnSZdoIdipeVIpQieck0p/F+qIaVRiZ+7Ndu8zBLJomPR+3KhiK
	kL63FV9GMhSFXn+CyD1LSVrrH3/cwMUMh/1KrSNWTyGfFCvdUC3d/wphBjGFj2xSUvgFQcRSBSEvt
	JXliy1O/+hqRu1xifjjhBCo7JCh0fvInY36mKEDAfrtB6Nj+qs4kqP07/Mryoeb3Ja68XgsQgDNx8
	jC9A9Huw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDg97-0008AX-Vu; Thu, 03 Sep 2020 03:42:46 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDg93-00086w-MP
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2020 03:42:43 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B3863806B5;
 Thu,  3 Sep 2020 15:42:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1599104548;
 bh=JJ90luUH5F1pyN8w8r/5anGwlRHYrTL09INJPGDcfPA=;
 h=From:To:Cc:Subject:Date;
 b=1r0dvYdKPEg7ykHctSM4yi4FNI21DMauJkwAQWios3vBodFazE47tLeCF9pxU/edH
 uk+yqZ+OeUk1TbShcOxMsIeKyz1sFrQbfwoGE5Fm/kaZWK3tuW7SgPzy2Hhayo9Sv5
 8qS/iZafRTOEFoIGFsu7m+VbcChzYpqtqT0U7ADTgwR6wpbu7MYJEGR+pLHNtt4Jdq
 OJw35V6M4TzcdBgWRmbeTfuL6ozhPtTU4PJjrOumnxpfjf0t0yhzLq1CFdTC6AGu8O
 gXcweQDK1FKPHI49ct8enW/5VV898cM8N+bv5PXUWfOeFGERiYct/5a5UlnneysBxu
 ra6V8CM0Q6WUQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5f5066240000>; Thu, 03 Sep 2020 15:42:28 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
 by smtp (Postfix) with ESMTP id B14C513EEB7;
 Thu,  3 Sep 2020 15:42:27 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
 id 7C46833EDFD; Thu,  3 Sep 2020 15:42:28 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: mtdoops: Don't write panic data twice
Date: Thu,  3 Sep 2020 15:42:17 +1200
Message-Id: <20200903034217.23079-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_234242_366035_ECF96751 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If calling mtdoops_write, don't also schedule work to be done later.

Although this appears to not be causing an issue, possibly because the
scheduled work will never get done, it is confusing.

Fixes: 016c1291ce70 ("mtd: mtdoops: do not use mtd->panic_write directly")
Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/mtd/mtdoops.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 4ced68be7ed7..774970bfcf85 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -279,12 +279,13 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 	kmsg_dump_get_buffer(dumper, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
 			     record_size - MTDOOPS_HEADER_SIZE, NULL);
 
-	/* Panics must be written immediately */
-	if (reason != KMSG_DUMP_OOPS)
+	if (reason != KMSG_DUMP_OOPS) {
+		/* Panics must be written immediately */
 		mtdoops_write(cxt, 1);
-
-	/* For other cases, schedule work to write it "nicely" */
-	schedule_work(&cxt->work_write);
+	} else {
+		/* For other cases, schedule work to write it "nicely" */
+		schedule_work(&cxt->work_write);
+	}
 }
 
 static void mtdoops_notify_add(struct mtd_info *mtd)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
