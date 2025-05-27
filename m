Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89D8C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 18:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtGTHVDJwE/aGErm5yWbtSMlwgDbAfSdU6Akf9TixYg=; b=Yq2zm2VpjwfB6h
	vqXMWEB00rUPCuQ/9LdCJ2+acAK/UdlxQ4qj8yYRRkabpGGgFfQJfxrV9O8Tu4OYjFAO5//wwABGI
	SMYWw+ZCk4Vyn+XUC3eq5GerVEcxqK69KfLVBavdk9a/XCvabFCz2feCvpy6MkvNwNk3oiqViORcu
	GTnLC32M48/MFB4shxTvkCtegDwNb39diPOeUpdkD63hXT0FsY6ByuaboGqWHPosn8qAWt+XQeLlL
	LITJ4rnxuBh0UNEDwP6cctaJITidTus22eu8JaomIXteaptTd7utgRxyG+FWMleoIRyIwnQzRUBmP
	ML4h0fBpCKc5gaGK1Eag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzN9-0000000BNlG-2em2;
	Tue, 27 May 2025 18:49:59 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzN7-0000000BNkF-0Skh
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 18:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748371797; x=1779907797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4XPP3GOIqEuNTDva7xUb4Pijg8qL5gQlGrrO0uFeFTI=;
  b=bV+M0+PFsAwhVjTIpMUxjZpOpPu049wDd94k/RoVhLA+zpYTTo9TKXiG
   iflmu9xiiu1nnnA2VMQg/1bAaw5CpLIWhFA75HCeTaQ+WJE4Ph2u4ZjzT
   sOTV7iwipSFP0TNv5BytN2VwbzrgZvLC97osVCOHvXlAneqehO6YjxBlY
   sSNNAjsYMiJ27N3kmlCT34LrF+UlKRYDMUZoifpFtqnAdqW6rHsMHjs10
   UQRGwd65woOKoMQpe6wAS67Wcob+HsHWvXQsXaRNOJmUKE6Zb7wbvtviD
   KUX47VhtpCUWVsqJZvLAWVlVggq3jLO5pQ2OEiXZ8IeeEFdZ4/XhXP3QX
   Q==;
X-CSE-ConnectionGUID: XGcQFmj5TAGAxtigqCSk1w==
X-CSE-MsgGUID: AwwDhKimQh+5Mp3hfcC6ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61431127"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61431127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:49:52 -0700
X-CSE-ConnectionGUID: NTG3c+mbSlWEHG5NEwB8JA==
X-CSE-MsgGUID: ldVFg4/LSoqXZ5tLnXnV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="148212316"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:49:47 -0700
Date: Tue, 27 May 2025 21:49:43 +0300
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
Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDYJR8r6BCd6cSe8@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-6-alexander.usyskin@intel.com>
 <aDGZCL_B3fEkvahj@black.fi.intel.com>
 <CY5PR11MB636674D63B2769B15A79B172ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636674D63B2769B15A79B172ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_114957_181457_DB3A9080 
X-CRM114-Status: GOOD (  20.90  )
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

On Tue, May 27, 2025 at 11:33:10AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
> > 
> > On Thu, May 15, 2025 at 04:33:40PM +0300, Alexander Usyskin wrote:
> > > GSC NVM controller HW errors on quad access overlapping 1K border.
> > > Align 64bit read and write to avoid readq/writeq over 1K border.
> > >
> > > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > ---
> > >  drivers/mtd/devices/mtd_intel_dg.c | 35
> > ++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/mtd/devices/mtd_intel_dg.c
> > b/drivers/mtd/devices/mtd_intel_dg.c
> > > index eedc0974bb5b..2f32ed311ffd 100644
> > > --- a/drivers/mtd/devices/mtd_intel_dg.c
> > > +++ b/drivers/mtd/devices/mtd_intel_dg.c
> > > @@ -246,6 +246,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm,
> > u8 region,
> > >  		len_s -= to_shift;
> > >  	}
> > >
> > > +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> > > +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
> > > +		/*
> > > +		 * Workaround reads/writes across 1k-aligned addresses
> > > +		 * (start u32 before 1k, end u32 after)
> > > +		 * as this fails on hardware.
> > 
> > If there's a spec definition, we usually mention workarounds with
> > Wa_ID:platform so that they're easy to track. intel_workarounds.c
> > is good reference for it.
> > 
> There is nothing in spec that I can find.
> Not sure that i can formalize i as workaround.

I'm a bit uninformed about the history here, but in any case I'm fine
as long as the maintainers are okay with it.

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
