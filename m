Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF522C07CA9
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29pVicXbprWPD2ko/YwLgePNtb+BwVVUrkJETinRnDc=; b=q9JSvxYuklDVuZ
	2ucBQdyRVWlaWHdTajICx0YNDNLHDuoEzYIBX+c8Z+pDbKOAR1X7q8kb7Rwt4htV8Gkewhagn8qNG
	ebR9I7d1VA6dPAaX/Frpq514wgG/9uOvwWaG75yBDF6cGXu2ZnYXv8OwAqDXR5+5/QilGXtHQvPnl
	s+9PUFqpDUAWt7TAiZDq1QnEB6vDhhFEnGC2/11qwVs0vXN8hz+QWUiS3NlDooXQbdwQNns4syIha
	FyCMoFbriOdbGIqbC3Xt8WcJUjqD7qKwFgKFSSrk837jyHHsgpVrCkBWRo5Rc51J4KybCVq+oVXuk
	YrNsgfEHRE2TMOUuLdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePL-00ASrM-2P;
	Thu, 30 Nov 2023 10:36:35 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePH-00ASoz-31
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 10:36:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DBBFE0008;
	Thu, 30 Nov 2023 10:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701340588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGIOr2vveYhzaZuDnY6oRfLCP5p5desOJjVqC3APyGA=;
	b=jfrCBVSX3+3OanC+F5adR14mV7ic1PqlxA23KVa6Vzzm2Xv9O50Z8HQIBhLsJbL+o5AQ3e
	55cMLQ4N2AuWuXyZmZWTgLkja+WxL6XjMfG8flhLXcwgJXI2ltJGCQY/FDoOP5Ixauy9gu
	uDQ8Ipv1NKR7HU3315txZcFP4D/cpHoYX8JzrFuDetIhIYaFsgUh0KwbWMLErD9EaybiD1
	rzReTBmp40yntFT4jXExGNTGEuSctFMCIfQXZ7/7NIvci01D2vZowgrmdgNAphRMCSPNe0
	awCmsPROieIusvqp8dA8r55AuBP+1fJx+A8tgK/Zoa1CkwmFvoRcwZhV24yTFg==
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
Subject: Re: [PATCH v5 4/4] mtd: rawnand: brcmnand: exec_op implementation
Date: Thu, 30 Nov 2023 11:36:24 +0100
Message-Id: <20231130103624.715263-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125012438.15191-4-dregan@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3cc4718fa6448c51008e8bfaf0303a2ff938a929'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023632_261209_290A0A8C 
X-CRM114-Status: UNSURE (   6.59  )
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

On Sat, 2023-11-25 at 01:24:38 UTC, dregan@broadcom.com wrote:
> From: David Regan <dregan@broadcom.com>
> 
> exec_op implementation for Broadcom STB, Broadband and iProc SoC
> This adds exec_op and removes the legacy interface. Based on changes
> proposed by Boris Brezillon.
> 
> https://github.com/bbrezillon/linux/commit/4ec6f8d8d83f5aaca5d1877f02d48da96d41fcba
> https://github.com/bbrezillon/linux/commit/11b4acffd761c4928652d7028d19fcd6f45e4696
> 
> Signed-off-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
