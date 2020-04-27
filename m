Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9146C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71AB1214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HkM0DYHE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="JfNK8pjb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71AB1214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eaZCSKFArAzFNI7oLYfYHSUfiRHHIMRIjWCX4KONPo=; b=HkM0DYHEI8RA5w
	cRjSZWKUPWCUgKbOxWatrzZy+92YVYPi0lHpCEOOIqPgS5uQBjO15GR79ZZDSlEAR9kDDRGcwYzP9
	/qFs2CfTfjCfFaKaP3FLClc710DmPoYBHpO8cCWHVOOFwJ13PzdWE1+YCwCYIA4otQg1fJd+YyPd9
	t5eVERluYrwjezN2Geob1dD6haNWsRLs8HIIl6ga7iYLCGKfuUP2frEbqLSFlQgVE4f+I0KKIV2DS
	IY1T/ADMhjcvKyuw0IODOsngwS+Eop6ciPxqhV01QFTwvRkE2yRv16tIKPOqsaLs9t0dNYZ6WLmnH
	mxLB0MAe6oRpF9XYV57w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8zk-0004Iv-Jx; Mon, 27 Apr 2020 19:00:44 +0000
Received: from gateway24.websitewelcome.com ([192.185.51.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8zC-0001yN-FY
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:00:12 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id 4B60D129118
 for <linux-mtd@lists.infradead.org>;
 Mon, 27 Apr 2020 14:00:08 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id T8zAj8gzHSl8qT8zAjYEDI; Mon, 27 Apr 2020 14:00:08 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LDbKFNJfmPWOJIgfBqIvSGHMQbRoOTKIi2anasyc6tw=; b=JfNK8pjbssL3lNb0vv9UdYv9v
 hiX8dXffE8UhzXW2S2HU7Qs41TIDKP2ZdViBxYZ73yauclJZaFfSLtefSRGsOLK1zTZkDGzzYMcJ8
 m6liiH5yHzmCEoA+jqd4ZbT3cV5ZN0qJ3oa/I43/3g+OOzpNgMRr2muwA+IfXup5tZVQDm4jvRLnQ
 /5yrvszHQx2BtTq5HjjVUIVwEoPvXU/22jA9pts+v+bW1QgsqTurKzV28Vr21keQAGrhfjzptG5e6
 yqLH0UEk2TVb3FdOy4BAnVQ/Gi/+g86JLJfLWnZL+k19qvfE8mS0/2wtCywL1ZezOQcEjWzD8Vsjg
 KsdzFk7BQ==;
Received: from [201.162.241.110] (port=3231 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jT8z9-000anI-Lu; Mon, 27 Apr 2020 14:00:07 -0500
Date: Mon, 27 Apr 2020 14:04:25 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mtd: lpddr: Move function print_drs_error to lpddr_cmds.c
Message-ID: <5cc0d2e83e971693d974235608c8d96fe94c849d.1588013366.git.gustavo@embeddedor.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1588013366.git.gustavo@embeddedor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.241.110
X-Source-L: No
X-Exim-ID: 1jT8z9-000anI-Lu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.241.110]:3231
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_120010_658501_1E942809 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Function print_drs_error is only used in drivers/mtd/lpddr/lpddr_cmds.c
so, better to move it there.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/mtd/pfow.h       | 32 --------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index fb1cbc9a2870..2675032984f9 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -94,6 +94,39 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 }
 EXPORT_SYMBOL(lpddr_cmdset);
 
+static inline void print_drs_error(unsigned int dsr)
+{
+	int prog_status = (dsr & DSR_RPS) >> 8;
+
+	if (!(dsr & DSR_AVAILABLE))
+		pr_notice("DSR.15: (0) Device not Available\n");
+	if ((prog_status & 0x03) == 0x03)
+		pr_notice("DSR.9,8: (11) Attempt to program invalid "
+						"half with 41h command\n");
+	else if (prog_status & 0x02)
+		pr_notice("DSR.9,8: (10) Object Mode Program attempt "
+					"in region with Control Mode data\n");
+	else if (prog_status &  0x01)
+		pr_notice("DSR.9,8: (01) Program attempt in region "
+						"with Object Mode data\n");
+	if (!(dsr & DSR_READY_STATUS))
+		pr_notice("DSR.7: (0) Device is Busy\n");
+	if (dsr & DSR_ESS)
+		pr_notice("DSR.6: (1) Erase Suspended\n");
+	if (dsr & DSR_ERASE_STATUS)
+		pr_notice("DSR.5: (1) Erase/Blank check error\n");
+	if (dsr & DSR_PROGRAM_STATUS)
+		pr_notice("DSR.4: (1) Program Error\n");
+	if (dsr & DSR_VPPS)
+		pr_notice("DSR.3: (1) Vpp low detect, operation "
+					"aborted\n");
+	if (dsr & DSR_PSS)
+		pr_notice("DSR.2: (1) Program suspended\n");
+	if (dsr & DSR_DPS)
+		pr_notice("DSR.1: (1) Aborted Erase/Program attempt "
+					"on locked block\n");
+}
+
 static int wait_for_ready(struct map_info *map, struct flchip *chip,
 		unsigned int chip_op_time)
 {
diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
index b1fe2bbfdb04..7b57c36878cc 100644
--- a/include/linux/mtd/pfow.h
+++ b/include/linux/mtd/pfow.h
@@ -122,36 +122,4 @@ static inline void send_pfow_command(struct map_info *map,
 			map->pfow_base + PFOW_COMMAND_EXECUTE);
 }
 
-static inline void print_drs_error(unsigned dsr)
-{
-	int prog_status = (dsr & DSR_RPS) >> 8;
-
-	if (!(dsr & DSR_AVAILABLE))
-		pr_notice("DSR.15: (0) Device not Available\n");
-	if ((prog_status & 0x03) == 0x03)
-		pr_notice("DSR.9,8: (11) Attempt to program invalid "
-						"half with 41h command\n");
-	else if (prog_status & 0x02)
-		pr_notice("DSR.9,8: (10) Object Mode Program attempt "
-					"in region with Control Mode data\n");
-	else if (prog_status &  0x01)
-		pr_notice("DSR.9,8: (01) Program attempt in region "
-						"with Object Mode data\n");
-	if (!(dsr & DSR_READY_STATUS))
-		pr_notice("DSR.7: (0) Device is Busy\n");
-	if (dsr & DSR_ESS)
-		pr_notice("DSR.6: (1) Erase Suspended\n");
-	if (dsr & DSR_ERASE_STATUS)
-		pr_notice("DSR.5: (1) Erase/Blank check error\n");
-	if (dsr & DSR_PROGRAM_STATUS)
-		pr_notice("DSR.4: (1) Program Error\n");
-	if (dsr & DSR_VPPS)
-		pr_notice("DSR.3: (1) Vpp low detect, operation "
-					"aborted\n");
-	if (dsr & DSR_PSS)
-		pr_notice("DSR.2: (1) Program suspended\n");
-	if (dsr & DSR_DPS)
-		pr_notice("DSR.1: (1) Aborted Erase/Program attempt "
-					"on locked block\n");
-}
 #endif /* __LINUX_MTD_PFOW_H */
-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
