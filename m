Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96965C3ABC9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYezGpLy71OENxRjkasPxXyCsxOlnI75WiyvTBh7NoA=; b=Gnm5I7oHSHhPds
	1tnsidaDVYWhggVlM64rSV71a9OrtYUQ9R0Mia4kP8t27IcCe8rya+iTaI2pL1o4yfRE+U7/Dbx4L
	zqGoUP+f2gmVWNzhpSMUsZgwqwOFCLvCOSBNhcosloVxbCXGlrK09Po+Kac2wmgJLaU/VbOg8w5uz
	xInPzFPDGXoP8PDCjK7AsGCCKWfUM0s3IDtQ19PePK4NBpoJVG+iJORAuDtVJUJB9OXBPKnOjZFQZ
	qEva22a1PSE2pqxpb2zAZkvYPzg2Chaw/Pe3m3QaORcfmK9NlLgzUZxxbRgqkURLa5K9+CgPHXXpM
	PK99ji87gtbM+eZpo2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXTA-00000000WQr-1GGa;
	Thu, 15 May 2025 12:13:48 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXT7-00000000WOn-3BR0
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 12:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747311226; x=1778847226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMzCIxMMZEO9396KBs8rN2h+xUSN4fGX3RDCLaGg6m4=;
  b=IiKSe/T3FxJl9MmXHvKjOGQoMohbCc9qCFT8Uu07QwiVQsWiz+V30i5G
   02P1g+knKP6fQb9LR9jTjgwptk+ysD/rtbLvDI8M0Uyx//QvZz7SRnueA
   XbHADKfprYuAORiy8KsVHRR14Zd7a0qgBXnmrw63rpLSRiuykkN4yQiTS
   CBEHMEAwvwUjIiwlaT2Kcn1g49XfmaWR5Hq6Ioozze9n3Igc/jpy618lf
   Ud0GtXv0V+66hXVGHjxwXoPndpL9vO8LSRp+LcpVsk18Ek18WlauPEEXp
   B8gARWST09hnC9rn75PWK7DcUuphfSSc8kNIfE/007d+H+O0eskAibfUU
   Q==;
X-CSE-ConnectionGUID: a8e7A7iSREWv9qSXZi7+2w==
X-CSE-MsgGUID: sZ3RL1q3QFuU8p9yN0F9ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48360743"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48360743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:13:42 -0700
X-CSE-ConnectionGUID: W8qAHBCoTcuDraKKNLsqjA==
X-CSE-MsgGUID: k/GCdjmUSmOyXOBwmWmUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="169290312"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:13:37 -0700
Date: Thu, 15 May 2025 15:13:33 +0300
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
Subject: Re: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Message-ID: <aCXabQt_nhiTa1pF@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-3-alexander.usyskin@intel.com>
 <aBCcdPbIxthARrMj@black.fi.intel.com>
 <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_051345_799840_E1AD5B30 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, May 15, 2025 at 03:41:08PM +0530, Usyskin, Alexander wrote:
> > On Thu, Apr 24, 2025 at 04:25:26PM +0300, Alexander Usyskin wrote:
> > > Add auxiliary driver for intel discrete graphics
> > > non-volatile memory device.

...

> > > +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > > +		if (!invm->regions[i].name)
> > > +			continue;
> > > +
> > > +		name = kasprintf(GFP_KERNEL, "%s.%s",
> > > +				 dev_name(&aux_dev->dev), invm-
> > >regions[i].name);
> > > +		if (!name)
> > > +			continue;
> > > +		nvm->regions[n].name = name;
> > > +		nvm->regions[n].id = i;
> > > +		n++;
> > > +	}
> > > +	nvm->nregions = n; /* in case where kasprintf fail */
> > 
> > Considering kasprintf failure, should we move forward if n == 0?
> Not sure if adding exit path here adds something positive to driver
> other than complexity.

With an error path already in place it shouldn't be too complex, but upto you.

...

> > > +static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
> > > +{
> > > +	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
> > > +
> > > +	if (!nvm)
> > > +		return;
> > 
> > Are we expecting this?
> > 
> > > +	dev_set_drvdata(&aux_dev->dev, NULL);
> > 
> > Do we need this?
> Is there guaranty by auxiliary device that after release nothing is called?

Any reports/link to read about such issues? My understanding is that driver
->remove() callbacks are bus lock held and there won't be an active instance
to be called after unbind.

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
