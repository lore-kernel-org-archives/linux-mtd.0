Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8E3C282C1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRk5Qh1DplmT8zgpx7zRBolRxKvlqdwsTqMpTxw77DM=; b=qIJ4w7lwgcyDFO
	Bqd096bQzr+fv5Yg2Aw+wksSWJ9p5TvpxENAHe+UPn2DqC3mofAKbBKt1fJZcgV5EQhcktsy7ohJj
	vHq/GdjlRI+rYvAFoQUMb43rosbyOQu/Ff3s+UYqZk/b4MuwYX0LV8D+ZcN/3c0mUxkRwt2iGyTma
	IFkpBUVRGA53wR2ZT0s9kV3i1eZTw/dvLEUjmAwYlZKhKrRU0BYF49F1aLontG0nlyS8VOO6ij2Zf
	E06TOPkQGU2a69b9Sl031A5aSmVCNCx28+gsPwOUldStE4tNmEDn2Z7jESMAsjNYmpGSCajZvssL8
	WrjpjHpYoVFe5KblvnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1m-00000007lYB-1yKT;
	Thu, 27 Feb 2025 14:38:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndYR-00000007SNq-3ORb
	for linux-mtd@bombadil.infradead.org;
	Thu, 27 Feb 2025 13:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C4NTJOJ3dCAJ9+vpvzEprQrWJrpsHSJFBRqUQ8todYw=; b=Dpw3udR3BJAFq9SyV4WrEEtnAj
	4AK/f2BJmM2iCspBbFHcvyAYokish3HnL+MnOj7JlEsRpxTpwaGNuOZ0GjF1xl2kJOx4qt3J2ahuW
	az6fb102wILROrGzFvXwJPaH58zNpMOOcrCBc343TieQO3/CDGnn7X1+s/6kO95pgHKXAnEejIoZr
	eB7TVgWCB6dlZRGlAflwAymbuHq47SCX9B61CP43qWtZ2O6ijiX7nvvVtATjJJOXC5cOJJTTKtd0a
	0oXIb31u03yt/F+rw+NDupYNgVgy0IBHz3v3ZGkJAqcax4tYjHYegxiTUmQ4/XbT5eUfHjXU340Lp
	d0XLYfiw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tndYL-0000000Hb1D-0gW6;
	Thu, 27 Feb 2025 13:03:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 45472300472; Thu, 27 Feb 2025 14:03:47 +0100 (CET)
Date: Thu, 27 Feb 2025 14:03:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	Thomas Graf <tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	iommu@lists.linux.dev, linux-mtd@lists.infradead.org
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
Message-ID: <20250227130347.GA5880@noisy.programming.kicks-ass.net>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <46d17d84-5298-4460-96b0-9c62672167a0@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46d17d84-5298-4460-96b0-9c62672167a0@icloud.com>
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

On Thu, Feb 27, 2025 at 08:48:19PM +0800, Zijun Hu wrote:
> On 2025/2/21 21:02, Zijun Hu wrote:
> > void api_func_a(...);
> > 
> > static inline void api_func_b(...)
> > {
> > 	return api_func_a(...);
> > }
> 
> The Usage : Return void function in void function
> 
> IMO, perhaps, the usage is not good since:
> 
> A) STD C does not like the usage, and i find GCC has no description
> about the usage.
>    C11/C17: 6.8.6.4 The return statement
>    "A return statement with an expression shall not appear in a
> function whose return type is void"

We really don't use STD C, the kernel is littered with extensions.

> B) According to discussion, the usage have function that return type
>    of the callee api_func_a() is monitored. but this function has below
> shortcoming as well:
> 
> the monitor is not needed if the caller api_func_b() is in the same
> module with the callee api_func_a(), otherwise, provided the callee is
> a API and provided by author of other module. the author needs to clean
> up lot of usages of the API if he/she changes the API's return type from
> void to any other type, so it is not nice to API provider.
> 
> C) perhaps, most ordinary developers don't known the function mentioned
>    by B), and also feel strange for the usage

It is quite common to do kernel wide updates using scripts / cocinelle.

If you have a specialization that wraps a function to fill out a default
value, then you want the return types to keep matching.

Ex.

return_type foo(type1 a1, type2 a2);

return_type my_foo(type1 a1)
{
	return foo(a1, value);
}

is a normal thing to do. The whole STD C cannot return void bollocks
breaks that when return_type := void, so in that regards I would call
this a STD C defect.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
