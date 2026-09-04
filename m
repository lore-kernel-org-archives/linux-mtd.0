Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01410C61DD6
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljaRcqBQGYcO8ozWLajTgVgMeFXO4eOEmktcng73J8Y=; b=vVXW/1xZZoe5L4
	UNMGzsaTEzsKi5uXDI7VburBSgnKPMlJzjdI8MJs0VGNfFCTFabN0ipK5v8jlYFFCrFyT1RWX+zgg
	bvMIz38c/i74r+lT6FE1+Pp/LggJV+XE1Hx3lsPS8wW+dunu487p3MeWXZICXYBSWwqA/q+fUSNbw
	/4rXp5buFSdlnI17W6UBck4S4JUJ1+x8v0DURwZQJ1ChYyHlBnyiVWBuO/JbfjDui4BC8VVePkgU8
	LqAp6cDqoMXqA20ARjgU1KOPGbNXqaJTsgqtgLaU0LhvArVVB4nqnikoXitqcbrYzndcWJ2ec+wic
	3RnTnuHrRxSgJn+UxFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9i-00000002Fqb-3JsS;
	Fri, 04 Sep 2026 13:40:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9h-00000002FqA-1OF4
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 13:40:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2C2C60219;
	Fri,  4 Sep 2026 13:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E43F1F00A3D;
	Fri,  4 Sep 2026 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529232;
	bh=108ncanAA8Xot4M0Apjvanj2sNmxvWNWsc1V8hX8xZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FxY4r4nfu9ITLvXzw/HIzpRfdiZu1vZ1FrhHYSEY7d9bZlOJqlwMKgmMGk4gN33ta
	 Rq9ETPgK3hDjvsKkk5puV7RS2tOcUamflUzg8xA23rP11BFSseZw/rc1Y0PuTzDQxf
	 rYqjG6E7q6f6aSl/Zoi/MpVvy0BRIwfUA3cmRzQfR6ycIBtN25Qrrhv8EvMxW4uXrA
	 k2z6u4UcGyroeq78o4SUJ34mvoVxX2USuMmkktNLuGEkleEaHymQndeyMMtJsA9Zlv
	 bShCrUgFAUko/VVzu7kMbNmwIzVsRNtuaDAK3yDXFXlwAr0rsdZIf2ugj8yvA7E/R4
	 koJBM+wCbr8ZA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20260605084837.1875896-1-linchengming884@gmail.com>
References: <20260605084837.1875896-1-linchengming884@gmail.com>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: macronix: Add support for
 MX25L12833F and MX25L12845G
Message-Id: <178852923038.3340372.16221387405129989849.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Fri, 05 Jun 2026 16:48:35 +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> This is v3 of the patch series adding support for Macronix MX25L12833F
> and MX25L12845G, and restoring fallback parameters for MX25L12805D.
> 
> I would like to sincerely apologize for the build errors in v2 reported by
> the kernel test robot. I had made further modifications and fixed the
> issues during my local testing, but I accidentally submitted an older,
> incorrect version of the patches.
> 
> [...]

Applied, thanks!

[1/2] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
      commit: 1dde2faa82fd69a4da5ab7a4635b51773b566d4d
[2/2] mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D
      commit: 01739ccea21b69818dc071096a249e6f84a6b13d

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
