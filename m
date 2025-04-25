Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984DBC369D5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ztn7UfRBWBSJ5HfOYfy/i7SbfmnqffdV3mPpj6ne8Qs=; b=TYyZ6qD/lSoktW
	EuSFsHm/tUxeskQAT6w0kmA5BqBQlOJQOYLzPeo46h7e8yx63qe7EQBCgAADzolfdmeeVkxH1GZo8
	2/3RusovQaNtNyEBNlAK4ioKQylDWlZopqb3Xywa3szCq4lbFxnjXcU4FR6iZHF0moPKZ0FlLzJOV
	c6hCxvJgQbsdf9GCkFdsX4MZt+dymgw3nnuYeFuhw9JrohkymQi/2c2m4Ngg4fJ6BHI0upxeHM5O9
	6wsAmsl8l5IjSD0oNR9OYE7p6ThcRcB/xVa1MLOezlRTSRX8cKvgr46gW/tZqcIZ2rnsmX2+pYHPQ
	5TvBd41omP5rOF5+q5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Iue-0000000HFB3-29ge;
	Fri, 25 Apr 2025 13:16:16 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8I3D-0000000H6qZ-2ySa
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 12:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Fc/25MkrpBeQ5N+c0EPmb7zcVe24kUxWCCXYa4mSP68=; b=IsQT5opmNOuSSThUWcBeGkcobG
	5ycosMTSABz34FQRjWDlNnTSeHToSWXB0JM9EtXW9pzXugp13H0IskALZaPk3fZ9AOJfUefig2HeD
	ZDMXepl4UZPl/HO0IfLCiJ0MLfu1Kk2L735q3wLzTZwNxiZ9iJZ6rSxMM6Hvw9MTONkOV/BzPgOuq
	QoVkoym3vz2kWlyKi0OpbZkokU+xKkbCJ7ieZrjCMMYKuLrsXSDkX8E9i/794shaBTs42eMiO1wF+
	DqLJz4DA3WKZFYrQGwu0mEuIVmaaugRNzruZ1mwHfeAT3m+zklb56qRZSGYS958oTX58wH11c/lQk
	zGbKZyaw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8I2s-000yzT-25;
	Fri, 25 Apr 2025 20:20:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 25 Apr 2025 20:20:42 +0800
Date: Fri, 25 Apr 2025 20:20:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v5 PATCH 11/14] xfrm: ipcomp: Use crypto_acomp interface
Message-ID: <aAt-GiUloeLEfu7O@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <d7bccafdf38259c2b820be79763f66bfaad1497e.1742034499.git.herbert@gondor.apana.org.au>
 <aAt8AIiFWZZwgCyj@krikkit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aAt8AIiFWZZwgCyj@krikkit>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_052103_749613_32A5A43A 
X-CRM114-Status: UNSURE (   9.49  )
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

On Fri, Apr 25, 2025 at 02:11:44PM +0200, Sabrina Dubroca wrote:
>
> The splat goes away with
> 
>  	/* Only update truesize on input. */
>  	if (!hlen)
> -		skb->truesize += dlen - plen;
> +		skb->truesize += dlen;
>  	skb->data_len = dlen;
>  	skb->len += dlen;
> 
> pskb_trim_unique ends up calling skb_condense, which seems to adjust
> the truesize to account for all frags being dropped.
> 
> Does that look like the right fix to you?

You're right.  I must've missed the truesize update in skb_condense
when writing this.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
