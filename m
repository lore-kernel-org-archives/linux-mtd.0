Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2035C48291
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDXtyo6g6+HXhGvNgOeVcMTeFDqNGMu5JtVMB/Kyrjw=; b=ohMNWC0kzIf5j7
	oMmeWrOHinhIh7aKfECsUPg+FxG9ZfYg16xsNxUr5prhZfsrIcN0HMOaf13NYf+vDHk0+uk7j5oYR
	7QyXWNwCgZZ0zCWyJyQehInE1k02+X0DK1MMx3cjBNslqleY0mnJFTBvq2uWOhSeMqi1sqLcWtRcC
	//XPJubF8cK5kJ0Sezzr3kt/jm1M5BGKqnBuJjPPOT9thRhjaLfd7cFCx+ocvn5T0+p9iR0+KCuCj
	FQbK83IT7jV72XoatT8U2qa1EkHJiFiSab22tx2JCBgLoqhRhZ/pb0rsuu2pDnri3WvEdmzgiZ5rt
	bSpF2/qEtiyIoKZlFC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW8tK-0000000FTFM-09TU;
	Sat, 03 Feb 2024 05:48:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3ur-0000000DwsS-2QBS;
	Sat, 03 Feb 2024 00:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JbJskgU16IKX1o+zwN+em6SbRZySqO1hl82127p0go8=; b=fjFeoj4Eq1eddU8UoZgNjpZ4lX
	UZye7PIiXUE6fp4v5+cNeukVFi0S/nwdQJ27xYSeYyKx5acld5kB6RxAm8kIGESWMK53HCa/1eig6
	7xneNVFn7qSKVthcoGVGlKRKkvlTGiVr6jxxPXdzcuzR7M4V4ITw/RVMGF3JJKsOtkoQEDz975BXr
	eS190/m7KDC/d6cfOJ+HRwlB3Bi3drjcJvTMQFRY4xR+6TVRiZMsaDGVL47m42MSUs2NDUmeJI/OR
	LLGdJ/+tvPXRDqRKPBxrjv/bHGMJE1dr16QlwDFeFCjhIjAl/gvr3ihFT2dCO47RQvQJA4Ys/f2rU
	qJHZj11A==;
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uk-0000000ALTC-0oLD;
	Sat, 03 Feb 2024 00:29:51 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 63CA3C0000EC;
	Fri,  2 Feb 2024 16:29:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 63CA3C0000EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920181;
	bh=UPiy9NotMMhw6RetrVpXpgqiL4XDR2ya1PJkJ281Hf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlOW1xN+lDL5uGwFqHKc4uMARbK5v94zuXoKF0hP1LhOT+WAHAL7MkoSU+zbEHFxx
	 VtPNJTcVDwzuxLCnN0z/yyw6F1YD8Ewj79abbz4NboHDpX5i6UaYD4IblJ7qnGCTXA
	 COFjVniYLx4GhQvguR6/bT08YNL4ksYPLVdDrm/k=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BE1E518041CAC4;
	Fri,  2 Feb 2024 16:29:39 -0800 (PST)
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
Subject: [PATCH v4 10/12] mtd: rawnand: brcmnand: Support write protection setting from dts
Date: Fri,  2 Feb 2024 16:28:31 -0800
Message-Id: <20240203002834.171462-11-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240203002834.171462-1-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_002946_849285_433D14A7 
X-CRM114-Status: GOOD (  13.89  )
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

Changes in v4:
- Use the new brcm,wp-not-connected property based on the dts binding
change

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index efeee9e80213..8c1489ff7bd6 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3218,6 +3218,10 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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
