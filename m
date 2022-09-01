Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7719FECAAD2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV8/avA5Lqc4iis6Y1nGC0heF6bYIXJgJJLf1PL+alE=; b=dVy+yc1505utoO
	SDs2HLS0VHT3rNpXA0EG37xCbhxQZrW+VG6T4oOoNLJSUbpyCASgTDyzw44Spp/4djG2tsUrZVCQn
	MaxbpRyLFyIz9MHu4vzsPpszr97UGThs/WodDSqVClDpYInfSdV1Jr6hx25sA359wWXw2PJzRoT86
	7/lxpz1w/4liZE0FNQMJKgzaJVpe0obDsfdrwfNONu9EvN0Wl/SGMX5ieR8RQLPoaxcIxnIf28djZ
	puINySHtl5JMLYnrG10OqqENUqcKb79B2kzWEMQDQqFWwVruBbQpvWTHA+Cl1lYC89rDCAJnMfPmn
	fK0zrQMBD/3cvO36CeOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsXI-00FEva-5k; Thu, 01 Sep 2022 22:19:44 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWq-00FEXt-V2; Thu, 01 Sep 2022 22:19:18 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B53E82174;
	Fri,  2 Sep 2022 00:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPTSNnKuOZ7slK5iP2y/D4YlHgeHTfE+RpZ3l5g5oDE=;
	b=xVw9apIIeycfaSw4xC5V+V9aqeQ+Yhu7JgXVUqFEgGpHNt0DbYiOqB8hQx+rwVIBbseS4d
	Xv3TdS7ReFq+ZB1fdj+y2qCBF0DQM83gQ+8gZ8kmRZQ/l9ICbqBTm8XCEr0vIl/w24trl/
	2vfBccFYhuNqgWqEOmOVCiXsN9zNWyey4vjN/ju14C4YANPzHhk05uJMSRh+uxLgFTdfXY
	mQzyWJY61bzFrBiiEMNwiARl0UJs+GMQXNhYX9oLlNqSxxv93+HmO7pP1wlga2VCGiemE8
	JBARPRLsKjn5pSrAG1/4uHSrt/86WceOjMa8wmu5BrkTSlcYo3EU2VHv2qu4wA==
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
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/20] of: base: add of_parse_phandle_with_optional_args()
Date: Fri,  2 Sep 2022 00:18:39 +0200
Message-Id: <20220901221857.2600340-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151917_186248_49B6D291 
X-CRM114-Status: GOOD (  14.78  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
changes since v1:
 - none

 include/linux/of.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 766d002bddb9..a0fe1a017452 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1008,6 +1008,31 @@ static inline int of_parse_phandle_with_fixed_args(const struct device_node *np,
 					    index, out_args);
 }
 
+/**
+ * of_parse_phandle_with_optional_args() - Find a node pointed by phandle in a list
+ * @np:		pointer to a device tree node containing a list
+ * @list_name:	property name that contains a list
+ * @cells_name:	property name that specifies phandles' arguments count
+ * @index:	index of a phandle to parse out
+ * @out_args:	optional pointer to output arguments structure (will be filled)
+ *
+ * Same as of_parse_phandle_with_args() except that if the cells_name property
+ * is not found, cell_count of 0 is assumed.
+ *
+ * This is used to useful, if you have a phandle which didn't have arguments
+ * before and thus doesn't have a '#*-cells' property but is now migrated to
+ * having arguments while retaining backwards compatibility.
+ */
+static inline int of_parse_phandle_with_optional_args(const struct device_node *np,
+						      const char *list_name,
+						      const char *cells_name,
+						      int index,
+						      struct of_phandle_args *out_args)
+{
+	return __of_parse_phandle_with_args(np, list_name, cells_name,
+					    0, index, out_args);
+}
+
 /**
  * of_property_count_u8_elems - Count the number of u8 elements in a property
  *
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
