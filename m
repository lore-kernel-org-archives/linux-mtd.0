Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56051C54F30
	for <linux-mtd@archiver.kernel.org>; Sat, 24 May 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZVouwHlKBA4jqSCH8MNMFa2HD35PdPedJLbe5ebKtA=; b=inJhEdboZncCdv
	v5SMT8w89OLzmvdGzwDpkkGUHw4KJ5NyJaVEphznxNWgGFOnESnkgWLMU0pG5R/wyaGQxdHLlrmDf
	75465cMX6P8jMa2j03jFyYQXF0aQiGdSTSeUUAOM2540PSOO5S9qbP6rri3NV3Wh/AkI1xWkCSxNh
	WfyucrCkiC9ekttDYLfZVCW8CYqXt78hFLvA9f4yg5hxX4lETXRSGKgUCw7g3kid8bU6zlHytEX58
	Dicim3DoBEr2sThnEoga1ut41LwyKo9tXhjQHQ1gaQY/l6dP6Sr6kOPNJ6w9QWCl/uCwtW01uPFB6
	B9eyPGQHMpHFd0uWIN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlhW-00000005hra-0xIf;
	Sat, 24 May 2025 10:01:58 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlhS-00000005hqq-18Lq
	for linux-mtd@lists.infradead.org;
	Sat, 24 May 2025 10:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748080914; x=1779616914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Z1S/hNWZ9pEp/mNhwra4+VgljiQYHC4PHrsvJbhuBA=;
  b=emV46PVgrR3hkzOENDnOVHm0p9GcjuvvL3+gcztVi9esJ76z/SUe/lFS
   EzGjiHyW673y0t5fmkf73o6qIYY51kF+8AHI9f2seE9NxG9RKMj1uBRLM
   ODDKmDPlje3TaAMxdhtJvnR/R2lAFT8R6vCZmN6o3cK31zLPJAcuqXyWr
   KL3eNfFJOdVZrrkCWFAEvfaVpVvvEg1pqUKsYNASxFoPabJtgbjsARG5b
   ucuGuFn874nl3eHR1+i6xa4aF9a87Oxm5L6/T/JnD4939HYfOJAPVhdEd
   Ey0Z3MwYw65Z7qPqNrRGe0N1mLjj7kb7QMijrEPUdzDE2wZfaqJZWag/q
   A==;
X-CSE-ConnectionGUID: Vz912ZPxS3Kr1AsHA+FWmA==
X-CSE-MsgGUID: 53i6FtjuTuGm86/7kcTzSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60778847"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="60778847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:01:53 -0700
X-CSE-ConnectionGUID: Gsn2aVMxTheSeNn7uAZ8ig==
X-CSE-MsgGUID: x09pD8gQTg284T1blC2gRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142063527"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:01:47 -0700
Date: Sat, 24 May 2025 13:01:44 +0300
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
Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDGZCL_B3fEkvahj@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-6-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-6-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_030154_347527_F465F71C 
X-CRM114-Status: GOOD (  18.76  )
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

On Thu, May 15, 2025 at 04:33:40PM +0300, Alexander Usyskin wrote:
> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd_intel_dg.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
> index eedc0974bb5b..2f32ed311ffd 100644
> --- a/drivers/mtd/devices/mtd_intel_dg.c
> +++ b/drivers/mtd/devices/mtd_intel_dg.c
> @@ -246,6 +246,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
>  		len_s -= to_shift;
>  	}
>  
> +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.

If there's a spec definition, we usually mention workarounds with
Wa_ID:platform so that they're easy to track. intel_workarounds.c
is good reference for it.

> +		 */
> +		u32 data;
> +
> +		memcpy(&data, &buf[0], sizeof(u32));
> +		idg_nvm_write32(nvm, to, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		buf += sizeof(u32);
> +		to += sizeof(u32);
> +		len_s -= sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data;
> @@ -303,6 +321,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
>  		from += from_shift;
>  	}
>  
> +	if (!IS_ALIGNED(from, sizeof(u64)) &&
> +	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data = idg_nvm_read32(nvm, from);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[0], &data, sizeof(data));
> +		len_s -= sizeof(u32);
> +		buf += sizeof(u32);
> +		from += sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data = idg_nvm_read64(nvm, from + i);
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
