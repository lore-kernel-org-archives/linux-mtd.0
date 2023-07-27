Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFCAC04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLZ2V4+++KYroIaEY8GO/VR/XZv7GW+Rb20cAnX5x8s=; b=Y09qgqIj2ndVYE
	EfIzMQHy6KXSHZXZrp6g/o8RM0abqQWDAzIu+3fRpPzoUHpiiYKOG6npGSnsWYzgr1ZXACG3ssS3v
	xOcRp3lLYjJqKHMGT7E9xz/x1WY7peT113FhaIt6krumcdSBafl4RYuZpYjcxilMP/hAUjrF3YCtQ
	3vsDlX/MFe3dU3AsCWv1sDgseAKeLz1dHtAvkda97GKJZorAM11BWxwO0cWgZMlPXcJkxQHwwadFD
	zKCwB/XPDm0+RD21+A6ifaVZS1yREMsgyKkKBTuJAojuXVg3AMzg84BT0+Bgr9Upj5Hi6t9Hxxxsl
	UmbIhS6BF7KfAuuFdraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3Nv-00GDuY-2P;
	Thu, 27 Jul 2023 15:58:39 +0000
Received: from [134.134.136.31] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3Ns-00GDqa-1p
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690473516; x=1722009516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FdpnzmpbpDtQgpHo2zN0d9vbabH9VR2p8NO1uqeU8Ac=;
  b=D3qyH9y0PVOEK7kz90kt64/8vhZSvwgLmyRNZUuBPF1NNMF+Wy61TaWE
   ZQTHBnUKxFgHQB8ilrs7RT9BPtAn6jJEP7Acj0RSawL34iYIbbdb61D8W
   WoU7cYOQyfFrgZmoeuMmqiWUp4sfR2yYUNH6SQcHx9Nf1/ckSswTeZ/kf
   LlsN+xRIui6zw1eoYyOQiz1km+zwjOiSH3NVDwJFlPOCHh4/ZCucUTpeu
   nza7h7OlxjKg1LkL5fAfTdHuZAKx/lv5Nxov+jQTFfonep6flLOZSoXjn
   d8/1t59BiVIRLGdXwJBJJ+I6vwIQbGI0qt1nBPyhSo8QQW5k66AtR8l2Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432165600"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="432165600"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 08:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762206230"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="762206230"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 08:58:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qP3Nl-00AzYB-1n;
	Thu, 27 Jul 2023 18:58:29 +0300
Date: Thu, 27 Jul 2023 18:58:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomas Winkler <tomas.winkler@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
Message-ID: <ZMKUJbl7kFOfgKGg@smile.fi.intel.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
 <ZMKJRNDoQV8p0DH4@smile.fi.intel.com>
 <20230727172013.7c85c05d@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172013.7c85c05d@xps-13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_085836_679950_C178AA84 
X-CRM114-Status: GOOD (  16.02  )
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

On Thu, Jul 27, 2023 at 05:20:13PM +0200, Miquel Raynal wrote:
> andriy.shevchenko@linux.intel.com wrote on Thu, 27 Jul 2023 18:12:04
> +0300:
> > On Thu, Jul 27, 2023 at 05:57:58PM +0300, Alexander Usyskin wrote:

...

> > > Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> > 
> > Closes: ?
> 
> Did I miss a recent update on the use of Fixes?

They are orthogonal to each other. Actually Closes goes closer with
Reported-by.

I believe both of them needs to be added (by I might miss something).

> I thought Closes was
> supposed to point at a bug report while Fixes would point to the faulty
> commit.

Correct.

> Right now I feel like Fixes is the right tag,

Nobody objects that (see above).

> but if you have a source explaining why we should not longer do it like
> I am used to, I would appreciate a link.

Since you know about Closes already, I think there is nothing to add.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
