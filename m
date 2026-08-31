Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02470C61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEDrGSMSr+4RgDB8uaEWhyRqu8r84kBrfhPF+H06Lww=; b=kX9mWjcXK9U2YR
	CSN4g7pOHvWBVJRGXXhIkWE09ILPY+2xow5EmvA66DFPTw77p4z0so5uRpXe5TIcBhWgm0JXCQygk
	rkZmTH9kiGxpyNImQgPMrSRD0+nN0KaFxsfTGTjcpHovQFx7V8rVAlY+V4ZnwekRkgC+hakj/V1lh
	jXgeuqVEo3Pu/6q0+MmiXVElRvTJPvv6H+krxeMzoem2m7Ne5yLUAn/sD+SKle/MoLA67H1poY9XR
	wmMdkhkou0Yy0bDfIuGOQ0IG3jCdbpafznBfX1BFy654P2IYCHt7OPFqFUTJ/vbtfwVjSkyT/SwyO
	QMYDa7y0gNHi0WURQzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Xy-00000009LZZ-3DAw;
	Mon, 31 Aug 2026 12:55:34 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Xv-00000009LZ7-0p2F
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788180932; x=1819716932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sif5+hNzJedR/vts6gsrtZ73av+XEooXAd9niZui1ZY=;
  b=BWsgu3mPXzppHDfvo10KeJutzM5hwZ2AR9bazo2jnsSWNtEaEp+QWX7G
   Wvwu3ZK+vfbKX5Ic1NyzbM3ii7cBfgqan+RgUT99O7bFE4mD6stSlUy1i
   D+Hfpsxtlv5TopTPELda4wskzrveFEHiTgMLdd+DzjGGShRNRDF3IJBLL
   rmKPNK5GpPbs11MyXZdjlJlWsa+DrLBJjtLs0ejQIa4dDb4duTTlhNmGG
   2S6EcrW9nhVELkqaa3QzvWu7Vx7NeJvBNs28snZ/vJagl6D3+XUuLXv33
   kf4WhBrD1bjwacVaNnwaLjVb45ff9r6fK0EoAKV8S6FAN2ZBrETS45wPd
   A==;
X-CSE-ConnectionGUID: WMnupS9hSyuUrdVSbx6WeQ==
X-CSE-MsgGUID: /SQfIpF5RaibSh+CSVDAGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="100099930"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="100099930"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:55:30 -0700
X-CSE-ConnectionGUID: e5CI7kEYTRGeapYb6Y21NA==
X-CSE-MsgGUID: ARJQiCOHTfC/50iF0RwawQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="272980107"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2026 05:55:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8584799; Mon, 31 Aug 2026 14:55:26 +0200 (CEST)
Date: Mon, 31 Aug 2026 14:55:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: tjakobsen84@protonmail.com, Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Report platform enforced SPI flash write
 protection
Message-ID: <20260831125526.GJ124825@black.igk.intel.com>
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
 <DL34V3WU5UY1.3FYYB7UPWYY83@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL34V3WU5UY1.3FYYB7UPWYY83@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_055531_277430_E3889AB7 
X-CRM114-Status: GOOD (  13.35  )
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

Hi,

On Mon, Aug 31, 2026 at 02:37:59PM +0200, Michael Walle wrote:
> Hi,
> 
> On Mon Aug 31, 2026 at 2:05 PM CEST, Tobias Jakobsen via B4 Relay wrote:
> > Patch 2 adds the only user, spi-intel, which already computes protected
> > range state at probe but has had no way to expose it since the SPI MEM
> > conversion removed its visibility of the MTD device.
> 
> Where was it removed, though?

After the SPI MEM conversion the driver is a regular SPI driver so it can
only use spi_new_device() to add and configure the SPI-NOR chip (via
platform data, struct flash_platform_data). Prior this it was creating the
MTD device itself.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
