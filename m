Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0EC4167D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 05:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTUz/OZtM1OWCDHZeG2a0wp5I6WU7A4Anlkbr+xvtMo=; b=RodRcamaoHjhQe
	Jkv9+pi0hv5cmz3rYnRNbSn6LwFv0SrNWrP5Gm6+BTqAfNQa9/wkTnrf681U609o3sS4BgDZCuCJA
	ksxDRWQiGMm3xBXSVZj4haFB0nqZliNu27vv1TDkybeag/SYjQu2ygSmOhQpVoi1UsdygpsSnfAlW
	vW/vqXHuuP1srxyEfjqYbTJFAM2eouNy1LzPnwjd6ZnNbSG/+rpy7Ewhqog/eComE0ROucwU/6zAO
	QhQWfH8nwHGflDXhmxv3k1z+1ZC4yr8+gSkco51ejilGZRWA00iHovv1f5DWhsHjRYiBiFj445N68
	0dIiw/UAWjObLki8rY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KEm-007ttq-1o;
	Fri, 10 Nov 2023 05:39:24 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KEk-007ttQ-2X
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 05:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699594762; x=1731130762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F3x6oX+rvafLRaso93FOquCeRAY97QKEk4cHD0f+V5E=;
  b=fGw15Hx/Hzg//Uh9rMGFanNz6xabmrM/YS85nEQBHEJCipbPz2/4x0AX
   XiryEXKwriMJiXYQWm814KULhmSzUSxaIxNTykuFlCrjFKszh5V7PglOS
   ffaY/lUAgY3ak170+uR2jV/16rpCv/c0Ni8oUzWksW8HN0Myvr2JaifTQ
   t9d2nrd42s9V5qwy1vSS3z1OVZzPj31WRwS+/4anIqXtAJVXifBB4tJ00
   kNHcSEy3PytqF+49uN6voy6mgxsqFOAGi710CJg+E250z40bKX1dAl3lB
   LCruAxJ9VPbml8tEFBGdZEgDazYUCESaUfRZxldWE3eG6Yj0DpdT4cYge
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369467522"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369467522"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 21:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907378749"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="907378749"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 21:39:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F3A0614F; Fri, 10 Nov 2023 07:39:17 +0200 (EET)
Date: Fri, 10 Nov 2023 07:39:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: Stop reporting warning message when
 soft reset is not suported
Message-ID: <20231110053917.GH17433@black.fi.intel.com>
References: <20231108094303.46303-1-acelan.kao@canonical.com>
 <20231108094303.46303-2-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231108094303.46303-2-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_213922_834360_177822D2 
X-CRM114-Status: GOOD (  10.08  )
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

On Wed, Nov 08, 2023 at 05:43:03PM +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> When the software reset command isn't supported, we now stop reporting
> the warning message to avoid unnecessary warnings and potential confusion.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Looks good to me, only small comment is that perhaps you want to update
the kernel-doc of spi_mem_exec_op() to mention that if the
driver/controller does not support reset it can return -EOPNOTSUPP.

In any case,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
