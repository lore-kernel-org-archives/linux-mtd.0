Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F2DC2D0CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv+1ruUK+vfHEK7nHraPH/8YJ/VvPJ+xPmesioR+zeQ=; b=upQrhKqi3AONwH
	h6blMYydE6is0qyRBvw3uxvg08JKIoseDED+WCR49/w1pKonBxMKTmB1SL68yOF4SY0Dqv6Reb8eJ
	qR9Q83/UW/9hJmOhjG62nmA/ElUFLWmpWaQf3k/yvpH6dAVHukS+OU9PqT/RojRj1MNUhcyN4uVcL
	fbPVqvFdf9JWg+S+eDVi4jgJpG45Y6mfwJbhxpD781Uo0eVfxOfovINBdgg0bUuYOx6i5y4X3DnhU
	Bi5FaZ+haahWo/9cBOyGnT51HpSTt73Gw1DEJhOzWCysA4R+4gvWRNknpwySv+MROvbN6IMceZck3
	0/tAHiG8fG3Qgf8nYuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXYu-00000000Xb6-1Vb5;
	Thu, 15 May 2025 12:19:44 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXYs-00000000XZF-24Fb
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 12:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747311582; x=1778847582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFAQ3NK4nPQd0IHrWUbmpnTo8qjx6xZhrLCMhXW/F14=;
  b=M6JWmQX1eVEX9pSpYugCOTbR32dUfh8yzc/OqOt3gKw2wFOGTFOL1Kfx
   NHDd6eyCZpbRBEQaomXcaYoHbWXSMTGenHtQJWxst7p+oOID57rDR4BTX
   tfZ/XnruT3trb4qUlDCObF4HNUc7SDrfIB3r2/xPvsSu3WYXWgIyi/z+7
   pngyTnuOm3SKO9CYlyPnoZmC3EZKKnwrHY4yvqDy9w6xxy21S88XIKyni
   gkvw/EYnDBGQ9vnC4rsErkCAYd0RHfgrDqS2Zy3m+RV/NFTyaFIcgLuJW
   5MeusKLo4viUatho6Hi84n6uvONYeUfmWFjFOYa/u0Z+sVSvP5ZROB6Kz
   Q==;
X-CSE-ConnectionGUID: EXpuN9P/QpCYV1lwzvXCAg==
X-CSE-MsgGUID: mrpDiCrXRpKDgEANeEAysQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49402650"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49402650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:19:40 -0700
X-CSE-ConnectionGUID: yuRuvhS8TrOvZRAiYDej+Q==
X-CSE-MsgGUID: TYMuvsbVQ/aKlzbvndqzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143553856"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:19:36 -0700
Date: Thu, 15 May 2025 15:19:32 +0300
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
Subject: Re: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Message-ID: <aCXb1NjwGquN6vGN@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-4-alexander.usyskin@intel.com>
 <aBCfbaYs9CnXL2h1@black.fi.intel.com>
 <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_051942_560005_CE3CC495 
X-CRM114-Status: GOOD (  19.42  )
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

On Thu, May 15, 2025 at 04:53:38PM +0530, Usyskin, Alexander wrote:
> > On Thu, Apr 24, 2025 at 04:25:27PM +0300, Alexander Usyskin wrote:
> > > In intel-dg, there is no access to the spi controller,
> > > the information is extracted from the descriptor region.
> > 
> > ...
> > 
> > > @@ -22,9 +24,199 @@ struct intel_dg_nvm {
> > >  		u8 id;
> > >  		u64 offset;
> > >  		u64 size;
> > > +		unsigned int is_readable:1;
> > > +		unsigned int is_writable:1;
> > >  	} regions[] __counted_by(nregions);
> > >  };
> > >
> > > +#define NVM_TRIGGER_REG       0x00000000
> > > +#define NVM_VALSIG_REG        0x00000010
> > > +#define NVM_ADDRESS_REG       0x00000040
> > > +#define NVM_REGION_ID_REG     0x00000044
> > > +/*
> > > + * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
> > > + * [23:16]-Reserved
> > > + * [31:24]-Erase MEM RegionID
> > > + */
> > > +#define NVM_ERASE_REG         0x00000048
> > > +#define NVM_ACCESS_ERROR_REG  0x00000070
> > > +#define NVM_ADDRESS_ERROR_REG 0x00000074
> > > +
> > > +/* Flash Valid Signature */
> > > +#define NVM_FLVALSIG          0x0FF0A55A
> > > +
> > > +#define NVM_MAP_ADDR_MASK     GENMASK(7, 0)
> > > +#define NVM_MAP_ADDR_SHIFT    0x00000004
> > > +
> > > +#define NVM_REGION_ID_DESCRIPTOR  0
> > > +/* Flash Region Base Address */
> > > +#define NVM_FRBA      0x40
> > > +/* Flash Region __n - Flash Descriptor Record */
> > > +#define NVM_FLREG(__n) (NVM_FRBA + ((__n) * 4))
> > > +/*  Flash Map 1 Register */
> > > +#define NVM_FLMAP1_REG  0x18
> > > +#define NVM_FLMSTR4_OFFSET 0x00C
> > > +
> > > +#define NVM_ACCESS_ERROR_PCIE_MASK 0x7
> > > +
> > > +#define NVM_FREG_BASE_MASK GENMASK(15, 0)
> > > +#define NVM_FREG_ADDR_MASK GENMASK(31, 16)
> > > +#define NVM_FREG_ADDR_SHIFT 12
> > > +#define NVM_FREG_MIN_REGION_SIZE 0xFFF
> > 
> > Should we move these to a header?
> They are used only in this file, not shared to anyone, why to put in header?

If we know we won't be further expanding/splitting, sure.

...

> > > +static bool idg_nvm_region_readable(u32 access_map, u8 region)
> > > +{
> > > +	if (region < 12)
> > 
> > Anything special about 12? Should it have a macro def somewhere?
> > 
> 
> The access bits are separated for first 12 regions and last 4.
> My feeling that making below numbers #define will make
> code less readable.

Then perhaps a small comment would be useful.

> > > +		return access_map & BIT(region + 8); /* [19:8] */
> > > +	else
> > > +		return access_map & BIT(region - 12); /* [3:0] */
> > > +}
> > > +
> > > +static bool idg_nvm_region_writable(u32 access_map, u8 region)
> > > +{
> > > +	if (region < 12)

Ditto.

> > > +		return access_map & BIT(region + 20); /* [31:20] */
> > > +	else
> > > +		return access_map & BIT(region - 8); /* [7:4] */
> > > +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
