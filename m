Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00375C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aViFMWJbBriktdFD5CNbPzM0WXykePTL5rn/7AszBtY=; b=lebrD5NDsKzjGE
	x2pPPO5Ut+HHqE5az7VsnUQkA4kcFtlv/CTTc5n0sG7wfLByHX6gGDAEBF0BWJwMMwXHSqP2iWWRe
	Z/o2+wA7oCWqSlGBPPdH5ru7SSOd8avSO+yjZInC3o/hUDgnSBvF6f2pzWMiLuKTKyLqKDmJAAb3t
	CBFaUOVG+sYl0W7yepHXX1rZAnF59f61inxbCvFy0OEgtMUgkC21xj9N0rnsUGPRgNkcsvtkOKw9p
	+7d/eHA9gDCUQT34wmBq2xYO0CRej4onQGVwHRtKY8aALj3bnNjdMM8kF8AiLcvR1PybxFczsxOGK
	EmzAxQZsGBlg7/lAkJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYRH-0000000DsdE-2RGR;
	Mon, 24 Feb 2025 13:24:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYRG-0000000Dscv-3EEQ
	for linux-mtd@bombadil.infradead.org;
	Mon, 24 Feb 2025 13:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OwmwOu+Cjzvd/Dyh2oCLg1P9uzBvkTbz8Qibak6RkKs=; b=iS/A260A40VI6SQ9dsr0Pe2Ec0
	+4I/Bpalp0CX65hp2mHNsbxfdLQ3ZQMp/MO3XTCmulOZ1LdYifv6XmmjBsEkUzc7/Ofye9OegILGU
	jhMbWZFAabjv9F1E7Tdsq+St//fzgpJbTghlaQ08rLhkZfj4YHNl3RsAgWE0X2VcL1qmU/ZGIqy9s
	q3djqUzHMEgyRNxqJ4zMlGJrlo+rBDv3+zWiBCnZolwsUOv1flDL0UYKwJjrhfaGLVZBSL82vN7Ui
	z/ItUQgAbHGrhpvvZGv/LP7zX+kb01JmoNnF7MGJbWqiG9NuEPEKF3SG3il1lVkgYfzh0ukPwqkvp
	tlhJKBVg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYR9-00000007Gtp-2twK;
	Mon, 24 Feb 2025 13:23:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B2A18300164; Mon, 24 Feb 2025 14:23:54 +0100 (CET)
Date: Mon, 24 Feb 2025 14:23:54 +0100
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
Subject: Re: [PATCH *-next 01/18] mm/mmu_gather: Remove needless return in
 void API tlb_remove_page()
Message-ID: <20250224132354.GC11590@noisy.programming.kicks-ass.net>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <20250221-rmv_return-v1-1-cc8dff275827@quicinc.com>
 <20250221200137.GH7373@noisy.programming.kicks-ass.net>
 <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com>
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

On Sat, Feb 22, 2025 at 07:00:28PM +0800, Zijun Hu wrote:
> On 2025/2/22 04:01, Peter Zijlstra wrote:
> >>   */
> >>  static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
> >>  {
> >> -	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
> >> +	tlb_remove_page_size(tlb, page, PAGE_SIZE);
> >>  }
> > So I don't mind removing it, but note that that return enforces
> > tlb_remove_page_size() has void return type.
> >
> 
> tlb_remove_page_size() is void function already. (^^)

Yes, but if you were to change that, the above return would complain.

> > It might not be your preferred coding style, but it is not completely
> > pointless.
> 
> based on below C spec such as C17 description. i guess language C does
> not like this usage "return void function in void function";

This is GNU extension IIRC. Note kernel uses GNU11, not C11

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
