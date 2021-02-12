Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043AFC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 16:32:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C336186A
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 16:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C336186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wOC9YyZp0THpAXimv5ZC7qHBgd9gVzq9ton8cUv74JE=; b=I3x99fDSDhLAIB4Mmw2Le4ub6
	ek/6L4Fh3gWjQUZVMvSpGdKSY3mdyhh8fD/zEXaU8ElzwPRMsCzRqFPkXgVH9W1NG94XiCo+7NCB5
	/XH7g+8udfcGXFIPfnn0UB1uqJcU9V5fJwX54s64lW9cKR3gEPyJZJDOY3oFBY9P4+/CePX3maNcR
	f9l1n7Y24gLR2f1/13UReWXEG/kWAaN6fZIuBo/KTItxJpulsPxl2mLd+p2F641GvyXmZC/RtV008
	OyZ1fq75guNurKPB8ugYAWTMPjtbFRNg/Bi35JmhDFPCUs6rsusG22vGu+729k7U1bMOlxZ7fRvK6
	xqHRN0MtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAbLJ-0002X6-IP; Fri, 12 Feb 2021 16:30:53 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAbLG-0002Uy-J9
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 16:30:51 +0000
Date: Fri, 12 Feb 2021 19:30:41 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] mtd: physmap: physmap-bt1-rom: Fix unintentional stack
 access
Message-ID: <20210212163041.a23drtvtcv5vjem6@mobilestation>
References: <20210212104022.GA242669@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212104022.GA242669@embeddedor>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_113050_795039_64CEBC2D 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 12, 2021 at 04:40:22AM -0600, Gustavo A. R. Silva wrote:
> Cast &data to (char *) in order to avoid unintentionally accessing
> the stack.
> 
> Notice that data is of type u32, so any increment to &data
> will be in the order of 4-byte chunks, and this piece of code
> is actually intended to be a byte offset.

Thanks, one more time.)
Acked-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
> Addresses-Coverity-ID: 1497765 ("Out-of-bounds access")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/mtd/maps/physmap-bt1-rom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
> index a35450002284..58782cfaf71c 100644
> --- a/drivers/mtd/maps/physmap-bt1-rom.c
> +++ b/drivers/mtd/maps/physmap-bt1-rom.c
> @@ -79,7 +79,7 @@ static void __xipram bt1_rom_map_copy_from(struct map_info *map,
>  	if (shift) {
>  		chunk = min_t(ssize_t, 4 - shift, len);
>  		data = readl_relaxed(src - shift);
> -		memcpy(to, &data + shift, chunk);
> +		memcpy(to, (char *)&data + shift, chunk);
>  		src += chunk;
>  		to += chunk;
>  		len -= chunk;
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
