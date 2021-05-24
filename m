Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E774DC2B9F7
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 02:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5A9F6141F
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 02:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5A9F6141F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QedO4YQJCmZWhu+ZBv9/yQ8XHe1GIctwBndZLi/r9ys=; b=ocXFGPjJXRZsUr
	8IeKeqeP1RNAhy/7SZ9bOliZxj/f6E4nN/0MXCG4/dyWz/eoZqIRLTehdNBDrNOs/LAhQB4raYpML
	uU7luHHjSZDahS232Jtob8TYywPaPMIDWn2M9r4Hz1zPSvyXJw1EnrftpQZ4pTXVj+wVWAbTztvFN
	Qjvlb+dJXCSGBPsMZ+1DbBa3jxwyAfJmq0W6inXsuWpLNh4J50Z3os2aBFJytPyLkmVzAr2TXHb99
	Jdxuv0SLn0xKPLFUcBYEIBx66vGiMUVfmOUEEUCmOIDyjGha/ayzyRQbgeKFrcnZZt3OCTDJ94Pvq
	n00Hjq2Adn96z9DNSxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llN2k-002yTo-Qi; Tue, 25 May 2021 02:43:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llJ56-0028S4-ST; Mon, 24 May 2021 22:29:54 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 84AD5FF802;
 Mon, 24 May 2021 22:29:45 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-rtc@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCHv2 0/5] Support for GE B1x5v2 and B1x5Pv2
Date: Tue, 25 May 2021 00:29:43 +0200
Message-Id: <162189535932.209674.9024031320724831491.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428222953.235280-1-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_152953_102424_E04AD711 
X-CRM114-Status: UNSURE (   9.66  )
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

On Thu, 29 Apr 2021 00:29:48 +0200, Sebastian Reichel wrote:
> This series adds support for another General Electric patient
> monitor series (similar to existing Bx50v3), which is based on
> i.MX6DL using Congatec's QMX6 module.
> 
> The module uses an I2C RTC to provide the i.MX6 32768 Hz clock,
> so it's important to keep it enabled. Not doing so results in
> incorrect timings of watchdog and i.MX6 RTC. The bootloader
> enables the watchdog, so disabling the clock results in system
> reboot. [0]
> 
> [...]

Applied, thanks!

[1/5] rtc: m41t80: add support for fixed clock
      commit: f765e349c3e1f2e676ad4bd61197216b26976022

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
