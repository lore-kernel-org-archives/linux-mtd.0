Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE4C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O47MWdYAgN2s2oq5VNIRFuT98INK5Tj6bTn31SSKRzs=; b=bpAdyqQEBvmihX
	y6PygzHo7HD37QEVyLCZFIZ9Jo8fhgwVmOYpilHs9QzBpDAWWFdvqZc6FDaFCfFyK6LgFJhcbh4nq
	XL8fd2wxfJwaP4pnjCibePSRyHVPt4x7WjnRQQf3rAdIhckrnGizr3kUk/U0kiEhrKyP4Fxu5ANwJ
	hwrAP41S5/5pDfEHtDNpNjHK6jw5gQLf7XDWki268I03iXFCyZpoflrEKxftk7XLWrtBPjj0qqgeG
	7LUqmf5srPihognPjudPKwsFmWkUVuiGyltQKTOgADsrVDdG59vl8BFlj7UbVqhqbvlQxvNaH2xWD
	UZYY13UVydRilDLqwhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrj-00FfJ6-Ly; Wed, 10 Aug 2022 22:07:51 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrH-00FeqX-IE
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 4D80722253;
	Thu, 11 Aug 2022 00:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41mI0uugblWMUTssmahtd2l/fAYAHT04UlAk02aSkT8=;
	b=vYjfLZ8+Cr3jl63gwAXfHrTKRcp4pPUkS0dW33d3fW7wkLV8Jr+dwHVhc02l5esXB0nb3Z
	4LULct3uLgYVeqy6cXM+2NX9RXYJgXAJtA6/gOJN7nOb1zxp8Xot2RtPcWQ1JqE2UwDcOx
	DwQ/XOBVjO8Q4APucjgm09g2+QDaLWA=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v2 5/7] mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
Date: Thu, 11 Aug 2022 00:06:52 +0200
Message-Id: <20220810220654.1297699-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150723_844408_C3CF3F92 
X-CRM114-Status: UNSURE (   9.21  )
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

4bait will set the erase size to 0 if there is no corresponding
opcode for the 4byte erase. Fix spi_nor_select_uniform_erase to skip
the 0 erase size to avoid mtd device registration failure cases.

Reported-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f1d01c7dacce..42f9bb63919c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2118,6 +2118,10 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
 
 		tested_erase = &map->erase_type[i];
 
+		/* Skip masked erase types. */
+		if (!tested_erase->size)
+			continue;
+
 		/*
 		 * If the current erase size is the one, stop here:
 		 * we have found the right uniform Sector Erase command.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
