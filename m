Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC1C04A95
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Sep 2022 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OIXmaU37MFBnOHG2atEBbGA7XNwsw9fa7nhNxSHabk=; b=B35hilBq0agJlu
	KL8jPPO6FheUtwfJTZKa7R6SlWNu0Y/YgZ/hBOwjZuMGYFm0a5VrbfVD3VIHxK8zSpI0epZM484Nq
	UJTIlc5Wb8dAMETw8IGPBk3Jc7+uXxq6UrGxrSHEv+G9tbu/jVuj9XJosFaPH8C+ivBd9TZDDrWRl
	egpKrCb5dXXStmg9ZJ4UReHBmjboDDbpT3j3AOla9Lx1fPt8vuAxTDzcjn7FAYEhr/b0rFo6wFBym
	PmGKv5PWf/NU1RXXeM8LVmXtSoa5DDEiN2iE2Bg6ptvxr0v7Vmh0lwrLu7mPnex4z3vYBClE2N+9h
	52Sm38crUiiJMWaP3Oxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odbgF-00Ha9s-EV; Wed, 28 Sep 2022 18:21:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odbfi-00HZwJ-KJ; Wed, 28 Sep 2022 18:20:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDFF661F74;
	Wed, 28 Sep 2022 18:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41880C433D6;
	Wed, 28 Sep 2022 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664389237;
	bh=tsUzsDLvNMrNl/WX8swyUROVgGbJNAP/UA66NR2AIis=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JwMM6+/J4W+Yp4SjAIqo11CnhzBuYiAK6rdqc682IYFSA2lX8oNlh7Cb+QKRVGJ2G
	 cDcsh8RFmqczZp+ARE3sUbnsw2/lORF/e5ZnyUaDxqJri9n65Lc5Rd8wc3e3kru034
	 eaHHmAkWBlbJ8Lo6i+9RUt78dCJ59RIJq/o1yrJJrfjfvfuNNuLfoxVRdBSda5h2xe
	 CW5ptePlYsTC52ieKS40CNp9lU7o2iDwkUVv8n+p0ZsWWhMXD86E/kz41C6De+v1+S
	 bz5x1uyvUZkGjbG0qHIW5EZn9KKQjq+PDLumji2/xT6/IAsp7Z5KY02wN1XAADaoqr
	 MwlE4joexgKTg==
MIME-Version: 1.0
In-Reply-To: <20220915150959.3646702-1-han.xu@nxp.com>
References: <20220915150959.3646702-1-han.xu@nxp.com>
Subject: Re: [PATCH v2] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, han.xu@nxp.com
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, Michael Turquette <mturquette@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Sep 2022 11:20:35 -0700
User-Agent: alot/0.10
Message-Id: <20220928182037.41880C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_112038_732195_079DA88C 
X-CRM114-Status: UNSURE (   9.56  )
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

Quoting Han Xu (2022-09-15 08:09:59)
> There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> should not be used. For instance, the default parent clock for QSPI is
> pll2_bus, which is also the parent clock for quite a few modules, such
> as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> hang due to pll2_bus rate changed.
> 
> Fixes: f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> Signed-off-by: Han Xu <han.xu@nxp.com>
> 
> ---

Applied to clk-fixes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
