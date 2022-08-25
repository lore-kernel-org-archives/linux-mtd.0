Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2EECAAA3
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbWpXoQn4xt1FArwcgolBqr8WCbH9G7sa+zgPE6uBVs=; b=kgcgGubLeltrdq
	Srz3IbrgI7/gdUuirtMqI5O4en2gDVBG51EZRTpWVTgzTHy5Ypz/XsH/tl9Tbvd1lg2tBBsQadIyj
	Ryc1rfYqWL2/sRrlCf6y7K2bnJVX0ubFc4O8lBadVUPrLwSSBZUvEISot+gpyLJJuz56a5fEtU9DD
	NCHfiYmS0lOkWIjHL3xZVLniP9C33uZAvDEGhFpLTkx8Yk95daBtJL3lXed6zGeCYMqjIBtRaowqQ
	JsMPremqUjrDU+CiIQ+uc+vulBWjv5Cl13bXP1DMptARAC2SeGh3JDdNdzaFfmM7mhcK2bObhnkVj
	k9LnOjvGitZ1oVBszbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKen-003XcC-0y; Thu, 25 Aug 2022 21:44:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKeW-003XRG-De; Thu, 25 Aug 2022 21:44:41 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 161817F2E;
	Thu, 25 Aug 2022 23:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zX8TjV8dOnJxKMl5NAJkTUty3DOJ6KEgZ/kYBbKIV8=;
	b=XB4NXM872kGcTLCruhp6Nxw8vdVKpW5vwcqPrnH+OYu9aer1qGfz9rzEpjs1Crf2KUV/Qm
	FOCV8bfXuLjziajVsbUgw0I2d1nBm5dDWGTNmrUf9jOlHfwjUrXUETkUiZ6ZsPutscxK/P
	oYXnPf3S3zwyW2XCRVXGEvWwa+L3lY1R6Z7AOUe/YeICN0Z/5KfCORfonTzK878knZ1cYb
	TbPl0A0Ax0+uiMmaCn/mTIPCTV7Y12/JB0NntKeuzVXIkwMWalRaTwarHT2fYO3XIujh9M
	iujJat5JCbPNiNnCUXu65BFQztrE8u7JoaHIrOKLPIImJjtkQ9ng5wEGF6uyyQ==
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
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 01/14] net: add helper eth_addr_add()
Date: Thu, 25 Aug 2022 23:44:10 +0200
Message-Id: <20220825214423.903672-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144440_653041_CF1E0ADC 
X-CRM114-Status: UNSURE (   9.54  )
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

Add a helper to add an offset to a ethernet address. This comes in handy
if you have a base ethernet address for multiple interfaces.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 include/linux/etherdevice.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
index 92b10e67d5f8..d1be5ca4d5cb 100644
--- a/include/linux/etherdevice.h
+++ b/include/linux/etherdevice.h
@@ -485,6 +485,20 @@ static inline void eth_addr_inc(u8 *addr)
 	u64_to_ether_addr(u, addr);
 }
 
+/**
+ * eth_addr_add() - Add (or subtract) and offset to/from the given MAC address.
+ *
+ * @offset: Offset to add.
+ * @addr: Pointer to a six-byte array containing Ethernet address to increment.
+ */
+static inline void eth_addr_add(u8 *addr, long offset)
+{
+	u64 u = ether_addr_to_u64(addr);
+
+	u += offset;
+	u64_to_ether_addr(u, addr);
+}
+
 /**
  * is_etherdev_addr - Tell if given Ethernet address belongs to the device.
  * @dev: Pointer to a device structure
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
