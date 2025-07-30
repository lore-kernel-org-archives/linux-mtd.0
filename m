Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F3C87FC9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AlqdjFD37W9nxOgeJ3VIsyOvjjIqG5TqVe7TbqF5S0=; b=AbhL33cweRxl/y
	80cgME4hR0VZztS8EB1FCIwu7siKAbSBHfF8cC5pEgnZMM2xZ8OvPGy3W4OubPVIInk5VWCF5zsTn
	bi0dBS2+FTnqAXHdLS4SBAzmckup2NcfSxUQso2AEXXuTsEWCumadz9X656kel2LdAL6c60StJ2Xz
	B3E4e24jKqFwJXRvty7kelVSeCCn6ufoHt8uU1e2dUSTt3nMNNqOxarbrORdROE8MIYVlp6tQudcY
	877dJC7VZPDGjuinPpEAnNI7vQWdYgI+rK3p3T1elBIpQoiuKu4Uuod9h+CsyUNOW7kYJwiSAgLpn
	s4RnHr3RQfTxUrQqjwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh49G-00000001EvB-0BpQ;
	Wed, 30 Jul 2025 10:35:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh46b-00000001EhN-2BPV
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 10:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753871538; x=1785407538;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=xY0cGAduPMxd5tMAYBCMfqbxzSqavrO5JyNnwoCIJHQ=;
  b=AFsQKAUNCcOK+Fu5TCMtpSPFPZRdtx7KgUOeYfoB9AQyisjltT18NDNy
   P5c7AsAtjANXpD/V/2mUjA9XrVGLVZPLUEDRQwjh7r6CZ3cv1+lAQH8/o
   Kea0ytx7fVqWJIkX35PkQoELm6tgfA14fkgNF8z4VtG0IptfKPcStzJaQ
   dLYpuDdbxRw1y6/t59FK9XK3MKQlHPMk4i9QWUHULCr8GFaE83IUBrrDF
   foxEnwEIph+yqhFNZJ5n4nIw3cGWqwAAKBPrkwJ86MLLFokKOCoXj0Dlo
   06ICdhQi1dkTiDfV4vTFqKGxPA6UKDOw1xWo7iIwaWB5BzoHlQbLdgtnF
   g==;
X-CSE-ConnectionGUID: ZOBsGMMjRt6GGKsBagJ36w==
X-CSE-MsgGUID: OpbV2zH0Q8+AQncDvrZg7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59808653"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59808653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 03:32:15 -0700
X-CSE-ConnectionGUID: eI3AQv9KRMevZgfTBjMV8w==
X-CSE-MsgGUID: ltEV/2/KTsCZXYhDXdqRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162979081"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.74])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 03:32:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tomas Winkler <tomasw@gmail.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
In-Reply-To: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
Date: Wed, 30 Jul 2025 13:32:07 +0300
Message-ID: <d947168fd02d6f820159b456099e6aa8f465b633@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_033217_594455_9A63D6F2 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, 30 Jul 2025, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Intel Discrete Graphics non-volatile memory is onlt present on intel
> discrete graphics devices, and its auxiliary device is instantiated by
> the Intel i915 and Xe2 DRM drivers.  Hence add dependencies on DRM_I915
> and DRM_XE, to prevent asking the user about this driver when
> configuring a kernel without Intel graphics support.
>
> Fixes: ceb5ab3cb6463795 ("mtd: add driver for intel graphics non-volatile memory device")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mtd/devices/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 46cebde79f34b0b7..f0ab74d695347117 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -185,8 +185,8 @@ config MTD_POWERNV_FLASH
>  
>  config MTD_INTEL_DG
>  	tristate "Intel Discrete Graphics non-volatile memory driver"
> -	depends on AUXILIARY_BUS
> -	depends on MTD
> +	depends on AUXILIARY_BUS && MTD
> +	depends on DRM_I915 || DRM_XE || COMPILE_TEST

I understand the intent, but IIUC auxiliary bus usage should not require
a "depends on" relationship. Couldn't you have MTD_INTEL_DG=y and
DRM_I915=m just fine?

BR,
Jani.


>  	help
>  	  This provides an MTD device to access Intel Discrete Graphics
>  	  non-volatile memory.

-- 
Jani Nikula, Intel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
