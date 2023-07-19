Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F339EC001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 21:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Y5JrN6Hd53CgObC/c8MAGum2qwOWsrNxZNFVlYydaQ=; b=kbXfeMmXg/gemS
	S7quHbmL82l4qSD8VubCHmytM384VG0ECgANlwxalr+x3wq2CELi3adoQ04eGfwd1aQZ5ZsOXb3rA
	z4aAA/5ky7a8vGHOIBRRhrFE/HbfqAWyzkxV+UR8BaKjJjP2xAYnsZyZNZ1K0YgdktAp7pKxkMWCM
	GTHGzP1v/ivDCa31UjAfeagDLUCCCf2ViX2rItZ94Qr9i/oWZzXO8G9W20oPPAqAtLdn1BVibka0N
	6nxb3BILTGvA+S5T1JkgJ5o4hEJXG92P2zFOR2V6wyfVrp/1zmkCoh204+g4PHNjtlWO9olwIoR8X
	oxNUHJUA2eS9XZxZ64Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMF91-0091Zf-0V;
	Wed, 19 Jul 2023 21:55:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMF8y-0091Yn-1v;
	Wed, 19 Jul 2023 21:55:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E05F5617FF;
	Wed, 19 Jul 2023 21:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39491C433C7;
	Wed, 19 Jul 2023 21:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689803735;
	bh=LZGTzFpSHfpTcvbThJ8bOlUPyqc49MIpWv26NdWHD/0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K+6JiuEzRS0YoJ/68ES/WWbnnDYk1c6OFzTPqUKDYEQ+wscgxicKF3dTRUB9nOdyV
	 3m8Uo6XLeEvf9fdNr+lBBVjIbWueYOEF5if2vWaPkqtY6fkp11jR+1XfSMvZ7cOBci
	 fTkVYanYbzaCNGOUmOVm3khxSF6V4qaTOomUypN2bKbxidZiDRKJOh4j8OXUcp6dqi
	 l3oWPATq6xkuZhcLNfc6UF0l/tFJ2gZ2OL/quQqgE88J0+F4FVGV74fClFR58l5KH0
	 v2mx7qhd/sLgZWGLQ292okszTzmPxar44Z+5GZN2yQO3B4M61ROEPj25iT/IcDKEbf
	 gjS6CiFvrmgBA==
Message-ID: <a7f78b4e812a4cd6ea4b61ef4ebc5f19.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-1-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org> <20230630-topic-oxnas-upstream-remove-v2-1-fb6ab3dea87c@linaro.org>
Subject: Re: [PATCH v2 01/15] clk: oxnas: remove obsolete clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, linux-oxnas@groups.io, Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Neil Armstrong <neil.armstrong@linaro.org>, Paolo Abeni <pabeni@redhat.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Wed, 19 Jul 2023 14:55:33 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_145536_681635_D4EED3A6 
X-CRM114-Status: GOOD (  10.10  )
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

Quoting Neil Armstrong (2023-06-30 09:58:26)
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove support
> for OX810 and OX820 clock driver.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Applied to clk-next

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
