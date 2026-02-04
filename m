Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D3EA7946
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWMsxw77i5pDB6wRcxjJowC9bTP62ahbMuZkDKRe6GY=; b=vDJIpjpQr97blS
	sW+VeZMVSg9fufDrG6eq9Fe/av8pjIfT0u+1sX9HUGWa/U/tRP3BRDW/mWYfOsJUg9SFaNSluje7Z
	KlMmBuqy7X1fUvLwfNFDgtCh/ShORR2dG0YvgqD5ktgsQp6OBBIvMsBiaZaK4LftW0r2JbaxW0BYx
	O5MWOvr0TUi9gFSuqE2AuK2bRKTqfowqZMVg5MzNFBCc/axzXTXFmxV3YddnmCwe3YsrD6SkGb+4O
	qgLYpJB+6Sa/P/heI4aoUnmojAksiowk6SrjaiPQp/Y0dyLOaYWnq+IS/wEXB8aeyvGnJ0P8YOwsS
	WOyMYm8nc7XE0lL8pVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkAR-000000095Xm-3D1L;
	Wed, 04 Feb 2026 21:12:07 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkAP-000000095XS-0Bwv
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 21:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770239525; x=1801775525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yttss3Q9KiabiVq+I8ru33iXLqJEhygxc3lQ+tgJI/U=;
  b=VwneSCtA5U7tjVjSi0c3hisK+xEq445nsCxxjllg1AcXdrNl7He4Qal6
   8xYe/uZvr2d+eDODkY/0tFXRB6WR/CxKQvN0uTwr3O7POzQwPuf/zEUkV
   XwOJhXO4e4xajb3xKJCGDOUjUh2HPNymY6xY+EVnqEvz3TG5msi9y6mcF
   jV8nhfr22l0umjXeEwrJwl3a+A0b7MsQmdaM9UD5RNw0IpHvumtYTFUP8
   VeNZFbXna2XbJoGRiMgGiwDDWGB7DsAae18swh3mTM7HuMiOG/axr+o1k
   AM7ZZN4hgROqm9jH147b41Khe5OCp1bDuFsfOJtfZlw692WM/ZiOCmF6K
   Q==;
X-CSE-ConnectionGUID: y94GcKKdR5WMpcpgJ3P94Q==
X-CSE-MsgGUID: A85gcZCNSRieb7YOgs34iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89016888"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="89016888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:12:05 -0800
X-CSE-ConnectionGUID: skLqpx8xTACKpQkjes1rJw==
X-CSE-MsgGUID: /3NCVb3FR7y1AR1sycNBRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214453397"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:12:03 -0800
Date: Wed, 4 Feb 2026 23:12:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <aYO2IPsoxmDtTsec@smile.fi.intel.com>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_131205_113456_7D54151E 
X-CRM114-Status: UNSURE (   9.00  )
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

On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> Compiler is not happy about used stack frame:
> 
> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Fix this by factoring out do_write_buffer_locked().

My gosh, I already sent a v2 earlier and there were some replies,
I need to check...

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
