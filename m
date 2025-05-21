Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0199C54E65
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=924sEPLWUrUkZZSyNH2CXBmHKUhxRcDku+bapuWdppo=; b=sZqYsHX3z8hnkS
	MTt9BKnbyhTIoI/Fhfe4QK90QsC2de/OTgUA5mqfgrDFFQLd0or6OxVKiv0AdhBwWCvg2NnZFP9EZ
	Z2KrhLfdo1eRV1iv7Qve0NBYj7kgSNXFMbxQ3Jb3scWGwknIj5ABGP4gEkNzYAiKRhdM7boTpdZBn
	EbtPyRQdJZYuQ7GjS3m2bSKM7LqMrUSg8FyU+MQoxp0a2pY2Rg7TlfpAzRo+HqM8aSbM2Q5vzd2aQ
	p9I0OIWiDNhMOupuZkirc1ZkEDHTs2xOQJB06wHIuZxH/7G7YoljHSGtBScGk0Cm5uLKizxlPvyoG
	RSwUcxss9zlUebLM8mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHq1P-0000000GmgI-0k2B;
	Wed, 21 May 2025 20:26:39 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHq1L-0000000GmfN-4Br4
	for linux-mtd@lists.infradead.org;
	Wed, 21 May 2025 20:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747859196; x=1779395196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLtQzNGu5/O0fU0Cv03GWH9zFR3LL3UOULcLPG921iI=;
  b=EX7E3lMxtSy12LxNi3nfG4JSUyAmqQLaQ1M1anZ/SMm+Bz91m1X+eRGd
   N2jz0kP0ce3Jtvoggd2L27UhABJemPPFmObD9x7k4VKKeatD4npSvwsnN
   TegPAbCrM4dsPdUr/LXTKdXGcOmLx/fzxSRYzjYUrhrg8YWEDSaGPNF1t
   un0X5YIl25rkisCsYV1TGU3WoSBSpuyB2Q/lBaHd7CFQBwYplrLYfwTdm
   lT35jkxvxyZLmIOg3noxkcJQnH4ISsr5htlR8pb3mOMZZ7oNsgi4qyR1j
   o8vt+/2nyIn9bSJvSu4kmsnkpalV7B6DZS88BPwsybPKnZ8fVDPJ0j+lJ
   A==;
X-CSE-ConnectionGUID: ReER7U8FRISX7opIbN9ZHA==
X-CSE-MsgGUID: gkrypWhFTlaDyD7s1Zl8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49762881"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49762881"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 13:26:35 -0700
X-CSE-ConnectionGUID: qZCX3NfvRmW5MjpehmDrkQ==
X-CSE-MsgGUID: D1ORkfQ1S9OCFvbKBj7yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140088834"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 13:26:29 -0700
Date: Wed, 21 May 2025 23:26:24 +0300
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
Subject: Re: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Message-ID: <aC428Ak5j_x6Cr2o@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-4-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_132636_090798_40C6AF3E 
X-CRM114-Status: GOOD (  14.09  )
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

On Thu, May 15, 2025 at 04:33:38PM +0300, Alexander Usyskin wrote:
> Implement read(), erase() and write() functions.

...

> +__maybe_unused
> +static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> +			 loff_t to, size_t len, const unsigned char *buf)
> +{
> +	size_t i;
> +	size_t len8;
> +	size_t len4;
> +	size_t to4;
> +	size_t to_shift;
> +	size_t len_s = len;
> +	ssize_t ret;
> +
> +	idg_nvm_set_region_id(nvm, region);
> +
> +	to4 = ALIGN_DOWN(to, sizeof(u32));
> +	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
> +	if (to - to4) {
> +		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (uint32_t *)&buf[0]);

Forgot to add, you're using both uint32_t and u32.
Perhaps make it consistent?

> +		if (ret < 0)
> +			return ret;
> +
> +		buf += to_shift;
> +		to += to_shift;
> +		len_s -= to_shift;
> +	}
> +
> +	len8 = ALIGN_DOWN(len_s, sizeof(u64));
> +	for (i = 0; i < len8; i += sizeof(u64)) {
> +		u64 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u64));
> +		idg_nvm_write64(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +	}
> +
> +	len4 = len_s - len8;
> +	if (len4 >= sizeof(u32)) {
> +		u32 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u32));
> +		idg_nvm_write32(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		i += sizeof(u32);
> +		len4 -= sizeof(u32);
> +	}
> +
> +	if (len4 > 0) {
> +		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (uint32_t *)&buf[i]);

Ditto (and also in all other places if any).

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return len;
> +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
