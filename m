Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8688C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaBqy2odaoItCrvH8MCZYKL69OHdxphJDkUnPuRzgoo=; b=M5+T4/1yEJt+iH
	1LCwbG7tOBIIMTbEodacpGHwXLT+UXUCgng5fa44xwpO4eS4TGryR3FuqwxA1WiXV1G0vW6UHMuRY
	p4zmo2bIrtpEMLPP4BZ4f//25Q1kxUr41IM5AdQSaZwHuzwkL6LpkBI5OVJakFT2gGGWCfoLVmf7W
	XJVJRzBWZAaw14qDicW1ku2mdpZwkTX9uKS94NtCFYL40yOkYmvRNN3xh+Lnn+USR/tqqMGe+jfXf
	gYW99/KtZG80UT3Gwh8eGq9DyT4atz6YISgWZrz+0LOByDzX2RVovqV0RV93t06Fe7Y3gp3VUyQJ8
	3IKCi3qxOgvoehU8bkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqHy-000kTX-21; Fri, 03 Feb 2023 07:15:14 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqHu-000kSf-RJ
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 07:15:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id AFA2168D05; Fri,  3 Feb 2023 08:15:07 +0100 (CET)
Date: Fri, 3 Feb 2023 08:15:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
Message-ID: <20230203071506.GB24833@lst.de>
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-2-hch@lst.de> <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_231511_039421_B535C797 
X-CRM114-Status: UNSURE (   9.05  )
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

So given that the big series doesn't go in, can we get this removal
picked up through the drm tree?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
