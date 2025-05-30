Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C8BC5AD49
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=406/oVLhc1GqrsfX3fw4caRnFAgL8lmTRD71QtrWI1U=; b=sRUiIAQRtofOt1
	YmITQQZNmn5pSaAnu/+9HTDer3L53dvKH9WhzlNL2S29GwLgS5Ig7RAz/dUl2l0diCURfcsU0VtMU
	xwnV4X5r0w5L+IP6bdkxc8h4PGnefwC2IEClZs+rO6I8heUIw8jlIwdYiWK1GIysmnv9wabEsZ7OL
	jGlcg+o4bmSjKcJqcbxBfsuvwUlThu/jau2saiGARz4g0jEFJIrWK2a8vrRqKIseO9ZjoPwnaTj6X
	nVO1zHjEqZqe/au3wu4/qj9Bn3eQH4X6S4FeTVXfFqJm70UjAKi07C708dxJPELnWr2TeITE8bM2/
	PbNz4NbWzgrqX9jCbw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0CF-00000000p6L-0UoW;
	Fri, 30 May 2025 13:54:55 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0CD-00000000p5S-0mYr
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 13:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613293; x=1780149293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RBaCZTQdhPMgKEXPyAzhYmB8NNmpV2BzO5s7RSPQP6w=;
  b=LXjWD1rHeaUHAi3YJL+wKTgwY/gmNyEy7h3fVlmd5fKiaLhgrr0Q4hlf
   8X0Jned2E2S4ID3HJIfmZDR5w+Q9jSJwU1iUT6sKXym6Vz/qwQ/z3Fhaw
   ODyLyaSl/cA7NU9OZFnn17ybRLW+6/AzdMmr6LA2oDxxS/56OR+bY3pjS
   BnlzvJU4G5v9yUIvklrSF4P+aADBT4bS5a/oehpgFD2cS4Oj2pzrq6mMm
   q8llnHUDg2pTrvJOfDncxXfrt+sanscJVVx8SfqLEeZjuSfENcGzpG3UB
   encNDH+vIu0LG55fc2c3okdxJFaU8GgmS9WpPZNJx2fXPnBEUYsv7avyo
   w==;
X-CSE-ConnectionGUID: IYRhXN3YQ4Gj6XPRYC0QvQ==
X-CSE-MsgGUID: RARg7H+6Sv6VC07XN1yuhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62050978"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="62050978"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:53 -0700
X-CSE-ConnectionGUID: r+GLEQFPR2aQqJOf5YKfPg==
X-CSE-MsgGUID: jWWBS004RTSMRYYJ7+KDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149027757"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:47 -0700
Date: Fri, 30 May 2025 16:54:44 +0300
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
Subject: Re: [PATCH v11 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDm4pAqHUhI-kY2i@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-6-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-6-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_065453_234354_0711463E 
X-CRM114-Status: UNSURE (   7.56  )
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

On Wed, May 28, 2025 at 04:51:10PM +0300, Alexander Usyskin wrote:
> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
