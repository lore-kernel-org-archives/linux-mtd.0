Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5635C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 15:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dz5nBdtS3tKUY2V7lUGPOWCkydCKfT8R1W6rk/Xy4E4=; b=w/nkL/r0+7nZfh
	/2cCLWeuHA8YRuUoESzD1463kVhy5OU1dK+nuBqkI8gfo3xnWmHnhWH/r2t2p/yhvMf/ljPLpBWl2
	nGuCG4R5UO6abbpcy2VWoPjr31RE/ZIzLcL19nmEuZ1IcQma//1ncmGyOz8jNyTp86z4BMhdGFoUV
	VVK9iv8N9/F0stsqdoQYTQ065+fnDufMAfLcn9IWH8ibBziA9x0XoGiOiBuPENhsUDnOANIUDv158
	dyxcvst7bqBUJh3FFZ3LlikpB+3ak4j7PhggwGbb7HYUSL/31AbLon8shTYoq60EYobOv+HzdYGIT
	fDTUzS3Z9ELlINhuJDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romFL-00000000Ufu-2KyF;
	Mon, 25 Mar 2024 15:28:23 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romFH-00000000Udz-1l6h
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 15:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711380499; x=1742916499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hFH5HS1gKtBfdacUKeLYr29lMbYa1oGBsoDCuw1Wvjk=;
  b=QetX768EXjryurtQ//qn3PjFrQa7G0ytYYlJjG0Bih4JlmRSVHcTRAy1
   FT/hc/xbwkSDniViddeCwf8Y7GhjHWwjm3c2VYSwDy1RI0Q6n6FxQK7/b
   h/VV+iaszrpXyTnoSLfBuk/L61qD7J0n9tejkzaAkspaK4X8uoeH9Oo4O
   /+77JFgoCbqYbDRft4hJU8nCMxXBmbgLh0XzN9XvfAMbmf+XmTorVeZHC
   hp0Cisp9IB7pTYE3Zogr/Ja045UuPzKugwa5gDQgTW1GaMpZAP1NsfZ8z
   mxiaVkNr2yinJjMeHHDZA79FBw2ky9r9koUl6cVs2Eszbv+HQkt6Eecj6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6250711"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6250711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="914846583"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="914846583"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:28:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1romFA-0000000G1ad-1ChE;
	Mon, 25 Mar 2024 17:28:12 +0200
Date: Mon, 25 Mar 2024 17:28:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: core: Align comment with an action in
 mtd_otp_nvmem_add()
Message-ID: <ZgGYDMzAWEaPkAXh@smile.fi.intel.com>
References: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_082819_578422_13EC1BC6 
X-CRM114-Status: GOOD (  11.39  )
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

On Mon, Mar 25, 2024 at 05:11:50PM +0200, Andy Shevchenko wrote:
> The comment is related to the non-error case, make it more clear
> by inverting the condition. It also makes code neater at the end.

Just realized that even semantically it's better as it's done here
since we have an error path from which we exceptionally return successes
(in some cases). Tell me if I need to add this to the commit message.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
