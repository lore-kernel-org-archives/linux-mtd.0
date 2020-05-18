Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D613EC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:59:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E7720835
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u8nSJlKE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="TzJhRkI4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E7720835
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=b5dCjglqd+hYGwz6VckR1rYkCSis4n9ufhi5wH5ayjc=; b=u8n
	SJlKEyPaBA2FnZdgesbX9Vti6AUfHUd22bMtVsbqOYFBHAPB7J7qOm+fCvGdSF0oADC5p1cIwKuyS
	qGT1RByaVZ3GP6qFZ/rNoAZGorLukXNiW4yq39JlF9FxgddprvmwTDNoGiT5qJjyl0Do9YS4F0yBS
	tzF2J8k/1NKnrTo8+KKbEZ4oZuR2cQUUE3tEDHdVraMIz4kMlNvl4Jv13bBG/Z0PECK5WTFYlPffH
	r6Ep1CJX+kvz8EuN1pyquRGQpEvsRyVHmSw+Cu1NnJHwRHjqEGfBx6RIZrsqQEtS5oWJ2IJIHeuXy
	+wOtKfeQGjPG8f5GyOeLIQNANst8zVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jak36-0008AN-VE; Mon, 18 May 2020 17:59:36 +0000
Received: from rcdn-iport-8.cisco.com ([173.37.86.79])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jak33-000899-JT
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 17:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3585; q=dns/txt; s=iport;
 t=1589824773; x=1591034373;
 h=from:to:cc:subject:date:message-id;
 bh=E6wUvoksm92tkLhsV1QtOJo4fFsp8OB5V3olcAzEjgg=;
 b=TzJhRkI4lIwg7JrziDfi2HiOktBM6a3/Xfr7d7eF0Z7fwZIFI6DqD8V2
 sBXIqYX34tg800wBudh6thNbpUT5SbWFeVMS2RY1XTmFBECxSzeI/lQbG
 eCufqD9+Lea/DQWy33ToNmv0BptevGh4HKcKW+6XEk2KE2JHDy3Hb5x1Y E=;
X-IronPort-AV: E=Sophos;i="5.73,407,1583193600"; d="scan'208";a="768458442"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
 by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 18 May 2020 17:59:31 +0000
Received: from zorba.cisco.com ([10.24.1.223])
 by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTP id 04IHxUGK000659;
 Mon, 18 May 2020 17:59:31 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] mtd: spi-nor: create/Export parameter softwareseq for
 intel-spi driver to user
Date: Mon, 18 May 2020 10:59:29 -0700
Message-Id: <20200518175930.10948-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.17.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.1.223, [10.24.1.223]
X-Outbound-Node: rcdn-core-10.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_105933_719608_2D2C196A 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Bobby Liu <bobbliu@cisco.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, xe-linux-external@cisco.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bobby Liu <bobbliu@cisco.com>

How to use:
append softwareseq=1 while probe the driver.
example:
modprobe intel-spi writeable=1 softwareseq=1
it will let driver use software sequence to write register for opt=EN4B
by default it's 0 if not specified, driver will do usual HW cycle

Why this parameter is posted to user:
Intel PCH provides two groups of registers for SPI flash operation,
Hard Sequence registers and Software Sequence registers,
corresponding to intel_spi_hw_cycle() and intel_spi_sw_cycle()
respectively in driver code. But HW sequence register won't send EN4B
opcode to SPI flash. BIOS code use SW register to send EN4B.

On some Cisco routers, two 32M SPI flashes, which require 4-byte address mode enabled,
are physically connected to an FPGA, one flash is active and one is inactive.
When we do BIOS upgrade, we need switch to the inactive one,
but unfortunately, this one is still 3-byte address mode as default,
after we do real-time switch, we need reload SPI driver to send EN4B code to
enable 4-byte address mode.

Refering to our BIOS code, Software sequence register is processed
while sending EN4B opcode. So here we use sw_cycle in driver for EN4B as well.

Why I don't just easily use software sequence for all:
1.It will impact all flash operation, include flash W/R, high risk
2.The only SPI type I can use is INTEL_SPI_BXT according to datasheet,
  this will require using hw seq.
  I tried to specify other SPI type, it couldn't work with Intel PCH.
  If I force SW seq for all, during boot up, sw_cycle fails to read
  vendor ID.

In conclusion, I only use SW cycle for EN4B opcode to minimize impact.
It won't impact other users as well.

Why the default flash can work at 4-byte address mode:
BIOS sets 4-byte address mode for the current active SPI flash with SW seq registers.
So we don't need append softwareseq=1 for normal boot up script,
it will only be used in BIOS upgrade script.

Cc: xe-linux-external@cisco.com
Signed-off-by: Bobby Liu <bobbliu@cisco.com>
[ danielwa: edited the commit message a little. ]
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index 61d2a0ad2131..e5a3d51a2e4d 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -163,6 +163,10 @@ static bool writeable;
 module_param(writeable, bool, 0);
 MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");
 
+static bool softwareseq;
+module_param(softwareseq, bool, 0);
+MODULE_PARM_DESC(softwareseq, "Use software sequence for register write (default=0)");
+
 static void intel_spi_dump_regs(struct intel_spi *ispi)
 {
 	u32 value;
@@ -619,6 +623,18 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 	if (ret)
 		return ret;
 
+	/*
+	 * Intel Skylake will not send EN4B to SPI flash if we use HW sequence
+	 * Here export one interface "softwareseq" to OS,
+	 * let driver user decide if use SW sequence or not
+	 */
+	if (opcode == SPINOR_OP_EN4B && softwareseq) {
+	    dev_info(ispi->dev,
+		"Write register opcode is SPINOR_OP_EN4B, do SW cycle\n");
+	    return intel_spi_sw_cycle(ispi, opcode, len,
+		OPTYPE_WRITE_NO_ADDR);
+	}
+
 	if (ispi->swseq_reg)
 		return intel_spi_sw_cycle(ispi, opcode, len,
 					  OPTYPE_WRITE_NO_ADDR);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
