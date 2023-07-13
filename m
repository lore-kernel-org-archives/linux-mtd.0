Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8789DC001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nq7xeCq+i/ifA6qJfgbA0f9lYUCkQZnoDalATff+qgE=; b=qT78EFyY9x6/SL
	SyMjhJ5dmUhaq3UH5qd8CvENhjAWMP2zx+S0V5LE1HyIMpPtbNSSeF8WWOMMRDTYTlX6uP/aHLYgc
	4ttXbeYNKoQjY1XA4K1mdtKU094sciUZHBxtXbNzVGfuwol+XwSB88pfAuX/d45ZZgi2GK3Qtj+zZ
	AtaHkE38U3FaelZ2hE7z+jr5XSpwiHs5+OTREwNCVj1GX8R5hlKIvqbS2f4VGNdpYVp2WrRvS3fq6
	fMVrJHMdDzudsR264oJD50T5GtVpHY3ZMOCnMOdG9nrbEVD5n7QYc3Ahw5pjlATqC1S9hidBGTPgW
	YPupIe4GTSWgawoaXqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDU-002JmL-2A;
	Thu, 13 Jul 2023 07:58:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDI-002JbO-0w;
	Thu, 13 Jul 2023 07:58:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 973D51BF20D;
	Thu, 13 Jul 2023 07:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bd7RovELBTrSuhrEanMZDTIOoID6ra+M5Ryj+4yBaMw=;
	b=KXW/WpxYCi6nN3uLct5Cu9GSPpg5xd4zWhL60lrpE/OSqTPcxnxsnIakzOxMB66IFdrpCU
	dG6/Vt1ubulQbe2n+xRD0FTbCue9+rY041tFXTOWo+VXrlRGDBKz+ULDqXxLEMCttYjA80
	Jv4E6v20GyKivYk4fgIBLtYqH6WUabUpK+xHDZNtk+WKZLKfeZfQ3kSMmWXCtEguWMieYf
	yDEXyap3Rj8UD/L2dHeu2T3eaz9bXHooyBcYiaSro5KzSa/UIe8sfakqN5OTmMoyQVu3FH
	U01TZdyDrfA5MjX0vxrx5Sg4ywWJbeUNiQLrJF/7/aVe2wN3ON3rV6ZhNVbyjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/18] mtd: rawnand: stm32_fmc2: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:09 +0200
Message-Id: <20230713075809.486249-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-6-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'68e10224a5ee9de5867152da8086acd543263c29'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005812_474515_4066A338 
X-CRM114-Status: UNSURE (   5.13  )
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

On Fri, 2023-07-07 at 04:06:10 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
