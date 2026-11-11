Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F728606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cOogdfT1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IqZh77k+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=skujzIZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yvxblVcgfUqG2gTfTup5IwOj5Znuywq5UDBk3Mh3epQ=; b=cOogdfT1fOs6NWr8c58BlVdhHY
	GPEZTSc17bzm82DS/2RFVZFYnhNxRHc5Ukzem3MhVx1sOVECR9QumxghtKZhsPUKRy6mbtFxixnd3
	ZRht76dOVsy07rtgmH7oyANQgmBmjBMxFHFziGHCtazdDxMzQxkg1ydZlrowT13QSo8FTu0dF8dnA
	g7qlXMWhrFs6qpdM6bR/+FAk5qg5V9RGLFeiXkPv4PPUfr3hUhEaYGdl4mrTLHVenAgaUmuttVCVM
	0dRRo4r8+2sQOJJ4HofS/qguTX0Y2PUf1KB4p1xQC8U3Bgqmqo1vphSFyzVis2igNxeMFaf1gLixf
	v5say4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6x8-00000006aDn-19wV;
	Wed, 11 Nov 2026 11:57:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6x6-00000006aC3-2zk7;
	Wed, 11 Nov 2026 11:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LY2SWOxsJqbOxznpwl/qTBJZaImhznfIoKMaO+d3rnA=; b=IqZh77k+I5RpI69xF+N54gJz7F
	KWnXfSQ/T2lsnBWiNTDK1PopqL8GrnsILbnLtdHo/6l9Qr6gVZ29Q5qbXb45jno0HJDtdY5BwXftZ
	fbxyEJDiyNfUmW9eFR3iwb2ne10EdUyHlRrHvK/CKE6fTUxjuq5NKJ+TB8AEyrKarp9rGacONhRCT
	TZz19j+/ELpnYne3V1zXCXZrLE5VxLStdqrzVugbpmH5TVDi5Repy+cQGWU6u/8/4uKyOxVjlVTFK
	5S1SluLEJX5v2ZHDTWk6zY+WU5gEzZiGyC+CVCLMiqNfDQ4XWGt8sBSrqofJ5CsM7oDZ847N7fTgP
	EDY9BJvQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6x3-000000095wH-3DWD;
	Wed, 11 Nov 2026 11:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398237; x=1825934237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AP1aVJcfWeQCRbRFuJA0bQ52dwt1E9dh4XOxNt6hqek=;
  b=skujzIZTeAx6npnbWPruoD0gHMO1LJuZ4TS7r6vbwSw1Yl725JAIyVFI
   RW4sg9OdRBTg2DJLWhXL2vbdhXpxyB5+J6M8FOGyvRQx1tTapImP04DT5
   5ma7yQQqgHGpwBnwHmSBnIsYHolGa2vGH9PwmK0ojEXNaBGrxIq6+oEvC
   1j0GhZiVfv0AeYkA7prY9i/nVkh4+hAtxi7yZTJJUyJeqJDYanfMAT8n2
   8rh/VNlqkK/ZMtUkYI+EH+zcDQlYW6AI0iwWW8AfvfJ8xYxhOoLO7ntNw
   SOyi1PRC/YqdruHsxQIwihjUCAZnQtKs7iLKMZ6Yz7T4wH9R12xtNbQ8V
   w==;
X-CSE-ConnectionGUID: uIdH9OJaSL+y3CqrjVwKMw==
X-CSE-MsgGUID: IQ4DUsstRnW4Mz9MkZGS4Q==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="66350199"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Nov 2026 04:57:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Nov 2026 04:57:11 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 04:57:01 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <enelsonmoore@gmail.com>, <aaro.koskinen@iki.fi>,
	<pengpeng@iscas.ac.cn>, <mathieu.dubois-briand@bootlin.com>,
	<gregkh@linuxfoundation.org>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v10 8/8] ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout
Date: Wed, 11 Nov 2026 17:25:40 +0530
Message-ID: <04714d8fecbed1fbc8401742087d0c7591359d4c.1794391660.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794391660.git.manikandan.m@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_115717_967557_277DFD82 
X-CRM114-Status: GOOD (  10.03  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable CONFIG_NVMEM_LAYOUT_SST26VF_SFDP_EUI so the factory EUI-48 stored
in the SST26VF QSPI flash SFDP can be used as a MAC address on boards
such as the sama5d27_wlsom1.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 6e5f845e95db..4eb3238af5b7 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -219,6 +219,7 @@ CONFIG_PWM=y
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
