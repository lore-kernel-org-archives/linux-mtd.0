Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC0EB104F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAvSCL1u+WPPYpWVlJ4AqBCvL5KS1I8F8tK8sBB13xk=; b=RZDt5su4aHYaI/
	fhozy9RC6giOMsD19sWwvnZYMN4rh/3Q0NmgtyD9ut59wBWTwWeWsf9YbrNMDg4BV2BkAvM0G1h3n
	krOOwbKUJcxpDAJ1oNDQnI3kDKiOdNd3iIfv4gLNzugPhgjH7QFGiUnclHK3/X2aIC1KwG8TNr5X3
	PcA2kHaj3k846fX/DbyBvzxQz5aplRk973pq80+KS/gIVFqBfpvBgk44R4juLsiCWGDxAbsY8HoAC
	KLvq8jGeiBgm+ryke8Lqk1IE2zs2lsy8ePkj3BC5LbZ4JW34meKveqXy8iQfVvpmj4RpQRiYHB5MP
	M7/cBjWwkKu+XNuBzC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvWM-00000009InE-2mkQ;
	Tue, 10 Mar 2026 11:45:06 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvWI-00000009Im2-3u8J
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 11:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773143102; x=1804679102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Mu/VtaXCUbFGaoaRleKJWD0Vlj05WPcc6/ExYoawvY=;
  b=TY3DyJTcZVWqbJWvrYMRy85Bvr+uOCvQNpl106ovkNEbaWEA+y60SAri
   saCViniaygtIFhbyfL0NIGUXy6UhG7kIrHEJnJRps5/7/YUaS1j6gM5f1
   eXTER3G4IUkfxmzHWxqtmEX+/JtyjFLm05t2mCvGv9Pms7OWZs4r980WO
   qa3vtpHJgQQrtg0gdEXCNXcUgBnhPhcwO+/A0iAHdnRwSRaxkbQ+iMHFB
   kcq8gmxS62IxePQEr9V03dOkdkcwrN8K8SnVykIGrPzoGH0pS4XLYPf+F
   jwdroSNUPcNxMIEfK+L82kM3po+TL2RfD5muiiL8J0Go+qLhfNy8Jg/LY
   Q==;
X-CSE-ConnectionGUID: 5cnwYDvGQC+Uzi16YKsdRA==
X-CSE-MsgGUID: is5gfabwSrqtf7XfgcFPPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85663401"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85663401"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:45:00 -0700
X-CSE-ConnectionGUID: GpAQ9A33Qha75WjaiYaauQ==
X-CSE-MsgGUID: b6F03VQ3SPOliGtqkPcgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="243100932"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:44:57 -0700
Date: Tue, 10 Mar 2026 13:44:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/1] mtd: physmap: physmap-bt1-rom: Remove
 not-going-to-be-supported code for Baikal SoC
Message-ID: <abAEN7_1aQjSxYhc@ashevche-desk.local>
References: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_044503_030652_CC8203C5 
X-CRM114-Status: UNSURE (   8.40  )
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

On Wed, Feb 25, 2026 at 05:23:34PM +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.

Can this be moved forward?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
