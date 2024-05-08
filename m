Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E9C25B4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 17:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8P0e6m4iFO3JQwLGYNUprUD/B/li8uB8aiiu4xn9/8=; b=30QSUiLIR9OdA/
	n8uXdhD9QGwF3Tb6hcR0jsFfaknViIje8T/wUhA9lDGoGHEihAaMFu19FkHWQBletRFv5aPvvTvsg
	lFUQnRk6f/gnAGrAAjF35CHKUrfHc70P7N1rUCkS3QYuedfQ3zKNcw0sassZ/ZtOBIR7g8haOR8c2
	2ZZt2GUOSS6PsMxmr4qMc1JyhJRmvPmZJX1UXDeBrCe4n1v60qCPzRL+o4yAFIxHT4CsCXY1xcHJU
	mauYUzhYcZdErk+tz/JjGlPCxqOZ34zsAvITJEvMru2/qer+Lnn+0Qii4Jtq/x/vU1959zrq9ixne
	hj/cxLVoqeEQgzTxf27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lUI-0000000GSEu-1Y2k;
	Wed, 08 May 2024 17:53:54 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lUB-0000000GSBj-1YVQ
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 17:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715190828; x=1746726828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=da7eBN+RCnZYS2bJ+PqxlbsRBwzsYBthm4w6NriSzsM=;
  b=b36DrL8LrWKEVD86gHw7JljTNLM2h0imJZJUZvKK0hUMCyHMFDrdfjcW
   e+kG1NKZqyrD96C/F0BRaMv+VVMoN8siHPmpVl9HTrNQ97Y53YjugRfjq
   e7YEDfH5ncOzJJrT8OTjmkJpdYurSA27Tst8JvR8bfnVjdI1I1J7TbTQ1
   9CPMGcg8L0bosoc8IRDYOlR/IcWEqXC7Aehv6YwKfa74M5gKxuBo074dY
   O3Niv9qW4QuSy6N4SiGTvnZFivzuhQVAPeI13F8Sq3IWap7w8AGjgs/Eu
   X1iL1CzX766TrkdQdPqdtEWVY1qDRC1y8L7c7cCe1FN4emaActovSg9h7
   Q==;
X-CSE-ConnectionGUID: OSVXX/YqRHSbfW9uIPJ3CQ==
X-CSE-MsgGUID: dXef5w3MS+CyJWXX9QRn0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22224101"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="22224101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:53:44 -0700
X-CSE-ConnectionGUID: 9Bra/CBrRnqTGHL0eAcyFA==
X-CSE-MsgGUID: FeVJ71DUSVuEx93t50Wyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28909170"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:53:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s4lTy-00000005Wu3-46qY;
	Wed, 08 May 2024 20:53:34 +0300
Date: Wed, 8 May 2024 20:53:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] eeprom: 93xx46: drop unneeded MODULE_ALIAS
Message-ID: <Zju8HpBCiOjjIZ1j@smile.fi.intel.com>
References: <20240414154957.127113-1-krzk@kernel.org>
 <20240414154957.127113-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240414154957.127113-3-krzk@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_105347_475923_7C0FB4B2 
X-CRM114-Status: UNSURE (   9.96  )
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

On Sun, Apr 14, 2024 at 05:49:57PM +0200, Krzysztof Kozlowski wrote:
> The ID table already has respective entry and MODULE_DEVICE_TABLE and
> creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
> the alias to be duplicated.

...

>  MODULE_ALIAS("spi:93xx46");

I was stumbled over this (leftover?).
Commit message doesn't elaborate this bit.
Any comments?

> -MODULE_ALIAS("spi:eeprom-93xx46");
> -MODULE_ALIAS("spi:93lc46b");

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
