Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203B01073C9B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T01Aa5ndpLQZm7ZDvCx1HGyESL06MUZmlYwcTHNs3JM=; b=chQ9IEv4RAUFfS
	gtioRyX0GoGLYs0RT3jUrt6qstMACc2LbKeHZ0rzkhOUVgk0ko7xwYLRwJt+Jz52vkzkwXNyK4DA9
	jabJzdM6dax0+N1CV07riaXTUCcuBulxb+Qspi4WKHtNLm6sY+KbLHlyJ+hwpz8PGhZdJzWCoUJUd
	nrjw8tb8cdiTd8Q/FJ5eHZaUcCHddG2cHVapATOOROQ8jtKGiKkuNiElhsLzgZHXNVSMMrC2eZStJ
	oXo1q3FAm+0Brphdc0vqwMX1QJGaJBhXiycxzdj3G74rs1uX1H3k9abtu9211VLta4jUBUQ0YTdd+
	0d6z+n+sGvo3oLWdpcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR4Y-00000008kKX-3bej;
	Wed, 08 Apr 2026 11:27:50 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR4X-00000008kK5-0Got
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 11:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775647669; x=1807183669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8LmPIEP/Tr9DEnt8ZTpwgfcytxWaNmStAUNyJnf90M=;
  b=H5bI3IGfs74hOjc2XE2EtaY/xYgwD9YWzCJcTzn+KeAZBIwCXCfM7vYS
   wXhYZI3Fn+n7hq+nSddgWPECM9N+lgHYID2WsHR95zl4rZBjIXBijrl9K
   XL+YxijgRruSjNcZIwXsC32SKiWOu8j2LrSx9x0RsTxJ3/GWa8XR8eNVc
   0khswFr9Z/PfqmMsIRFZViNY/nTNyEZR1x8J11R89Aa0CbyOt/xAw8ZQb
   yDCFE8vkJmdjWCxQZJcIGBQxwpOMtTB5kQPUwHFmZe1Jz5A++VURMLr6c
   22xnMkKxUpLeJdFy9UAVyNLhZRTbNb92YOgfjk3rWtWkf5il+cBj3Ewvv
   A==;
X-CSE-ConnectionGUID: w3eYtZOvTbeRPQlHJSdZsg==
X-CSE-MsgGUID: tsC31GnqQ1CMnV3BtDIPAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="88012137"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="88012137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:27:47 -0700
X-CSE-ConnectionGUID: dQmf47jTQNCkbErWvNhPvg==
X-CSE-MsgGUID: lFAgsKeTQsuc9wb8S8udxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="230114381"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:27:45 -0700
Date: Wed, 8 Apr 2026 14:27:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <adY7r_YNFjGk9EKZ@ashevche-desk.local>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <adX3SHYgazijahbG@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adX3SHYgazijahbG@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_042749_136114_490633EE 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, Apr 08, 2026 at 08:35:52AM +0200, Lukas Wunner wrote:
> On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> > Compiler is not happy about used stack frame:
> > 
> > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> > 
> > Fix this by factoring out do_write_buffer_locked().
> 
> FWIW, the issue only occurs with CONFIG_KASAN_STACK=y, so an alternative
> to refactoring the function is to disable KASAN for this particular file:

I would like to avoid such big hammers.

Somehow I lost the track of this patch, I need to find it locally and check
the status, I will come up with updated one once I found the latest version.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
