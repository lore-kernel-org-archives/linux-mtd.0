Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F0D149DB
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Muyv6GccaNgEdhQ31oj/iFsjNKjzu3VgdtiPcOJBVc=; b=uZdgu6R3CGWPMb
	EX4HEE4qCe4dZR1xV7knaZgfUkHdTRydiaJMkoE8iqcahVOMqlXi4OECUzpdQNs/izmt8v6EsB1U9
	SbbKLJHK83YmOSWlB2GxeVT48yuxm3b2AAbodZqPUYZZmSsbWqtIe+xHG8mFHLQcwP7ZhBWIxmMVb
	eVrlk8/boczoclgjRM2QDRy4Kq6q2GNBTQXTVWy3FMBUYvKHOluq3CtF5nti+Cz/DkWFVPnRmif9Z
	fJH4Zf2QdQ8lRvypIy7RuqT5ESEaYvZBNhlLTjvrSXYU8pWAj+WnJEComccqsBUrxb33HaotKmhVs
	TNMBtfry2GIcpViT+mbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O9j-00000004bc8-30ij;
	Fri, 25 Oct 2024 17:31:23 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MyF-00000004Nlm-1Dlw
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB94DE000A;
	Fri, 25 Oct 2024 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pByiemz6sGQ1dAc0XGPZWpgyfqvuQv9orpYDTvxc394=;
	b=Cofj1aeV4v4w5g1P2JbjfXuAhzb/D/hZUV5QKSjmsliVXNsX0Liy+oxfIcrf4iww7NnfnX
	f9m2d32g4G1RY0unlEGPoKq6SwXledRpqAERsA6BcF93QdxPjp6opHal0BNXmSuIQz/OFs
	+N9VZ9xwWEf57iUDdmVBoEMGgFUoLf+1FkTfFrWm0Xt4E8nBTuum1Rj21C9O1JBfgimtsa
	PFG5LZ0jl0P5FTS56jjxm6J/6d0NKt8uZUPLygt/r/K4acXagLTneqLmmnPWD3ymnyMeCI
	aaYBSdXbTtBRVDvOiZbjl7LSdfaVUWHysXp33Zt9hftyRkcqMIpzoPQm8tqnBw==
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
Subject: [PATCH 20/24] spi: spi-mem: Reorder SPI_MEM_OP_CMD internals
Date: Fri, 25 Oct 2024 18:14:57 +0200
Message-ID: <20241025161501.485684-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091527_641622_D68AC275 
X-CRM114-Status: GOOD (  10.86  )
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

Follow the order used by all the other similar macros:
- nbytes
- value/buffer
- buswidth
- other fields

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 379c048b2eb4..318ea7b193cc 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -15,9 +15,9 @@
 
 #define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
 	{							\
-		.buswidth = __buswidth,				\
-		.opcode = __opcode,				\
 		.nbytes = 1,					\
+		.opcode = __opcode,				\
+		.buswidth = __buswidth,				\
 	}
 
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
