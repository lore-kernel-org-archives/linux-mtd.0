Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E675C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POiBRLzJr6/vlUN0Ai1HB7MT5c0d4fBKkoFCaQy/Nng=; b=UuR2B4SPGE1g1X
	CTUztFhsi2Y1xFrH46vsGwNkfg0ts63Z26285BwkVKGV9WDZylhgCHkMzg1vZWNtEYVbFB8CaWd79
	y0d3TYm6OqcFIxuGN5ZAccpj5CWQzpjNuIH05QH7g33NClG1VCh1VBKorC5PExF3B0wFXEvZXSLN5
	viAgRMYc/V0mWkOhUd4J7soQY4YP6kLasiQ/tH/0S0cmBaoRQl5QeWmVT/sTBuk7I2fwUlF20la8Q
	ezqpTWkJQzYFJjA1qud/O7qXrfN49YhrZK34Y+wsehTIs5/YMuQDVswpSTKC0F02sXZXSLL7EL4z+
	V84bBC2wM19ZZSOznKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFwV-00ACMi-Kl; Tue, 26 Jul 2022 08:29:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFvv-00ABkQ-Dj
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 08:28:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oGFvQ-0006c7-GN; Tue, 26 Jul 2022 10:28:20 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oGFvJ-003HT4-4w; Tue, 26 Jul 2022 10:28:13 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oGFvI-0003CM-92; Tue, 26 Jul 2022 10:28:12 +0200
Message-ID: <55668d62aad8feedb7fa78f410f4f71ecfce8c98.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/9] arm64: bcmbca: Make BCM4908 drivers depend on
 ARCH_BCMBCA
From: Philipp Zabel <p.zabel@pengutronix.de>
To: William Zhang <william.zhang@broadcom.com>, Linux ARM List
	 <linux-arm-kernel@lists.infradead.org>
Cc: joel.peshkin@broadcom.com, f.fainelli@gmail.com, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, dan.beygelman@broadcom.com, 
 anand.gore@broadcom.com, kursad.oney@broadcom.com, rafal@milecki.pl, 
 krzysztof.kozlowski@linaro.org, Guenter Roeck <linux@roeck-us.net>, Bjorn
 Helgaas <bhelgaas@google.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Wim Van Sebroeck <wim@linux-watchdog.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,  open
 list <linux-kernel@vger.kernel.org>, "open list:MEMORY TECHNOLOGY DEVICES
 (MTD)" <linux-mtd@lists.infradead.org>, "open list:NETWORKING DRIVERS"
 <netdev@vger.kernel.org>, "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT
 DRIVERS" <linux-pci@vger.kernel.org>, "open list:GENERIC PHY FRAMEWORK"
 <linux-phy@lists.infradead.org>, "open list:PIN CONTROL SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE"
 <linux-mips@vger.kernel.org>, "open list:SERIAL DRIVERS"
 <linux-serial@vger.kernel.org>, "open list:WATCHDOG DEVICE DRIVERS"
 <linux-watchdog@vger.kernel.org>
Date: Tue, 26 Jul 2022 10:28:12 +0200
In-Reply-To: <20220725055402.6013-7-william.zhang@broadcom.com>
References: <20220725055402.6013-1-william.zhang@broadcom.com>
	 <20220725055402.6013-7-william.zhang@broadcom.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_012851_489776_AA31358A 
X-CRM114-Status: UNSURE (   8.83  )
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

On So, 2022-07-24 at 22:53 -0700, William Zhang wrote:
> With Broadcom Broadband arch ARCH_BCMBCA supported in the kernel, this
> patch series migrate the ARCH_BCM4908 symbol to ARCH_BCMBCA. Hence
> replace ARCH_BCM4908 with ARCH_BCMBCA in subsystem Kconfig files.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net> (for watchdog)
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> (for drivers/pci)

Acked-by: Philipp Zabel <p.zabel@pengutronix.de> (for reset)

regards
Philipp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
