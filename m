Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA4AD26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ArRzNPt4JXsjf7sYLOEn1eLHjkwY2Nh337sA28dBRY=; b=x3uJhLPqoeYk/n
	YQw7ijkPVRTARUFqyFQNvNw2/UuQRFJ6KrsHTl+Tul1nd9pYf0/40kxwvtil3iU7pVr0Lo8a2HBk4
	D+31ViEKJcSmvTwzMILC12QfTZtPGvBEysFKdqxqQBOHEUACHTCC0O6Ql5O24I+eLKBOQsxJ0vw4q
	PtosZhcgujg7qLC+clMo4wKlA0AQpz5n7QUVp7/3Ftij5FnrcnSp6cMrKr5MC7I8vSGaGGiWkLEpA
	K53fNpY00QqFyq251cShibC+QLGF6ikD/tbsTWcQ3/w2StXKxke5vLscjU5b89BG+qVM5YocJ6Lbf
	iwMohYZ4wdw/7/skP05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG82-00000002loy-1AaN;
	Fri, 09 Jan 2026 17:18:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG7z-00000002lma-0QXE
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4FB80C1F6E6;
	Fri,  9 Jan 2026 17:17:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 988A9606C6;
	Fri,  9 Jan 2026 17:18:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06108103C89AD;
	Fri,  9 Jan 2026 18:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TdRhJU2g1aCtWJB6jVyDXMoLZUtYtJ3QCG7nSo0yd9g=;
	b=fZkuhbynJrZvzxDpARwKOTLI3aT3fjUyhlxHsZ06G115O4FLa1GKpHCfaXHScGSyaI9wck
	aLA61q9c2slPTNSddPoe8ODdLC4Oen3wdse/fMEAArrNSDuJxV5YUdpRCoZ5C2n6h7oVzQ
	KEEJCox7EXLcRnorC/jUkUeFyFZ9lAOO/NFTSdfEvg0Zb3YncDOEjtAU4mqd8OL5lC+pvT
	NuaIM87WIJwreaivgtDkddUZK9ACL4LaUo5JF5j6d7sqX2SZKNHoOCJN2oIrmcRzpU+DRB
	5wW/hjSx3j4YNEo4JLAUmfWHwPOHF6lAAfB7k0UzYkzbGXUe9BWHBS2AyjKveg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:00 +0100
Subject: [PATCH v2 02/27] spi: spi-mem: Create a repeated address operation
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-2-1fff6a2ddb80@bootlin.com>
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
X-CRM114-CacheID: sfid-20260109_091823_284038_F5DD4D79 
X-CRM114-Status: UNSURE (   8.80  )
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

In octal DTR mode addresses may either be long enough to cover at least
two bytes (in which case the existing macro works), or otherwise for
single byte addresses, the byte must also be duplicated and sent twice:
on each front of the clock.

Create a macro for this common case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 81c9c7e793b6..e4db0924898c 100644
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
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
