Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABF1C54F30
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvHDnrdnKxZ8FnEbCKQiaj7Y9mEebNxSydgHlVl4cD0=; b=bBG9yaYPSVqy4q
	YLSXKvilDYPmniXuyu+KJ1HqvwkPd16W68Z0JsWWUXUBXzIIXgB5ecMdoELQyO4JM/X5yXooxTGsf
	FTwF9knd6tshO52XaVqfjWQOl6rTbxxVl3IBnIdbPZwGCA+h4GMqGue6z1KSevDNtliKCtIre27gN
	e0iBnDVFLTmMuDGm93RiI24ApX4N8HTJ9zt3ofWolsMyCXJFb3GTVDJT14u3peSg57WEv2KQViiPk
	OMZPzhV7czouEI5cZLpwCveqs3AssGrUPEg5qaQlx2pjkUeM1pyWnIGPkBMnCXIqQ/tPV3t2zNNfT
	rSLtLI0LdiZyYjeuRahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzAs-0000000BMb0-3Ikf;
	Tue, 27 May 2025 18:37:18 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzAq-0000000BMaO-0G7M
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 18:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748371036; x=1779907036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n1Hvv26+Zpv8SzTuLKYLJ1yZzLAggmKAgUbIT3iJPeU=;
  b=lwGmTrVx8NfqBzCd61wVc23TEzorNyKmbB/uHJLZMvREWCFw6jwQfVJM
   ITmJL3HP54Gi5tZew8/JDrUNbr8bAmF9cgYCBGa1yDo81Vg2qYb6Yw9Z/
   z4YD7rC/sM7T3WEwWdyeDpwT1agY34mMhAFGrz6LEvz5PLJvA3c2ruxMp
   bYiC4ghK5KiX7OyYlnoRbby7Mx7kkE54YShv01c/Qk8tAuYB90wIWvmua
   zeT4Fv/61C15uMlXA251j1YVBnuE2dXyGpjHfInEGipvZtefuA/grgMwG
   XOIM5jgpVJ8NSHTf7PJBdJ28O6FnzZruyrBFJQA1IWy+5mIy4VdnirOqo
   w==;
X-CSE-ConnectionGUID: A2WbntQMR8+MoVc1i0xAyA==
X-CSE-MsgGUID: 6Ag1mB7IRoW+GGl4BLVNmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49488066"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49488066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:37:15 -0700
X-CSE-ConnectionGUID: QP7Y5iKzQTiQfK4EH1nU1A==
X-CSE-MsgGUID: 5qVzn4b9QGOkky5MxopYcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142896602"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:37:10 -0700
Date: Tue, 27 May 2025 21:37:07 +0300
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Message-ID: <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
 <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_113716_111415_443C83C0 
X-CRM114-Status: GOOD (  11.19  )
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

On Tue, May 27, 2025 at 11:55:13AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile
> > memory device
> > 
> > On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> > > Enable access to internal non-volatile memory on DGFX
> > > with GSC/CSC devices via a child device.
> > > The nvm child device is exposed via auxiliary bus.
> > 
> > ...
> > 
> > > +void xe_nvm_init(struct xe_device *xe)
> > > +{
> > 
> > Same as patch 6, please handle errors.
> This device failure is non-fatal for Xe, caller will ignore
> the failure anyway.

Same as patch 6, let's atleast have the readiness.

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
