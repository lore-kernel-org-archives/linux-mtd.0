Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E005C433E6
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:59:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B572311C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B572311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xBoCRmHesDI6YKb0WmHDG+ImmPi/4BIUh4qVidD9oQ=; b=2YgR7A9vzoguG9nEsdd0UNBmAx
	1c52kze/tWNYPtuzfoXogHg8XCsLnE+12vxIp4ddeloRJwQGoRsU8RcmQDkUPLS2adyrafKQMnpCI
	5lufxUPHoPU1yy2eBrgAYR7AG6uFgtnlrT6ZfYiqzzdNE0Ob6Db8Ziw9Rnm/5G5Zn0JoQVU7CZ7nV
	N878YUmtxBiVihvVkjWFRokZPB517aoe6NB60F7syR8bnURMvU+3q7Sj/zdlCuxRpZWRNkctL8l3W
	h5AJN3WlcQ/6a9WFBUm759OKW2CBxOXHwX/YtM6kIDHLfYGntKoE8oHwgfLPOaGW0OZwHtGuPwgmu
	AK2SeF8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxAGs-00031P-OH; Wed, 06 Jan 2021 14:58:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxAGp-000315-DY
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 14:58:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5D8723110;
 Wed,  6 Jan 2021 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609945121;
 bh=fs4tnAAHZc6P9CcCZmtXnqhshJdz+3INo0fDCULFaD8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=grRap1qACe13qOi+OZcRSFbPBF+dIr/ws3L/0hIw9hJfGzIKvP7l6ogZ4IDw43yGy
 2LHdh5/KkLIX5OZy0HUphNkwfKucd730v8Tp6LLuzacbNiujVv7S8AcFgKaat4EO7E
 y+/PvinZw7ISykZaboaWt60Ak3aP6L6FH/2ur96+2LlVa2dRoeg/GHIVTXjbL9m+/N
 lmUrNwQGiW3vl9pfoybJQC9JwzVTaaO03pya7nRF3kZVYLga8QDzM2brjULMEAV5En
 tz4bM66daxGgVwHYO/b7ctz5giI8LEijCXhmI8MPhXeH67zs/Q6iAskX79k3QrpAy9
 gww2PkLy1Faag==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-rtc@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-spi@vger.kernel.org,
 linux-ide@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matt Mackall <mpm@selenic.com>, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Alessandro Zummo <a.zummo@towertech.it>
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
Subject: Re: (subset) [PATCH 00/10] Remove support for TX49xx
Message-Id: <160994509314.52132.9683741232298303961.b4-ty@kernel.org>
Date: Wed, 06 Jan 2021 14:58:13 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_095843_534153_7A3CFEC8 
X-CRM114-Status: GOOD (  15.06  )
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[10/10] ASoC: txx9: Remove driver
        commit: a8644292ea46064f990e4a3c4585bdb294c0d89a

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
