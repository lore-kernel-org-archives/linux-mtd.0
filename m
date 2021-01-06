Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCF7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 19:11:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBA3223131
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 19:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBA3223131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svV4e7ZVer0Jxx5kFhLkaqLB1E8gBN2tNIZLsfu+Ars=; b=aXBnDuj2RXDQGAmUBYteYk1vMf
	80Hcop3eGKnAmE91eSftDa9XIVsH4Kq2UFuNERQaQczfZIcHlnzmvHuMg5sEMKQAlpURWuuMii5iQ
	rlImR7IovbwWw1H3XkxmFx2GZM0AiDxE6kxa8oI2y0q5pswMYK0Dt22em8ZvJee/L4irFRt/o6KHD
	WnjBt3MagbJ8rnYPyxjT1SPoF6xH0d4UAVUQgpLIzNzOGW4jnYUNvCmOFy63BydS5XzzmnKN2hUzq
	0vPQs5OFPORpHsAsfknGcNMIXSiYT5xWBPzXqO0Ju8PXu9n6tU3hbsYqyMSm44zMna15Y2oxS160K
	7VbWykLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxECn-0005mQ-Rv; Wed, 06 Jan 2021 19:10:49 +0000
Received: from smtprelay0160.hostedemail.com ([216.40.44.160]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxECl-0005lj-BK
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 19:10:47 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id BB2925C0;
 Wed,  6 Jan 2021 19:10:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: push15_3e110e4274e4
X-Filterd-Recvd-Size: 2304
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed,  6 Jan 2021 19:10:39 +0000 (UTC)
Message-ID: <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
Subject: Re: [PATCH 05/10] dma: tx49 removal
From: Joe Perches <joe@perches.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matt Mackall
 <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>,  Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter
 Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-ide@vger.kernel.org,  linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 alsa-devel@alsa-project.org
Date: Wed, 06 Jan 2021 11:10:38 -0800
In-Reply-To: <20210105140305.141401-6-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_141047_433830_04AEBEAD 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-05 at 15:02 +0100, Thomas Bogendoerfer wrote:
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
[]
> diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
[]
> @@ -26,11 +26,6 @@
> =A0=A0* DMA channel.
> =A0=A0*/
> =A0
> =

> -#ifdef CONFIG_MACH_TX49XX
> -static inline bool txx9_dma_have_SMPCHN(void)
> -{
> -	return true;
> -}
> =A0#define TXX9_DMA_USE_SIMPLE_CHAIN
> =A0#else
> =A0static inline bool txx9_dma_have_SMPCHN(void)

This doesn't look like it compiles as there's now an #else
without an #if



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
