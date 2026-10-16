Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BEECCA464
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvxblVcgfUqG2gTfTup5IwOj5Znuywq5UDBk3Mh3epQ=; b=3NFahwfN2Bgrrh
	WPlJ/8C4dQ4B1GXBjcZufaeyp453O+JwUf5YZlZm1ChVZzRIl1R0blA4wW+lF7ovoSBxnpad0Qaoh
	aC0IjdvwgnaiAM3pp/uWj7Czewd4ZP7Tfwc38uCxmxTLAdLY9Lg/+HCt7UPRMpS7nj1jawu1oNhib
	uAN2GGxCBeXEj7kqMKGR+LCZW55E88a64lM29gEyCKNuM2iaKmS2WzVwW1PWbW0678LCIkVcchNGp
	d0gYGMumTvZ1GCEznlLzKb8aRAs4nul7+n4gM4rT0mYkDsN31ltMNv3UYJoHvekh9Dh+KESWMK5Xd
	9SRY06HSNKZ6ZTSccNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfMR-00000002gNI-3RHQ;
	Fri, 16 Oct 2026 10:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfMQ-00000002gLU-1XOB;
	Fri, 16 Oct 2026 10:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LY2SWOxsJqbOxznpwl/qTBJZaImhznfIoKMaO+d3rnA=; b=RYww8p6sE+kvZhSMKfCQQHz8EH
	Sh9rG7ZWWW4Mtrq0HnAiuKuocNYe4WfMA2j0JGMsXz9+wWUsSHAyCiLarNL0CzjMSCjEuhP6OZjaE
	XDXzUUKSvHC7hlMkMYz5Afc1B1n1oJPrkQG+s6GcYqWdQit2IzmXVFnVomuzwkeaF7ADve0hpvRPU
	XPBPERnRrPUPvrQWcrCU5zyW2d6cEylN9BireHPQeJp1/AUAM8P1+uFTtZ/s69S+/fOpytzweeUT+
	pacCrwpKlDz6JBpMuoIsiuye9/0M1+ZhaWSet3+vDMayie33yamlLNsVYR14sGQrtn7mMcsVKTkXl
	C3XX3Nkw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfMI-00000001Oiw-1C36;
	Fri, 16 Oct 2026 10:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792147219; x=1823683219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AP1aVJcfWeQCRbRFuJA0bQ52dwt1E9dh4XOxNt6hqek=;
  b=tJEPv7nE8k0Gr3xUNk72D3bkaDvJ2WMwvr4tJWea/IC4xqr1eYCHzv8i
   IEgQYQJd2eudHRsSDZX0RiNMcXWfZ7P0WPHbU0hzBwX0Iul5MpdXqOZ1x
   xR398lEHoWxY61fNPBbSNUizeSw3f2aNLu57EHRYNQmrMOm3ocIcNtArU
   mNat1DUNvWdxgJpvfsifU3Kt32pGqcSNP3Oo60kLrygyVSKj8J6BK8cpp
   eVno7GsenthGklA8Iwsyshb21U8nofpbuxK1WmudML67w8vQjJlmIdlUm
   /u8amoIiVLu9xZvFBKdYicQuPobNKVsCjB88XeUO59o8inmqOwbuB02Hj
   A==;
X-CSE-ConnectionGUID: YKmh5CJ2S++Y+0yvb1ZVLQ==
X-CSE-MsgGUID: esKNX6LQTZyXkh4aR9SWAw==
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="75541342"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2026 03:40:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Oct 2026 03:40:15 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Oct 2026 03:40:04 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v9 8/8] ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout
Date: Fri, 16 Oct 2026 16:08:36 +0530
Message-ID: <0c11ce03944466fb2a579dd1cb774ede550fb011.1792145382.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114023_467595_A9DE236C 
X-CRM114-Status: UNSURE (   9.27  )
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
