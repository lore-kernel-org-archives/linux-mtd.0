Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E85CCCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUqCPIKqeliv63a0xdijEeEKu/8DvPclxG5Pt7TNQ6g=; b=C5Q0OZg3u6MiGh
	iqNRluekoITH6MGzKlDkLg4rUctbxF1/71Wjhk4yttYINNBf/CcY7XengQbKXcfzUzTvVCJVMnEhh
	Fwwu1surL+8WyJIkL7f/ZE2nH9Lj52TnK8qgHJrXRWz4YQjk0wDHlC2tfxuKOirzvADXtMNq7Hc90
	eg3KksgWUuK8PExue3JxAzKGOr4mTi1tIQH/NWKnz/v8wg2fxs1YULS1kvFqb5eU+1N/fWVscH+6K
	Y8nhla0sNP2zYeONc0Fzc7ZakEC905t5XWJ23tfkUrRDnOckd6wjJ3gSvPV180ks9oFolr94daRe6
	eUfbyzbYW0vQjtfYlrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvK-00000006UF2-0Sqp;
	Fri, 31 Oct 2025 17:28:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsv9-00000006U4p-1R7q
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 70C424E41442;
	Fri, 31 Oct 2025 17:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 477B860704;
	Fri, 31 Oct 2025 17:28:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD781181800B;
	Fri, 31 Oct 2025 18:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MQ2OSbA2wX7GpEne4dN3xY/3vjobyU3TcL9SV/CMJH8=;
	b=vvI4HU/grcaLTF2EgrEQqMZN9bpaAXWY9kU/ltufl/+RXDyc8UiYJSFIMOx971wR5+m+mr
	/QABjhbFEv4ePBgoNHVR2N6ddUH9WnFa5VkJJC9BJHzFGQU37w2MpQE8nPQXuSYqKVJxy2
	/rJvT+fSBGXmFItqrda9qTNeJApBDcI5QZTN8G7TiTJ1D0+BpfSKYZACjPU3R4kDJG3DTA
	21jLXXDmkN/Az90EQnn13I75WOxgp+gSlF7wrIQUAP0/vtsSZIt+qQPe5bJxz/VLZtu8yA
	D8erudFjW/vAZudPrgCii7M+0HwZXQyns2C3vYuwNhvQKW0ERiV9I44Z6wRMTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:46 +0100
Subject: [PATCH 02/28] spi: spi-mem: Create a repeated address operation
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-2-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102815_551438_9A96A284 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

In octal DTR mode, while the command opcode is *always* repeated,
addresses may either be long enough to cover at least two bytes (in
which case the existing macro works), or otherwise for single byte
addresses, the byte must also be duplicated and sent twice: on each
front of the clock. Create a macro for this common case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 81c9c7e793b6ab894675e0198d412d84b8525c2e..e4db0924898ce5b17d2b6d4269495bb968db2871 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -43,6 +43,14 @@
 		.dtr = true,					\
 	}
 
+#define SPI_MEM_DTR_OP_RPT_ADDR(__val, __buswidth)		\
+	{							\
+		.nbytes = 2,					\
+		.val = __val | __val << 8,			\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_ADDR	{ }
 
 #define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
