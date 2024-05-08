Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAACAC04FFE
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T7IQJkyaeiR+f8xRI3yjYWGndwBQnUgCDRmCPDnJuMI=; b=ZatqaPLH/RvuPB
	rufpKSaqTKMdiHh18kni8MOLLyotxN6/8miU1cmkXiPs7IzpwIlIjcSM/rDFqVGcmHceepakE/hVU
	xkAFf9AwxvbzTDRmY+UrjhXJS+s3aTQeByapZZ8gJeciA/0vAsqzRc1/rksunGAVO2F/CmTHxTJAv
	O+8h/y8jV8U2o751TuigGKTR7D6zWEeQHEQ484thIubplYnnU8vFBknbBJp29hXq7s1C2Al6400HQ
	jL0RuOxO19YuzQ3C9XGua+WFwyrF9fcSsKPUE1inJda83UbaXFkVXdzkFZKJ5m7eyuokg0Ms3LjiR
	qKIW8YGb9HnPiis+bVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fAL-0000000F8OV-37pT;
	Wed, 08 May 2024 11:08:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fAG-0000000F8NT-3hqR
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 11:08:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s4fAA-0001ip-NQ; Wed, 08 May 2024 13:08:42 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s4fA9-000GOB-Es; Wed, 08 May 2024 13:08:41 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s4fA9-000NrM-16;
	Wed, 08 May 2024 13:08:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/3] mtd: nand: mxc_nand: Convert to exec_op
Date: Wed, 08 May 2024 13:08:26 +0200
Message-Id: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACpdO2YC/42NQQ6CMBBFr2Jm7Zi2FEFX3sOwgHaAWdCSFkkN4
 e5WvIC7/37y398gUmCKcD9tEGjlyN5lUOcTmLF1AyHbzKCE0kLLCqfFomudxSmZX6BEBv2MRd0
 VXS2MLqoK8n4O1HM63M8m88hx8eF9XK3y2/5jXSUKtFKVV91Tqen2mMkNryV4x+liCZp93z/aW
 yC8xwAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166521; l=1539;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=3g8zTdgFTywwXXViLkx93zxG/zs97n+z7Ky9USpA3aE=;
 b=N5L74TgDef67CwjtaATyuJAF4Lso8l3rkYl1WGWgNxwQp5JwBo+uXOFLja9QKZDhRUwW1z8jp
 hyISxlLnQFXD91m1GVHYmzxXGYWhCfnl1tGAHGkceOTrgfTtKYWkMIn
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_040849_043286_3203A66B 
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

This series converts the mxc_nand driver over to exec_op which gets
us rid of a bunch of legacy code. The motivation for this series is
a board that has a NAND chip connected that needs 4bit ECC whereas the
i.MX27 hardware only supports 1Bit Hamming ECC. With this series the
driver now supports software BCH ECC.

After discussion with Miquel I have now changed the way the data is
written in software BCH ECC mode. The controller normally interleaves
user data with OOB data in a NAND page. In this version I reversed the
interleaving before writing a page and after reading a page. This way
the data on the NAND chip is arranged in the way the NAND layer expects
it and commands like NAND_CMD_RNDOUT work as expected.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v2:
- Enable hw ecc only when needed and leave it disabled otherwise
- Use untangled data/oob layout for software BCH ECC
- Link to v1: https://lore.kernel.org/r/20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de

---
Sascha Hauer (3):
      mtd: nand: mxc_nand: separate page read from ecc calc
      mtd: nand: mxc_nand: implement exec_op
      mtd: nand: mxc_nand: support software ECC

 drivers/mtd/nand/raw/mxc_nand.c | 651 ++++++++++++++++++----------------------
 1 file changed, 296 insertions(+), 355 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240417-mtd-nand-mxc-nand-exec-op-38b3b80c4377

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
