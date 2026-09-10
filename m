Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D78C79FB9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vy5DBhDJEVeeyvbTICAFAvht5qXjt+I2ghvfPv698KA=; b=YkW3aT2c0LM6jc
	t5TCMhmDZDo/qfrV6hilDs9Zt0PdEnZe1AoracJitieR3bZohRC80MzVO1ozuoiaXZivzPtJRPCLD
	/ZaCZC+mDbat0vQybWLSqVhppCRYy95YpDWnDtMmehRlBnbikNkagNqI7t+aX/3aZYuVyID3QJ3VA
	1Si51o8pQqGyom95aBvUufuOUexvEJyM5UcEOT1drhghAekuiIZfTao9POHL21EUyv9QoEwphUYxx
	rAgZEkHF5LIf9GqeJyJPSh7GU9D3AuQSGvXjI9VeH8B/mDdH6J7wq3ASNW7foZuqI5eKs5Zw6vrMn
	1yXjMQo6Px3N21KYNHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4d22-0000000EDjj-3Ktt;
	Thu, 10 Sep 2026 11:33:30 +0000
Received: from b224-5.smtp-out.eu-central-1.amazonses.com ([69.169.224.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4d1z-0000000EDix-3axh
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 11:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hi6pntjfnmhxrdkbpi4sl3ndfqswqs3i; d=sagnik.me; t=1789040003;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=gU+TosqF0bmNRmsn9m+cbxl0ah+pcAiVRzQfc5xFUoI=;
	b=qRUbXAh2X0f+DDinEefav43TE67elGf1HnusH7qJpcXuh4NTNE/gTvANWG4Pa6z5
	5c45KDU2kuizYrcaqFNTfrcpEHgjOBNuFvB2b5ukcr86Ns9yNr4NAQXqpkLIzZynk4e
	/GuCrRwsdm7y/zhs9nyxbpveHM39PcSJTySG/fRofbeFwOWsGWbkBHLkZmJXm1J+sp9
	Fj88fjrPsVCaw9K8PgcRNj5aLllwZoNddG0ZugIK/afwry7sdb0yiaQP7Hf4R/3MMJ/
	a6+hqvgf+4jhUmaA3lPNDVVAu2TU9YuUDKcO98kNNJl4I2BdH4hoqOUAxzoUQZHiGxB
	DQLyFD4m4Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=sokbgaaqhfgd6qjht2wmdajpuuanpimv; d=amazonses.com; t=1789040003;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=gU+TosqF0bmNRmsn9m+cbxl0ah+pcAiVRzQfc5xFUoI=;
	b=S5jf2uWeUej6tj1l06lHggDCo8vY+YHmqUkTCAOBowju0eI9sZ2OXy2kmqgih+6l
	I0bOyz5/cwi/kBrpJfPW6fFJZWNUbGCY//ypo0oEEP0f8BldRh9wHj0jQBxJzDzILtI
	e296s5L+myPiRv4jbjMduZUFSh/Py4G6UMkUFvt0=
From: Sagnik Sasmal <sagnik@sagnik.me>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
	mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: Do not update the QE bit on devices without one
Date: Thu, 10 Sep 2026 11:33:23 +0000
Message-ID: <010701a08b180a21-f4b7e929-ff1c-494e-99ec-c563bf7c92f4-000000@eu-central-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.eu-central-1.PI0qW2sOnv0WHLkqY53RTxXQVzstwFEIoB04n7YZrig=:AmazonSES
X-SES-Outgoing: 2026.09.10-69.169.224.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_043328_081302_4ABBD3B1 
X-CRM114-Status: GOOD (  11.62  )
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

Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") moved quad-enable setup into
spinand_configure_chip(). The new code only determines whether quad
mode is needed when SPINAND_HAS_QE_BIT is set, but calls
spinand_init_quad_enable() unconditionally. This clears configuration
register bit 0 on devices without a QE bit.

That bit is not universally a QE bit. On the Winbond W25N02KV it is
H-DIS, which disables the active-low HOLD function. Clearing H-DIS
enables HOLD during single and dual I/O operations. If IO3 is not kept
high, the flash can pause a command and ignore clock and data.

H-DIS is not restored by the FFh reset command, allowing the incorrect
state to survive an SoC warm reboot while the flash remains powered.

Before the refactoring, spinand_init_quad_enable() returned without
touching the configuration register when SPINAND_HAS_QE_BIT was not
set. Restore that behavior.

The regression was reproduced on a Jio JIDU6401 with an MT7986 SoC and
a W25N02KV. With Linux 6.18.44, sysupgrade failed and the following warm
reboot hung in BL2. With this change applied, both sysupgrade and warm
reboot completed successfully.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Sagnik Sasmal <sagnik@sagnik.me>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..89e9f5410cfa 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -281,6 +281,9 @@ static int spinand_init_cfg_cache(struct spinand_device *spinand)
 static int spinand_init_quad_enable(struct spinand_device *spinand,
 				    bool enable)
 {
+	if (!(spinand->flags & SPINAND_HAS_QE_BIT))
+		return 0;
+
 	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE,
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
