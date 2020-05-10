Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED7EC54E49
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64FAA206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="saHedKpz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64FAA206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgZ3/HCL9DgjK0E9eaK7Zp6GSTxvzU3yBKkD4axyCms=; b=saHedKpzp0Iozj
	nNQ7VlE048cw8075iW0jRGtp+uci+E03PXqKzQlCO2PnbgwAQVWSrqiWfJ2wHwRWj4CY93DB0XD7n
	fPcz5hrjxbgLQseWUGlGaXKtNgNSaWgng4t6s5XW8hFsRfgL1tm4K08+ATLYJXWHVdWTlzHeuhMmd
	I+QGwDqsvjm97dS63a6YuiafuJVS49qJlDEb9tKTHaXQCYJV4dCy7opwD7+MaawQB7GUXzKOg+pA2
	jBvlo+0M39mao5DR3THsru0QcERprJrC3LoIfCS8FIKeQr6Xz5WJDcsf7Tbx7xEI2cNHzs/TuaVod
	fkXx3nzuOaGeMzQaAW+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsLQ-0003N7-6c; Sun, 10 May 2020 20:14:40 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsDf-00025T-8Q
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:06:45 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DAB47C0007;
 Sun, 10 May 2020 20:06:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: denali: add more delays before latching
 incoming data
Date: Sun, 10 May 2020 22:06:35 +0200
Message-Id: <20200510200635.3080-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317071821.9916-1-yamada.masahiro@socionext.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 5756f2e8dad46eba6e2d3e530243b8eff4dd5a42
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_130639_441535_83261F23 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-03-17 at 07:18:21 UTC, Masahiro Yamada wrote:
> The Denali IP have several registers to specify how many clock cycles
> should be waited between falling/rising signals. You can improve the
> NAND access performance by programming these registers with optimized
> values.
> 
> Because struct nand_sdr_timings represents the device requirement
> in pico seconds, denali_setup_data_interface() computes the register
> values by dividing the device timings with the clock period.
> 
> Marek Vasut reported this driver in the latest kernel does not work
> on his SOCFPGA board. (The on-board NAND chip is mode 5)
> 
> The suspicious parameter is acc_clks, so this commit relaxes it.
> 
> The Denali NAND Flash Memory Controller User's Guide describes this
> register as follows:
> 
>   acc_clks
>     signifies the number of bus interface clk_x clock cycles,
>     controller should wait from read enable going low to sending
>     out a strobe of clk_x for capturing of incoming data.
> 
> Currently, acc_clks is calculated only based on tREA, the delay on the
> chip side. This does not include additional delays that come from the
> data path on the PCB and in the SoC, load capacity of the pins, etc.
> 
> This relatively becomes a big factor on faster timing modes like mode 5.
> 
> Before supporting the ->setup_data_interface() hook (e.g. Linux 4.12),
> the Denali driver hacks acc_clks in a couple of ways [1] [2] to support
> the timing mode 5.
> 
> We would not go back to the hard-coded acc_clks, but we need to include
> this factor into the delay somehow. Let's say the amount of the additional
> delay is 10000 pico sec.
> 
> In the new calculation, acc_clks is determined by timings->tREA_max +
> data_setup_on_host.
> 
> Also, prolong the RE# low period to make sure the data hold is met.
> 
> Finally, re-center the data latch timing for extra safety.
> 
> [1] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L276
> [2] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L282
> 
> Reported-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Tested-by: Marek Vasut <marex@denx.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
