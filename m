Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA80ECAAD2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9SnUOZuFyHeWG6v30nLjc8mPtA2MdWy8NnZ9FkBvLg=; b=eORQdKBrwui9rM
	fM+ohTE9yEgppj2xmj1poVsnneBoPw4SYuP5o2dKPscSTTdHX8dcXlL8GRlex8yyaOoXIClfT90cx
	CnMCkXVb+KmkEamx+36axm7F7mGf5E1223vb3tb/aokw8y6UUHS4239MrEihK6+s/2BmKjfSmExXC
	bX6G6UYfuwA89exCPyXybOzxrY4dNKULf4RcMS0ut915DVSLQbVpQj3tYPwku7zP3yxRIddomfpmY
	d3DBLX5Nqiew9TBEkTIYtthly9giAySEReNXV25vyWJhnwEiMEEeHSl/ctfzZLFRHOJK2OxlurfMk
	iizy3PEM7q+spPC+4UZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsXu-00FFMv-Ip; Thu, 01 Sep 2022 22:20:22 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWr-00FEYD-LV; Thu, 01 Sep 2022 22:19:20 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F109321AC;
	Fri,  2 Sep 2022 00:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgDOWLqHqJzz1nUsUJVPJH/GeDuSfhFT531Ll207Vjc=;
	b=YlTsLPYHXzE41fxjgLTvg8ha8vBrNGgdjudoQW76wZh2BkH8IWsXv1ZDGa/OYwMvNODZeo
	Dcd11In1QBgFWOzVOsuO42ma6Uhpsat534Ipupk+1YLKjRjncN2kU5AS5goRBYtBa/LYPP
	S2KwrZ4EFmF4WQszSBgyNUAaqmkH/xz+raelh7iuXhP4wIfDfx4p58RMgbcf76zH4OS5+y
	NMxNB4gdcx5Gug6L73hIcLb6eD4Sy510kmuBB0BHArRLSMnDiGQSmNXsqQkiG1tTQ75g3V
	6YxSqOdw1ZNdqbOGdm/XQd9NUSiYqSj10wlx6d9mUqvXRwoozXikhX93Fxxr6A==
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
Subject: [PATCH v2 04/20] nvmem: core: move struct nvmem_cell_info to nvmem-provider.h
Date: Fri,  2 Sep 2022 00:18:41 +0200
Message-Id: <20220901221857.2600340-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151917_879319_9A866605 
X-CRM114-Status: GOOD (  12.78  )
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

struct nvmem_cell_info is used to describe a cell. Thus this should
really be in the nvmem-provider's header. There are two (unused) nvmem
access methods which use the nvmem_cell_info to describe the cell to be
accesses. One can argue, that they will create a cell before accessing,
thus they are both a provider and a consumer.

struct nvmem_cell_info will get used more and more by nvmem-providers,
don't force them to also include the consumer header, although they are
not.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - new patch

 include/linux/nvmem-consumer.h | 10 +---------
 include/linux/nvmem-provider.h | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 980f9c9ac0bc..1f62f7ba71ca 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -18,15 +18,7 @@ struct device_node;
 /* consumer cookie */
 struct nvmem_cell;
 struct nvmem_device;
-
-struct nvmem_cell_info {
-	const char		*name;
-	unsigned int		offset;
-	unsigned int		bytes;
-	unsigned int		bit_offset;
-	unsigned int		nbits;
-	struct device_node	*np;
-};
+struct nvmem_cell_info;
 
 /**
  * struct nvmem_cell_lookup - cell lookup entry
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 8f964b394292..14a32a1bc249 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -14,7 +14,6 @@
 #include <linux/gpio/consumer.h>
 
 struct nvmem_device;
-struct nvmem_cell_info;
 typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 				void *val, size_t bytes);
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
@@ -47,6 +46,24 @@ struct nvmem_keepout {
 	unsigned char value;
 };
 
+/**
+ * struct nvmem_cell_info - NVMEM cell description
+ * @name:	Name.
+ * @offset:	Offset within the NVMEM device.
+ * @bytes:	Length of the cell.
+ * @bit_offset:	Bit offset if cell is smaller than a byte.
+ * @nbits:	Number of bits.
+ * @np:		Optional device_node pointer.
+ */
+struct nvmem_cell_info {
+	const char		*name;
+	unsigned int		offset;
+	unsigned int		bytes;
+	unsigned int		bit_offset;
+	unsigned int		nbits;
+	struct device_node	*np;
+};
+
 /**
  * struct nvmem_config - NVMEM device configuration
  *
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
