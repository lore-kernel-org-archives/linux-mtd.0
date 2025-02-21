Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBD6C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1xhImkhQvVhHs6BDfEBUqo0u7M+NTOzJVOK79JxkN0=; b=q2yEz7zrXsHPvP
	rQjhWdRCK3cRgtk+HIY0uljgCzmBWBwMC0sin7IZ8N9o9gPkCtgKYtniInzTOPKpEKU96dujK9xsQ
	EVbkypvPTxtpa8YESMujRo0hLzD0QIy91+gPxqzJSk7qbn4Lf4f1YFH1JJ9peLiVRDzx031dp3Ehs
	pGUFuGC3ThBqHlA0c1FKW37LU3tGTwLzkvbVoSApgujuF4P6cx4yg+PKZGhevrEO2jKlWGgAhmuDU
	IJYIHnaMEc/vhpJdXbgZHvEQ9yeTEEw4aVmr+ZdERxiUe1qnFuxdii9BzcepaPczmLotB/4mANxJ+
	uiwEgoz/DIq5VsBuRDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSpL-00000005aBX-42Qi;
	Fri, 21 Feb 2025 13:12:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSpJ-00000005a9R-1qKa
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D46C95C5698;
	Fri, 21 Feb 2025 13:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF81C4CED6;
	Fri, 21 Feb 2025 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740143539;
	bh=OaIEfRGrNHujGIM2xLDrlaaE7zfxvSiYKjihwGmoU78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyXONUDbGQ78MxsudewWlzaPrGsFnl2q/eB10uxmLxkUWIEIPE62xYNKYKKcUGAhr
	 RPQvR4591QqFmp/SBvlWCc55VgxYql2SEwFsM+Ss8aba8JFiNjATNYZ43c6E0SVGDQ
	 WgAk6f+2vY/eqZV/Iie1hLQLtLIh5+agINDhu+wU=
Date: Fri, 21 Feb 2025 14:12:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
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
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zijun Hu <zijun_hu@icloud.com>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	iommu@lists.linux.dev, linux-mtd@lists.infradead.org
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
Message-ID: <2025022145-ungodly-hanky-499e@gregkh>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_051221_594228_7BF6087C 
X-CRM114-Status: GOOD (  14.21  )
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

On Fri, Feb 21, 2025 at 05:02:05AM -0800, Zijun Hu wrote:
> This patch series is to remove weird and needless 'return' for
> void APIs under include/ with the following pattern:
> 
> api_header.h:
> 
> void api_func_a(...);
> 
> static inline void api_func_b(...)
> {
> 	return api_func_a(...);
> }
> 
> Remove the needless 'return' in api_func_b().
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
> Zijun Hu (18):
>       mm/mmu_gather: Remove needless return in void API tlb_remove_page()
>       cpu: Remove needless return in void API suspend_enable_secondary_cpus()
>       crypto: api - Remove needless return in void API crypto_free_tfm()
>       crypto: scomp - Remove needless return in void API crypto_scomp_free_ctx()
>       sysfs: Remove needless return in void API sysfs_enable_ns()
>       skbuff: Remove needless return in void API consume_skb()
>       wifi: mac80211: Remove needless return in void API _ieee80211_hw_set()
>       net: sched: Remove needless return in void API qdisc_watchdog_schedule_ns()
>       ipv4/igmp: Remove needless return in void API ip_mc_dec_group()
>       IB/rdmavt: Remove needless return in void API rvt_mod_retry_timer()
>       ratelimit: Remove needless return in void API ratelimit_default_init()
>       siox: Remove needless return in void API siox_driver_unregister()
>       gpiolib: Remove needless return in two void APIs
>       PM: wakeup: Remove needless return in three void APIs
>       mfd: db8500-prcmu: Remove needless return in three void APIs
>       rhashtable: Remove needless return in three void APIs
>       dma-mapping: Remove needless return in five void APIs
>       mtd: nand: Do not return void function in void function

These span loads of different subsystems, please just submit them all to
the different subsystems directly, not as one big patch series which
none of us could take individually.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
