Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19074C001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5pkj6U/IH1TnATh15uesppxFWFLIpPsbN7Z+W/Hhjs=; b=RIwiRgzmuJnX27
	ZqBoSJnkuq99wzllSeY8/PWt+A0+u5/zIfAx+1xIvQQ+hh2XjXK9h3SDX30nrHhjAf6yzVtZXD/aa
	5xJXg4t6b/kBqTxn68aNYj1ytfhvqw/HP+fdDOFD8WUk4TqZ9Js5+AB3y/2VKPAbPw22At7Bn2xyn
	JWZWTuEH0dliVTT4VrH9nmI/6IqKQWhoKQuqKZjJFowfCFH2hGOEfkowyqjnwDknTWG8xTOxjOSmO
	NeR1cJaxolWi6ED5mPz607VDAB5QcmH9HItWcvayvg6dJnu6J8J29XQgYktBRKBmozRN5Eop9QsxC
	o6oVjon8Ub92t3Fyqzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzr-009796-2n;
	Sat, 15 Jul 2023 16:19:51 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzk-00972c-1r
	for linux-mtd@lists.infradead.org;
	Sat, 15 Jul 2023 16:19:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FBFC20004;
	Sat, 15 Jul 2023 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSNgylrSoHg9p/+V4pQvqiHnrRCa0QL9KzIQQoEi5OA=;
	b=HdRT8zriTduwYkmsgM3ka87nGDLq2nUIRcdaF2Lww+fo4hAXE9ZG37/WJQHkljMnMweLjQ
	+YfBqg2d1A2aN0a14XcpKXbAmhsj8Y72xfDi+5+y0/h3iW5MOtSlNNYfLIOprW5OS6dl4E
	XaG1LqpXufQXZr87adTM3n5urea4wFQICyLcKTTg/pxAOLv6SpmnVvqDKRbOUBHHp7oXRv
	2Kju31aYFrJIpepu1vKqjBB9gJasvgMgAYe0dvnsAlUfmS0JnjkRMyrfGcOsnIngYNMxoU
	gGCrGiL8e7KCbK16L+AXcp+CNjBR0vA+Kb7i+14Gw85ULlK5rLxWAz8ZfiwfHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: omap: Use devm_platform_get_and_ioremap_resource()
Date: Sat, 15 Jul 2023 18:19:42 +0200
Message-Id: <20230715161942.20758-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713104422.29222-1-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b798f7729ca66a620242435f0d325aefe0a13b31'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_091944_748419_07F41868 
X-CRM114-Status: UNSURE (   6.20  )
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

On Thu, 2023-07-13 at 10:44:22 UTC, Yangtao Li wrote:
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
