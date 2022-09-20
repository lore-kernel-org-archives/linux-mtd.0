Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5CCC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMlD3LqSxFzJ+xkeFdwAtdMOxeTj35AMUhFACNmRrk4=; b=1b0SsFUXGs65g2
	FRc/EPtvENZvTULIXl0SjueT1V3QOUKJ41Q2re331omA11cHMnxESB5l98iZEuWzcPbxXDFLltJ8G
	jfXkFcL3apEMZTfvOXO1VbXjxkJBgdp0hfP1/nP2zMBlQwmp8jC4+xu0Mj1oBEyaszwg6EtWf1pal
	oX2TXWAPzhaIHSv1Ykd2fnVNqVGpPquO+JppA8JtAXryM64ai+KALD+gUU1n/CtZ+N3iteJ3Sw/Ft
	jsiFDBb00ZPUDKCMBqKb8R7JT1uOXPI9E5CEbnfsyC/PWqmPoDMH40lsFGwhk9dj7gQ1GyUb5brLK
	Nj22WUHapUK/TAOHhAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQq-001hP2-Gs; Tue, 20 Sep 2022 08:16:40 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQV-001h39-Nm
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C05C820008;
	Tue, 20 Sep 2022 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mH4eJDdPeIqnWGX47G1oaR2YkiazldZdxhkY5UwFwf4=;
	b=cRH0E2cqS51/jK4yOvuWNKN5e6gDq6SAA+3shEKWWsol51puOB0hotgRClGRvjh08MHJNb
	TemEqsUMVccqjn++FwFQQl1Gtby5VOVAq9ojGoDwFmmLuiq/DVRMS/1vTUPTUbZ+NElRfR
	zmWDEoM9wseY+mbV+/B01AnnwtolStQEEnQwLJ0y66gcZkY7qUJ5Kce5hEBl/lkI/V8q/j
	bqhhbP83rD9Z5+CBPY7q04iHFPl5qrS26C6PJ+zUIDQmm4GHzTCV+KX6dcMoGuJl5yqUtj
	jXozZNUuvawje5j9nMGC5xXByqVHpdM1+xt+8s8/4Or33LNmqr8abS13SxWWpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	richard@nod.at,
	vigneshr@ti.com,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: mtd: intel: lgm-nand: Fix maximum chip select value
Date: Tue, 20 Sep 2022 10:16:15 +0200
Message-Id: <20220920081615.598292-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-3-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9fac2a193e4553d6ce093a626ef5920c362d0753'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011619_963940_6C2F8A77 
X-CRM114-Status: UNSURE (   6.02  )
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

On Sat, 2022-07-02 at 23:12:21 UTC, Martin Blumenstingl wrote:
> The Intel LGM NAND IP only supports two chip selects: There's only two
> CS and ADDR_SEL register sets. Fix the maximum allowed chip select value
> according to the dt-bindings.
> 
> Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
