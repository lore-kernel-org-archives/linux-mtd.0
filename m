Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A51AC87FD1
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ra1Z+/49TjihphdC9vZjYuu47orS6oxYcpBurfAt3Ok=; b=VWymnCvQhGdrqo
	dN4LdVYf6k75HZ18pZJzPwFpddQm6VA1/iTU6H4v8Mq2sYrrP+Ql1SMo96AbgN9ZXDSKS8iY0A/zF
	TAaudc+KiUK/ZcqIeWAXxJH5U0XRC7kLyJTLzklpL7t9s8LNsnntQh8cp9HJMyMyNvpdRX0Ll6Umy
	DPgOAjbagfUXN4kqbM+//KoiffpT4+8VGPcShM5umfVwDvhqI8lMZpnApTNDoSV6byFNjCpF0jv6X
	FsN2Uiry1d7joh1366/SZc/913OJ27lrrimgRBRmIHXXhe85wLAQ/PRjw41lAz5tRjsyaKgHZD0xX
	90/zQPd+8tZW05daENOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPi5-0000000Dstu-2gNd;
	Tue, 05 Aug 2025 22:00:41 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPgZ-0000000Dsmw-3ZuH
	for linux-mtd@lists.infradead.org;
	Tue, 05 Aug 2025 21:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754431147; x=1785967147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EaMvOaRV5chlfG7PUma2cPCP9U04BplrQiABKl+h3HY=;
  b=cFHWHD1cF4da9ySZVapF50B32Q26pqcsU5B5n1zVIse0wL+IV8JmxOFC
   32jIWPK2LE4ablqd/pYur2Wq2gk7d6B5594V50+HgHlzWm68YAZ8+N1de
   6PDzbrfVPCBZKI0OQ+BclC0C+8KVW3xl9gSq78jrwOAU24FeyR3jAs6hj
   lVfNBPz6DexJBG2/voxHIaS4XqHhErHiOlHvLG6T23ZE6lPqgKFd+H+st
   Tt7LHlBlPjjf1u7A3fdbWHnMgvkYBOI573I+M03+TmRDbmrMgkyULN76i
   Qmlm+CDTjevuTCuQXXZFyeiCP8R+BC+9FVg/rjaIhTVQM2qJOYxYRGDvU
   g==;
X-CSE-ConnectionGUID: GSw98u3tS1ageyF2Mzh9og==
X-CSE-MsgGUID: 1SiWJThPRWKS3bYlX837Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74318915"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74318915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:59:07 -0700
X-CSE-ConnectionGUID: Ejd+COAuTdmDl7wfpaD/yg==
X-CSE-MsgGUID: 29bNG84tQTeFOGQQRD41fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169980994"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:59:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujPgU-00000003rZ9-28WP;
	Wed, 06 Aug 2025 00:59:02 +0300
Date: Wed, 6 Aug 2025 00:59:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: map: add back asm/barrier.h inclusion
Message-ID: <aJJ-pqFvHy2hCgop@smile.fi.intel.com>
References: <20250730135934.1712198-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730135934.1712198-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_145907_912363_EE50FF38 
X-CRM114-Status: UNSURE (   9.85  )
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

On Wed, Jul 30, 2025 at 03:59:24PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The mb() macro is used in this header:
> 
> In file included from include/linux/mtd/qinfo.h:5,
>                  from include/linux/mtd/pfow.h:8,
>                  from drivers/mtd/lpddr/lpddr_cmds.c:14:
> include/linux/mtd/map.h: In function 'inline_map_write':
> include/linux/mtd/map.h:428:9: error: implicit declaration of function 'mb' [-Wimplicit-function-declaration]

Oops, thanks!
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
