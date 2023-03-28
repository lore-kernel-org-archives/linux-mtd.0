Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC4EC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA1+y4ReghNhPeHhxCgyRm3WafDb2BufUS25GL07oyo=; b=fZBT5d8mqaKqCj
	+jCsj/hy2qxDcyjSsFy41f9mgJXwDHcEF0FHwu6sKh41Dbqamrcnyp9Z7D8xMWwZYzsatJrKL/fHj
	8sovK+WsplsTAI3iWQboB9GTPQYNmDNv1s0pmQ4sBGxq5f8stF3x1jSfyqq55LMhpdtSUhgtupjEk
	5lHIOgB8TDS8gK5lbUZBNRchYaC0UKVd3gZEbBBCrsz41u2YoXttWhNKoq3l0LEdjBasi0VvhZhBs
	OIdJk0h0u51GJ0jlzytv+9fwaaJ25vDFaQvX5ZQXnySa1h0NJg+iaAX98Wulwhp94Kc9vl39MF7mD
	B3H99ChhmF2O4UIBO8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRn-00EyhH-1W;
	Tue, 28 Mar 2023 15:41:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRh-00EydH-2w;
	Tue, 28 Mar 2023 15:41:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF5DB60004;
	Tue, 28 Mar 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8+C50L6TyjhDk2JejbiwzuldSIgSHE+w4n/RI9WwcQ=;
	b=Nge901IZ139UsD3MGuFcxgzpK1cdTGtVkQcwLDDAj4QAr9N9eP5CHfapU0Gpkf4W56xOz4
	BwVmhNxj3cdq2wc/wMxWkntcHWZOQSL+bLF9x1f3Tp/Ko2S54h9+7zmpjPuTGC3GtPDn4N
	j8bHYq9X11cdbKCOR8iABSXQGy/BVN7Z8qZWvOdP+8vNhhkTDxahNSF+ihCSSDFGuzscXv
	xy6CRZMrAXcR66HaUdY/GecJhhGw229VxhxBeBnfx1eKM8B8Ajs7dG+j+56mMc/MXircOq
	k1t/8vmPSdRcGFcZykicuA/bbIfQ2pWmVFsbCt6cfLXWaIk1TZZt4dpQ77ARaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 2/8] mtd: spi-nor: Add a macro to define more banks
Date: Tue, 28 Mar 2023 17:40:59 +0200
Message-Id: <20230328154105.448540-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084114_079287_4FEA5E79 
X-CRM114-Status: UNSURE (   7.50  )
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

Most of the chips on the market only feature a single bank. However, new
chips may support more than a single bank, with the possibility to
parallelize some operations. Let's introduce an INFOB() macro which also
takes a n_bank parameter.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index db0e458810c7..bf2e64671856 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -555,6 +555,10 @@ struct flash_info {
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
 
+#define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
+	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
+
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
