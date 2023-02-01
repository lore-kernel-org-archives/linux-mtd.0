Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6EC05027
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwRrLHUetQm4Tl3rrfxBvI0KPfVD0RjMFrai2N1WzOo=; b=kHOVRLEUu9hhwR
	kgb7V5MjnHGylGD7EOmoLwqxrZyJSg8Aixx1WQ+K+tEGJCEBxl66MsA5EXcyL1k2fT/f1Gftbqi40
	X7fG+EXCTva47SU0aa7zQkOebBV82lP3uO358QHvB31B8K38oqwAZG5yh1fxnYq+fDCNI1iMwnt2a
	/OTI9LDWyogTc8Wgrz4eiBeD0Jtda+WM1Db4Iy3um9YtC0wQjo0/sFstS+44gSuayauYdmV/Zfl/g
	FAx8YszpKg1W1a+/lUwtD+18BnpUYXnzGlz3R/yN6Q6ryOoHx42OrBNSROwxiI6F5fmUCbXxgGHAG
	T7ycnn+K5YvXvipUZ5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBQG-00BVaU-J0; Wed, 01 Feb 2023 11:37:04 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPQ-00BVGB-Ba; Wed, 01 Feb 2023 11:36:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 55719240011;
	Wed,  1 Feb 2023 11:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpXajK+kF4YKgVI5i4Ma7QEwo2zNfp/vWhqn4AuxdI4=;
	b=RfXKZgvLSoufKzUfPEgocalk9e1WuNDlOFzFHuOxFf8n4ZDQvuU/kkCS4OTU0NRtWvLEhJ
	NpAWF0F4R+ukARAE1kiPF134wO/pu24BRw1pJuG8L+XE17UOvHK/ZnQyDqSGSZ5BKOi4Bn
	HfT7+OhctCRb3dNdmMQVcf+vs7zy2E8kPV1RZZwIQ4obTRcWyH5iBQ4KzDIvDRUcYOmMOV
	iIh8iVz3prHa/uDL562SW3TAFL+KvNl1j0WmAV35wBBYKOcBCOylXdxrmHXpqsBjlYUg1c
	2UjjDUuFECodlKOJ172f+43PxJ4+eoK+T1i1jJo3N1KIY5ksykm0VTylO4aQQg==
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
Subject: [PATCH v4 2/8] mtd: spi-nor: Add a macro to define more banks
Date: Wed,  1 Feb 2023 12:35:57 +0100
Message-Id: <20230201113603.293758-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201113603.293758-1-miquel.raynal@bootlin.com>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033612_566093_6D7981FF 
X-CRM114-Status: UNSURE (   7.98  )
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
index 768ccd1a5a8a..888a08c37d8c 100644
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
