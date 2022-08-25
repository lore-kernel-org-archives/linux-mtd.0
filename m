Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B28BECAAA2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ryIE42UuPZae9Wp/bKR7Rbmn8rMkCAn/gOBpSZeBBo=; b=dHN100tYDn+61E
	C1cRVosD6nSQdP8HndfyLHKuRzEKPJKuLhu7cC0cPCCmDX0KBgzVUmCfUrknXm6j3/mnbQx/z0aZR
	g/TWSfQkOzg3S+vBrhrXvFSujxmZDXm+X+gHxF7qGtITf+PvFj09/kVlbkl+HDhckWgYNTrIk0kBa
	N7Umyjxrz7+gNQ7iC9IiT6xFL8DJ2nzkxyvHjX+bKp0klNiruVb3PWR/k/dFgAU+Xx8rCwqUF5OcF
	E1jpXZkcP8rr+POU9BWKrYxu5weknq246HrD4GgchLst8tdedqGRE+P2iVnqRX5bGfX2k1pj7BJH7
	OQpRYC+j+5b1h+7/eM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKgZ-003Yan-B1; Thu, 25 Aug 2022 21:46:47 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKeW-003XRU-Dh; Thu, 25 Aug 2022 21:44:43 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B779D7F2F;
	Thu, 25 Aug 2022 23:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmcHupI3mIbSe+IgK2Ws1BvvkDFNVQM1m+LZLWbNFnw=;
	b=BNSJKr2FuITRBJeIaRpiDsHPg+a3EQLU/2iA0my5HhI4JmThIC0kK6rQPATo0pL7Q4eEcH
	LjUz0dhNZgSJW3WuHOjYFIM2kL4/QbvUpWfLKwEo0nTOy8/Cft6mBv98NMo6qL/RWgPlo3
	A4uQ3EJCk2nRejzSa0W3u1IY43kyfPObPxXu9tr3ZrfICvmjabfbPSsgJ0tIxjJY2GFGYE
	k8tKKfVvZtYH+Nw2Q4f/JWGXCB791/+1X/+YJDFURGn7axpJPdEAtNs7B2kZT7yxLjoA+i
	bYPQAQo7590N+my84L+ymvOoWT1CqWtuepDIeu+R8/SdnSjfFmL+12yW5n0lmQ==
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
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v1 02/14] of: base: add of_parse_phandle_with_optional_args()
Date: Thu, 25 Aug 2022 23:44:11 +0200
Message-Id: <20220825214423.903672-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144440_740858_D2CC200F 
X-CRM114-Status: GOOD (  14.16  )
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
