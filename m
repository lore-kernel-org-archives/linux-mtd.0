Return-Path: <SRS0=hgS/=GP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D086C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 23:35:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2448E23132
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 23:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2448E23132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uX5QVx/FwIlyymImEDpeqI/+Ksza8LK4UreJ6PyYTwU=; b=JKpYih0LTpN0xzLxwb5rcfMa2
	Za+A1gMw/odnHSc3R352QpRLwf/b69Pzg18YCpLLtOhBLTjp8z1cb66/ea99XZECe1AW85KtzoTc9
	Ebk8keRl5aI7R2M4KnfxQblO5a+Vep0Ffz6TbIpvlhE5P7b408KNl6NBhm8CjJ0zs16mCpC+MCccu
	SfI3CVDVriN5FQot2q7BbJxokjSsfKXr27+5RP4cqZ67kzKLiTo5HcFAMjpu5JxHPJKmROGNjH3RJ
	f1srpJI0RMrHUP49+oJEHYFhtRMa4p/jDBKs3NgWQlU7aVkby5pvoKfsX13mFbjJAGMUSRCs7449Q
	aakzzKWpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzTAj-0004ba-8S; Tue, 12 Jan 2021 23:33:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzTAe-0004Xp-H0
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2021 23:33:53 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A8AE81BF20B;
 Tue, 12 Jan 2021 23:33:41 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jaroslav Kysela <perex@perex.cz>, Matt Mackall <mpm@selenic.com>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Alessandro Zummo <a.zummo@towertech.it>,
 "David S. Miller" <davem@davemloft.net>, Mark Brown <broonie@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-crypto@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-ide@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: (subset) [PATCH 00/10] Remove support for TX49xx
Date: Wed, 13 Jan 2021 00:33:30 +0100
Message-Id: <161049432258.352381.2804715824942772218.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_183352_723280_50258832 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
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

Applied, thanks!

[08/10] rtc: tx4939: Remove driver
        commit: 446667df283002fdda0530523347ffd1cf053373

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
