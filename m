Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDC8CCD184
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Oct 2025 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0qXoCtB71UAffeD0tK6W2DMjuPqmpNthWqBG5XS+JQ=; b=dzdnry9vMsmiDB
	Jru71c1jsOs7MTz/f3H2awJ7U9wzw8XYkVODsFMFbMpteVqNa39eTcqZFuRAHSTzlxyQXr1hAWkHR
	w/7VKiYy1fSJT5uno71DKbhaC9u33hlrfPX9Xb+0g1eR0DbdKVBGorMKwuAUlrQiHEmeZEIfwTqaS
	qvkStSgpxdAAzTLCBrSW53jDIbeFLz7aWF9m3JzORPsyLqxldEpMefP6r+zGsZEMJHsQ32MKf4xdo
	j/6Y4jJuIc8atdb0SmFgTDgcUq2ou2vB63fedFTJWHAKo5mGydkY1KKYXa3hxt3uk7gAW+A9z+9PE
	iKRaRP8vOTpjGINvgXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDgy-0000000HOKZ-0bCp;
	Tue, 21 Oct 2025 14:50:28 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDgw-0000000HOK1-19ih
	for linux-mtd@lists.infradead.org;
	Tue, 21 Oct 2025 14:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761058226; x=1792594226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=awPIVGw/VUs/Ej6U4PuR8oMMPhCYfy2wcKd6w8Qxm2Y=;
  b=cgxnb5SZLL5qzy7XiGj/EdZBzbE0KrObXmukHp54567W2oiZlr9tfZD+
   Ne6bI6jWUstubvLEJqHqhUIuXzuaZ8xJQ7XDMV4OqnQB4JIqxyO3UqvCc
   gzmPwczQcBkWJrkOpdn2lracCD0efQVZKUu23a5IUg2AXHQMsFQ2N79YQ
   ylE9cycq1mhNcfZvPg4wsBYnLsdIsR/tLQFbsbv0RUnBgWF04qk9dB2P1
   /KFBfZtiFGz2Vrf21hXvFKrY7TCNaenuisDkCKSksbcpBZZ7lXztcBVCH
   eTzmD/+YmG72XgswdSCSov47mIn2Jmf2zBdcBkvMtoo4gta+OfSn+S3Lw
   w==;
X-CSE-ConnectionGUID: Gp3s0wgDTOahFc3GFMx5cg==
X-CSE-MsgGUID: XX9jv2+AQFK9QnvUBS4sJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50758904"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="50758904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:50:25 -0700
X-CSE-ConnectionGUID: lwYzEMbEQ6qBBhjMSb86Jw==
X-CSE-MsgGUID: lZQl/vTeQbGlIUSOm5ytIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187645042"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:50:22 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBDgp-00000001WOh-2ncS;
	Tue, 21 Oct 2025 17:50:19 +0300
Date: Tue, 21 Oct 2025 17:50:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] mtd: intel-dg: wake card on operations
Message-ID: <aPedq3pz2TXYUSEk@smile.fi.intel.com>
References: <20251021123246.3629282-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021123246.3629282-1-alexander.usyskin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_075026_345152_72D3A1D3 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Oct 21, 2025 at 03:32:46PM +0300, Alexander Usyskin wrote:
> The Intel DG cards do not have separate power control for
> persistent memory.
> The memory is available when the whole card is awake.
> 
> Enable runtime PM in mtd driver to notify parent graphics driver
> that whole card should be kept awake while nvm operations are
> performed through this driver.

> CC: Lucas De Marchi <lucas.demarchi@intel.com>

It's possible to make less noise in the commit message by moving Cc:s to...

> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---

...here. It will have the same effect on email, but commit message will be
cleaner.

> V2: Address review comments (Andrey S)

I think you meant Andy or Andriy here :-)

...

> +	devm_pm_runtime_enable(device);

I consider this as a wrong pattern of devm_*() usage. If one uses devm_*() they
should check for errors and act accordingly. (One way can be a printed warning,
but again, the devm_*() call inside can be implemented differently. It might
make device be enabled for a moment and fail due to upper layer issues, such as
memory allocation. In such case the error is different because it comes from
a different layer and you effectively ignore it without a reason. Hence either
check for errors, or drop devm_*() here.)

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
