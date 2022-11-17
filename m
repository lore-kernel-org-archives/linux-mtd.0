Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD73C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKElhow0cI4I/jbiLmlarHy5Ybe1signveZjcglrNrs=; b=v/5Gs9JKOrB25v
	YdR1ocAHfJwPwQL0Qv0ER3dvJNG+6gmSrJ6VaAjelq+f8ip8jZnKKRAMDJo1QBHMSne5Wh+99Jw5B
	dCrKirPlTEdkptDPFmYWFbt4T8LUrXD3AIOEmsNnTQOGcBzrXLevoM0iHfYGtESwsBFukEBIbT27k
	oTmHthwsD8Waj0FIvMfB9iyicG0VZ5pLHqi8qvD0P23kcJMJF0UtH2x+YQ5zsDvamB18p4UDSZ6JW
	BKisc2rubtI+LQF07wwPOYW5EFEPIAisW+Kb5njlb/wpHRzAMV0p5ctD2rvjtQHxsj12R94uNvkeV
	bhdSTO58yix/QlRQZBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFw-00HZdl-OT; Thu, 17 Nov 2022 21:17:09 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFH-00HZ0t-OI
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1E0A7240008;
	Thu, 17 Nov 2022 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRtYi3vYAjLpXY8WOHa/2dwKQFZjvZN8mIZraBpZzEk=;
	b=BLShnR/1Af40KpIte5jrwnELaBV6DiP1fBs5XVWINc3DailaLKAIJwzLp6bCkDWA1Fe0+z
	V7hD+c7sIVDW48Hbh0TCVB4CwBGBitBXqmEuCDLfpsuBpK8CIX9+lj3WCnAlik4XzSCQkD
	2sw3XSFH8BEL6NtEl+uWhQsIreAQRcgmEXAMPIL6w9IJvr1ikcNYkuAG4F6rH9h27Ijnep
	m/FurlYs+MkzD4aEis+SBMe3h7usNMpLHbU1vMN0U6jG5/HeYoXD/gWqiEiqMJG5NNiUSg
	nvadVGzPD7PHrbsGxIadmYi/lLyPPCEODjCu43mj2p3/9bHv2J876D7REeoexg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: mtd: Remove useless file about partitions
Date: Thu, 17 Nov 2022 22:16:21 +0100
Message-Id: <20221117211621.1273636-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f902baa917b6c1f2d70d008b2ebbe5acf79ba392'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131627_964087_BCA56A3D 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, 2022-11-14 at 09:03:00 UTC, Miquel Raynal wrote:
> There is already a real partitions.yaml file, so assuming everybody
> knows hot to read yaml schema now, this text file is no longer needed,
> so drop it.
> 
> Depending on the situation, the lines referring to this file are either
> dropped or edited to point to mtd.yaml which includes partition{,s}.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
