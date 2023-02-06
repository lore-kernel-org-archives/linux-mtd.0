Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BEDC05027
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yumVDc+mFp7ugpk2gZq1Nb7Q9jXuqrHmIr2Jkl7p2FM=; b=Sb5gQBBYCtKv/8
	No+wp20SUAPDB+YtrdJEb9v6B6nnSrt3gp/GJgpRhYFWNVeEEEpL1mcvp+CtAmwG9Ng8EbiEx94bk
	v9CaHLdkbS+vVu8nEZSvPm0DUOACAHw0vZBAmGvZoQN856lAY2nLMxHckYKnAcUvl6uHTmLGwW6z9
	Cp56Flgwws4pbHRPmFj9HTJMav9+YFlMElLkMbDVzwJmyj6GmoxfSJfKS70qjmn+pol72M/FgoPCu
	vAxB1MY5ZQY7Lg+DaIQkFCvz0uyDXCy3ag46WrYCM175diZGhu3MIlxr1szsdU7GMQIdSR9tZSiFW
	sekhOagBLjeAU4q2+nNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05t-008MZa-GS; Mon, 06 Feb 2023 11:55:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05h-008MTS-5W; Mon, 06 Feb 2023 11:55:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DFE9224000A;
	Mon,  6 Feb 2023 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675684517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7t8Uwdr1dUJSd52cm7PrFoTbxTBWVyGF5I8T/aNAD8=;
	b=S0xt4XCCUU+Bl0tfBnzQdpC9rGWP4Bilb8BHVsQScGNlc00ICg3W2OQQGadNy4PML2JImG
	n+v7MeRBXObu3B7NCJy4Y2mvOQ81maYs7Kgnic3io6kcWTZ46YYQ/526vFUBTzNgAD0fUg
	JzCgYXUNywRG2SENlg6PV/8vOevm8d4FMzf0XiomOycFlkXGzMMLq3Qm2jxH64gb3OnO0Q
	Fi+XvMEddM0eroxdnfcwDPjmlKmIDbkHxwc3/l2zxopUdB4mhiIqyX6AUztQcxkaOuBjj2
	KlE7FfbnM3gGnYfmqmJwlIbn6jftDsdVbDgnqEAXT58My05+36O3bO8Zc7ze4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] mtd: rawnand: sunxi: Precompute the ECC_CTL register value
Date: Mon,  6 Feb 2023 12:55:14 +0100
Message-Id: <20230206115514.560804-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204143520.9682-4-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ef3e6327ff04af8527b3558e023e99f1cc241bce'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_035521_361759_08573F74 
X-CRM114-Status: UNSURE (   6.22  )
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

On Sat, 2023-02-04 at 14:35:20 UTC, Samuel Holland wrote:
> The value computed by this function never changes for a given chip.
> Compute the whole register value once up front, instead of every time
> the ECC engine is enabled.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
