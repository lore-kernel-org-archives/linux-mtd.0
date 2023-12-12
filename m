Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B8C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAEYg8OnVtxVc+Gpmgy6viorrIcn7/otqROiUjnIQPo=; b=1His7OzAK2l6TRPM44zlBAj2Rs
	EAW0pCqjrWznWfOx9zMGXATxbhHNpWnLdqKmiEKCBZwM6ofCaWbjiiXAeePlDEp4ANu3uNz5V4dY2
	2zddi/b73lTGw/2ZZF3Bo8I81BGzEcWmLH2dfFXXMbUZnl3iISxqII3b6w+xZmz75N9OiUmugfF6B
	PJalSUjDW6MWh8gkwh39GvekDLvMgJaVIuga9Czgsm67Ml8VxRlQwwAPdljAzRxcuho5mfRlGnGPF
	zW7IfL7zQfTEJYwgEhJbo3chaZgUN6bOYca9zncGlYXp1Rd53/kQQoIAOUViB91Lzh2cvkDlGyZi9
	/OKQWm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1yZ-00BgXn-1a;
	Tue, 12 Dec 2023 12:35:03 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1yU-00BgVb-0v;
	Tue, 12 Dec 2023 12:34:59 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BC3E071;
	Tue, 12 Dec 2023 13:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702384491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVsH9JrMU+kTllg4YnT8PH24+guNEqb5IZwuUj2+thc=;
	b=asEntrfsJUlVGUOuVaMNcSEyWMez6f94TkJxrdnYBhrPGNP6VFg/a3sxhqR0hd1IkQZIWX
	EqnahLwu8JFqlCzFkksUj3ny6AojzvDwmyknQs29Xh7cB7yHi+iJ89NEu1LhvV8Llb1+zd
	wSkrrDAcq6FjbYIDRFEwzQOgl5BHZOONLlYylIO0zjx2ZQP9D+c5+gKcVTG3kvhZpLXqNY
	mKCdx5SMagAm+jyjxpETjDt5y/h48F5k1qY6TYvDLz163Po8UJjJYyzZiLbu8MikXffurA
	7uVidvriQgkThLix3x5o1jZgUWuOoCZEU7OqZpUBVmiPBx3sNZmbF6Bg9ag2TA==
MIME-Version: 1.0
Date: Tue, 12 Dec 2023 13:34:51 +0100
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: broonie@kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sbinding@opensource.cirrus.com, lee@kernel.org, james.schulman@cirrus.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
 tiwai@suse.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 00/10] spi: Add support for stacked/parallel memories
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
Message-ID: <30ffd8378d3ef1c4fa6dfe4324b18345@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_043458_719811_D9106BE3 
X-CRM114-Status: GOOD (  11.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> This patch series updated the spi-nor, spi core and the AMD-Xilinx 
> GQSPI
> driver to add stacked and parallel memories support.

Honestly, I'm not thrilled about how this is implemented in the core
and what the restrictions are.
First, the pattern "if (n==1) then { old behavior } else { copy old
code modify for n==2 }" is hard to maintain. There should be no copy
and the old code shall be adapted to work for both n=1 and n>1.

But I agree with Tudor, some kind of abstraction (layer) would be nice.

Also, you hardcode n=2 everywhere. Please generalize that one.

Are you aware of any other controller supporting such a feature? I've
seen you also need to modify the spi controller and intercept some
commands. Can everything be moved there?

I'm not sure we are implementing controller specific things in the
core. Hard to judge without seeing other controllers doing a similar
thing. I'd like to avoid that.

If we had some kind of abstraction here, that might be easier to adapt
in the future, but just putting everything into the core will make it
really hard to maintain. So if everything related to stacked and
parallel memory would be in drivers/mtd/spi-nor/stacked.c, we'd have
at least everything in one place with a proper interface between
that and the core.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
