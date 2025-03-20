Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A3EC28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKjn0VhApmBQHzC2dz/68gmxc6PTDmjTkl4Ia7sQrqE=; b=lv3lM5GcbNIC89
	ZhHP9xOrW1n9RUNHZXVnsAyLgxXxXz1se5i/tNlnZmPv/xFk0VAcqZuYgLzNn8ctRezp8EOYNNMBm
	430ubMdrqP6FqTiUY99oojL4hXQSUer4MlVNKuCqK83nranuCctTdou863aVz63HhwN83NIPfkzIp
	GDpsPIM3/ghp+iJvx6eM9Jo7hgwkmR6Qr0BNlUsbw8crtkZ5gl8hgewbfU1gy/AkZkE1mlVcLDN5+
	/clnsbWKyoonjhPAUIZwBmF5RXYFSyl9G+CiSMbGoMdNABPkYeNlPc7fOWcZC7VBmrVDHAP+DJ3uP
	u1EyxSHOf7bCx2L1xQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCIC-0000000BiEA-37qH;
	Thu, 20 Mar 2025 09:34:24 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCI2-0000000BiDN-3y4O
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 09:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NgDHGEQEM91sirkF0AfoRwO3nj0yC7YqaxjyVS0vZ7A=; b=AXLjn6h3p+ptU90LFBXmrST3qQ
	3Uh9x6yofzozBU9OGkrnqfJmYis+jGw+KswC8ZzAAS7BwOMjVlx1psug331Rpohj6oy1o42tV/k7X
	hRTiPUowHypiiNaxT6mupCE7AJlGz4sgBjDhp8U5DMHRfTjzRW9oOMz+YJXIpKtRhC7gsUqwCO56v
	q4sfFzB4wUNPx29wl+iBmiFnT5iCOvJF07avkO/faIN2OITJJdrJMfJo+Orkv6scMAV74iHmK+rUQ
	4Iyy6kktqUsFMtK1yu8cg2vRcOlU3KGctyn53lnYWfJkYkJxyYORZHQU+14rNrXxfk07v/Kg7uKmo
	+30tTLFA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tvCHm-008fU1-0b;
	Thu, 20 Mar 2025 17:33:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 20 Mar 2025 17:33:58 +0800
Date: Thu, 20 Mar 2025 17:33:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v5 PATCH 11/14] xfrm: ipcomp: Use crypto_acomp interface
Message-ID: <Z9vhBv2Jp0ABpZas@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <d7bccafdf38259c2b820be79763f66bfaad1497e.1742034499.git.herbert@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7bccafdf38259c2b820be79763f66bfaad1497e.1742034499.git.herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_023414_980608_6D0BED8B 
X-CRM114-Status: GOOD (  10.01  )
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

On Sat, Mar 15, 2025 at 06:30:43PM +0800, Herbert Xu wrote:
>
> +	sg_init_table(dsg, dnfrags);
> +	total = 0;
> +	for (i = 0; i < dnfrags && total < dlen; i++) {
> +		struct page *page;
> +
> +		page = alloc_page(GFP_ATOMIC);
> +		if (!page)
> +			break;
> +		sg_set_page(dsg + i, page, PAGE_SIZE, 0);
> +		total += PAGE_SIZE;
> +	}
> +	if (!i)
> +		return ERR_PTR(-ENOMEM);
> +	sg_mark_end(dsg + i - 1);

This is missing a

	dlen = min(dlen, total);

> +
> +	acomp_request_set_params(req, sg, dsg, plen, dlen);

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
