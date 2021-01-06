Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9C5C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 06:19:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4602320727
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 06:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4602320727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lN/MMu0Q2PFV1CrtpsLRZ2gHuQas978j54wY4xQEO9A=; b=XDT1tDqF7qWCwQCvXfqKl8/ln
	XPEukWFYTtJZXqrX8+8u4MslIri2rll3YgkAbOfGx7JbnWLSy3J16LT8bENJHFtuvvVXHEQGnOy1d
	I6OTAcjTP5yK69TvcfBkGKuL/MNhic6nqx4zNawvRsjll6q56SG1vADX0p2rxcym1ePXd5oU3Ybt2
	mNQRqQGchdFDYwVc/FsNiFTBJ+bWnlouD3bkLcQK3/MXaBR/GIPzzcLH139y/qmMAIvyWNYy7dhhj
	rQhCx1zfK7mHTUNib3h+i70IMjN4ELPmAoHI0LNSsuDF+BuQnvT2qnxFU9yuEwcXVHK1AQgiHDv1J
	Tr/Ha8evg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx29J-0006ck-Jy; Wed, 06 Jan 2021 06:18:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx29B-0006cI-L4
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 06:18:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA573207AB;
 Wed,  6 Jan 2021 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609913894;
 bh=5lp+13jiD6sIpu3g6HHgflH2MeBd+glQhPUXzn5sEb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CakvhJq/S0InR70KIkE0nT8f4OsK8tazYsMYaSFjfmUD+Huax/XAoFChfqSwh2Ko3
 O2Yr5kMJTtRg84SKasb5ZjVbjiriRmjXC//Mp6svMTkOguihXcYD8Y7jrNAu5hhU9s
 NdGVzXNjj+s9GjbUJWIyH+IHiUgF6TmPNadTJjfPC+mngpvbFg7c/5UFpGfay3esh2
 cYJ3MG2vwyVhJDX/j+RFuMWxX9ZlY7uvVKpUVyQmSjwgaHtsGBtJTIpjBfFO76T5xG
 lQPLPifs3+qF6HuckWFMEKtmfxytThn8qOgCOh6FZpFqy+bNi0rc5xLf/Si1eeEIi4
 d5j4VPRJ+OyIg==
Date: Wed, 6 Jan 2021 11:48:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 05/10] dma: tx49 removal
Message-ID: <20210106061810.GO2771@vkoul-mobl>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105140305.141401-6-tsbogend@alpha.franken.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_011817_810704_06AC69B7 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05-01-21, 15:02, Thomas Bogendoerfer wrote:
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Applied after fixing subsystem name, thanks

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
