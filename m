Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D0CC54F30
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLgRMjXtV9P1UK6g0s0HQpN8YghTXss1QtXH5FR/zKQ=; b=BIoFmZlo3z9PxJ
	WsP66gYSObQfDjYkXIsCwId61yNtZH95Xl70jWj81ThqEl/j0S+yBnXKm4NqiGMDBVG3tuaRZhVsc
	AiCRxHwEjZtbA188oBcC5U4NPjEP+HgNP2HM+gBSA+XFHEH3akZUbE4hcI6Csc3l9yysCWSKG+X3k
	cSO4ZPW5SyZMHSkOuKX9+UElru1BOwyfbT6teS1kMnZT85CbQXhtv3ZO/YrbRb4zGYqyG8F818XVb
	n8REieEuaklMjfAmfkIuJzzvxC7N438kVOY8AHIeAJec5VW+WyVvFmomvPYt9kotLT2uvQTY1ojDx
	ahoeu2yL6ZldHfRGJPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJz8v-0000000BMOw-0nVo;
	Tue, 27 May 2025 18:35:17 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJz8s-0000000BMOc-3vNw
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 18:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748370915; x=1779906915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+8+iElqWcT0dDbkP3pmK2f9v7upnAUnEd8g7APK4p64=;
  b=XEDJ1AtvdkBXNgApt4XRWBE2KN66UTlbAJzFYKpVp4ukZTJcYnQKQ3kY
   yNYlshN0vm/R6MF7unWb9mhE916X8w7qs5XwFitwTmwzXLSl0Fd6LIDfK
   7gsW993NhG3UqVHV9VH5vDcuoyslp4I/REEm5b5/U0lA1LrVe/4Y5HLNI
   GIiHFJnV9yQw/csQHip6doPkPUU4TxhO7icfdi11xuKyxDyu3JbIGlAL3
   CWNZlfCSRM/LJ5A5GBnOshIzjDPqW2+ZmRnvEXt5JsRVZQ4eCHBnLRbPs
   sUSMML13r6lxlfBlFyLxW5UdXzU1bAymAJn8WOYo6XOmcEkkMYkSkzfdY
   A==;
X-CSE-ConnectionGUID: +6cFYiBES+iKGm7CFZXBSg==
X-CSE-MsgGUID: yHcBK/4ISs+y8bQ/k9XZOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61038206"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61038206"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:35:14 -0700
X-CSE-ConnectionGUID: 0Wi5oRxtSpqfrK8DIV1HeA==
X-CSE-MsgGUID: scnxzUhMSNq2G1HdZlyC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147688246"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:35:09 -0700
Date: Tue, 27 May 2025 21:35:05 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"De Marchi, Lucas" <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>,
	"Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <aDYF2cBPdb0EHRrX@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
 <aDGdWof1HfViERND@black.fi.intel.com>
 <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_113515_026857_9CCC2695 
X-CRM114-Status: GOOD (  14.89  )
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

On Tue, May 27, 2025 at 11:30:20AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
> > graphics
> > 
> > On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> > > Enable access to internal non-volatile memory on
> > > DGFX devices via a child device.
> > > The nvm child device is exposed via auxiliary bus.
> > 
> > ...
> > 
> > > +void intel_nvm_init(struct drm_i915_private *i915)
> > > +{
> > 
> > Lucas recently revamped xe driver to address this, so let's not hide bugs
> > and return an error where possible.
> > 
> I can return error from this call, but the SPI failure is non-fatal for Xe.
> Caller should ignore error from this init.

Fair. Let's atleast return error and leave the handling to the caller,
so we don't have to come back revamping it in the future.

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
