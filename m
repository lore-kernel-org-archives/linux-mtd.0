Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE0C43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA4zCvrGECCHJk5MvyV9ZT5L2z2hH01DQ98t90/8qLQ=; b=XuLChxp9xNQBAx
	yYxro8qH+hMop7rAYlhh/Xw44tMorE6z79c0UiIqEVgHRWAAZonwPRfUqwU2OazDex5gRgMbRG5yw
	cePEFhf/cbutJWv7VKDDjl3ygLHt88uZciswuNokC0g/22HM4+h3MuuZcD+Tc307xUFtGqpMYGhkT
	bfY6pszXcmC1Xaor4xx+c5ZURt27g0tBdXrLLNTS1KbAags9K1fPHGLuTRY628GpH25aiS9+egzOb
	CKRvkiw72oofWVIqjeIzr8ahmjhhUsOzqaywyCzi4Uwfa4Y4YIm3qu/eeNciStEXdZEniffvK4uNM
	oW1RAENGM3XnVmz4G4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkX-0000000GQDE-0nHE;
	Tue, 30 Jun 2026 09:27:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk9-0000000GPjG-3QTX;
	Tue, 30 Jun 2026 09:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HYhkN5USyI9+utSWtbtEyPGhwEFt5jhO+BWHxjG0ySY=; b=U0Ukxx7MDH60bdt0EX/I1Vm7E1
	bBUkQnjPDC8s0Gr39rMu7ibLCubXQ/9E/eIATQPyg360+zhrdzG4eUWR+3x3akd088hB8fccTictW
	0SqCLNSIK3ceVQll/HJtf2aucPdmq/qvNy9VY4dpU0dmEVq63iDiOYDqUsHcGoiI4+RKRbt8mArw8
	eL5rDfTRi87gcwc6TnHewv5Wcqgc6Snuswpeoxcq9xaBLWmJe3gBGKinfgxxF93I04cQrXNsCFM8r
	DaAbFhv+EAh/sPzxh/KAqKsHzSxwYxaQ0OAuRPkeOX6bDnyGcv+DU2hhrrhcwNAVXooD2EgGQQhdg
	/qCkjHoA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUk2-00000001hxf-2pNE;
	Tue, 30 Jun 2026 09:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782811615; x=1814347615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JITfwfmBfz9FGpcy6YY4iQQZZ0bchSkWh6fdczzfXlo=;
  b=WNS0dx8V4Zoe6ZsAFI2BaKRCLHhXnBAPhZFjRQJYINbA/6I2Bmfhdh7w
   yQ+2s70Iv2RuQSFu6+kcPz54RQ2uK1UVBAm9HSLmSdx8z/+6X4EbGog5/
   v0IrMtEyTxYRyhGwg7pbsYkHY6ix440Ogu6PF8dUQ36nK2SHS66AlxnDI
   3jhMc1iJ1BKMrr5++DSglICwO8MVBGmSJeVP2jQguJws0nnktbhuLTf6t
   Dv8dXryl7O0/+mVwM8Tr5aJxiy3keT4Cebp63igGHVKbKI1u4BKJzwbw4
   xN7k8yVFy1j52e242GifAF1yE8b2Ssm0xOCbiXJqYqTR1kahqD1mcnd8U
   g==;
X-CSE-ConnectionGUID: lQi6qUsFTYyp4rovl1Lg4A==
X-CSE-MsgGUID: ZHDP5R5bR6ilBCfpCQuS6A==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="291266576"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2026 02:26:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 30 Jun 2026 02:26:51 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:26:42 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v4 7/7] ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout
Date: Tue, 30 Jun 2026 14:54:06 +0530
Message-ID: <20260630092406.150587-8-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092406.150587-1-manikandan.m@microchip.com>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102655_542677_DBD66ADA 
X-CRM114-Status: UNSURE (   8.28  )
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

Enable CONFIG_NVMEM_LAYOUT_SST26VF_SFDP_EUI so the factory EUI-48 stored
in the SST26VF QSPI flash SFDP can be used as a MAC address on boards
such as the sama5d27_wlsom1.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index bd7f0b5f7d66..14dda4b0cfd0 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -220,6 +220,7 @@ CONFIG_PWM=y
 CONFIG_PWM_ATMEL=y
 CONFIG_PWM_ATMEL_HLCDC_PWM=y
 CONFIG_PWM_ATMEL_TCB=y
+CONFIG_NVMEM_LAYOUT_SST26VF_SFDP_EUI=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_AUTOFS_FS=m
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
