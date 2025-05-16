Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485BEC3ABC9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 22:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foVYCsiPKBkB9Y2nVfSbhFWLaj6UCu6cETTSSLN0jNo=; b=poqKOE1liO28zs
	CwO5K37XYHo/DrhZHm8dhNIXEmOD14FdTX1XS3u5zVKvAC2h2zb8+VTS94fMlqSUhsuaUfB83r8kf
	XJeXauo9MY8Q0p9rkZgEAs81OA2GFIIK+pyWS3PKuCqZZBuFKFWPO4JPLiHyqicwqS1ifVmUHkTuH
	07L4mcg4MeD4ZbFPAJ95spn9NYf4l29ptoXlypELqe3FBE+NMZympjnG28s0+IPNJPFgdOl4ldf4k
	BZ16qPitsZ5OWFqD7pqwcczUdff3c6Mipod/9x7vd4irYb06X8Y8/9ql2eZDaHfosTzBQwz8HbGOo
	AmBzvLP298D9jNCOVm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3RX-00000004k8S-1srg;
	Fri, 16 May 2025 22:22:15 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3RU-00000004k80-26sO
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 22:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747434132; x=1778970132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kONYMJEJ044G8TH598Cjlf7EWAn1NPZyS4WQgCgWhfw=;
  b=Lz/CkJq7YDC7fMmoEshNIhBtjO+6mWtMuXsvld5gaQZvejdNA/V8rf0F
   2+qerdVZSglKT1a0ZD+qI9PuEPLvqOJ6IDk7nBVEki3OHH5Vm0NUs5mEo
   sjEOF7xyk9Nbk5twxCX1QKo6NHAoGdWD6CiIT/oZFVFNsAgNs3m16+ftn
   79M6jRbJZHbkL6wqcO54n7mcbBCTHwSGWnHDLFv179dN1Nka+rjjhOxgb
   hDpwXE3aVDxF5EChchxfZUnVwkUPIUfI/Oye+jXubOdCJxyFadftd8hTr
   1tN/Aat+Zgnv7jAE+dCIMw7nP90Nsx1B6C9tfEIdhwDOLDQ4rB77UQ0S1
   Q==;
X-CSE-ConnectionGUID: 0jtgS9ChTW62W9Lche4a5A==
X-CSE-MsgGUID: C8yn3/aWR92bnxMyIsotRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53219835"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="53219835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:22:07 -0700
X-CSE-ConnectionGUID: 4PfXNEVeSPSO2G7++83Vng==
X-CSE-MsgGUID: 1joxnqDJQsmgxWHlsSO7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143934991"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:22:01 -0700
Date: Sat, 17 May 2025 01:21:58 +0300
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
Subject: Re: [PATCH v10 02/10] mtd: intel-dg: implement region enumeration
Message-ID: <aCe6hlGFG3v0cav9@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-3-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-3-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_152212_549578_8F31CA4C 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, May 15, 2025 at 04:33:37PM +0300, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.

...

> +static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
> +{
> +	int ret;
> +	unsigned int i, n;
> +	u32 access_map = 0;

Reverse xmas order (along with all other places) and

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +	/* clean error register, previous errors are ignored */
> +	idg_nvm_error(nvm);
> +
> +	ret = idg_nvm_is_valid(nvm);
> +	if (ret) {
> +		dev_err(device, "The MEM is not valid %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (idg_nvm_get_access_map(nvm, &access_map))
> +		return -EIO;
> +
> +	for (i = 0, n = 0; i < nvm->nregions; i++) {
> +		u32 address, base, limit, region;
> +		u8 id = nvm->regions[i].id;
> +
> +		address = NVM_FLREG(id);
> +		region = idg_nvm_read32(nvm, address);
> +
> +		base = FIELD_GET(NVM_FREG_BASE_MASK, region) << NVM_FREG_ADDR_SHIFT;
> +		limit = (FIELD_GET(NVM_FREG_ADDR_MASK, region) << NVM_FREG_ADDR_SHIFT) |
> +			NVM_FREG_MIN_REGION_SIZE;
> +
> +		dev_dbg(device, "[%d] %s: region: 0x%08X base: 0x%08x limit: 0x%08x\n",
> +			id, nvm->regions[i].name, region, base, limit);
> +
> +		if (base >= limit || (i > 0 && limit == 0)) {
> +			dev_dbg(device, "[%d] %s: disabled\n",
> +				id, nvm->regions[i].name);
> +			nvm->regions[i].is_readable = 0;
> +			continue;
> +		}
> +
> +		if (nvm->size < limit)
> +			nvm->size = limit;
> +
> +		nvm->regions[i].offset = base;
> +		nvm->regions[i].size = limit - base + 1;
> +		/* No write access to descriptor; mask it out*/
> +		nvm->regions[i].is_writable = idg_nvm_region_writable(access_map, id);
> +
> +		nvm->regions[i].is_readable = idg_nvm_region_readable(access_map, id);
> +		dev_dbg(device, "Registered, %s id=%d offset=%lld size=%lld rd=%d wr=%d\n",
> +			nvm->regions[i].name,
> +			nvm->regions[i].id,
> +			nvm->regions[i].offset,
> +			nvm->regions[i].size,
> +			nvm->regions[i].is_readable,
> +			nvm->regions[i].is_writable);
> +
> +		if (nvm->regions[i].is_readable)
> +			n++;
> +	}
> +
> +	dev_dbg(device, "Registered %d regions\n", n);
> +
> +	/* Need to add 1 to the amount of memory
> +	 * so it is reported as an even block
> +	 */
> +	nvm->size += 1;
> +
> +	return n;
> +}
> +
>  static void intel_dg_nvm_release(struct kref *kref)
>  {
>  	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
> @@ -85,6 +285,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		goto err;
>  	}
>  
> +	ret = intel_dg_nvm_init(nvm, device);
> +	if (ret < 0) {
> +		dev_err(device, "cannot initialize nvm %d\n", ret);
> +		goto err;
> +	}
> +
>  	dev_set_drvdata(&aux_dev->dev, nvm);
>  
>  	return 0;
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
