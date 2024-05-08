Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECB7C04FFE
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GProTFR6o7IY8v/VcO1A2KWBdHsR3M5zFrBnKrzMSlM=; b=PqAaKwt4j6r1Gu
	Aw7CTrmKnnUBnQ6xMo2aHEvONWHFdFbb6jurnDmFfWoMRN4hNAjCeNgIK3wQIkYW0PYClQiFoaneO
	8uvYA9X4amERBBPGA0kMtSMdAahnE8aQZh96p04OcmR3IV161SM2Z8Arf9lfMiYctNDOj16ogaaRW
	bLjBeQjeyWtN/DxdPqPSTIamBhJqwL8buwPMpDDKlofDqP71LE/4iZNElGHj2Tt6aags3k51Ce0ii
	ugjoGR6P++uFU3M0mAGEshkRndf8VDn9Cs2JQxpyDycPL6UiYlE8hapPC5mla3dORBsVUoYVdpHu1
	dt8iqvUbFrMKT4ceBv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4m2S-0000000GXHZ-0Srq;
	Wed, 08 May 2024 18:29:12 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4m2L-0000000GXG3-2t6q
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 18:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715192945; x=1746728945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3kZgmXnnJRsJLju+dT3OUItaJu9Z1c9zg2md9E1tiA=;
  b=CPuir/jw0T5x0y3CwrqVYvfxvjS6ekUJpVKa38FPCoUBfaOFNPA86yTR
   gzq4W76NDcj/WN8rpbPDUZWyamSUAa/z2ZD7uVzE29wu5uO7EjPZ7xQ7C
   PSHmgGzbWNyLVeGLgOhqDKD9ZulN7w+MxHJiUcI0eR4kdGbvbPIdp2ztT
   MzMHzT1pPoEagvGWiSogjJTsytphZ8fhIdTovBiBZiDB71BZcYgshzyi8
   2SATfLD6f+9e4HJCkiHrL5EdVCLPK+AcA2ZHwQI7LlQyvuJ3rNHdKEL34
   QBQMyqSCtbemWmpvQ1XYKPDSqAMMq1eMFTbArvi/P4HynNgr542T17yXv
   w==;
X-CSE-ConnectionGUID: I04xV3g7TiWbwYvr+3g+Kg==
X-CSE-MsgGUID: SsWtQMx9TueFdBBKEJRkxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11231591"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11231591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 11:29:04 -0700
X-CSE-ConnectionGUID: y332NT5ATcS/PqALfhLjhA==
X-CSE-MsgGUID: GaWUBkhQQbq3B1arheGwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="59840609"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 11:29:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s4m2E-00000005XVd-3wSo;
	Wed, 08 May 2024 21:28:58 +0300
Date: Wed, 8 May 2024 21:28:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] eeprom: 93xx46: drop unneeded MODULE_ALIAS
Message-ID: <ZjvEam5paLD0Iv6V@smile.fi.intel.com>
References: <20240414154957.127113-1-krzk@kernel.org>
 <20240414154957.127113-3-krzk@kernel.org>
 <Zju8HpBCiOjjIZ1j@smile.fi.intel.com>
 <6599e2a3-3b04-4ea2-aa5c-a916b66c8009@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6599e2a3-3b04-4ea2-aa5c-a916b66c8009@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_112906_025126_FAEC1D36 
X-CRM114-Status: GOOD (  15.15  )
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

On Wed, May 08, 2024 at 08:15:00PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2024 19:53, Andy Shevchenko wrote:
> > On Sun, Apr 14, 2024 at 05:49:57PM +0200, Krzysztof Kozlowski wrote:
> >> The ID table already has respective entry and MODULE_DEVICE_TABLE and
> >> creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
> >> the alias to be duplicated.

...

> >>  MODULE_ALIAS("spi:93xx46");
> > 
> > I was stumbled over this (leftover?).
> > Commit message doesn't elaborate this bit.
> > Any comments?
> 
> It is not present in ID table and commit msg removes only duplicated
> aliases. That alias has meaning - someone might be actually relying on it.

It seems no users for it. The only user of platform data of this EEPROM uses
board files which AFAIU bypasses modalias matching.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
