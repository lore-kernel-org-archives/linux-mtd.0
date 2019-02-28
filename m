Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF0DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 08:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2ABF218AE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 08:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BulW4VbT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2ABF218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5bGKsW7Cy4Zxn4y4EwRZhARAb2g56eg+/74/5L6reg=; b=BulW4VbT3njYuC
	4cRx34tv59+ryuzJCI2p8lpDUV7HpU+LfZXpwM8tj0A3rAeCYAtBEeIjWJ+cMktSE1/ncXBb9RgUa
	ucSFohnk95DMS1vQL0LJ/rmt0ZEBJbIb8gAd9W+oCV/LmTw+PaWO0LcSc9i/KUbHTBpV2AVfqela2
	eH7CHymKS6zSq0668M41lmKkTaVRPI2X0YmXuWBZs2JTSpayoeKZ6FaPl7uTmvTpTz2xpNjh5bYE9
	GTanIk5FS3QnJq0+UWtih3Eu66bBD1cNrp3PBu74mnYbuonuxMTag7ZpjRF1pTVqYprzfdPYtS7js
	rRwRNrmUwJqhVqVRsqAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzHAd-0008AG-0t; Thu, 28 Feb 2019 08:35:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzHAZ-00088s-4w
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 08:35:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 872F1608A396;
 Thu, 28 Feb 2019 09:35:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id itjBi0Ip0Qwz; Thu, 28 Feb 2019 09:35:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 34F55608A397;
 Thu, 28 Feb 2019 09:35:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MMr32QXzIu_C; Thu, 28 Feb 2019 09:35:51 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id C2230608A396;
 Thu, 28 Feb 2019 09:35:50 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ubi: wl: Silence uninitialized variable warning
Date: Thu, 28 Feb 2019 09:35:50 +0100
Message-ID: <8490920.CCJDc82j5X@blindfold>
In-Reply-To: <20190228053551.GB3253@kadam>
References: <20190228053551.GB3253@kadam>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_003555_340413_D95C2201 
X-CRM114-Status: GOOD (  16.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 28. Februar 2019, 06:35:51 CET schrieb Dan Carpenter:
> This condition needs to be fipped around because "err" is uninitialized
> when "force" is set.  The Smatch static analysis tool complains and
> UBsan will also complain at runtime.
> 
> Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/ubi/wl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 40f838d54b0f..2709dc02fc24 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1517,7 +1517,7 @@ int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
>  		mutex_unlock(&ubi->buf_mutex);
>  	}
>  
> -	if (err == UBI_IO_BITFLIPS || force) {
> +	if (force || err == UBI_IO_BITFLIPS) {
>  		/*
>  		 * Okay, bit flip happened, let's figure out what we can do.
>  		 */
> 

Good catch, Dan!
I thought gcc is supposed to find such issues too. :-/

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
