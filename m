Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF6AC54E90
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eN41X8NpV8mOq4is+9clDNvYZtAKBrL2XsKT5AmkOQ=; b=MqAfl00cucjPii
	q1450OYHBu7P/p5Bkn2ftx0no9x10Eb8RfzQ8/qC3CeirQgU3fbbFZjUrgkYXmOJ3p+RTBvUlIz99
	7f+rursIf5SX2/hjzcwkLbg5Xh970idffIj9p6CtvgA1KItEqtHVPkTO+cfIZGaZsH2nJQvFb8XJA
	AkI8QIK20tU/+v2G/1+Vu/NzxjFDa11AJ88Tc82JG7IJeRvi4MsNxukqO+1ClhwKrbeKDTKhJ0kfd
	6B4STwI56xWkl9FxZXXkCyZjQeIHcXtr0fySBUJqAKBYFUrveoU3e8uYKf+uJOgG1MsblHXP80HCh
	he3OfO0SDRm8jP7ORiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHr8B-0000000GsBR-0l0X;
	Wed, 21 May 2025 21:37:43 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHr7u-0000000Gs6b-3GMc
	for linux-mtd@lists.infradead.org;
	Wed, 21 May 2025 21:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747863447; x=1779399447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TRHgk4WgbfqINcXZ2LzA/XzOmn7LII0S0I9TtZCzhk=;
  b=A8IDtbSqQFFsfRg3cex80kESaGVb5HDfibyHNT0+TTiqyoGhmXJ035uX
   9MTvYg/SLayloPHYKx+85laF3UpO1ftHD37fh2/AV3/ZRFZMX1teIzsOP
   2aXYodFmjgulW6YndDavCNCwa9uebMQdi+yiqJeO4dEyilnhKFyJZovwz
   18mVQ45q5pJqNNj0zw56hCzq1RW+y9nFmWYwTtS8Y99C9kOxMZr+/KpcM
   DHGC8d54O/YqtN+WDp0jXmBszyOz/mQoN86eV20j/40zGEVu664FAZpxz
   NMjimuetj1eQYeEsYYLD1dClmp4O+p+b1hZw+xuXnBvFiPBPSTJvdFXPi
   A==;
X-CSE-ConnectionGUID: ALXILcemRGiChC+mSL9fVA==
X-CSE-MsgGUID: iIFebL1rTD6h9qcxSYsW3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49851099"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49851099"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:37:26 -0700
X-CSE-ConnectionGUID: yOQi57DvSxaVw+HjU/f7UA==
X-CSE-MsgGUID: hTBnemMxSU2khYiz+9BJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="144987316"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:37:21 -0700
Date: Thu, 22 May 2025 00:37:17 +0300
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
	Tomas Winkler <tomasw@gmail.com>,
	Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Message-ID: <aC5HjQKRf_4Ewous@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-5-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-5-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_143726_861950_4426A76D 
X-CRM114-Status: GOOD (  16.02  )
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

On Thu, May 15, 2025 at 04:33:39PM +0300, Alexander Usyskin wrote:
> Register the on-die nvm device with the mtd subsystem.
> Refcount nvm object on _get and _put mtd callbacks.
> For erase operation address and size should be 4K aligned.
> For write operation address and size has to be 4bytes aligned.

...

> +static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device,
> +				 unsigned int nparts, bool writable_override)
> +{
> +	unsigned int i;
> +	unsigned int n;
> +	struct mtd_partition *parts = NULL;
> +	int ret;

Reverse xmas order (along with all other places).

> +	dev_dbg(device, "registering with mtd\n");
> +
> +	nvm->mtd.owner = THIS_MODULE;
> +	nvm->mtd.dev.parent = device;
> +	nvm->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;

Isn't MTD_CAP_NORFLASH already writable?

> +	nvm->mtd.type = MTD_DATAFLASH;
> +	nvm->mtd.priv = nvm;
> +	nvm->mtd._write = intel_dg_mtd_write;
> +	nvm->mtd._read = intel_dg_mtd_read;
> +	nvm->mtd._erase = intel_dg_mtd_erase;
> +	nvm->mtd._get_device = intel_dg_mtd_get_device;
> +	nvm->mtd._put_device = intel_dg_mtd_put_device;
> +	nvm->mtd.writesize = SZ_1; /* 1 byte granularity */
> +	nvm->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
> +	nvm->mtd.size = nvm->size;
> +
> +	parts = kcalloc(nvm->nregions, sizeof(*parts), GFP_KERNEL);
> +	if (!parts)
> +		return -ENOMEM;
> +
> +	for (i = 0, n = 0; i < nvm->nregions && n < nparts; i++) {
> +		if (!nvm->regions[i].is_readable)
> +			continue;
> +		parts[n].name = nvm->regions[i].name;
> +		parts[n].offset  = nvm->regions[i].offset;
> +		parts[n].size = nvm->regions[i].size;
> +		if (!nvm->regions[i].is_writable && !writable_override)
> +			parts[n].mask_flags = MTD_WRITEABLE;
> +		n++;
> +	}
> +
> +	ret = mtd_device_register(&nvm->mtd, parts, n);
> +
> +	kfree(parts);

I didn't find anything questionable about this, but hope this is tested
and there are no side-effects of this.

> +

Nit: Redundant blank line.

> +	return ret;
> +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
