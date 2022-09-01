Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E37ECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/x1EvqeBQRKnF+vsnRjmpoosbHOJHDG97GrpCHg8mQo=; b=oxBP6XAQ2vFvwO
	pZoIw3yh5eSopLoYz0do8mDepL2tABoMysINCIEeidNeUh73SgqHweLKsrG0IWM1CpLavJcL/ADGr
	DkZBv6us2eF7b/YkvhrdHLXfNOMCmMNWhbRSpKnCfdvlgxIsValthrXOFswJZOsuY04bD7KgfjYvr
	rm+Z5fdU/Ki27pxSTY/MeEcgRQLoIVs0LveZ9MmK+1QofPV/XX8nj7o/kRss+P7f5Nf4DMdBnRJDz
	JLOfPN7a8YxwagZ1O6BWuCx0TWBrjqbGqdVCvdTtFVhoWtLxUCqKduV80QJa8sunoc+/FHRSSFJgH
	aaV3DR0qK6LtxGuyVjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTseY-00FKbx-0s; Thu, 01 Sep 2022 22:27:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWw-00FEfT-28; Thu, 01 Sep 2022 22:19:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 78B6E2205;
	Fri,  2 Sep 2022 00:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGryqp6PN2Xl4uE1Cl8ul5MHURkXagR6tqozK7Gh86g=;
	b=NHxHG204Y9W9I0zSVh0EVs8SFiwhe9ccuNqrQNRb6USXzgjoncd/2WxYqubX0TaRuCtBJn
	C+dK2S002mU8Ra8ZAMChbkkwIadhH+9P5DERw2aCazNBy2TBDP4Q+nzB4GeLsMa0RnOyx4
	gL/m43Nzb117yWQPXfCuApkTtcwx1/wyt4SBKrpz5uv7YOT8DUWd5XgaTJjdn65aAbqCAL
	PuoGIN4XWUg0zUaWoHTGPhl192nLkdOSMFHCunchKktSaEI3SYfQURf9lbNmyizNJQRdmW
	TKalRIq1T7LBbQouNAvlGCvVrMzs5S6We3v7crBY9yuZBeO0UcFQxo/Futg5YA==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 13/20] nvmem: core: drop priv pointer in post process callback
Date: Fri,  2 Sep 2022 00:18:50 +0200
Message-Id: <20220901221857.2600340-14-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151922_338276_EF163947 
X-CRM114-Status: GOOD (  13.32  )
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

It doesn't make any more sense to have a opaque pointer set up by the
nvmem device. Usually, the layout isn't associated with a particular
nvmem device.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - new patch

 drivers/nvmem/core.c           | 4 ++--
 drivers/nvmem/imx-ocotp.c      | 4 ++--
 include/linux/nvmem-provider.h | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d31d3f0ab517..6910796937f9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1523,8 +1523,8 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 		nvmem_shift_read_buffer_in_place(cell, buf);
 
 	if (cell->read_post_process) {
-		rc = cell->read_post_process(nvmem->priv, id, index,
-					     cell->offset, buf, cell->bytes);
+		rc = cell->read_post_process(id, index, cell->offset, buf,
+					     cell->bytes);
 		if (rc)
 			return rc;
 	}
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index ac0edb6398f1..5e869d4a81c5 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -222,8 +222,8 @@ static int imx_ocotp_read(void *context, unsigned int offset,
 	return ret;
 }
 
-static int imx_ocotp_cell_pp(void *context, const char *id, int index,
-			     unsigned int offset, void *data, size_t bytes)
+static int imx_ocotp_cell_pp(const char *id, int index, unsigned int offset,
+			     void *data, size_t bytes)
 {
 	u8 *buf = data;
 	int i;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 9d22dc5a3fa5..46067a6a0395 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -19,8 +19,9 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
 /* used for vendor specific post processing of cell data */
-typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
-					 unsigned int offset, void *buf, size_t bytes);
+typedef int (*nvmem_cell_post_process_t)(const char *id, int index,
+					 unsigned int offset, void *buf,
+					 size_t bytes);
 
 enum nvmem_type {
 	NVMEM_TYPE_UNKNOWN = 0,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
