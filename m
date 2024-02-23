Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307E9C48BC4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HH/HXBA3T47jzn8CCjzZVxXtRRUwug/zuIfTvF8Pp78=; b=rJIM+JJN3hwtLl
	iLWXcOm8PfuOsmGcd4R7prHKptbygEBUPJYUusMxb0nGntfPxMwA7iNRTc42R9CGA0cYNDDHf8EST
	9oeJ283z0oo5Q5dr9vWD0CxVS/sc06QVj/zyhOGuYuF4bLLoLVgWs36IVsvchsX+1PW/EHeP0RYJZ
	Gpl1u60d5LJEZL2AbWmm2MGYe2UqHSWyVYtW42PkJD/x28yE9NKY0Fy7S30+KQHv6SqW/08OVGqT1
	7S6a2ILabED5sQ4xFOAPuzziN5aCWLASROzOXVwdtE5vwkt8kMnQzCp+WyG89yO9Bsb4Dr0+a2sWe
	j5hr4Zzvu85rToQXSurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMcg-00000007lGx-3ep9;
	Fri, 23 Feb 2024 03:53:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYG-00000007jfV-18CO;
	Fri, 23 Feb 2024 03:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f7OrPXkA9h5wUvIzBLPC8L+hyLvLOPdYeBxH789kQv0=; b=qRLkZCRgw/XBMu8M/A2Ykojhmh
	BnSfGB8+4l+hafmgAzk7jB0MiM+uEPHN0la4Ahw7yu3olV6S9y/4qxVfCF5IECPnPV+UTY4n09tmg
	PBIi1/dY76GqbcKbBgoH+U93UDUojqisj9+rGve86oslqEM6PM5H2Wu0eOxKhoN0XRBOxIiY/n3eu
	higZPSCWn6+tHzu0PSC85ffFq6vYQDfBLStZxkF20eD8QMaxiViLaMhTv5X+tb41KhlBddBZx7Wte
	jyQR7qDjf00M77rBwuqj+TYH2GupEU4hNbgTXN0U0iu5zCGuG1lF1oh5OPcVvMf3baJ0qsP4M7iTa
	6BPwnkCg==;
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYD-00000005dkY-1BJz;
	Fri, 23 Feb 2024 03:48:43 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 99370C0000FB;
	Thu, 22 Feb 2024 19:48:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 99370C0000FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660114;
	bh=wKBvVMc60Fe2dxQpvxpi677VlKI114pZ3dAsj88tuns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AhT4oVyZgKRKY7Nnq2vDCMrwhgFNocShT5rPsyPDWdtvaFG1LiYUuXSPfe+vTDwsI
	 vY0jPY29IlLy+Kfinlw69gTmNR9eR5R4HaxmxOwiO0+8GvulZgblNc084VWDz0l7k5
	 KRcpTG0OOzNdkLuNI0jVVuHnFsuZq7G0SeS/eIdc=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EDB2618041CAC4;
	Thu, 22 Feb 2024 19:48:32 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	David Regan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v6 13/13] mtd: rawnand: brcmnand: Support write protection setting from dts
Date: Thu, 22 Feb 2024 19:47:58 -0800
Message-Id: <20240223034758.13753-14-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_034841_453888_70616468 
X-CRM114-Status: GOOD (  12.98  )
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

The write protection feature is controlled by the module parameter wp_on
with default set to enabled. But not all the board use this feature
especially in BCMBCA broadband board. And module parameter is not
sufficient as different board can have different option.  Add a device
tree property and allow this feature to be configured through the board
dts on per board basis.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4:
- Use the new brcm,wp-not-connected property based on the dts binding
change

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e8ffc283b365..4810345d0d8a 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3223,6 +3223,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	/* Disable XOR addressing */
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
 
+	/* Check if the board connects the WP pin */
+	if (of_property_read_bool(dn, "brcm,wp-not-connected"))
+		wp_on = 0;
+
 	if (ctrl->features & BRCMNAND_HAS_WP) {
 		/* Permanently disable write protection */
 		if (wp_on == 2)
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
