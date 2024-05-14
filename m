Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C96C25B75
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/BnlpZGeodGnn2/106CkuAlehcXW8xgqkTfplgdytxk=; b=s58FgjsuCarUF6
	x1yrRFK3DPMK6CCmLghzHCa7yWFgEmhmmZ7xUlyLnEYH0dPYjdybFi8pm4kxPTBgTWzrQwBB6SE9w
	s/R4kM+uPHjcQFUWoLcZ03dGhekWHOq8FQqJBYVE1KGqJgopOKkAopT4F7aXGuLwR0ra2uNYfeLtE
	NBLxIKSYaeIZX/AiSZZjusmtZv1jNfXaB91/PjHeHoySErFt5YxgzH9FEZUau3kSi+tbEIUwBNjC0
	oEtfwZC8iiPuuo4UdoDv3zm7dCAvuK8Tu67zHOeQMemDVUUsifIpmST6EZbEJcQB0/YP8uzr4IyRn
	vp2XopppVwsEhjdTpsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6t6E-0000000GAxs-1v3Q;
	Tue, 14 May 2024 14:25:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6t6B-0000000GAwJ-1ijt
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 14:25:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6t5m-00044Q-7m; Tue, 14 May 2024 16:25:22 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6t5l-001N6a-7H; Tue, 14 May 2024 16:25:21 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6t5l-004mXh-0N;
	Tue, 14 May 2024 16:25:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3 0/3] mtd: nand: mxc_nand: Convert to exec_op
Date: Tue, 14 May 2024 16:25:16 +0200
Message-Id: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEx0Q2YC/43NTQ7CIBAF4KsY1mL4a0FX3sO4aGHasig0UAmm6
 d2ldeHCxLiZzHvJfLOgCMFCRJfDggIkG613JfDjAemhcT1ga0pGjDBBBJV4nA12jTN4zPq9QAa
 N/YS5anmriBZcSlTupwCdzbt9u5c82Dj78NxfJbq1/6iJYoINZVUtOqgEnK8TuP4xB+9sPhlAG
 53Yh6uI+sWxwtWt5HUZitPui1vX9QURKGfKFgEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715696721; l=1577;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=TIeV/E62DXbqh4pIU8p/hTVnaZWv3IIq7Aq4uMoPDQ8=;
 b=QhR9nchAUId6bzTlNyM5dtiSW9Li0QNfunfyDmHWR3kV9eI/RJ78jyFv2dg0/4rCREoUokc3Z
 trGaK23IwNCAbLO/YuI04XUY7D0GGLkYWbNIecXk4+Kv4bMEEoGkfY5
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_072548_189173_774E1B35 
X-CRM114-Status: GOOD (  12.51  )
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

 drivers/mtd/nand/raw/mxc_nand.c | 667 +++++++++++++++++++---------------------
 1 file changed, 314 insertions(+), 353 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240417-mtd-nand-mxc-nand-exec-op-38b3b80c4377

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
