Return-Path: <SRS0=9pOF=GL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6142C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 08:30:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B5123435
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 08:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B5123435
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iwCSqd5+w1XXDb43bPYLwmk5dZD4D1zuZ998J6Xi75Q=; b=ZNm8ikj1G0IXWzAxGrAxxnNLI
	zKjBU7ItDZFb6Rt7IH3quS4P/E7lqbQ1Lnz8yxkSibusjDPUNPlyv4InxrRQ32PGufuGzVeo1U47K
	u0tryU1d/hIx1gU+n+aK++L2pNl6bQGuVmjLf6teGiFI5hfx4YRWtgz8k2rR1stFwelbpDDFzvCyy
	5FQEJKsZU2o4Lyz0AjCkYKOq/NPpUhJn2pzg+3RjE3az0j/meU/ykxVwQ94AAdqf7ns8d/PCR7wM4
	acu4JX0sOGArL3xHN91BE9aILe4QLIAViQsTI/X3OwsS/DWquvgoMFf4RIo9ykT4TvNtwG5IIm+JF
	mXKnJmp+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxn7v-0004Qq-3v; Fri, 08 Jan 2021 08:28:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxn7p-0004QJ-0j
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2021 08:28:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CC7A23435;
 Fri,  8 Jan 2021 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610094479;
 bh=SAoDiXJG+49pPIJcmLEdT3YdpudMLb3tXzuV+M1ddMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EnEKOJIN+WnD4u6lFgo77faKCj54N+d/pFKhcGzW/Y3/Ccl68siuEONd2+MQVmWwA
 g8i5J1Jp9PRFqP+bjh1UVHmW6ZNZoM79Em/nHN5DHOG6ps9hEvQuax6LdoYTVQba6R
 W0M3rPvSPrbm/vYAaPU9CsppYeuXAhSoIAN8UGVK69VCDMDjU1FlkyeISfeCHTf0Cp
 UrPLrlJpGz0S4tUYkZu+D7Yp8uZm4/13PvNs53jDnTG1yuR/TZx3S6Q2A5kjWrfu5R
 w1MefWO2hD7veYyvb2xtc7eB2pAO3ZpInFWl5OgE2Cy2VRAsn/olPyc/xhF+bAgyze
 9qY+rCVqge15w==
Date: Fri, 8 Jan 2021 13:57:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 05/10] dma: tx49 removal
Message-ID: <20210108082754.GW2771@vkoul-mobl>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
 <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
 <20210107164015.GA12533@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107164015.GA12533@alpha.franken.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_032801_156773_3D419B33 
X-CRM114-Status: GOOD (  16.84  )
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
 linux-watchdog@vger.kernel.org, Joe Perches <joe@perches.com>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 "David S.  Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07-01-21, 17:40, Thomas Bogendoerfer wrote:
> On Wed, Jan 06, 2021 at 11:10:38AM -0800, Joe Perches wrote:
> > On Tue, 2021-01-05 at 15:02 +0100, Thomas Bogendoerfer wrote:
> > > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > []
> > > diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
> > []
> > > @@ -26,11 +26,6 @@
> > > =A0=A0* DMA channel.
> > > =A0=A0*/
> > > =A0
> > > =

> > > -#ifdef CONFIG_MACH_TX49XX
> > > -static inline bool txx9_dma_have_SMPCHN(void)
> > > -{
> > > -	return true;
> > > -}
> > > =A0#define TXX9_DMA_USE_SIMPLE_CHAIN
> > > =A0#else
> > > =A0static inline bool txx9_dma_have_SMPCHN(void)
> > =

> > This doesn't look like it compiles as there's now an #else
> > without an #if
> =

> you are right, no idea what I had in mind while doing that.
> =

> Vinod,
> =

> as this patch series found a still active user of the platform,
> could you drop the patch from your tree, or do you want a revert
> from me ?

Dropped now

-- =

~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
