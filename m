Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9An4Pnfy88RBZOpxfzEV4UDM02VmzDlZ48TaQCZanY=; b=KbLN3b0zdkkWdU
	DlayK2FuKriuyxwrQ1cumr36FDl4wGOJfiM154WzwEBLwy6CxlXDlgi4kWY4qCg6dCZX2WQysCSTq
	HLqzak4ClNK6GGOOsjcpV1w/j40FsDMUlQai+VHo0reiqF2jWu7pIqCS295OrVyXt/MtidGHZhZyf
	/xG/oNSDyGWvjJX9owGr+hfJs6GkxSCNAlL1BGAOicddtJLZ9cogmq1yGHREyXcLyUVqJ24Hu16J0
	oLLiPvaoi6FfHsmejG53lW0FzRaoHuw7MHVizNcIzub6pEko9HCSs/e8IgGo6/6e2VEVZjs0KgYrA
	ABPjszeJp9CRr7Uw6txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DXe-0019Y7-H7; Tue, 28 Dec 2021 14:33:31 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DQn-00170I-G6; Tue, 28 Dec 2021 14:26:27 +0000
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E1843223F7;
 Tue, 28 Dec 2021 15:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640701578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8u32QLgP+bx/Avj9/UQOtx/OkwJzp0bCtXU3LJH76Fc=;
 b=rzSLw3hes1+GfIvB++uAojB1vhiOCMw7vvcHgxa+s1zaJWBQvAiY+q7T+ZMDnLMLWnGGom
 6CB6wl8wSGdh6iKpLdafzYSskmGWj0amUyv1546atnOWJRoeOOkoUdgMt/YpMikd8u4S5L
 /7EWzYL0lSOPqOcNW4K5NZ0x6sYrdGc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 6/8] nvmem: transformations: ethernet address offset support
Date: Tue, 28 Dec 2021 15:25:47 +0100
Message-Id: <20211228142549.1275412-7-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211228142549.1275412-1-michael@walle.cc>
References: <20211228142549.1275412-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_062625_739302_BC8BA3CD 
X-CRM114-Status: GOOD (  15.73  )
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

An nvmem cell might just contain a base MAC address. To generate a
address of a specific interface, add a transformation to add an offset
to this base address.

Add a generic implementation and the first user of it, namely the sl28
vpd storage.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/nvmem/transformations.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/nvmem/transformations.c b/drivers/nvmem/transformations.c
index 61642a9feefb..15cd26da1f83 100644
--- a/drivers/nvmem/transformations.c
+++ b/drivers/nvmem/transformations.c
@@ -12,7 +12,52 @@ struct nvmem_transformations {
 	nvmem_cell_post_process_t pp;
 };
 
+/**
+ * nvmem_transform_mac_address_offset() - Add an offset to a mac address cell
+ *
+ * A simple transformation which treats the index argument as an offset and add
+ * it to a mac address. This is useful, if the nvmem cell stores a base
+ * ethernet address.
+ *
+ * @index: nvmem cell index
+ * @data: nvmem data
+ * @bytes: length of the data
+ *
+ * Return: 0 or negative error code on failure.
+ */
+static int nvmem_transform_mac_address_offset(int index, unsigned int offset,
+					      void *data, size_t bytes)
+{
+	if (bytes != ETH_ALEN)
+		return -EINVAL;
+
+	if (index < 0)
+		return -EINVAL;
+
+	if (!is_valid_ether_addr(data))
+		return -EINVAL;
+
+	eth_addr_add(data, index);
+
+	return 0;
+}
+
+static int nvmem_kontron_sl28_vpd_pp(void *priv, const char *id, int index,
+				     unsigned int offset, void *data,
+				     size_t bytes)
+{
+	if (!id)
+		return 0;
+
+	if (!strcmp(id, "mac-address"))
+		return nvmem_transform_mac_address_offset(index, offset, data,
+							  bytes);
+
+	return 0;
+}
+
 static const struct nvmem_transformations nvmem_transformations[] = {
+	{ .compatible = "kontron,sl28-vpd", .pp = nvmem_kontron_sl28_vpd_pp },
 	{}
 };
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
