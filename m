Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8AZb8uyxTYav9rgR9/n3d/ZwHCqD6z7QPVqgxE0oNQ=; b=3u/h5wm8Ol7jP9
	uKwF4nN85DtKgphsk2Iw+84y5jlAJVGFc6piSGz4n+Q+FdOzNDjUyDoEhZa5j7076RiLiYtQMIABw
	Bvn2nKX+nWN02EDKU7DrGErBr7XNuu5sA7QehYVFQUpOf/fyuK0IQTfYPlKz/8nfCFXFkqM9Tkxow
	hXjrMWQomRt4EyOpsic3rg3hRVjCXX4AMYX4uiLG8zknDNm204aEixVPps2vLfA4zcMYT/Ol7qx65
	RailivsdnvIMGCrr61Vm9uixU/uRzMRuKxlJWpN/nBcupjpxMwwO0n8SVhNDrK+tmMJiareFPuQr7
	DNO9vU8X9YjLNxJf4CRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9jxC-000kp1-2E; Tue, 18 Jan 2022 08:34:58 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9jx0-000knK-Ut
 for linux-mtd@lists.infradead.org; Tue, 18 Jan 2022 08:34:48 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n9jwe-000196-OC; Tue, 18 Jan 2022 09:34:24 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1n9jwc-000D8k-6O; Tue, 18 Jan 2022 09:34:22 +0100
Date: Tue, 18 Jan 2022 09:34:22 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 0/4] Fix and improve gpmi nand on mx28
Message-ID: <YeZ7jjzaLIioOGZo@pengutronix.de>
References: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:32:55 up 110 days, 21:29, 72 users,  load average: 7.00, 14.79,
 14.26
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_003447_013840_CDF32C37 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon, Jan 17, 2022 at 05:17:51PM +0100, Dario Binacchi wrote:
> Starting from [1], the series fixes the timings setting of the gpmi
> controller for the mx28 architecture, also adding support for fast
> edo mode timings. The whole series has been heavily tested with the
> mtd kernel test modules, and with repeated write cycles on nand.
> 
> [1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
> 
> Changes in v3:
> - Remove the "mtd: rawnand: gpmi: use a table to get EDO mode setup" patch.
> - Simplify the validation logic (suggested by Sascha Hauer <sha@pengutronix.de>).

Thanks Dario. I gave it a test on a custom i.MX28 board and it works as
expected.

For the series:

Tested-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
