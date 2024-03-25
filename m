Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0DFC54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUN1roSXHqwhxWjmtVNWXqRtEPezRuZ91aIpzWmtKiY=; b=hzt5rj5xe+3KU2
	VqPngyle23DOyGmAeyjflujsStx6vafybKJFs36cB0yu5L0bNvNJUIVcQwFq8yy8l0dcs3w32pdLX
	iRhCcwAEjzhXTqlVCJ+vSoEeIEQ5vDseeaoEYOQyQC4JynrP+7286h8ML5PzaSS5uQJUBLUPlxcSc
	cdpWrWv8lL1lrQR4eTqchYo+k4Z9RCy8dFr9NnI+C/6KXx2v8woSoiPnthG+21i1RHC9M8awh0UJM
	Ulvta/oGD5YdQKSyOdtHT2n89+FbEYK13ZTDRHrjhkisv56qy6laHVK9tZWq+S6fPT46CCCoMm3oC
	Pz2VO8oEvxqeE9ql++aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohau-0000000Gkvo-0iJt;
	Mon, 25 Mar 2024 10:30:20 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohaq-0000000Gkt0-26Ci
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711362617; x=1742898617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ntCNgzdQGJ3LvOfVZ4wL1NBn0gVZep3S69fBAzBNNrc=;
  b=Dx7DZEW9qJeQ2Kw34Opptl6wXxoDn3R6RANsXLDBzKRUKhvtWYMA1N4p
   GwszePnT7yAJ5zDcQYCamHZ4sUd+Xk8G5C+YXe19ysbdMzraL3w0JeLa7
   cggAHBHmVujjLVop2+YCCBmqKsyChfeUOqQQrqCkM9HErj5ZgqwqUdicr
   HB59prDks7gU+yO6u2C7Ym2Pj4Qkck9SOq8kCnNc3w/zsgnaLGnVvaWWw
   YI4eQDM4l9pra6ReKxT77d9qaIavm7Y19e7aYboRxW/0VSifFpNyDO+EQ
   xRZDkfzGo6cDfBzZu6a0kj3qwvDbDiiP4Dg5GV6+0DghogSapfQquKanB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6470446"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6470446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 03:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="914839103"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="914839103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 03:30:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rohaf-0000000Fx35-2a2n;
	Mon, 25 Mar 2024 12:30:05 +0200
Date: Mon, 25 Mar 2024 12:30:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Denis Arefev <arefev@swemel.ru>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, trufanov@swemel.ru, vfh@swemel.ru
Subject: Re: [PATCH] mtd: partitions: redboot: Added conversion of operands
 to a larger type
Message-ID: <ZgFSLY_uQkfbyyRG@smile.fi.intel.com>
References: <20240315093758.20790-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315093758.20790-1-arefev@swemel.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_033016_716811_7E03F3BF 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, Mar 15, 2024 at 12:37:58PM +0300, Denis Arefev wrote:
> The value of an arithmetic expression directory * master->erasesize is
> subject to overflow due to a failure to cast operands to a larger data
> type before perfroming arithmetic

...

> -		offset = directory * master->erasesize;
> +		offset = (unsigned long) directory * master->erasesize;

Usage of explicit casting can be avoided by using size_mul() from overflow.h.
Usually explicit castings are prone to subtle errors.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
