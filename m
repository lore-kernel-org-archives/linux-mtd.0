Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD34C35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 10:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B35Si1bYWnWwSyZ35wlp0BPpmH0fIfQ5GRkKrh/xP3k=; b=fjlMy2un2dhDA7
	KxpXLkUDTp3DyMPTkLF9ZM2hL5agv340v7UwKQVztqr4dw9A7dNnhCmMFRJfZkINSoAvkFBJ8+tF8
	A9xcMaLvESMw9hf9OHqRUWx0Xh+rnBZpkj8YzN/UW8R5u714mDEACH9YpWm+G/HDVr21Oag91A/ga
	xK9JC7B2+ORKD3tqEgPMe9zquh86PeFcx8/TVf3d4PDDrrHkQx/Xh1DyBjVfRk4oZqO4RXC6jwhCe
	lcYYxwMYwnf1V6G8lj2uoPLOUt2mlwU/LrzxwHEbmjsJbBc+M3Rjnp1y+Ve/M/hXrICe6WP/sJKfo
	VQSczuhdVgB0p508EX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqG9-00000008bhG-0G0w;
	Wed, 19 Mar 2025 10:02:49 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqBA-00000008aps-3vgf
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=soZjkWmnxzqoseqLHBteHQrecOxj2rcgJpWAd/MQWSw=; b=CvxxG/eyewwJvyAZXaUOdQOndl
	dPKTxPdgPfY/0NRpPiisMELtLDbUeB0vdhyo0lmJkLaC6L7RHoge1S+gQf99Di1uGEOl61jmR96LW
	nWCXuiF31cKw2pvW/he2hq8aaizHtVlEXIBh/lsA18cuWCY/ZYDKYiMYmKeNzwNP+0uMuJgoufnaC
	MCB7+EcY2Jenq9G3HVYX7RqY2iExTkKmCaZIGgfl4UZKX43XgiKXdE7mBUMfDov4/I6muJ2xIyIV7
	7jn6z2rVncpR/OnSDEmTSjvJSP5/VNj5UFnLi+2H11U7I0m6kXnS+jcVBh57CwvpBxl/hPl3NMQyR
	2sfc2gOw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tuqB2-008My9-1x;
	Wed, 19 Mar 2025 17:57:33 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 19 Mar 2025 17:57:32 +0800
Date: Wed, 19 Mar 2025 17:57:32 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v5 PATCH 10/14] crypto: acomp - Add support for folios
Message-ID: <Z9qVDFAzse7y3zLa@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <aa5ce234573d4916ca7a2accf4297cea6f750437.1742034499.git.herbert@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa5ce234573d4916ca7a2accf4297cea6f750437.1742034499.git.herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_025740_978282_E4A4FE40 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Sat, Mar 15, 2025 at 06:30:40PM +0800, Herbert Xu wrote:
>
> -		n = slen / PAGE_SIZE;
> -		n += (offset_in_page(slen) + soff - 1) / PAGE_SIZE;
> -		if (slen <= req->src->length &&
> -		    (!PageHighMem(nth_page(spage, n)) ||
> -		     size_add(soff, slen) <= PAGE_SIZE))
> +			spage = nth_page(spage, soff / PAGE_SIZE);
> +			soff = offset_in_page(soff);
> +
> +			n = slen / PAGE_SIZE;
> +			n += (offset_in_page(slen) + soff - 1) / PAGE_SIZE;
> +			if (PageHighMem(nth_page(spage, n)) &&
> +			    size_add(soff, slen) <= PAGE_SIZE)
> +				break;

This should of course be

			size_add(soff, slen) > PAGE_SIZE

> +			if (PageHighMem(dpage + n) &&
> +			    size_add(doff, dlen) <= PAGE_SIZE)

Ditto.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
