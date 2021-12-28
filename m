Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C70C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoFd1kZhpducSXCW+HcZ0Ae+d7TI0+UlR8j7E6+zKq4=; b=WSFwxiNVwIof1p
	15u6EEGFjpAo8A0/QiOEyuQQdE4a0Agh6/B+bulpwy/MMndF1Wl3Os3NkoneT3u4BXMbt+eKu2s2Q
	+kqHwJZEyLOJluriPoLHUfg8Br7yIZydib+WZ0X1iFCg5YXNR9Vg3n7z5MmymJCdQbAL6STFeMniQ
	zjoodeFRULMpind90PUGdZ3KM4bQpMXwEIqBj6pW27bU3vWDN1ZLS4oJP54vot28LhPrn246yiWtO
	zmMuMp+1gSigSyAnjHzmWQ18g9Esv3AvP8eXtGC+KV0KAZmwcGLStoRaNOf4s8eq/vhwRlTYg36uE
	JHFd0DXGUHASNyWrlbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DRG-0017B3-Rk; Tue, 28 Dec 2021 14:26:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DQh-0016yM-IK; Tue, 28 Dec 2021 14:26:21 +0000
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6FE7A223EA;
 Tue, 28 Dec 2021 15:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640701574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9V3jjNX+h+SC4H3w7ArRhed6jMoCjU/AbUnBIS3w/EM=;
 b=LLhbIGksetqq4w9fP6GpIS0VEN7pDz+IZgJ9KsI4qai8ysx1kwMrd4/YF7cwhZYcSSBcrK
 ZAonKjulneohhOMhH2XUbPNhfnAKdBQ54/RjwWXzwP55OmrwgzpIhYMc//gUFNTSRkaVdC
 +5oBNdiL6m7B4iMg0FCyoQJm9XV2qIs=
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
Subject: [PATCH 1/8] of: base: add of_parse_phandle_with_optional_args()
Date: Tue, 28 Dec 2021 15:25:42 +0100
Message-Id: <20211228142549.1275412-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211228142549.1275412-1-michael@walle.cc>
References: <20211228142549.1275412-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_062619_805155_E655BA25 
X-CRM114-Status: GOOD (  16.23  )
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

Add a new variant of the of_parse_phandle_with_args() which treats the
cells name as optional. If it's missing, it is assumed that the phandle
has no arguments.

Up until now, a nvmem node didn't have any arguments, so all the device
trees haven't any '#*-cells' property. But there is a need for an
additional argument for the phandle, for which we need a '#*-cells'
property. Therefore, we need to support nvmem nodes with and without
this property.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/of/base.c  | 23 +++++++++++++++++++++++
 include/linux/of.h | 12 ++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5b907600f5b0..fb28bb26276e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1543,6 +1543,29 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 }
 EXPORT_SYMBOL(of_parse_phandle_with_args);
 
+/**
+ * of_parse_phandle_with_optional_args() - Find a node pointed by phandle in a list
+ *
+ * Same as of_parse_phandle_args() except that if the cells_name property is
+ * not found, cell_count of 0 is assumed.
+ *
+ * This is used to useful, if you have a phandle which didn't have arguments
+ * before and thus doesn't have a '#*-cells' property but is now migrated to
+ * having arguments while retaining backwards compatibility.
+ */
+int of_parse_phandle_with_optional_args(const struct device_node *np,
+					const char *list_name,
+					const char *cells_name, int index,
+					struct of_phandle_args *out_args)
+{
+	if (index < 0)
+		return -EINVAL;
+
+	return __of_parse_phandle_with_args(np, list_name, cells_name,
+					    0, index, out_args);
+}
+EXPORT_SYMBOL(of_parse_phandle_with_optional_args);
+
 /**
  * of_parse_phandle_with_args_map() - Find a node pointed by phandle in a list and remap it
  * @np:		pointer to a device tree node containing a list
diff --git a/include/linux/of.h b/include/linux/of.h
index ff143a027abc..ccace453d25f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -376,6 +376,9 @@ extern int of_parse_phandle_with_args_map(const struct device_node *np,
 extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
 	const char *list_name, int cells_count, int index,
 	struct of_phandle_args *out_args);
+extern int of_parse_phandle_with_optional_args(const struct device_node *np,
+	const char *list_name, const char *cells_name, int index,
+	struct of_phandle_args *out_args);
 extern int of_count_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name);
 
@@ -897,6 +900,15 @@ static inline int of_parse_phandle_with_fixed_args(const struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline int of_parse_phandle_with_optional_args(const struct device_node *np,
+						      char *list_name,
+						      int cells_count,
+						      int index,
+						      struct of_phandle_args *out_args)
+{
+	return -ENOSYS;
+}
+
 static inline int of_count_phandle_with_args(const struct device_node *np,
 					     const char *list_name,
 					     const char *cells_name)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
