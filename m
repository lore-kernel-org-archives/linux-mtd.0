Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF41EC433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 22:04:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887C165015
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 22:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887C165015
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6rCceUa4wBJeNKC0wKw+9BXdscdL8X49euOvghO0QY=; b=nHldhNyGAV9BP5vHyf28w2zs3L
	+qskfNwsGFPn74sXR+u/PHlxLrX12Z4G5Eg5lQ5JunnLnw+qQlcor5nRxro/bXOP1ZFcZ9ZsxvmhF
	iOQ8r1kkebjyA29VT8TpBBkuJl9x5SAT6IzGjl1uw0qi/3kiUkFNEev0qtbfTi7asoS2YUMhizJBU
	qe5p7oLI9orrg8vxkVrSdBpN3GG/crIjU9zvO4oaSkAwt6zsBmgP2ii5AdkOQjNOreLenKp2Aiq9x
	CwpC56SVB4Xu54T82lI6qjqHMGnOCicaXzW9RG6oUkX88KnOCPDxDNzY7G5EHTxJZpHfXZlGn8gVA
	ZlwTBaoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJkRp-005Wfl-57; Tue, 09 Mar 2021 22:03:25 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJkRA-005Wc6-Qo
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 22:02:48 +0000
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139]
 helo=tharvey.pdc.gateworks.com)
 by finn.localdomain with esmtp (Exim 4.93)
 (envelope-from <tharvey@gateworks.com>)
 id 1lJkQy-001Npo-Fs; Tue, 09 Mar 2021 22:02:32 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 3/4] dt-bindings: arm: imx: add imx8mm gw7901 support
Date: Tue,  9 Mar 2021 14:00:13 -0800
Message-Id: <20210309220014.22205-3-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309220014.22205-1-tharvey@gateworks.com>
References: <20210309220014.22205-1-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_220245_117774_835CEF1C 
X-CRM114-Status: UNSURE (   8.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Gateworks GW7901 is an ARM based single board computer (SBC)
featuring:
 - i.MX8M Mini SoC
 - LPDDR4 DRAM
 - eMMC FLASH
 - SPI FRAM
 - Gateworks System Controller (GSC)
 - Atmel ATECC Crypto Authentication
 - USB 2.0
 - Microchip GbE Switch
 - Multiple multi-protocol RS232/RS485/RS422 Serial ports
 - onboard 802.11ac WiFi / BT
 - microSD socket
 - miniPCIe socket with PCIe, USB 2.0 and dual SIM sockets
 - Wide range DC power input
 - 802.3at PoE

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 297c87f45db8..9af86ce3142d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -684,6 +684,7 @@ properties:
               - gw,imx8mm-gw71xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw72xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw73xx-0x       # i.MX8MM Gateworks Development Kit
+              - gw,imx8mm-gw7901          # i.MX8MM Gateworks Board
               - kontron,imx8mm-n801x-som  # i.MX8MM Kontron SL (N801X) SOM
               - variscite,var-som-mx8mm   # i.MX8MM Variscite VAR-SOM-MX8MM module
           - const: fsl,imx8mm
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
