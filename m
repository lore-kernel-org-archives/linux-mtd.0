Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D5D637B2
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Dec 2025 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MrbRMAFE3hCTMkYYUrbb+NzYZqXcZ2/ZQU/63wCWNE=; b=kznBJGG5bm8iGT
	tdENNdM5VDqnlc8vOn1R+odHDz8ecgY23OOQlIRh/0xwU6Uqgm0aih01NbvN18THccdcjlffxJRW8
	ojFiJkRNvVnZrGUyoKwYvjbKcF5hPCVos5/+UqvrVBpnxlyfAlIs0E50HwgemnQBbSKcRxE0/5TU1
	uAb1wcUywr29JS/4MkFzwAkeHMR7Ya4dH2i8rfwvn0HrHtaOVH55raUq/mPwdgXlatSYvWILLqs6O
	qqCTCyRJaioyowtPw172YFY7iVNLsvcid1OEbH8tARlSsxw5dAoFVJl1Wgkmk/1BluV316wYc5j2+
	6lU6VB5IgFfEdDdlXJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWr2Q-0000000BNA1-3q50;
	Sat, 20 Dec 2025 07:06:02 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWr2N-0000000BN9l-0ZY9;
	Sat, 20 Dec 2025 07:05:59 +0000
Message-ID: <4cf65ead-b236-4973-b81b-a45128959a65@infradead.org>
Date: Fri, 19 Dec 2025 23:05:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Tomas Winkler <tomasw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <aUZFLezigzZQVt55@kspp>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aUZFLezigzZQVt55@kspp>
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

Hi,

On 12/19/25 10:41 PM, Gustavo A. R. Silva wrote:
> Fix the UBSAN: array-index-out-of-bounds issue below by updating
> counter nvm->nregions before the first access to flexible-array
> member nvm->regions[].

Yeah, I suspected something like that but didn't find any in-tree
documentation about it.

> from kernel bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=220823
> 
> Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15
> 
> Notice that this flexible array is annotated with the counted_by()
> attribute, hence the counter must always be updated before the
> first access to the array.
> 
> Cc: stable@vger.kernel.org
> Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/linux-hardening/90e419ad-4036-4669-a4cc-8ce5d29e464b@infradead.org/

More appropriately:
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220823

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/mtd/devices/mtd_intel_dg.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
> index 2bab30dcd35f..d3e89fe324b8 100644
> --- a/drivers/mtd/devices/mtd_intel_dg.c
> +++ b/drivers/mtd/devices/mtd_intel_dg.c
> @@ -768,6 +768,9 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  	if (!nvm)
>  		return -ENOMEM;
>  
> +	/* Update nvm->nregions before first access to nvm->regions[] below. */
> +	nvm->nregions = nregions;
> +
>  	kref_init(&nvm->refcnt);
>  	mutex_init(&nvm->lock);
>  

-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
