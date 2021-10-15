Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ACAC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2D9560EE2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2D9560EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WVJrktp1vNGl9P/GkEp8ioikH4jWxbmkUaKFQ2RD0U=; b=cCioztIRVPymW5
	EVXJtBfaidsO7D3yCPtMCEC2Lg0JYlVXAIAyQIhrLWt9bMp04Tq2OdO9q+0k3d1O8BvzmbIVl+tr7
	WWY2A0sID1Jn1lStyOr0W+48j7gSdXuV0ZsuJEv1m18YN5HTSAi12uEC42blHDrYVZ9Fxy6Gm7ANL
	VnB9jzqlrcXZ26reDc/VWGC9ecrAFC0cMpcNUzheBSt/P4B4X3ptcaRQXxriOs9x76hM3GTVmPyfA
	aHLCtuxTFDM3ALaiy1T8Iy4He+sxiWHop4Dmbm74aS/EY9Xv12BKK3X1gStKZjvl6srnZ5mGOJIzY
	ivRCvHIP9uxVBmEDi53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKUt-006UYA-Iq; Fri, 15 Oct 2021 10:31:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKUi-006UWG-Vc
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 21D7740010;
 Fri, 15 Oct 2021 10:31:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cai Huoqing <caihuoqing@baidu.com>, vigneshr@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update the devicetree documentation path of
 hyperbus
Date: Fri, 15 Oct 2021 12:31:16 +0200
Message-Id: <20211015103116.948934-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211014110614.3320-1-caihuoqing@baidu.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8a057b5fb480f231b6944ebe01114ceb6a297422'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033121_174951_BF8644A3 
X-CRM114-Status: UNSURE (   5.57  )
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

On Thu, 2021-10-14 at 11:06:14 UTC, Cai Huoqing wrote:
> Change the devicetree documentation path
> to "Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml"
> since 'cypress,hyperflash.txt' and 'ti,am654-hbmc.txt' have
> been converted to 'ti,am654-hbmc.yaml'.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
