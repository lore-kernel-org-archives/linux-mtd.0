Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00A0C5AD49
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4rHPOl3IgWDnfiwBKzudbglvTpvvnOReABmAwkXOeM=; b=VZwZSRo0ceGFLg
	y8i4ngmboOtbfrBzUC+hhwi2fuqBIraiBv+5tgmF+JSG0GAwGE14sHbqjs8iimFuSWUaJSvChaEx6
	jDJG0MudJcdrpvqR+NyfNyKCIw8Pq0TgysY2k+OVYD0Ij6CaAbHAznSsGbNPboHIPFM/I7wp7czex
	/76wpf7+mPO+Kk0ZXF4qooOMKkm5KCK+ehsgB49WEUExS8Vm4+y8obQzyW/mN68RiOZF5+UhXOqxz
	faY1XJf0S1VAe89PXKq4pQoAgBrj/RyA7xxLpLI7LO+XMoy2/hd1HLZSf/5y3wr0LnA+c+yvN4aIY
	ynY0kLFDwMydFwtPd13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzyh-00000000mxk-27nx;
	Fri, 30 May 2025 13:40:55 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzw8-00000000mVB-2NkH
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 13:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748612297; x=1780148297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9P7/wYQPmYQaKNuFq7NSX+ZmEYiCM91XW9864V4KnY=;
  b=mT92QP43g/YRoXuAmdF/TtMbw0QLKuaAG6UCAOBUtUKYQI7FTNbIWIgn
   Cw+fCEgW3GPOLeYzagkhuGuyD37If7KC6CtUOt7ikxkRiIEIXgXQ24UZV
   OhhWHmZNFMmm4OxkGgTfGxoVBt5U9yQbskbk4IhKv9MLV6xf3QMtDA0Z+
   ZBVnKC7zKX2Dxi1CxJl7PLa2LK2TlBQsb/MOk4Up+CjKd8/5YQxGVkO8o
   v1bnAX4BaPNVigSZxzNrUgdHZbqnKEmsfwOqWvLDbTLRavFPGD52jeIWJ
   bJcpWu9TT7agrPqJcvmjGAA/FjNWqvAjDhTD9Aa/0uqLUcRSItGnf95dC
   g==;
X-CSE-ConnectionGUID: 6Snt02joSqmLwX2D36So9g==
X-CSE-MsgGUID: YGjk0vb/R4aUYsp3B0ajnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68255162"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68255162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:38:12 -0700
X-CSE-ConnectionGUID: 7q9JNVmpQ92f3Tt4LHEuCw==
X-CSE-MsgGUID: 0qqq19ioSmGK5DnanuKaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174759679"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:38:07 -0700
Date: Fri, 30 May 2025 16:38:03 +0300
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
Subject: Re: [PATCH v11 02/10] mtd: intel-dg: implement region enumeration
Message-ID: <aDm0u4wXDCqO5rFK@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-3-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-3-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_063816_609656_25FBFD14 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 28, 2025 at 04:51:07PM +0300, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
