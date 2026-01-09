Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B997D26D6F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oouxZTfpPaucFhAX+4Vphmxp1lW2/FwOA3Wjxp/Ot+4=; b=F1z/mXX/qOjV4e
	fKXoMij0aF//iGUo/PLU67JqWIMRDHzOcUyjtehTAhB4DFOeXmCWaIyExlqthJLOn/TxiWObEAZZy
	1uEpPpdLE6T3o7HGwdZqVe53f7ZmencKhFuiDx7ZZhBQzb5AsmxoPqONp/A3l4OE4w0Amp1OvygE0
	9FPPq48pL3A9OeKIcjhQA6nCEfAq9UWtpHeG25XNsAuqdWSDtJnIGpLvUwfEu7Wi0QZCShzwf4raT
	6/v36EcRCkGfeLbmIvX8oNHmqCU5sjcUfWYysTtUU8j+NswLVEEu5G0EKlMFyx4QQViFSdSo5Dvn1
	MVt4Bsadm0fmgUI5sKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG83-00000002lpT-2OJI;
	Fri, 09 Jan 2026 17:18:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG80-00000002lmd-0JBA
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 869654E42029;
	Fri,  9 Jan 2026 17:18:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C00C606C6;
	Fri,  9 Jan 2026 17:18:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D19C103C89AB;
	Fri,  9 Jan 2026 18:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9G/aUTnLmrJx/EKe3AC5h2XyiwOQM2CjA2RNxNPKj0U=;
	b=kZLAZdgIAwwqf4/dpch+VvSRsdxmzJOwoZw/n74dUBbuRHzqQq73AtLYqXxZE9RWElkG7z
	cuEmfLJs6HB1OxVZEY8Tgt0+XOgyEXW5KYVpWL4f4jlkZhX3NGcjiKzAeb/EUU6s9qK/LZ
	WKF+QYKqvk8puaW2J9zUrTfEQVjLGqL+XVtKlQWaaowwTeb2+RJELxICAvojzDrIrwvYpc
	1TC1MyITJv0iQyQ2i67SJGKf4YJ+mW8L04IckabagghPW3cIkJ0TzY3ynAhkbPc5Q2rk5B
	CPzye2lc21wnp3qd8G1GwwpiJyeiXsyTiFB3p4dnndZ3QA4LepsrzCSwKvQdWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:17:59 +0100
Subject: [PATCH v2 01/27] spi: spi-mem: Make the DTR command operation
 macro more suitable
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-1-1fff6a2ddb80@bootlin.com>
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
X-CRM114-CacheID: sfid-20260109_091824_273010_5F458F02 
X-CRM114-Status: GOOD (  10.52  )
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

In order to introduce DTR support in SPI NAND, a number of macros had to
be created in the spi-mem layer. One of them remained unused at this
point, SPI_MEM_DTR_OP_CMD. Being in the process of introducing octal DTR
support now, experience shows that as-is the macro is not useful. In
order to be really useful in octal DTR mode, the command opcode (one
byte) must always be transmitted on the 8 data lines on both the rising
and falling edge of the clock. Align the macro with the real needs by
duplicating the opcode in the buffer and doubling its size.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 82390712794c..81c9c7e793b6 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -20,10 +20,10 @@
 		.opcode = __opcode,				\
 	}
 
-#define SPI_MEM_DTR_OP_CMD(__opcode, __buswidth)		\
+#define SPI_MEM_DTR_OP_RPT_CMD(__opcode, __buswidth)		\
 	{							\
-		.nbytes = 1,					\
-		.opcode = __opcode,				\
+		.nbytes = 2,					\
+		.opcode = __opcode | __opcode << 8,		\
 		.buswidth = __buswidth,				\
 		.dtr = true,					\
 	}

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
