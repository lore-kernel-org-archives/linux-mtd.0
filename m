Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1089C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJuxxrku/sx16fcpXGu97B6L7eaDODa52daTDKr148Y=; b=KBIGvQDTqUn9Kw
	P48d/E8UImlSQ1ic714LW/cRUJQtfIfTFjKho3ScivwWscn/YTb/U9fKDpFoO+JyfC+yG4RJKm+vz
	K/m+T2Im3XylR0eX7S3W37YzVV/R62iE1A7KjOlgnlDV7sLpLZE01699TmXwFSGmOCxR/ZIOEZN5c
	cIPBm5vliR9rA+5hwqR0O87wjx46ebKiKY0N+S+fv7RmGnhZH7ymfAMMroB6jxVwnea/rFne23miZ
	mBywLPDWheXRHmembLMtaBN3vQMqn6BgFuQ/fiHC4aCiQF415X4+g5hOnQ/jhpSir2wd7ODlFphfG
	kdEbku6LLk8w0gvqk7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNYZB-004eAG-4v; Fri, 25 Feb 2022 11:15:17 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNYZ1-004e7C-Hc
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 11:15:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4006C000A;
 Fri, 25 Feb 2022 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645787704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s7d1/5MJwyJAgWC/q9iG3LwqQNqmMpQwEOsY7A8M4lE=;
 b=IyRdrHehUts03izUFa6y1cmECbhYSKoHw+G3I/YNJRt0klaM6cbaJmMNqEiPIaDssUm4Qn
 G5B2oHDBFws3A/4Ydi4s5hKLZrmCzI92yMfBBjZNvq45BlmQuWgg0vky7gaEjzSzB6HaA0
 xTRkvPdxjEdtKfa7LncpXTZUBvrejz41blBCMTqxTNBZtYiw+VCRJEu8oJvIAKB88ObFUY
 Cvnftzf+jyVB3OrwX0LZrDic7hEYok8Z1+imm6XnOjxdaFfmyIK7znRsyg31U1cewlF+cL
 IjZsPGtoQOafPncyNwyviiMuWv7Fr9REeMfmmvRRzHWYuyBHxCS5PuGKYcRpQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 krzysztof.kozlowski@canonical.com
Cc: vigneshr@ti.com, nm@ti.com, linux@roeck-us.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Date: Fri, 25 Feb 2022 12:15:00 +0100
Message-Id: <20220225111500.497281-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220219193600.24892-1-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7cf1de957a980d96d8b9c9e481c8bb1ad53fd99b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_031507_941976_E1F7173C 
X-CRM114-Status: UNSURE (   9.38  )
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

On Sat, 2022-02-19 at 19:36:00 UTC, Roger Quadros wrote:
> The root of the problem is that we are selecting symbols that have
> dependencies. This can cause random configurations that can fail.
> The cleanest solution is to avoid using select.
> 
> This driver uses interfaces from the OMAP_GPMC driver so we have to
> depend on it instead.
> 
> Fixes: 4cd335dae3cf ("mtd: rawnand: omap2: Prevent invalid configuration and build error")
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
