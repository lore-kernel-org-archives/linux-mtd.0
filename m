Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E743C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 09:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1122260F3A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 09:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1122260F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3Vs8xvTowexCwjPNNE09YsO+WmiwsM1ydSgSME7QFY=; b=uAawekx4ns/LGi
	hEiJvg8A4+Ym+RNzrgcfJONV22MR+bK9g/JHv9lRxCdrZkUCu16bxidwHq2Mkis0bNGoRojPo346i
	ign+jiPf24z0bTd4XyAdfeA0fBog/DpLHZ+2zHQAU6EpUHk8Fi30iPedUxhM0IW45Lz1zZEENyAQo
	XvOdaUi7AHj4Viroqz2xs/04NXq/73SIvMjNc5CHEcD3UQO+88GRRzjTolhjGW/RmsdWr3AYD+X67
	8SA7gZ4/p2EubuuBKAUV0d37jjuMN+QZ/7cDJLgpvR+H1wa7+kWleZS7Hies+3iVWUhXrxDkS0Ui0
	ogM80tgIlVXn3Bvq4LaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maDg9-00C8Mv-Sq; Tue, 12 Oct 2021 09:02:33 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maDg7-00C8MY-FF
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 09:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1634029344; x=1636621344;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EF1Vx9+OooQXhizKAvLnwpadXls2ylsMEMS8sUMTxXc=;
 b=FFCajlSLnfxacfjPxK/gWONgiJ2j4RrpsdELWivvnwbcjYFIs3aGcqtN+dQbLrRT
 ZK+23xFYm0ot7wyQ9DtpDLxjV6Qrf2siMepATHktBykYPg44llBzrEP+Lsqjpm+s
 RgW/uxSkvuf/LyMvKEK75J9v/nzUNonxnLTjjheC82Q=;
X-AuditID: c39127d2-c63ec70000001d24-cd-61654f20371e
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 5E.24.07460.02F45616;
 Tue, 12 Oct 2021 11:02:24 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021101211022427-1874426 ;
 Tue, 12 Oct 2021 11:02:24 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Eggers <ceggers@arri.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Greg Ungerer <gerg@kernel.org>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Christian Hemp <C.Hemp@phytec.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 1/2] mtd: rawnand: gpmi: Remove explicit default gpmi
 clock setting for i.MX6
Date: Tue, 12 Oct 2021 11:02:23 +0200
Message-Id: <20211012090224.4101984-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011084607.27a840e0@xps13>
References: <20211011084607.27a840e0@xps13>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 12.10.2021 11:02:24,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.10.2021 11:02:24
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRoCBS1fBPzXRoO+wgcXqlumMFo291xkt
 drzawmix8EcDs8XupmXsFqcaW1ksDrfvY7X4u30TiwOHx9qP91k9jq3ZzOoxb021x6ZVnWwe
 m5fUe2x8t4PJo/+vQQB7FJdNSmpOZllqkb5dAlfG/+bdrAUP2SsmXn/P1sC4jq2LkZNDQsBE
 ou/aCyYQW0hgG6PEovc5XYxcQPYFRonFM3aDFbEJGEksmNbIBJIQEVjLKLHsTDeYwyzwl1Gi
 v38FM0iVsECixOszs8BGsQioSjy+uRkszitgJ/F4xUxWiHXyEjMvfWfvYuTg4BTQkZhxXRxi
 s7bEvb+HmCDKBSVOznzCAlF+hVHi3B5pCFtI4vTis2AjmYHqly18zTyBUWAWkpZZSFILGJlW
 MQrlZiZnpxZlZusVZFSWpCbrpaRuYgSG+OGJ6pd2MPbN8TjEyMTBeIhRgoNZSYT3j01qohBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXHe+z1MiUIC6YklqdmpqQWpRTBZJg5OqQbGlh3Xp6Re35lo
 ZvBwUb7F5zQpx0cnEz+fYAsP/bo0/ILYhHv7Tr578tnCXPqfbIrXHl4tp8h5jy6fL+1R2sq0
 0MA7ba6AnN/27SoGlhNuhZ6+sM9p4990N/6ElKWPZW12vHmydu2Tv/ULGdYvEK87Enjm5t/0
 pdcLXioJmC2TXTff4VuG5YmH35VYijMSDbWYi4oTAehY+aJfAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_020231_858027_F7CFD4AC 
X-CRM114-Status: GOOD (  11.97  )
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

There is no need to explicitly set the default gpmi clock rate during
boot for the i.MX 6 since this is done during nand_detect anyway.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4d08e4ab5c1b..a1f7000f033e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1034,15 +1034,6 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 		r->clock[i] = clk;
 	}
 
-	if (GPMI_IS_MX6(this))
-		/*
-		 * Set the default value for the gpmi clock.
-		 *
-		 * If you want to use the ONFI nand which is in the
-		 * Synchronous Mode, you should change the clock as you need.
-		 */
-		clk_set_rate(r->clock[0], 22000000);
-
 	return 0;
 
 err_clock:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
