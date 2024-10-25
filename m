Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73608D149C3
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbEDeO8CW86fa95s84X+FZGqsa4KveBS25OVFI4Rjbg=; b=fW0Q9y84hdn4GT
	v0UpigiqqwFIHXb6VK9lc4suBTLJw7eSw6uueNBzvU7i2fLXZH8HaKO38ffejIsRCQs86A1iFancO
	OqNFuoNpoIyFhoNYBKkL+kZKKRIpctoxAg36M3JVUMNmzGrAoEOcn7HLM7VObtq/QQ+efYLfxeOy+
	/jLx/i2NXs5n/x8nuX/9MupeI6SgwO20LMRUBCfQr2Ou84TBxD1BJOeX1fN0+zZBlB5dm9ryalbFY
	VGX+Jrp/I6Vr7ZyZn8nXHIqV2WQkCNXHmfpamvXrxO4ZEU9fhTCYbTdc9ts+Qn8AplzN/3IU9C1Mw
	X7roRW5NRGeOLZqsVdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N3n-00000004PWA-25qL;
	Fri, 25 Oct 2024 16:21:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MyM-00000004Npd-0wE3
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Oct 2024 16:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TnJW+HtAJmLd3pYu1pAxAfjvDVGDfQqGvsxgR8a3u5A=; b=h+YrPTEyDwephyoGvzsprnhYEm
	HKeiQCTFno12q6bD27A7vxJQW3jvaVFa8KrKca23f4F9aT9jUOUDymeHBXnWPXdurzhA9sK4SQt7R
	cQbPtk79ERnVF7nCfu24cXRhAwt6wfSJqy+ZSGcf7ZN+orfclfi3iz4zri65M2qCNAEGQTW+bKsju
	6nqGTtwCC1D56VI1P0k7GjyXge+0IDE4rdPO/jxBioyiuwyC5TlNEbKHW1RxhPr+CthXixC3dZPuG
	zc0KTR1gOctvneoyVVuACZeEM7S9iGLeTQJixb4chOsJ5ECOeDbEM67vz5KVamx68MzdN/rSCiOAx
	Q9+6Bfsw==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MyJ-00000008yXd-13KY
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8360E0006;
	Fri, 25 Oct 2024 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnJW+HtAJmLd3pYu1pAxAfjvDVGDfQqGvsxgR8a3u5A=;
	b=Ow1aZTTqR5JoLQXYRgDRTOlatlI+hWfAjiflxMlwDKSKDiJYfj2nKKQus/aRKP7IQ529cZ
	wTUcYYzp5I6d0N/CQFXItbD9AyXDUbKD1f/2l16/+R+9+PeXXypElv+LrHEjvgBa0rJke8
	M0OYaYIFSNsRB8BfZ4UGdJYnApSc1rU4W1gQ/0godMzhyzSSu1XSBfvm9D2y07iU9O2gUl
	kZPwKK0Db/xC2eUogV/aS87drKU/MoMS1108S7rbCjXHwZK0E3ucHMk4Znckn+2F2povTy
	htG3JFyegwPDlXDnrxJe8dQSVmuV615r7pCD4mwABUBO1MchURVenklwjZ2y9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 21/24] spi: spi-mem: Create macros for DTR operation
Date: Fri, 25 Oct 2024 18:14:58 +0200
Message-ID: <20241025161501.485684-22-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_171531_499077_60F5C188 
X-CRM114-Status: UNSURE (   8.84  )
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

We do have macros for defining command, address, dummy and data
cycles. We also have a .dtr flag that implies sampling the bus on both
edges, but there are currently no macros enabling it. We might make use
of such macros, so let's create:
- SPI_MEM_DTR_OP_CMD
- SPI_MEM_DTR_OP_ADDR
- SPI_MEM_DTR_OP_DUMMY
- SPI_MEM_DTR_OP_DATA_OUT
- SPI_MEM_DTR_OP_DATA_OUT

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 318ea7b193cc..d332ac5ce971 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -20,6 +20,14 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_DTR_OP_CMD(__opcode, __buswidth)		\
+	{							\
+		.nbytes = 1,					\
+		.opcode = __opcode,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
 	{							\
 		.nbytes = __nbytes,				\
@@ -27,6 +35,14 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_DTR_OP_ADDR(__nbytes, __val, __buswidth)	\
+	{							\
+		.nbytes = __nbytes,				\
+		.val = __val,					\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_ADDR	{ }
 
 #define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\
@@ -35,6 +51,13 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_DTR_OP_DUMMY(__nbytes, __buswidth)		\
+	{							\
+		.nbytes = __nbytes,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_DUMMY	{ }
 
 #define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)		\
@@ -45,6 +68,15 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_DTR_OP_DATA_IN(__nbytes, __buf, __buswidth)	\
+	{							\
+		.dir = SPI_MEM_DATA_IN,				\
+		.nbytes = __nbytes,				\
+		.buf.in = __buf,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
 	{							\
 		.dir = SPI_MEM_DATA_OUT,			\
@@ -53,6 +85,15 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_DTR_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
+	{							\
+		.dir = SPI_MEM_DATA_OUT,			\
+		.nbytes = __nbytes,				\
+		.buf.out = __buf,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_DATA	{ }
 
 /**
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
