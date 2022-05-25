Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839AFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1p6nsR3ZHXQH9U3OVHEYMmoXfNwEGAwTs4DgUWpdqc=; b=3I7J6I2gTghy3t
	HdjbQtwQth2dicNTuaNAOPtOfhEj9xlngfab2bq9NTDjjlkdFZFGmif70AA3Rp77TdjjZgjyv2hNv
	cPd8iJNrc2YL9x36STamdvGRlNAU++Llp142YndkbM+dMfmOelcWSUpIicVYS5P3etssRa7xsHYOM
	O/W9xJI8YrlO1b6VzHsGEVyJVACaXpqmlEsg5c9msODdqg9BfXLjQI4TFUiDihpkalVZ9gt/wRGU0
	ZRrvOaMm9fOsywxQzWFyrsbaNe5tuOUnKxA/37FadgPorCVyYE9Pm3bZHILmCkR5c0ZBl5IKM3eio
	7Kei8iv8ZyvBxSgPyVdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttvA-00Bpnb-DA; Wed, 25 May 2022 16:31:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttup-00BpeC-Hs
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 879B1E0007;
	Wed, 25 May 2022 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62VJmhPGzq3clpTzKO5NxJUPggFTPubZR9Y/V5plOjE=;
	b=Guu0ZN5wm0OPjdrEP2Hw+9RZIYw/6RXCI8e3vvT0ZGQhsoEModH9aTPxp5BLM1oSl5Qyz9
	/tKEv/YmMcD4MQ2ExuF2u2042TPnK797Js3DTV3QDr3AxDakxHnLx0YBeiO3wYDhuCFTW+
	d7lkCEFw6dPzAQ9cql6MUTxGCijteYdh62BpliifMxG6tsrxxgctC7pz908GWZ6RmV3+pk
	+eXllbyjIqPBaJE5V34JaJ8r1nj71s6ryINFhpJKSncdTy/J2MvqEERxx7hmxzVlqkZ2qJ
	qrhOz33xqNwhhOX3Gg/2K0WafSBxcbEQKgqKn/8OF6KPdgtQh6Y+NSUO401k8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 3/8] mtd: spi-nor: Add a macro to define more banks
Date: Wed, 25 May 2022 18:31:03 +0200
Message-Id: <20220525163108.266705-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093119_759632_98207601 
X-CRM114-Status: UNSURE (   8.68  )
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
---
 drivers/mtd/spi-nor/core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f237aaeeb458..5200246942da 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -443,6 +443,10 @@ struct flash_info {
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
