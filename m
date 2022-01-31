Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whMXn9Uc3oq9hKCU7Mkjafk75EjtjqytpFAV2Si4m3A=; b=uZ1b4OC8hxm5ys
	IRMxzbtxMIa+Anre3EyWXLhZEv4Ysu5SKE1i/CSAmV+4lbRo76+6QKfxt2W9cgXRCSR8hob9HNqqh
	PauxECyxH3jvnA09VIuVc5rUQUyKV9ZQI1NlFPdb3JFEgvsA1b0Rf2vtx7WRxvoBOazkw13JEXCX3
	IbjS1rezeHxL43A+0NRSYoaJFh3ndA8CYDMsRbqnUoRz8GfirPCxfPU4N0o0Lda/SRkLP9u6gHVRl
	f6kfT5MAiMHLkHS64yVUfAFjz8fztwj4KvnNmrRV37cXfT5QhxLlDsePI/jxRAaxRIyGAJYfzgYzC
	9FPutC0980mTnUiRgYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZRC-009pjE-R6; Mon, 31 Jan 2022 16:21:54 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZR0-009pfP-Ia
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:21:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5B06C20000C;
 Mon, 31 Jan 2022 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6/mh2SLSC51yWDrYwTkaaXjBX/hk5KFdYxvcOIXQLw=;
 b=hQcto7671zJ/KwspWLTo8ScfRzYs95xsjxAbeYMUKt54gVK5zqjE2WN20jJ5Hd9tL45iPD
 oDEO8m/0EOzFCNbfHhTxyJhjpdRV4QF38sAmh3qcdJC9w/KOzQ3W4TM1x4E71YPRy/fKOq
 YYVlQfWlPYWcimKd5atnVJVU6mrkql54lqSrGjhhr6luSSXKvhkHIc5JWyx8J+x8Tlj/P5
 e+Qf51cme8wnPHazT9Tow508KlpOkHz2TeiJDb8qwDmVVXh4UC4Ic+5zzhMFq5ycZQmVii
 nAFdFpSkW5PmIo/r4vZnYzozgbXFK0Mzx16motDh5vxbiUf9euZXcs3ayHbYSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: Fix misuses of of_match_ptr()
Date: Mon, 31 Jan 2022 17:21:36 +0100
Message-Id: <20220131162136.23514-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3f26d1bf90ba9bf420e49ec9cdbe13d15c0df7cd'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082142_792946_A95CB88C 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, 2022-01-27 at 11:06:31 UTC, Miquel Raynal wrote:
> of_match_ptr() either expands to NULL if !CONFIG_OF, or is transparent
> otherwise. There are several drivers using this macro which keep their
> of_device_id array enclosed within an #ifdef CONFIG_OF check, these are
> considered fine. However, When misused, the of_device_id array pointed
> by this macro will produce a warning because it is finally unused when
> compiled without OF support.
> 
> A number of fixes are possible:
> - Always depend on CONFIG_OF, but this will not always work and may
>   break boards.
> - Enclose the compatible array by #ifdef's, this may save a bit of
>   memory but will reduce build coverage.
> - Tell the compiler the array may be unused, if this can be avoided,
>   let's not do this.
> - Just drop the macro, setting the of_device_id array for a non OF
>   enabled platform is not an issue, it will just be unused.
> 
> The latter solution seems the more appropriate, so let's use it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
