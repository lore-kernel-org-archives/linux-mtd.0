Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D2E6FE2D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfrZeX1+rhMxC/rJTKkGD/SCGvCuV/0Sq7cDOIjk794=; b=GR7uHaRLDId+GT
	SXIgqnUjBIXRELT/WHlKsoSc+3Q2LmJ58gQu2IM/0CLqJr1cphBu976NOvlymMYi88WytZ/PJ1lau
	eSThLfqxAxuSlljsJyCCn9JdTkD9wHToF2Tknr/V4k6ShdCqOqfeOrKJ/dIzNl12wzPJityZiiUKy
	0Qvo8fm3p8hVZjKF5WJ45rh6y146WRX48pBYWBgSPQeFay6leV834hM/Wt/pHXkM7169H4hvt56an
	FKdcscnSFDcmju35X5T1kL9aXPtzDyOtf3MKNZaM+zGRQsVQpHfvNxl3ewvnempNqBVjyRgoa/pmM
	upqZYnItKsOjm/HR3iWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smapn-0000000Cl44-2uNU;
	Fri, 06 Sep 2024 15:25:15 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaZz-0000000Chez-2nSN;
	Fri, 06 Sep 2024 15:09:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC05EE000A;
	Fri,  6 Sep 2024 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ly2d9EwxQYn8DsfJBD5rt/wTDTZaYNKWP55jAE7dZA=;
	b=nxej4J1szwQNb1526tnOEqIYdaSYKyTg99r7lIAHy+8jraW2VD1gInuPLTh7TYgx1JR1dO
	49sUgcOl5cp/jMtfQP8+x6Sv/K3bYaa7akahCPO5igBULKjfrDdZQTG+cehBvOss+9IjSJ
	9nx+8alEBf9roHUCupZEq74/iYz1H4Qju5ZEHbOhlcqcYJ0JKt7EJGEfnTUNATFZ+ntZkV
	94KKc3q0ZBQqcfHevFK0EKtPPaJG2i3AQclVd0R6k97iQys6HdlrbRT17UPinIAPPp/mjD
	6hPMD0x34ZLlIfD9FdBwJ2dWnLrgsOVdILs8QTxurFHuk7P7Xr06xK1nNOQ8+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Nishanth Menon <nm@ti.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Javier Martinez Canillas <javier@dowhile0.org>
Cc: srk@ti.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: ti, gpmc-nand: support partitions node
Date: Fri,  6 Sep 2024 17:08:52 +0200
Message-ID: <20240906150852.735663-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9e1a23aa86fc404af953e2ae8b1149a31f743f72'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080856_029144_EDFF8DF9 
X-CRM114-Status: UNSURE (   6.42  )
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

On Tue, 2024-09-03 at 16:29:57 UTC, Roger Quadros wrote:
> Allow fixed-partitions to be specified through a partitions
> node.
> 
> Fixes the below dtbs_check warning:
> 
> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
