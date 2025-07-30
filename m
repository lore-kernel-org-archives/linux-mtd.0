Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D39AC87FC9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrfIYxcv3Z0I4fTEG1U+Zg6eCadXeLLbDH/Pe3uu2lc=; b=GPRufAaHDGtuB8
	6omY9WmjHSIo3DJXY3EMM+SRw2GOefDSdQm0WUkumvK/xBiikucEbzAXmzD4pHmzZh6rsbuL2eRYc
	lMcRTG30uUS1VFkgz+wFe3P8dEgKGvCl0XxMV1BiWilo/6ZIyjw3SAo7WtC46MpsbSNgrUV2/mhOr
	kcn9RoWJZPEF/mULf56xf5+U5U+xkHvQu521kxdDkwCVgmtj/DSV7x0avygnTiReMFeA7ZhhFc1zp
	bv59KW/Zd6XztM9RwPod3wMdokvGJmvhjtn6AGdokc+RIyircV9M3D+jZ4hXgowzxmm0zuoCrheSw
	fuCaElfnqLXisiNW9f8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5m3-00000001REE-0v0h;
	Wed, 30 Jul 2025 12:19:11 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4pF-00000001KZ1-1Xi3
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 11:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753874305; x=1785410305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t0ejpR8IQbxsMHqtnT89W08zsv2WKywm9SjCHzeDXwU=;
  b=gCA8PN8snDe86GPLb1mFPWspmzJQ4ySWS78RcTA7dXR+ecmgTTbrtO2F
   vYrXyPslBWno8wur6+dwCXL/uZky6/BNYf53Nl2eG240P2Zw1vfMauswA
   TrOIOb6E4gfTQAox7VmPVnkmJ+1YJQDB/DmQbHGMBpA2o6FPk/b9kKJWB
   dMC0gXIvaqY+I7zJp/A50XwpmGU4cnI1WRufIdiH4xQObmHePT9U8VDQF
   JDacJUPB0o+32QFehoPZlFWA772OdJzdkX2C/BcdoN8fbT1STHLa6VOjQ
   P5+50rylKULjrOO4poVR6BY2024QiJwpNSzYRRoACwzE0FHJIUjfmQnLc
   g==;
X-CSE-ConnectionGUID: d/z2mwHqSC2WHozINyx43w==
X-CSE-MsgGUID: 6o1bBp5SRtiyH7AWbNJ2GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73759350"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="73759350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:18:22 -0700
X-CSE-ConnectionGUID: 1rX3xvXVTHyxd2N7bYOKJg==
X-CSE-MsgGUID: zvgzea4oRlqjWZvn+Mm2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="168267976"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:18:19 -0700
Date: Wed, 30 Jul 2025 14:18:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
Message-ID: <aIoNlFucSI18G0oX@black.igk.intel.com>
References: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_041825_411210_E8759298 
X-CRM114-Status: UNSURE (   7.10  )
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

On Wed, Jul 30, 2025 at 12:21:49PM +0200, Geert Uytterhoeven wrote:
> Intel Discrete Graphics non-volatile memory is onlt present on intel

only

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
