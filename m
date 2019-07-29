Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3E8C7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 06:46:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 618572073F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 06:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6Qfy32S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSbox5Nd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 618572073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzoxDecZ/noagr1BN/hn0vGQmDCmYW3su10eqrdx4OI=; b=E6Qfy32SwlEOHl
	YkuYvw2bsWrSGp5eL8re1PY2ug4JZ06l3fpkALPc0THIXrQ8GNGhB9M73kRp265Jp0sbVhEP1Et82
	QrTrTQLE3pjoA6SrBeBIwo2A/ENw5/8Hj2wbA+RtOaFbIutAwUrIpJxfPD0f5xqszWY66FSGLqnUg
	1HEdcFMGHLqRo5b6BBbZfL3dZMARhr6ar67wsIZnO8AffyGanNEzACO+Z01ALZunhliWK+EUNbXvb
	w8z1kx+jBn9sCytEbqlojeKiLvzbo+dKSHagWiT5bCzY3hJRQP1dAZCEJt3Z9geqoA4GMoMC/i6PG
	VvGPvGaU6ewJhcCgM2qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrzPw-0008P4-JJ; Mon, 29 Jul 2019 06:45:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrzPG-00077S-Rp
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 06:45:19 +0000
Received: from localhost (unknown [122.178.221.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95086206BA;
 Mon, 29 Jul 2019 06:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564382714;
 bh=OObfax840R6bh9rjFceVGkLchDJCG652v03RGds9gFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSbox5NdaQ3BOobR6anCjjqjcwe7a/gzulM+4ZQtjQyz1Il7lgEOjtDVlq5tfUGm/
 fyMsz+iLv2edW7yTgjYigFt2ghcb7VqdnJtaNFRZkBflZooGnqSJ125aw/9/GzR4Zq
 E/aKBut0usnFTitcTVppLrBXrAomIQENZkc/MA7s=
Date: Mon, 29 Jul 2019 12:14:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/11] dma: Drop JZ4740 driver
Message-ID: <20190729064402.GG12733@vkoul-mobl.Dlink>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-7-paul@crapouillou.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_234515_884049_A0CD9C28 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 25-07-19, 18:02, Paul Cercueil wrote:
> The newer and better JZ4780 driver is now used to provide DMA
> functionality on the JZ4740.

Please change subjetc to dmaengine: xxx

After that

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
