Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CFC5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6xXgXaG4jXv4ZGcLKoso/oZ5RfVUtyi+chQxD1IN6s=; b=3ZTWvZ3c5btPBD
	wFD5LRtEnEdXmIIPK+j6Zi6RuNNyy4m9gkvMDvpwxOjUP48CzmhKz9Bp1d7xGOtZoJXJVmzpEyyed
	dGmJD1m+/vH+8p9AgQfDYGb7AzFBXhw82/G+2MGbI+dmaI/TOtzG2jkHToH8xOSrTHHPyK/WpdHX7
	52R8IYQQi2+FDsSMbONL+ujpKEHd7dcyAcDalhP9FrCw7+O+I92y3iMEm6I9I9fztP/lP8CqvuytD
	Yt+PGl+mcIrx52AQI2D88VtrKDF11t4kVyn56FBkoYkToFKTEYFoaon3MEJSuIBlF0Qpehaa2mwdP
	IAO5d4CnW7Zz862suzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Yo-0000000FxPC-49zE;
	Wed, 12 Aug 2026 10:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Yj-0000000FxKm-2ZfI;
	Wed, 12 Aug 2026 10:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CO7HOu6bSH1oWMBDH3e84cNi6QIMSBzLU3gxwG2Zzko=; b=HRnhLw6cnbwyIkMnFUCqgPPZ0v
	mjilY90m5yTUBwFXNkxFWq+317Lh1uS/qyL9ly2zklD7BiB709tYpBnD3fzMxmf4oqNFIPaPz0KbI
	zTavU6ElrZLwcaJ/XZXDA3ETw3WtnAZ9p3SAh55djLrHSTrRFRRKp+isz1zM7aHq5gl3+Ur52iEwZ
	LAXIl9bjD/RteUsnh8tCm9gnOCasfiTaSF8hkdVOxC+4+iZPM3hCoblVbNBzc5siSj6AK77ua2R1U
	jt9Cf1IqquMxev4qEPo74eTqMuXAEHtB1Dxus0c0Q14cKFO8z3mqvRm8NY+WzEtbtwy0XrWQ8UUsA
	mfSPNjmQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wu6Yf-0000000FK3G-2WKq;
	Wed, 12 Aug 2026 10:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786531901; x=1818067901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XJw3ZIVNLVIjUuPwE5g/7zUOaAo2PmxEW3WdYarUvQ=;
  b=YQW9hagdLiF5004ySMnUMpk/4aX+JTV8/h4Ahhe4gIuTgLcFmyeMucQA
   yLhKVi7oWvLmvZrPkc9gRn/xnXnzC8ULh48CXUA/qjZxLEEYnS1yxaHyO
   2iX2dxGjqy3vs1uxhCl+4NypvuKySh604INLV1MF/vRtvCpKgKRP4ljeM
   Olr1simYUieRkL86ENMgBOGy8lc8hwJwRFBjpQ/HXAR15HWHKuomjcdbt
   IqpQGiQUPM9a+xs7rDSBTSxSE4//7bu6v+BaoY6axKlgCGfKbIFsIJ7Ow
   EowvcT43Oz/Ypy9bLie+u/vIx6pVWdjdj4Ox+CAJGx0xNEzRi7G+ZIFPM
   g==;
X-CSE-ConnectionGUID: ZXSAxwFwTfufGD66zMQ6LQ==
X-CSE-MsgGUID: jXelUdznTDmVXN8PJqotyQ==
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="71673525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 03:51:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 12 Aug 2026 03:51:36 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 12 Aug 2026 03:51:25 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 7/7] ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout
Date: Wed, 12 Aug 2026 16:19:55 +0530
Message-ID: <20260812104955.485667-8-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812104955.485667-1-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_115143_001607_A19FBC62 
X-CRM114-Status: UNSURE (   9.23  )
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
