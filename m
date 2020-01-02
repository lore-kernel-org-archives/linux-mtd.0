Return-Path: <SRS0=/21v=2X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC69C2D0DC
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 13:09:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D97F215A4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 13:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bRqD2hBR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Qm9Wllhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D97F215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WBaugc1Moa1mGbNV1JQfUhW1yJw4G/4dej4M4Cj19Vc=; b=bRqD2hBRr7To4q
	GnibQmEPQYxaNlin0ricHXCQ9tAohrv3BFAw4VtfrN3bUD60zCMsBGNcKuXWlhuRWH6B01sOfr+oP
	A4GJXrQfd1YSSyxFulTAzUHwhO1ScJe974V+zwcDWrQLCs6UgskPHmWkn40I6flWHRvJTKucB+9T/
	5hjSeZpjovb3VPkr0cU+XcS6+daW5cBJtFf0VCRkL3DsMeFFt1JF+d92fFjOi4f/mNDtm4P99YyG/
	1Clvd5Dq0MXkmQO0cl3CU5nmbXoWNbCX+zdLmpcS2ITeYePvcEJ4V06RyJdapFBEjnOekn/EJDfnO
	k2OT2XaZAP3KBrL8NlLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in0Dc-0007g1-HB; Thu, 02 Jan 2020 13:08:52 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in0DR-0007XA-R7
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2020 13:08:44 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id 7F05670C;
 Thu,  2 Jan 2020 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1577970498; bh=Dfa8ENalQ2mEXtcrK/dPpXS61QrbohOlp3rcs5GNL+Y=;
 h=From:To:Cc:Subject:Date;
 b=Qm9WllhlFFiSTBjIic+LmeZngoRAn9m4wdbvxPCdZzKIqdxuBINfPyY/zvNaI7o82
 EDUpekEGwIwwa27HTRy1mGMGfPJCelPVqzxeYnqjroJAvDBHtenBjoHkcsPgqzuIHg
 iQ6kiT1hN/SDUjmug6wPg/xPm/chypz923qABqaisyRbqU8VLlzXYDFPrno/waVdak
 p5BaY0mKTehVruqU2iTkANuw1xG5lo4F1hF+xFUXmOP9nSrlQAo2txsp4ps2pyNV43
 4yyM9B/ZV/YMOPX05m5K9Enh5jlLL8nEfZEnKKGQH1wiiMECIjnpi8pgcU8FmlPZ2h
 RDg2J3ZWKWpjw==
From: Esben Haabendal <esben@geanix.com>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
Date: Thu,  2 Jan 2020 14:08:25 +0100
Message-Id: <20200102130826.170647-1-esben@geanix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_050842_627809_A0EF26FC 
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
Cc: martin@geanix.com, sean@geanix.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On system resume, the gpmi clock must be enabled before accessing gpmi
block.  Without this, resume causes something like

[  661.348790] gpmi_reset_block(5cbb0f7e): module reset timeout
[  661.348889] gpmi-nand 1806000.gpmi-nand: Error setting GPMI : -110
[  661.348928] PM: dpm_run_callback(): platform_pm_resume+0x0/0x44 returns -110
[  661.348961] PM: Device 1806000.gpmi-nand failed to resume: error -110

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 334fe3130285..7ac8c8b95afc 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -148,6 +148,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	struct resources *r = &this->resources;
 	int ret;
 
+	ret = pm_runtime_get_sync(this->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
 		goto err_out;
@@ -181,6 +185,8 @@ static int gpmi_init(struct gpmi_nand_data *this)
 
 	return 0;
 err_out:
+	pm_runtime_mark_last_busy(this->dev);
+	pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
 
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
