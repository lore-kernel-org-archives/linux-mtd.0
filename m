Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C8D3CCAF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sR1x8mZOUw96gmHGBe/s6BM3fyIA5knw1cJ3pSrdpww=; b=CGqKzitoqclrSL
	PKUoVLslQMlBl8gP1A2xz5GSUTSOf3MPhapxqFJJzUu9cd3vfpk710cqHoQ2N5wt5vI6VmpUMrAUC
	q/fB+YKditjIEB8SlTjZw0Q1be/0aqfwxnnkpqKTjIgVYIKrA0Q852rwf1jaYkNpGnvwAIuPV/QUD
	RXltZvTtxsrz0L6P1kmDqXPDJpWPbOosKEJ3NjRFRJooIJFdResxLyS202s6ZozUlmE7W9/ZsZ8mP
	RX/sLy/fLvwIy94oO6t0D0bhl3ya/te9DnGGcmQj8W/a4drudXE40fBz3S+xnsyHdE0WCPgXP7b9l
	k/l0ndProfIviXOqKmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGNq-0000000Bp4I-2JFr;
	Thu, 15 Jan 2026 05:59:02 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGNn-0000000Bp3x-2sD3
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 05:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768456739; x=1799992739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KqSyi3BUbCDJufy9qCRTQlPXoTvU86tAvsNHvB4kGnI=;
  b=eQwrNNZfDQ1XqfWgbjq3h7d/128iZctx1vWmq6kiQhCNPd/MDLWZy96i
   AP8klteLk0N1Zvi7bsBwc3LPzYs4Ct+rOYnYBf0JelyEbVXPR6yLwXf6A
   w3Hm3rfFu6CwAQiYMEUi7E1F81jWVQO4jrwXu3La7qPjGrAQFQZu8tYtg
   NBQh6x7KiYRv6DCaaqS72xQ1WrJLNn4XHvsHH1/EZTT6XV1bHZlataNMY
   HcH/oLt4dOJBZIhQ3qWf/DuDkJaR+yCgTchJoI58StmeTW6j6aJXq6qdq
   Dm83WX5xk7LnJYD/OrmOLKO1i5LUn9w8w9nqzhcbY9uIsoEuXfC757aUS
   w==;
X-CSE-ConnectionGUID: 1vWojv/MQCClUURczawUYg==
X-CSE-MsgGUID: dBfXb1kqTTaMpA3+pd634w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92430655"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92430655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:58:56 -0800
X-CSE-ConnectionGUID: FCJbDYugRk6NPGu6GkTExQ==
X-CSE-MsgGUID: btfR36TDSmeBQo+/LxLX/w==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:58:54 -0800
Date: Thu, 15 Jan 2026 06:58:51 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Jani Partanen <jiipee@sotapeli.fi>,
	Lucas De Marchi <demarchi@kernel.org>
Subject: Re: [PATCH] mtd: intel-dg: Fix accessing regions before setting
 nregions
Message-ID: <aWiCG7LyGMhmfsjZ@black.igk.intel.com>
References: <20260115052237.1149027-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115052237.1149027-1-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_215859_790468_507B37E8 
X-CRM114-Status: GOOD (  18.73  )
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

On Thu, Jan 15, 2026 at 07:22:37AM +0200, Alexander Usyskin wrote:
> The regions array is counted by nregions, but it's set only after
> accessing it:
> 
> [] UBSAN: array-index-out-of-bounds in drivers/mtd/devices/mtd_intel_dg.c:750:15
> [] index 0 is out of range for type '<unknown> [*]'
> 
> Fix it by also fixing an undesired behavior: the loop silently ignores
> ENOMEM and continues setting the other entries.
> 
> CC: Gustavo A. R. Silva <gustavoars@kernel.org>
> CC: Raag Jadav <raag.jadav@intel.com>
> Reported-by: Jani Partanen <jiipee@sotapeli.fi>
> Closes: https://lore.kernel.org/all/caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi
> Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
> Signed-off-by: Lucas De Marchi <demarchi@kernel.org>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> ---
>  drivers/mtd/devices/mtd_intel_dg.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
> index 2bab30dcd35f..7f751c48a76d 100644
> --- a/drivers/mtd/devices/mtd_intel_dg.c
> +++ b/drivers/mtd/devices/mtd_intel_dg.c
> @@ -770,6 +770,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  
>  	kref_init(&nvm->refcnt);
>  	mutex_init(&nvm->lock);
> +	nvm->nregions = nregions;
>  
>  	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
>  		if (!invm->regions[i].name)
> @@ -777,13 +778,15 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  
>  		char *name = kasprintf(GFP_KERNEL, "%s.%s",
>  				       dev_name(&aux_dev->dev), invm->regions[i].name);
> -		if (!name)
> -			continue;
> +		if (!name) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
>  		nvm->regions[n].name = name;
>  		nvm->regions[n].id = i;
>  		n++;
>  	}
> -	nvm->nregions = n; /* in case where kasprintf fail */
>  
>  	ret = devm_pm_runtime_enable(device);
>  	if (ret < 0) {
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
