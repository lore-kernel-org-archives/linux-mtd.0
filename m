Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B992AD637B2
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Dec 2025 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6SpOBRqhFS7z/+spuiNNf+k568QhQwm603FJmP7vhE=; b=XuhuA4XgrUQqqi
	moJ+C8qkAREvDIV/x/G2GBCNTzFe+mAdabt/BYE+t9DkIAAn1/ExD51xpQHAahnoaE46a230aCJ/t
	1I0VhuvoDdK81XGfKPnTZE1v3XtHBvDhwuXXmjazA1Rb1et6Eud9+OWoBO1w4ELZYH1fPki0tuf9o
	1CZFbABLdDQFQXR7jam1YacEpV81dYtOtizcM4ZTbNJCBbpm4YAIXYTnxMJlwvmQE3ghMmzEI/Yxj
	jGVmIT3xzlt4xWqNLttOPdZntoz27/IsKg+VrgXXRyLzj59GnpoFo+pwvpciKDmsPWnq9pnT3vSHt
	hEWOmqFGxm0BG1otLngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWr43-0000000BNGY-1Fa6;
	Sat, 20 Dec 2025 07:07:43 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWr40-0000000BNG7-2KUN
	for linux-mtd@lists.infradead.org;
	Sat, 20 Dec 2025 07:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766214460; x=1797750460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+PkVN5dAeIa6PcQRAR/h8NFlO87MJ14rZ0rEoov89XU=;
  b=BCPNYiTCWlsrUY/38tOiv8b3OYiKUe45LzUFaDRLSqgWzrg4XqoyXd0X
   Xzx3/rBxdKkQWWHE9ngprdg3rxMUQrfIKtDIzUBUnP0Gr4NjsKbIsBMUN
   OEayYelzAEUqrA1504Ke8FK2ZltD5FgXWpRU70xMfjBGXE9+hKiobclvt
   K0Ww3CQ5bnzfrHjQDtMI/tBSIMQOXAczXY0Dx6NoiN6fQN7mrp4bRNDLZ
   7PFofeotUMlES8wcL77Dgv89kOnLNFiwyfhNlAJ/1B2J8yDk5+Kp5aZfl
   lwjDXJouICEgrzO2ft8q6Uz1YgGdqSFFMmbFF0DkrUG8AMk4yc/LD/nu6
   A==;
X-CSE-ConnectionGUID: Po1vHtK+RIiBSi1Ch+FPZQ==
X-CSE-MsgGUID: 08ll2K2xTkm9PjNEUxn3uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71797664"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="71797664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 23:07:38 -0800
X-CSE-ConnectionGUID: MLbRm28JTwyDYpid8YBTEA==
X-CSE-MsgGUID: Ybu/NrVQTYOD1I6qwTUdNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="199289986"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 23:07:36 -0800
Date: Sat, 20 Dec 2025 08:07:33 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
Message-ID: <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
References: <aUZFLezigzZQVt55@kspp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUZFLezigzZQVt55@kspp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_230740_657928_D504881D 
X-CRM114-Status: GOOD (  16.47  )
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

On Sat, Dec 20, 2025 at 03:41:49PM +0900, Gustavo A. R. Silva wrote:
> Fix the UBSAN: array-index-out-of-bounds issue below by updating
> counter nvm->nregions before the first access to flexible-array
> member nvm->regions[].
> 
> from kernel bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=220823
> 
> Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15
> 
> Notice that this flexible array is annotated with the counted_by()
> attribute, hence the counter must always be updated before the
> first access to the array.

Already fixed[1], but not sure if it's landed yet.

[1] https://lore.kernel.org/linux-mtd/20251111-mtd-nregions-v1-1-61db61e78c63@intel.com/

Raag

> Cc: stable@vger.kernel.org
> Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/linux-hardening/90e419ad-4036-4669-a4cc-8ce5d29e464b@infradead.org/
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
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
