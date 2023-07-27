Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233D0C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH5b7X7+u/6v8Fq/9fPbZGVR3DhbwmrowPOJ0Je1dDU=; b=lLtpI/rAeRLxZU
	hR1fqGALuE8082RriMVsMr5g2r2U0/KVx1M92PvjHF8Ynlk+q5F7SfKnL/ItiD4xi0RPzTLKyXWG2
	Yrsc53i7pZVFV6T0mHCt4msny0IZhhSZQpGaFxy0/1ks3TTG7u6HwkUNIP7+YLYACe0Nrrfj27X5U
	QQj27sAPHNZ4MQryNtThHoohEx5AXZhG1qux7OXCqTb/ltod26ULkjsT+Vxgy2726h7o7wEs8JLeB
	BNA34JLWXYgB+kMvG7uA0F8XBtaEflOEgGA3vetJEHjZpNO5t+AGr0DhfQYz5UadR53XsYfrcbqkn
	yTq+G7XM5Or0V45vRI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2f4-00FhTw-2c;
	Thu, 27 Jul 2023 15:12:18 +0000
Received: from [192.55.52.115] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2f1-00FhQU-2h
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690470735; x=1722006735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLnYfgXFu9qFwcn/sovr3DuEibzC1WZUxyf9Izpe7QI=;
  b=YdE99C4kRQ0KYDXE1eJzzk0Rvjs+/Wn9mpgDnwpS7/xURfb2nok0+DdH
   OxqUibvMSrksDXxWq3vuuYuQ9ZOw19eAH9MHVqC3wyD/p8KJfu1tCDtk8
   pjTHTTxoGzWTNK8lUD0sMaw5n/KEeF0gEYYJeeZQ2Reh95Vp9Xrg0YcmE
   gmv56Rw81pSuoNVChsia9naR/Qemt5B/0wODCg3UaXQ4ulNQ2M6hIwNBG
   HepYfMIxcSay2Z+fpfB+IEL2ciH2gZZ9R5B4F/NMGcBYjabwg8cOEOV27
   CFwjjwz1SdEum0ftvtyEJL+x2FHs8nm2SWniwT98DR8UhsRG+GToVLlnP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368353699"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="368353699"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 08:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900906746"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="900906746"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 08:12:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qP2eq-009OVn-2G;
	Thu, 27 Jul 2023 18:12:04 +0300
Date: Thu, 27 Jul 2023 18:12:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomas Winkler <tomas.winkler@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
Message-ID: <ZMKJRNDoQV8p0DH4@smile.fi.intel.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727145758.3880967-1-alexander.usyskin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081215_923789_AF41F703 
X-CRM114-Status: UNSURE (   9.50  )
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

On Thu, Jul 27, 2023 at 05:57:58PM +0300, Alexander Usyskin wrote:
> I case of partition device_unregister in mtd_device_release

In

device_unregister()
mtd_device_release()

> calls mtd_release which frees mtd_info structure for partition.

mtd_release()

> All code after device_unregister in mtd_device_release thus

device_unregister()
mtd_device_release()

> works already freed memory.

uses?

> Move part of code to mtd_release and restict mtd->dev cleanup

mtd_release()

> to non-partion object.
> For partition object such cleanup have no sense as partition
> mtd_info is removed.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")

Closes: ?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
