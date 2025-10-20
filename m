Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B9CCD199
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us4+pKEMG2wVXBZ60zHCl99p+A1431SARri1VO2oL4A=; b=jODj4J8MFyshjx
	yila+A6cIZu6qyFHmbt8CeDhWLfEkFn4IVeEMXkpop9DyRGY9IcU7Q3i0TGK4hVGJiiFWRlVlHa8p
	eif8wA10wcihAAq0xwcs+o6JYwMPnQ6xm+ravRKcugW6u3qo7C1Zpsy4qRK9iZQbnmtdq46S8Txx0
	iPj1BKf4zwYzeMC52lj8fsopiwEi5uSSs5kV9IAHTOQ3gMVKJ1pUE7LVdSZspR9WcNPSOFhjg/oIk
	Qt81TF34d1l3dQjEuLXP5nimQng9w8wABaPmzildv9dKEEe2JH/KYnB26Hk+lsN/VozDiDaUd9VGg
	q1ncBBlrgDVsf/ymeTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmpL-0000000ClPU-2DbJ;
	Mon, 20 Oct 2025 10:09:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmpH-0000000ClNi-39p7
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 10:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760954956; x=1792490956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mgmagDXiBORp/cgzFDOu0tnOLlFPHt0s85Ud1RXqUp8=;
  b=kuhJ8yDoqVry/gNV9h0JaJslmH4AlCzE6X0ybXbhXTq3qP8NwSHQkiOB
   Ec3PpQW/p4JAhmeE7i1/XaHCNfuF0jGGxSiVevaan4DULu+CyVgHzOYae
   dAksEvaqSoOfW/E0fAMnlNS4KJ/S6RCB/6GaUNg1Z1E7gDrD06/wHBBuJ
   bfsdRjWxGwirjHQVus42Zbt7KTpkVqjdxHrjU8IA+/7Pc/L84erq/9QHf
   UfQqh3FisUvzrPIWyhvUqewiN4nng1HtmS2LTfoaeg6YybYx+BRPYVRcO
   8fZ6gj8KD7EtXL2CY8cgHgt/Mpe6jOUyg2orB8ZfhPqmvXG9UXisqpKuK
   Q==;
X-CSE-ConnectionGUID: HD+RjPlfSyegv+NNePuIxg==
X-CSE-MsgGUID: w/6yp7DlRuKbQ4xnt96GVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="80693685"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="80693685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:09:15 -0700
X-CSE-ConnectionGUID: LtULEggHSpKRmikGNFyx2w==
X-CSE-MsgGUID: m+WRnFkkTfGGevtdeoL6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="184063321"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.6])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 03:09:13 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAmpC-00000001GpQ-3tt7;
	Mon, 20 Oct 2025 13:09:10 +0300
Date: Mon, 20 Oct 2025 13:09:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] mtd: intel-dg: wake card on operations
Message-ID: <aPYKRvCenwnrFXcb@ashevche-desk.local>
References: <20251019150145.3228079-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251019150145.3228079-1-alexander.usyskin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030915_817924_6DD75528 
X-CRM114-Status: UNSURE (   9.73  )
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

On Sun, Oct 19, 2025 at 06:01:45PM +0300, Alexander Usyskin wrote:
> Enable runtime PM in mtd driver to notify parent graphics driver
> that whole card should be kept awake while nvm operations are
> performed through this driver.

...

> +	pm_runtime_mark_last_busy(nvm->dev);
> +	pm_runtime_put_autosuspend(nvm->dev);

Please, drop the second (duplicate) call.

...

> +	devm_pm_runtime_enable(device);

Please, justify why this code is good without error checking. Before doing that
think for a moment for the cases when devm_*() might be developed in the future
and return something interesting (if not yet).

...

>  err:
> +	pm_runtime_put(device);
> +err_norpm:
>  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
>  	return ret;

Mixing devm with non-devm usually lead to hard to catch bugs in the error paths
/ remove stages with ordering of cleaning resources up.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
