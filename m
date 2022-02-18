Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74830C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F22UGCDMYvjL6vHnsUT02wH2jDvlhy5JiqriUVlClk4=; b=Dp0cutiaj62Usv
	OGpSqaPVTjHfNCAR3ggPcacNXTY503Va+C3EzJNVjTkSNs/lhcQqWZIWzYOq6JEbTFgzEGoCZ7hOa
	+EP7j0WiB1RLnSdYtiHkX6QBZ74sJUxP6A/QwJXeed9VjqTnMrbg3cnBm2Rb2vZfRGkh6GZXDB7HP
	p5tJSTSHyr1YzJjhDMOJSNLX2Oaxa6+bBb/YE4cOPZFybAJWOqJSiIK9IAvxicwZgVkBKQxLpkogX
	jFI2lKJIvHfmPxYYJtP40n7a6XGF3+XPruAMW/Ms4r/jRKoMQRfYQxmiuKu3wAOhxPeeSgfNDVcoZ
	pSASRcjiQ09v82LQM9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4K1-00Emvi-It; Fri, 18 Feb 2022 14:33:21 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4Ja-00Emk8-L3; Fri, 18 Feb 2022 14:33:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E725FF808;
 Fri, 18 Feb 2022 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilA53umUtnmqPhELfjf166xepuYFHYKSwnmlx/soh6k=;
 b=bFDr/GInPV++oTzutDVGOwvRe9vA0HoRFKba2bRFGTwdpSJkVKZuYV4dxNJTF3EKDbMJGW
 E+tHKE6Oe4Dv3jJppChsO1ZYezG8PybdQFaqRTBDwjsDrxke70kZqCRODYQayNm3/pA/AL
 RcLSGTkEyfM/Wv5ibsYGeW8Lw2WQKBE1J2bLTrzxGLM17eUJ4QQ79A9Kx8AOt4iIDmspI4
 r0gLhT3U9lq7E0D6j1AJar4VC2UiyagVabeZwSStJOD5G7mqFu/n84/AL6GuD9ED3wRt3I
 oY7HoK26A7asmbYcB/LbrdEOPl4uoc6jERhzD+HRd1OIzNNfbzBeGzn9wt3xFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Corentin Labbe <clabbe@baylibre.com>, krzysztof.kozlowski@canonical.com,
 linus.walleij@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 robh+dt@kernel.org, vigneshr@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Date: Fri, 18 Feb 2022 15:32:49 +0100
Message-Id: <20220218143249.321926-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220211120842.3388592-1-clabbe@baylibre.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'438356e5151b929af90e501b9c6dd1f3ea2fc7c4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063254_856737_7E0FC614 
X-CRM114-Status: UNSURE (   7.79  )
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

On Fri, 2022-02-11 at 12:08:42 UTC, Corentin Labbe wrote:
> Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> 
> We add jedec-flash to list of compatible because one board (gemini-dlink-dns-313.dts) needs it.
> See commit a10d862e585e ("ARM: dts: Fix the DNS-313 flash compatible")
> The flash on the DNS-313 needs to be probed as JEDEC, it does not conform to the common CFI standard.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
