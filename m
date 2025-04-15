Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F2C369AB
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoacoZVRyfE/q+bWi7QXy5bz8achpv9SZe0vAvupc3g=; b=UIUP/0RCtQkNji
	jcuKMw7omE153uLPLDfGfSQSriujpC1XfzeH9ksZkxlgRqk3dTg/EOCkQMQzTLi+SXPzy3Fac+M0t
	ntdwJzqodFRepYKjZ7xy2HslkYJ3eSI4rPmM4WsQsQP4k+cJELsuhEbFURdpS5Kg5y0LIPemeL7zh
	P+3X7Aac2q3VyeqKQAjc818ahasSUCK6Krr2B9yDTE2VvZsDc3WoYTS+oRqdh0c3sP02cB92tjtOg
	OMvHyF1voHPocR75v+GCakN3YT6xHomPrsIuOYy8XXdWIfNj48vMgleGdk+c4vk2GkXzOXZycOUEe
	4y7tP6Gbt2coYAa4O5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jJD-00000006R76-1Mp6;
	Tue, 15 Apr 2025 16:38:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iv3-00000006NNu-25XM;
	Tue, 15 Apr 2025 16:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2DFDA49F7F;
	Tue, 15 Apr 2025 16:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382BAC4CEEB;
	Tue, 15 Apr 2025 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744733631;
	bh=1jFrBy0lzqpyUKpmfkbxvJvV2QeeBiFeu/gLSlD6DXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iwf/xepfn8XdaQPkl3OXO2pziEP0MlRo4kLwGSJsiPog0Lg5Q1zc16D6DMGJwuihR
	 wFxPHaCtVDUNGtTLwsWTrCyK5ML3+2kHLLu+hLOI9049UI/1wvm6ANh7f1RkqDDqZE
	 sfK6i25rKsc+rZPzOJjQiMNZCqS9qAsXy/ekUZsqbaFi5M/YNucILhk7ZNjcpj8xhR
	 cTpu1IqsMZdWOGrrLhNg9KBwOnjf8is+U1vUkxZI9HftXGggDq4mt6mtnKRdxCOmja
	 JYxKuYVHbxzBtX6yyWjjBDmrCV6qBEG+qekX20hC4nqmB77hh3oQmv7Pech6xvsaet
	 8MiIM487OnzWg==
Date: Tue, 15 Apr 2025 17:13:37 +0100
From: Simon Horman <horms@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 09/13] wifi: brcm80211: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <20250415161337.GZ395307@horms.kernel.org>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-10-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-10-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_091353_662978_6F1FE498 
X-CRM114-Status: GOOD (  16.56  )
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

On Wed, Apr 09, 2025 at 11:43:52PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmsmac/dma.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
> index 80c35027787a..5d7500ee2d3b 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/bitops.h>
>  #include <net/cfg80211.h>
>  #include <net/mac80211.h>
>  
> @@ -283,24 +284,9 @@ struct dma_info {
>  	bool aligndesc_4k;
>  };
>  
> -/* Check for odd number of 1's */
> -static u32 parity32(__le32 data)
> -{
> -	/* no swap needed for counting 1's */
> -	u32 par_data = *(u32 *)&data;
> -
> -	par_data ^= par_data >> 16;
> -	par_data ^= par_data >> 8;
> -	par_data ^= par_data >> 4;
> -	par_data ^= par_data >> 2;
> -	par_data ^= par_data >> 1;
> -
> -	return par_data & 1;
> -}
> -
>  static bool dma64_dd_parity(struct dma64desc *dd)
>  {
> -	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
> +	return parity_odd(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
>  }

parity32 expected a little-endian integer as it's argument
while parity_odd expects a host byte order value.

I realise that the existing code just casts-away the endianness
annotation, but this patch adds a Sparse warning.

 .../brcmsmac/dma.c:289:66: warning: incorrect type in argument 1 (different base types)
 .../brcmsmac/dma.c:289:66:    expected unsigned long long [usertype] val
 .../brcmsmac/dma.c:289:66:    got restricted __le32

>  
>  /* descriptor bumping functions */
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
