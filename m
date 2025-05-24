Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00DAC54F32
	for <linux-mtd@archiver.kernel.org>; Sat, 24 May 2025 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9lN84OpiFKzscDVpj4rfH73T0q2qTlkE7QD7vPis2o=; b=z6SxZBOEu4Aq/K
	mXK1IxZtTxzRsvfo6ZeCHWwWjrylImtX6YnIKYXJy3dBmzt7P1lHWYxawSxUY+SCUHlpqjvwnM3q5
	IVOAN135o3yudZg50A2JLafKgl5/K4VMIVEJg19RDT5TxJxwjOO7kdcJyLSSx1riNkJuyalSW0sER
	IVHH1eZBrLAAvFjw7fcZTzfyU+vISI6ptX20hJBcKgpPmrb4f8vW3Glh54tc2TJNvOs+3tmaYXHRM
	WDIUtdAF2in76/D8E+EDIdFs5EihM9MyS+/tZ3K/UikDvTSTjjkazSz1dwtjncDU4Kb/bB9FNCphL
	FSmTURVzOu79/ktjn9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIm8D-00000005jq8-2AtH;
	Sat, 24 May 2025 10:29:33 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIm8B-00000005jpi-1b9w
	for linux-mtd@lists.infradead.org;
	Sat, 24 May 2025 10:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748082572; x=1779618572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s6UiEN1Jm7OVCrzrD4ZPy3L4yqbPYUdJaL8UHsYSCNY=;
  b=kSF0V4Vk2rZGJIvujfm4LTnUtfm0GXbKSQBfGPWCk7UylTGfIvLN/S8C
   rK5zxdXmfudrQSmkKg0W6oJY+4jN++5Kud3Px+YlfCtfNoqNAjQdp/+3J
   Enh67qIorIId5KTSO9k+Yh3gqBRwLgsUkRK3Ej2XVWYxSKJuym64dt+Gq
   rqf3YvbwAz690CfR9IN8B8vc2+vOMbCCEnHh3yFj5H/gYqLzQl9ty8GIS
   9SF0VvKFk2S0+o80Amv7egB1G17yCLbw8PqxdWl4ooIXcLb1kwzdBhz/D
   ddNvjYXBbxZjzbmO/wS6Tu1GlVLLit0nKYRuAPc59ZyRgj+LLdhG3yWx8
   g==;
X-CSE-ConnectionGUID: hQt3Hlf6QG2e398Q1dHTSA==
X-CSE-MsgGUID: 1YCs8pxYTH+Ra+utI2L1Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75522101"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="75522101"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:29:30 -0700
X-CSE-ConnectionGUID: HrBfmwpQQvqMks20J/JY6g==
X-CSE-MsgGUID: a+CwcV1LRRSjgimO27u1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146700425"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:29:25 -0700
Date: Sat, 24 May 2025 13:29:22 +0300
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
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Message-ID: <aDGfgubuFfa3e0K_@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-9-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_032931_487442_934C3737 
X-CRM114-Status: GOOD (  12.63  )
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

On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on DGFX
> with GSC/CSC devices via a child device.
> The nvm child device is exposed via auxiliary bus.

...

> +void xe_nvm_init(struct xe_device *xe)
> +{

Same as patch 6, please handle errors.

> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(xe->nvm))
> +		return;
> +
> +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!xe->nvm)
> +		return;
> +
> +	nvm = xe->nvm;
> +
> +	nvm->writeable_override = false;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;

Just out of curiosity, why off by one? Aren't ioremaps all PAGE_SIZEd?

> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);

Ditto as patch 6.

> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
