Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD47C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 16:09:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C901A22C9D
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 16:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C901A22C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mYZfoHIyO+k0hR/WeyxJw848HZk3ILUBgtLL8UV3Vo=; b=lZjKXKQGwh4/jDKO4TWGP3SeKp
	w+A1sMrjXSEF/a0hfm/5oGF9u2fFcYOX5LbP8WziEo4yYFpyBGXngTHNqevLl9vJRv6V3lYoxQKST
	h8fJLOm76lxe7Tnb2fq39bHOHqSZ2Gzvoemhisrehqad5Br1i7zSIKFg9DzjW2vi9sZJPOsqBpRZK
	cqcfVnxBVp2rTNT4m8KyB+ThtnpCWnCtAck08aoTHmKXwUIfZ7J88R4NFZvfhU9yc4Dy5HEKWum1O
	oRj4ftuMY/gY50nXKHc2/+rrbGfAvweiL07NoLVmumrzwXG+Wy0ARw6VRqyndCwh4D/hxsUheQaLo
	vj4y/+mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwot9-0006vC-BQ; Tue, 05 Jan 2021 16:08:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwot6-0006ud-RZ
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 16:08:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 519B722C9F;
 Tue,  5 Jan 2021 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609862927;
 bh=wJQJGEVMiFp+U9i3KB68KovC4I4ZjyrsTucyHvp+mYU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=RAq1XL/BRN8XRTSri4cXSrqvujM81ioR4+GUq1AHhXecaj7QiUWiQ88dIVugFlchl
 PLj0Tjq2k++ZbgqOoM47jhkKnKK69EB4dWwbb4SWWCCEgHFfJaIdqiA9j1o8CIDFGb
 VmlHy1C+y878dkjkF4kZd8pHUgF6pphBI9JLc1TNqEr7Y5H/GxrnO2q9j6hXU6/0O6
 F/BC+FOE5W7Pq7VFBMxUdC2Yx5x5dsQz87UyJo6xH3cai7eqArOI3dLNh6M9KIfFCe
 bMnxRc9j/jnfB58g5Lt3IlL35kE9dM38IFdhf5NXVGmzl9LHHUkqI+ApfU/oQDMsjA
 e2FHKR5qKJKMQ==
From: Mark Brown <broonie@kernel.org>
To: linux-rtc@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, alsa-devel@alsa-project.org, dmaengine@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Dan Williams <dan.j.williams@intel.com>,
 "David S. Miller" <davem@davemloft.net>, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Jaroslav Kysela <perex@perex.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-watchdog@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
Subject: Re: (subset) [PATCH 00/10] Remove support for TX49xx
Message-Id: <160986289007.50207.17900821173530027212.b4-ty@kernel.org>
Date: Tue, 05 Jan 2021 16:08:10 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_110848_995644_6BA4127C 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 5 Jan 2021 15:02:45 +0100, Thomas Bogendoerfer wrote:
> I couldn't find any buyable product other than reference boards using
> TX49xx CPUs. And since nobody showed interest in keeping support for
> it, it's time to remove it.
> 
> I've split up the removal into seperate parts for different maintainers.
> So if the patch fits your needs, please take it via your tree or
> give me an ack so I can apply them  the mips-next tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/10] spi: txx9: Remove driver
        commit: 74523a5dae0c96d6503fe72da66ee37fd23eb8f5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
