Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD475C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 08:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oH4HcFoKxjDvRvo18zbpzr6U/upZFyykIHheMmpYyjs=; b=Gmv/k4oV5VD5dY
	u1Kdy8+sb6SdATimsHUvXqmM6D6Bz9JWBUSEdgSEGzSaYDP6DXTkO8A7NxUCclIaMMWKdMIYFNuwG
	1qMhc68fu1FhsXc9tV95CgebdiPCZypcpd6ieKtIwkrAQNNymeOr5KuzvZ5LB/xmYfry5C6VX5NcT
	odfbdqlYTH8eBR3ahcYRPVA6Hdsa9JtL3/Qg7fUj5aU1CLjgo3KHmQGeVEhtA6aaZ6rEQuurOvTT2
	SvsojwB9ZEzsBJOkzNdJ/bo5u2HxsZXBN4X6rr4QtUjUl7p94RLz2Hm+0PK9Jv7UNZI666hs0WkQR
	7N0YRtUBPfD47qrCn/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndprM-007gAq-S7; Mon, 11 Apr 2022 08:57:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndprG-007g79-JM
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 08:57:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B4951C000F;
 Mon, 11 Apr 2022 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uy8PYExfwweAQfZ/2LJcR+WcX0pxaMoEIE7ETqL7kS0=;
 b=itXYWmIzfsMsvBMBi0YDgtl+v9IQBSVubOcI0dFzSiYKkZaar+qDe6Y/pfjxGyoq5gHiTe
 7ee/hrGOVZ0E5fQl3Oia491wBA33+CMimqFArrWyoANkERqbkPOrSLgMbV2H15E1XVP3QG
 IssJ14fAJRCV8ovzlrKowTqQkmD2JpwBmb/n03V0fuPoLECEaTl9TVO8Xmi/S/kWPb6lD6
 4KHWZvWrmkwqYeIQFBDy81ck4MY4ItmNsDXFHK9h/+wkBGLVfWW3z6mNGCWNjJCC7CYfV4
 QBo7blVMoN87+/mup+gYGH36LfcJOI+0eU3ZGOHn1ghRegE+dZwkt40VoAGyZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: maps: ixp4xx: Drop driver
Date: Mon, 11 Apr 2022 10:57:09 +0200
Message-Id: <20220411085709.10861-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407210844.2489682-1-linus.walleij@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ac3ce4ebcd60cf359fbb63815dae857acb808589'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_015714_809072_1D90A69F 
X-CRM114-Status: UNSURE (   9.61  )
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

On Thu, 2022-04-07 at 21:08:44 UTC, Linus Walleij wrote:
> This custom maps driver was never used with the device tree
> enabled IXP4xx systems, which use the physmap add-on from
> commit 2aba2f2a704d
> ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
> 
> Since kernel v5.18-rc1 IXP4xx is only booting from the device
> tree so drop this old driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
