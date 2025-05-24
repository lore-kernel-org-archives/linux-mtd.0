Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834D5C54F32
	for <linux-mtd@archiver.kernel.org>; Sat, 24 May 2025 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmhddv8HSscaXQMzdlO+1g8ZePm0Ps60+1TINYH3ERA=; b=zamHelBYC3SnCV
	uIEiIyOmfW0u9iAK/1064pkF9Svv0z8Va3KKQoUmIWQLxpDOlZp42Rig/nGlGiNvO1/2rIkAiAskj
	oLCxJ2tiv05r3u7jS7hdUmDqn1rmABYYpwb8AMNevbsXIqEP+0isAnATAkgh13AvU6MXjZleFBF0L
	qOuNgYDO9AhBxZLBlHEpizulIZ/EpzpBABxNwhoJFZfvw36Q7ZSsvFFbD0cG5PdR0U8SWwJnZR/Kz
	o5PGrv+n2yw7R1+UKH7HF9UJtC+Jw3suTUMK7hzdLkwH/ZtzE5j0OSziYBEOA12elyKpSUpOaqJuZ
	B5VrMzqeIJwiydGjlm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlzM-00000005jOQ-0aaD;
	Sat, 24 May 2025 10:20:24 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlzH-00000005jO1-44Zh
	for linux-mtd@lists.infradead.org;
	Sat, 24 May 2025 10:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748082020; x=1779618020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KAzAK7TgNRgfMo1XSxTNbqWPQmUnZXND6HQQpmqPXwQ=;
  b=QvuF6eQkqyqXqD6ztHsblXOsiEMZVT5jsYjoB5gdKou+tlYxHzsle2H/
   oaj9X2XZoJPRMRuO07KQor4NwxOcL9HIf5spz7SRa0g6/CqRCASwopw/u
   P3YDUXyRDmOLwjIDA2SycdsfJV5ymEDpYYa1Dq3t7If56xB1Yni3nSrGm
   038gyna59VeMeA0ZubrQPAN8joMa//8SRGmDmBgp8qAs4UdccpYGVs6DJ
   imwLNaIHegjKnbN2VoMaJqL+X90oHGip2hrsQkkC/cgG/tz1A8J0w7uPD
   0OYC+WVJ9jaLhE2ylADTrxzlk9xJcjQL8D9ez93RT5kKm1fmMkE2vhnUP
   g==;
X-CSE-ConnectionGUID: zXAH8h3zThSMmdevzoFv4g==
X-CSE-MsgGUID: VM+yuyPZSWirrFem0YlqZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49241372"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49241372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:20:18 -0700
X-CSE-ConnectionGUID: UtDEC9GMRJ229+0hrrPFMw==
X-CSE-MsgGUID: vhFYDXKRSCaVzMriwIjFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146382875"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:20:13 -0700
Date: Sat, 24 May 2025 13:20:10 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <aDGdWof1HfViERND@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-7-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_032020_127392_E1126FDF 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on
> DGFX devices via a child device.
> The nvm child device is exposed via auxiliary bus.

...

> +void intel_nvm_init(struct drm_i915_private *i915)
> +{

Lucas recently revamped xe driver to address this, so let's not hide bugs
and return an error where possible.

> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	/* Only the DGFX devices have internal NVM */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(i915->nvm))
> +		return;
> +
> +	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!i915->nvm)
> +		return;
> +
> +	nvm = i915->nvm;
> +
> +	nvm->writeable_override = true;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);

Why not just pci_dev_id()?

> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = i915_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
