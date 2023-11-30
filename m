Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D51CC4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52lfuS1Uc2DMspqyWyqAU2Av+hxY7FzmRR3lPXaiidk=; b=UW0pQyZ19KE3uj
	+DD9T2BRDwldisqlt8V2l3CpL5t39BjZkLGBV2BQoVx6+4WUsN5+c3MbFXnMLtCcJThVMvUQEHCzA
	/1tp+PrroSAOdv1yEy0DRtL8GzjrG2ZE3q40vC3M7TJlAbmD4bjEP0C2BQxrHZj9sMpy8pbpniH0Y
	ktJSJKxooeoYvAZCDZAHbN8OWulBX8MvL9LFZAAOdEgK1a7BabaFPy9SZ9L7egN3bIlz0dLEWFueK
	3CxQMIdgpYl4IQQI+FZX3JeJGiQE6iy+JJDPYne1DYM02ZrYjlbzSE36OJ0NwNtrehTfEaRPNkLwb
	bKaN0LEMzsRBHlX998rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePP-00ASsQ-1M;
	Thu, 30 Nov 2023 10:36:39 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePM-00ASqP-1a
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 10:36:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C87EFF815;
	Thu, 30 Nov 2023 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701340594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXGibL4JFLJ6Qk8J3/pSKDXmUg+l1GSINDae8lI3n6g=;
	b=inQ84HZS9Wu7ORtl5d/GTXif5Z4xhhLYPS68duwZfTOmFpUd0vHDXC48Wls+cD6Q//B2k8
	Vmd4Zf8bQgzr3e8YxbyX03/CPim2DjKfK/O5I701B1Ja+5eUNmHjjU997mSmnzmDooNy7k
	lLXpBBh5+cUNRIG7rus3F9LHQRauZXajNJRkRuxgRId/eSYwUWkRyjkDwSL+p0SR7oc6qM
	xzwD7iHQWfpaLK9VnJ0NnhmV0fUlpqRj2lvy+UL1hVgXAw481zTf9BbUzoNLMs3STM/VHS
	gqCLVc6EhlDwxr39ViUZmF5WancLAy/n4+cJavGr0WGj4LlKy1u8Sil9+ncrBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@broadcom.com,
	miquel.raynal@bootlin.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v5 3/4] mtd: rawnand: brcmnand: pass host struct to bcmnand_ctrl_poll_status
Date: Thu, 30 Nov 2023 11:36:30 +0100
Message-Id: <20231130103631.715302-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125012438.15191-3-dregan@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7d93debe84e1adc5a299a520c23d361572ab7b30'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023636_671592_34558BD5 
X-CRM114-Status: UNSURE (   8.87  )
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

On Sat, 2023-11-25 at 01:24:37 UTC, dregan@broadcom.com wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Pass host struct to bcmnand_ctrl_poll_status instead of ctrl struct
> since real time status requires host, and ctrl is a member of host.
> Real time status is required for low level commands vs cached status
> since the NAND controller will not do an automatic status read at the
> end of a low level command as it would with a high level command.
> 
> Signed-off-by: David Regan <dregan@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
