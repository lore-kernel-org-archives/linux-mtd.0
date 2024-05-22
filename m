Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DF6C25B78
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2024 05:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HZX4ymrKxTAOsuJKLHQjhccSr2EVxAUub8N0ZXyMpKY=; b=Mi7r4PAe3egt4k
	N1m0vNuLiLlm5fvIWG9v8qzke+AL4RmbBFg4o9HyqUjv2HUQ72oVSPuKjTQCuMQdtm3ZvXW6IYWJ6
	cvd9MaswAx5AI2TQkF5BosLd9QmBOWzYtkViGB48tE8QwAfhwZVfL/uhgibBnDaEWty+N2wHig5JI
	4fSsSqzYIIG8y4Pyyy3SrFUHoA62Dzpl22tlmkbzqtLWfS/yoyTMj0pC6bJSfnAeUqRautu86DXxK
	L0Tbh2G1GvuDYaQeYx0oMYRAj2TsynD79XGycGwq95IPGaoovCfemU3xGv5itJLAmdQURnuEHWdeD
	LhHJeFcYsX2E/T/IJSHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ehq-0000000226u-1TZ8;
	Wed, 22 May 2024 05:40:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ehm-0000000225l-1S31
	for linux-mtd@lists.infradead.org;
	Wed, 22 May 2024 05:40:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s9ehj-0003da-JJ; Wed, 22 May 2024 07:39:59 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s9ehg-002U0u-Oa; Wed, 22 May 2024 07:39:56 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s9ehg-00Dqu2-25;
	Wed, 22 May 2024 07:39:56 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v4 0/3] mtd: nand: mxc_nand: Convert to exec_op
Date: Wed, 22 May 2024 07:39:50 +0200
Message-Id: <20240522-mtd-nand-mxc-nand-exec-op-v4-0-75b611e0ac44@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACaFTWYC/43NQQ6CMBAF0KuQrq1pOwWqK+9hXACdQhcU0iLBE
 O5uwYUmGuJmMv8n82YmAb3FQM7JTDyONtjOxSAPCamawtVIrY6ZCCYkkzyn7aCpK5ym7VS9Fpy
 wol1PQZVQKlZJyHMS73uPxk6bfb3F3NgwdP6xvRr52v6jjpwyqrlIM2kwlXi69Ojq++A7Z6ejR
 rLSo3hzKVN7nIhcVuaQxaGAm58cfHBc7nEQOcDMyNRo0Ep8ccuyPAFvzvB/ZQEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716356396; l=1733;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=yeL7YBidh1ArL5wcz+0g/CtR4XhGDrY13bKz5c9oSjc=;
 b=8QjSfgQpsuuo3+7Et+K2NJ9b8j75hpC3LwsP/NZk6AV/CV9JKgR4BTihtkyMQC+Csl985R+YV
 z0dEjv3zoKRCSdEtTYJ/UIGdCesGXIuZ73mgTe37ZNO7ScWzoGLX5fc
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_224002_429319_64BD703F 
X-CRM114-Status: GOOD (  11.86  )
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

This series converts the mxc_nand driver over to exec_op which gets
us rid of a bunch of legacy code. The motivation for this series is
a board that has a NAND chip connected that needs 4bit ECC whereas the
i.MX27 hardware only supports 1Bit Hamming ECC. With this series the
driver now supports software BCH ECC.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v4:
- fix writing partial pages
- Link to v3: https://lore.kernel.org/r/20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de

Changes in v3:
- use monolithic page read/write helpers
- drop exec_op tracing debug functions
- use nand_op_parser_exec_op()
- move copy_spare() out of exec_op()
- fix comment about NFC handling R/B internally
- drop host->column. With using nand_op_parser_exec_op() we can forbid the core
  to issue multiple reads after a command
- Link to v2: https://lore.kernel.org/r/20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de

Changes in v2:
- Enable hw ecc only when needed and leave it disabled otherwise
- Use untangled data/oob layout for software BCH ECC
- Link to v1: https://lore.kernel.org/r/20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de

---
Sascha Hauer (3):
      mtd: nand: mxc_nand: separate page read from ecc calc
      mtd: nand: mxc_nand: implement exec_op
      mtd: nand: mxc_nand: support software ECC

 drivers/mtd/nand/raw/mxc_nand.c | 696 ++++++++++++++++++++--------------------
 1 file changed, 343 insertions(+), 353 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240417-mtd-nand-mxc-nand-exec-op-38b3b80c4377

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
