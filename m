Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431C7CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TP/3oxGOfU/w36uUFr9rRArveEJ5JVp0k1XD1efGqaw=; b=ZU2nqFFrNXnOYP
	4CXKe057lmnR64E/ABue2Ctujwgav9QP8u4deiW6ST1e74JVKS5daySvNQKdsU9tK/s7BhTMvb6RE
	lIre8Zh+1o4fkooRoPbDJkl2+EQwnIVvN8zuNx7mM5TZyFu/zSEwyDmGOdr9KHOh6tlgVZXrYQlnf
	2TBR/NBFLf9CCgKygs4+SSmxtNLzFkSJ7WwMl//G98l9Um/pqdXqbh49Kkk2S+XFt43voLB4vNEEv
	Pr7kcKJXhBjwK0dgg1XFQYnZIn7zbg9/Z7KoVMxsUnW72sJtc173dZ2YTPx5tWbDW13EoO/RifTz/
	bkNNfEgQxnRTieIp6h+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsgd-0000000EdOi-2xq4;
	Wed, 14 Oct 2026 06:42:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsgc-0000000EdN7-2keR;
	Wed, 14 Oct 2026 06:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TKjbAsClJpZLD5i02cC5z5UANwwJiVkGloR3RRouvvs=; b=MGCx8lUTAuUtqI9FMVo0zbQ2Wn
	/Yz3Muj7GTWBuV3Siu1WPIaesg/huoRyIoIc4p8Mew20xmL3Zk8R9k0E3t83LY5JqjVAMhk4XtYxK
	H37TBJhJGBsz0TY52dJSv5HbgO6NexT2Fl9wq2m780s8yy7wxSJxavYm3QrV7etgB0kzQFV++1HAm
	JqPaBPA7p33F40zCqdNnzhPzoF/qbeCYJazS+MK+H2aYr7tuEiseHvNZgp9zh4uQziIlybp0+lJ2y
	gANfLWzRYe0RgTdl8AHT3eFs3fc7Y+eFVLP1hnhnumoRKc2B4DDOLuXfMQMkU1yws24XuBgD7Bp40
	6EGcK7iA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGsgZ-0000000GPJv-0GMn;
	Wed, 14 Oct 2026 06:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791960118; x=1823496118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o72n1cSWA/x66f0FI2qYr1BLdnEOvPwevayrmClAUPE=;
  b=jgrxIYYf+B0vzcD6kB90IH8ealC3vi17BvXDYr4u9Z2C52FV2zQ7ySZo
   40iXQBdL7Sp2aG6T6Ul5OZNi5chlUyzBTZF5LFbDTtFRkU9+KJ80zFy/E
   dlDjv/oivbrLIsZe2WUcrDuhx1y4/WXviskqLbrLBa1fflqB8eFRIb+Dy
   pSR3zh3ukhnr/N53TCzhG6JQdb8IQJnk8mUwlFXLEFJnrTN2bpHJs49e5
   4DZ+Ms+FQgmyTphbjX+Q/mGBPeyx2zALUJJy0PwX+RC85b1GA49XLiUnb
   Z9f5E/9owwGMkwAH+cWbJQGKkmsCKa4Ria4nm8wF04c3Ui41EE3hbs3rp
   w==;
X-CSE-ConnectionGUID: E6UD/4c/S+2Gk9hz6D3ZCQ==
X-CSE-MsgGUID: 6+O+i4/pSjSq8LcJWDXNQQ==
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="232101734"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 23:41:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 23:41:55 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 23:41:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <aaro.koskinen@iki.fi>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v8 8/8] ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout
Date: Wed, 14 Oct 2026 12:10:12 +0530
Message-ID: <dfe67f77151c9e2271477bd30a5262fbacea9a4c.1790847519.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_074159_765464_E9BC72B8 
X-CRM114-Status: UNSURE (   9.57  )
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
index 1eafad9139f1..f8cc94106c54 100644
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
