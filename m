Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4D9C33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A424E2082F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pl6RqU0B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="F/zPL3CM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A424E2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oluEDYX8Sz94koH3VuHorjZ8nJf0xN6VGFpUdZOySw=; b=pl6RqU0BcvaX4/
	4It046Jw8PN6vN9yr7RYfaoS9x4S8azV6vafAvb4IcvJD0FJcX0ekQKVKxUnOhBXG8jqe/n4npSc+
	pk1Uhfn7XDjUucPO+U/D7Rczbx7VMTyREE3x57FT9c4sE5z81nzjfgSYyLfVCFthoJUTCnifFrU7y
	WmTh7h5BXtcc46EZQLDPZ2xAd7YUbigeONCkM3Qvop84p/6xFVpciFGewVFSFw6j+VXIZXkdqtruj
	Ikl82KOPyvEZVgeYg1Ao3hYLtbXp8ksjUbRf5NDF19NjccT0D4Fq4Gd/94Nr9Gkx5xn4yJCUqv/A1
	ib7TmqZRKdWN+6XWI4nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isXsO-0001pg-Dt; Fri, 17 Jan 2020 20:05:52 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isXsG-0001oM-Uq
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 20:05:50 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id A1778AB85D;
 Fri, 17 Jan 2020 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1579291490; bh=1GLtPwg7JdswZinMsh5MjBCQQjQEWaf+P1IDgjM0YLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=F/zPL3CMRnimda2fRV7CLQo6cnt6b/EeyJScsHMKxMi6hiSmzoNjEQzZu4D8Aw81h
 XuCEvmb/mB1TBLrzNW0xKmeXHiMLEul1oGM+sYoXVKm1RS8a7WO6F6GqdlnBv8jGM3
 2uqEEXfmYtAc6DoZXuQT1a1GbQ+3Lzo+2LrggUl16T4T0pGWkGRp4wZOKQk03q1R6s
 kqVHCIMc+l8X1p8W/emJqkd+dMTWgAA9UEiM/hCamv91v3t6SxcaYciAbYzlQyGAHm
 NS4MhpkvCijYCHhkYaJxrIpdVDQQzkUxJDQ1OZhzk+5J0Ls/1Qd14dicBj/ZkI0F6K
 YaJofEoxrUr9A==
From: Esben Haabendal <esben@geanix.com>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
Date: Fri, 17 Jan 2020 21:05:36 +0100
Message-Id: <20200117200537.9279-2-esben@geanix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117200537.9279-1-esben@geanix.com>
References: <20200117200537.9279-1-esben@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_120546_009416_11BBA785 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, stable@vger.kernel.org
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

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 334fe3130285..879df8402446 100644
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
@@ -179,8 +183,9 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	 */
 	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
-	return 0;
 err_out:
+	pm_runtime_mark_last_busy(this->dev);
+	pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
 
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
