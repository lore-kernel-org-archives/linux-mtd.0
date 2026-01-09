Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F91BD26D7B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYr1M/dxEKuJ6mI6VOkA8b37V1dPm7WyU2PB6Znq4vc=; b=mdTfdw+QYhO8Ss
	hMOucszbKHpXXmHBQkey5Md6mavwez+hmOYHpjmd1rzoKyLZ62Tn2zwLncaJDNeZsvf7NR7ALLc8/
	Irsz/JXCjbUXYslVtN+TK3vVXUV56YCqPJmG28rZj6JAqAEoRVfeIhbaExxcU6ZQNlzPDI/cZLZlf
	N+lMToSlqBEroCL2zDfhQLn92lCXRr8S2YosOQ+2nJsQLb1e6yRxGAErCDRCGJCd/H5yhklcu9OvM
	egBq3qqOsUPi1F5oxicXPoC3PbM6QVWHK0obqo8F1rZbicZ76YkMU5bQHINUdZC7FpOq/+91J7/QA
	lEPM/TmuSJ/VFIkeuX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG83-00000002lpn-3eq0;
	Fri, 09 Jan 2026 17:18:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG80-00000002lnL-23zo
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 13C1B4E4202B;
	Fri,  9 Jan 2026 17:18:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEDC8606C6;
	Fri,  9 Jan 2026 17:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31395103C89AF;
	Fri,  9 Jan 2026 18:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hpWiGp2IJhYFgxmfj56BPtbUVs0Zl/pSRbFJbsG8PAQ=;
	b=rt6j6ZvB+gVvtkjvT5b/qqqXMMtTMJ4no6KRPrg1z7A7g8TY9U3T9os07NoQaiH2IhQm5i
	lPKkvlAjD7ltT/lsLFyAUy3d1F9faa21ajqVuB0rNUr2AfvZjzfRGKu+CUoZqhqSyvcFUi
	ghhPFrH3emnkB39qO6dC2BqStYVXb2GYomhEu1UPQVkzxyAXyCV9KgLlNOhecjsCtoqqNJ
	gFAgodyruiT+Hiyy6lNvj04pXH/hP4SykA2w0Dk6U51N8gj1yawctATkcPIL3kMJQYVdD5
	mtC8yG7L9zEUIIFKPSZ0wmY25+gvFIcolbtpLtsJ4siA7tRGyUSR1ivTjc8JaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:01 +0100
Subject: [PATCH v2 03/27] spi: spi-mem: Limit octal DTR constraints to
 octal DTR situations
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-3-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091824_679089_C427BFE2 
X-CRM114-Status: GOOD (  12.48  )
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

In this helper, any operation with a single DTR cycle (like 1S-1S-8D) is
considered requiring a duplicated command opcode. This is wrong as this
constraint only applies to octal DTR operations (8D-8D-8D).

Narrow the application of this constraint to the concerned bus
interface.

Note: none of the possible XD-XD-XD pattern, with X being one of {1, 2,
4} would benefit from this check either as there is only in octal DTR
mode that a single clock edge would be enough to transmit the full
opcode.

Make sure the constraint of expecting two bytes for the command is
applied to the relevant bus interface.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index c8b2add2640e..6c7921469b90 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -178,8 +178,19 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		if (op->data.swap16 && !spi_mem_controller_is_capable(ctlr, swap16))
 			return false;
 
-		if (op->cmd.nbytes != 2)
-			return false;
+		/* Extra 8D-8D-8D limitations */
+		if (op->cmd.dtr && op->cmd.buswidth == 8) {
+			if (op->cmd.nbytes != 2)
+				return false;
+
+			if ((op->addr.nbytes % 2) ||
+			    (op->dummy.nbytes % 2) ||
+			    (op->data.nbytes % 2)) {
+				dev_err(&ctlr->dev,
+					"Even byte numbers not allowed in octal DTR operations\n");
+				return false;
+			}
+		}
 	} else {
 		if (op->cmd.nbytes != 1)
 			return false;

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
