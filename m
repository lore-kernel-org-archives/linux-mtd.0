Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17677C3ABDD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 May 2025 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIeuG9Yi46rsuTTQo8MAYtH/OlWWqTPN//JchCUb+Zs=; b=H5O5xxusYF3HpY
	wy8vw1G/Eu83fEZxRg3bxmMgrHVmC7uLkzKymwICm70Isq/0D6RA7cKGBzZY5uLJ26dcolzCg9Gmh
	nPrZ9A+iWQzUEF50CI5RTH22a+ivKy0Cp+ILmg7P7iJlSOR8bRfPuvgSArwsr/U9QMWyJl7iorIYk
	vjXXcuCFsRoltcK+pmaB9uzfy6rc5OzrxPJ0cNc0UShE8koNE/ZbxTYfEzGe2YG42fsD2yIltTFqh
	4ioxEpsikTEgow+wXXVFQknaW/d7AJ21yZ1WpvaCYLCxZk6THwExkjXXNp2xGCrNGJB5D2ZYb9TLX
	Kw1ace4S0WUUlUPzmhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQoK-0000000DgS3-3m8f;
	Tue, 20 May 2025 17:31:28 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQoH-0000000DgQX-3rtL
	for linux-mtd@lists.infradead.org;
	Tue, 20 May 2025 17:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747762286; x=1779298286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aKyld7h5OwA2Tp0yE8iRRpriwlPf1t10b9g3LHZckzk=;
  b=jQNvjpKTDEzIuwDXLKGppQgDZiJl8gOjqxC10/SRYAaVCEOnoMotvFqJ
   NPY8koIdFBl6H1AVMGZa29edK+v81o83TAkZ2mGXqzfdDcvMDMM+d0WAT
   jeWLAXH/CAQFh/qNr4HBGz2it3sjUCS7WdSwG/OEC3BBGLZlvpqW897jU
   gBZUxL07v4H3ETLLiynaFGrwBXoCUxvCsZVozdz9rh7x4NWB2kXFTcoOT
   ZBcF/q7gWfWOaXDHv36C2ehZZsB43oSxoVS6kIP1IIyBmtVhw/JlU67jk
   DYNGNIVYRfeL5hKO8uMwarXg55udNge3YmGN0CZfIcPbsb4ChXvHCV4PH
   w==;
X-CSE-ConnectionGUID: 9UoyfWgxRlCve10D/Z7e5A==
X-CSE-MsgGUID: GeGzgW6iSx2awhdHQmGd6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49583716"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49583716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:31:25 -0700
X-CSE-ConnectionGUID: N2HUp1NUTKeNrYa5H8G9PA==
X-CSE-MsgGUID: cUQ/AInPT/yQWzIWv/8eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143754323"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:31:19 -0700
Date: Tue, 20 May 2025 20:31:16 +0300
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
Message-ID: <aCy8ZJq4eDMDQukx@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-4-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_103126_000880_6F2F53E4 
X-CRM114-Status: GOOD (  15.16  )
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
> +static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nvm->nregions; i++) {
> +		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) > from &&

Since it's already off by one, I'm wondering if this should be >= ?

> +		    nvm->regions[i].offset <= from &&
> +		    nvm->regions[i].size != 0)
> +			break;
> +	}
> +
> +	return i;
> +}

...

> +__maybe_unused
> +static ssize_t
> +idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
> +{
> +	u64 i;
> +	const u32 block = 0x10;
> +	void __iomem *base = nvm->base;

Reverse xmas order (along with all other places).

> +	for (i = 0; i < len; i += SZ_4K) {
> +		iowrite32(from + i, base + NVM_ADDRESS_REG);
> +		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
> +		/* Since the writes are via sguint

sguint?

> +		 * we cannot do back to back erases.
> +		 */
> +		msleep(50);
> +	}
> +	return len;
> +}

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
