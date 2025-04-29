Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB14CC3ABA9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSAKwoB7GoShP/DRwmXsc+cy8i1cL1lgA8etieadclw=; b=4Uq5c8ENbR9ST0
	lk16iiD3zSs6AuvDWgKFXt4Z7UOlO1erpBVWQBe9MsayaMxmgFtyiOhywp8TR3CL3xUNM/5xi6ryk
	FB7EcUtGRSpORGZjPDalt8iEzq+TjOh6IeI4s/lf2O3kf/1yjj9et5+ToMHCUF69+RX+6Be4LC+qt
	di2ACJ/BwxfPJzRCpieOgC3cepNgEG9m/4py/UMtBm4mfde1OIOOVk3CdrP2yU17ldhAwp9jVz/ql
	epP2S1dmRKmufKRs1dlzaJzHCgFNeR7GGT5rpTQIQ56lworn2Ub4zfmtVwjDWHpllFIM/zoyBUshP
	s38N6YqozcWsqZAlPXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hVo-00000009BZW-2G9q;
	Tue, 29 Apr 2025 09:44:24 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hVm-00000009BYy-2Mob
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745919862; x=1777455862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wh7FchBcfOdfExNX3BYz2qNe2hMS+gRAYru+0UUvZes=;
  b=OCv6+IaaG06WCSW2P2KzmTcgLMRgcX/Mf0Wibn8O7+DG5NCiJj5pTpr5
   IpDzjWnBy192+ixxYub7XjUmbbBD3GYWdvrBNTF1/CstMwNvHS37eMZEz
   i1Lx0nkyDIFBQTyksg5hX66XRYCSr8c7XWD+sPLFTthBckf5QCy5z+0oI
   SwubT8TuGU+zZ6mn2hD4yZQ72GYFiUnUv4NQF1mg95ZWjQ+p3bgLSTzBe
   4FwRxgT5aEWhEGUCvnH1RjPWyJimy4svtGlFlHbUG2rcotBL/NapygJfL
   nZMehfVtZcbHpl5ZuA0sjddE5q/M2A5LeMZqNCyyqFg5QcCp2ziRvBMB9
   w==;
X-CSE-ConnectionGUID: 7MPgDYpjQuSKn9asMBTwFg==
X-CSE-MsgGUID: ULMI12T9Qemn9v6cKvawrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="57731560"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="57731560"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:44:21 -0700
X-CSE-ConnectionGUID: ESk4VnhqRUumDTvwR81cKw==
X-CSE-MsgGUID: cp5503b2Siai0RouYOw96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133726320"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:44:16 -0700
Date: Tue, 29 Apr 2025 12:44:13 +0300
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
Subject: Re: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Message-ID: <aBCfbaYs9CnXL2h1@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-4-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424132536.3043825-4-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_024422_649017_0FAB2F7D 
X-CRM114-Status: GOOD (  16.39  )
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

On Thu, Apr 24, 2025 at 04:25:27PM +0300, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.

...

> @@ -22,9 +24,199 @@ struct intel_dg_nvm {
>  		u8 id;
>  		u64 offset;
>  		u64 size;
> +		unsigned int is_readable:1;
> +		unsigned int is_writable:1;
>  	} regions[] __counted_by(nregions);
>  };
>  
> +#define NVM_TRIGGER_REG       0x00000000
> +#define NVM_VALSIG_REG        0x00000010
> +#define NVM_ADDRESS_REG       0x00000040
> +#define NVM_REGION_ID_REG     0x00000044
> +/*
> + * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
> + * [23:16]-Reserved
> + * [31:24]-Erase MEM RegionID
> + */
> +#define NVM_ERASE_REG         0x00000048
> +#define NVM_ACCESS_ERROR_REG  0x00000070
> +#define NVM_ADDRESS_ERROR_REG 0x00000074
> +
> +/* Flash Valid Signature */
> +#define NVM_FLVALSIG          0x0FF0A55A
> +
> +#define NVM_MAP_ADDR_MASK     GENMASK(7, 0)
> +#define NVM_MAP_ADDR_SHIFT    0x00000004
> +
> +#define NVM_REGION_ID_DESCRIPTOR  0
> +/* Flash Region Base Address */
> +#define NVM_FRBA      0x40
> +/* Flash Region __n - Flash Descriptor Record */
> +#define NVM_FLREG(__n) (NVM_FRBA + ((__n) * 4))
> +/*  Flash Map 1 Register */
> +#define NVM_FLMAP1_REG  0x18
> +#define NVM_FLMSTR4_OFFSET 0x00C
> +
> +#define NVM_ACCESS_ERROR_PCIE_MASK 0x7
> +
> +#define NVM_FREG_BASE_MASK GENMASK(15, 0)
> +#define NVM_FREG_ADDR_MASK GENMASK(31, 16)
> +#define NVM_FREG_ADDR_SHIFT 12
> +#define NVM_FREG_MIN_REGION_SIZE 0xFFF

Should we move these to a header?

> +static inline void idg_nvm_set_region_id(struct intel_dg_nvm *nvm, u8 region)
> +{
> +	iowrite32((u32)region, nvm->base + NVM_REGION_ID_REG);
> +}
> +
> +static inline u32 idg_nvm_error(struct intel_dg_nvm *nvm)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	u32 reg = ioread32(base + NVM_ACCESS_ERROR_REG) & NVM_ACCESS_ERROR_PCIE_MASK;
> +
> +	/* reset error bits */
> +	if (reg)
> +		iowrite32(reg, base + NVM_ACCESS_ERROR_REG);
> +
> +	return reg;
> +}
> +
> +static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	iowrite32(address, base + NVM_ADDRESS_REG);
> +
> +	return ioread32(base + NVM_TRIGGER_REG);
> +}
> +
> +static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32 *access_map)
> +{
> +	u32 flmap1;
> +	u32 fmba;
> +	u32 fmstr4;
> +	u32 fmstr4_addr;

Nit: These are in order of appearance vs reverse xmas tree in other places.
Perhaps make them consistent?

> +	idg_nvm_set_region_id(nvm, NVM_REGION_ID_DESCRIPTOR);
> +
> +	flmap1 = idg_nvm_read32(nvm, NVM_FLMAP1_REG);
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +	/* Get Flash Master Baser Address (FMBA) */
> +	fmba = (FIELD_GET(NVM_MAP_ADDR_MASK, flmap1) << NVM_MAP_ADDR_SHIFT);
> +	fmstr4_addr = fmba + NVM_FLMSTR4_OFFSET;
> +
> +	fmstr4 = idg_nvm_read32(nvm, fmstr4_addr);
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +
> +	*access_map = fmstr4;
> +	return 0;
> +}
> +
> +static bool idg_nvm_region_readable(u32 access_map, u8 region)
> +{
> +	if (region < 12)

Anything special about 12? Should it have a macro def somewhere?

> +		return access_map & BIT(region + 8); /* [19:8] */
> +	else
> +		return access_map & BIT(region - 12); /* [3:0] */
> +}
> +
> +static bool idg_nvm_region_writable(u32 access_map, u8 region)
> +{
> +	if (region < 12)

Ditto.

> +		return access_map & BIT(region + 20); /* [31:20] */
> +	else
> +		return access_map & BIT(region - 8); /* [7:4] */
> +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
