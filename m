Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8570EC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqHCyOeqVLbHKSftCHp6sCRhCsVrxp0tdfEK7wZ22Wo=; b=PlquvYNGwwU8bA
	MpE5nqrtq+oHHGIFobDbRpWVO/pMQpI+3T5hYs2wUbxUK+lzwzJUdv9EsaxIupYTJHoxYeOdjRlWY
	zXuvHi/G4kcuEmuJtQq9MJNUycNUddjRWWpF4WFnG9G4UKXovF3f/zJw0sMxj49JRBOJer7bppMBe
	iKw+oi9vxe7gIvwgwrOx5NifU1YTSlxVDgX0zLI10Y5M89z+nHxjGppEKxY7Lge9ojrgff4h7g3d1
	f6iuswH2/k5sQKOGgQ54Bks+0uLvf8gKtkmtEod2gcunWkRor2S2A9L2ngSsM44dZMt11BaYwsHuZ
	+FE8RIXreQgKOcceSsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndTI3-004X4w-Cb; Sun, 10 Apr 2022 08:51:23 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndTI0-004X4U-4k
 for linux-mtd@lists.infradead.org; Sun, 10 Apr 2022 08:51:21 +0000
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ndTHx-0003Ca-U5; Sun, 10 Apr 2022 10:51:17 +0200
Message-ID: <6b09d10e-2098-9fb7-be4c-ae67d802cd2d@leemhuis.info>
Date: Sun, 10 Apr 2022 10:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
References: <20220323170458.5608-1-ikegami.t@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220323170458.5608-1-ikegami.t@gmail.com>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1649580680;
 a8dc91e0; 
X-HE-SMSGID: 1ndTHx-0003Ca-U5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_015120_373992_DED04327 
X-CRM114-Status: GOOD (  14.08  )
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

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Miquel, Richard, Vignesh: what's up here? This patchset fixes a
regression. It's quite old, so it's not that urgent, but it looked like
nothing happened for two and a half week now. Or was progress made
somewhere?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

#regzbot poke

On 23.03.22 18:04, Tokunori Ikegami wrote:
> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
> check correct value") buffered writes fail on S29GL064N. This is
> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
> write completion, where as, chip_good() check expects actual data
> written to the last location to be returned post DQ polling completion.
> Fix is to revert to using chip_good() for S29GL064N which only checks
> for DQ lines to settle down to determine write completion.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
> 
> Tokunori Ikegami (4):
>   mtd: cfi_cmdset_0002: Move and rename
>     chip_check/chip_ready/chip_good_for_write
>   mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
>   mtd: cfi_cmdset_0002: Add S29GL064N ID definition
>   mtd: cfi_cmdset_0002: Rename chip_ready variables
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 112 ++++++++++++++--------------
>  include/linux/mtd/cfi.h             |   1 +
>  2 files changed, 55 insertions(+), 58 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
