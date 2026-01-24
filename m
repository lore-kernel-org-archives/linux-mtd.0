Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE2AD778BF
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jan 2026 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v47EdSW4FnHl9nqyxzN9V4x+Qv3QnHLB6YX4CE4HW74=; b=M+PlK8dqAidkTV
	bBkU2dYOGm3NXj3Z3e6HheSY5wJ8hW0zLBcT7YPyA9mwH8g8fhQod1Exx4fuAlVTbbRIVSTujYPLG
	J2iSi0qIN6CN2rm8V7RzBreRAwrbOa1OA/TCJzXkR/I9LndLGjhkg8jkXb2CnqNn+3pmeaaxykXqR
	IFgh9Wwl5ZVQ5IOBfmP1V13KQYYkJF8o5soV5BFWRD5oLMXZ8BrTWF0LkqUoy896CW1HsEkgfeWN4
	cQ3RaJxQ+Zyha4Q7pfAIxchypC+o+EhVMx2Xp9rFNG/KqH8iRnqRHaEZbify5IkG7LgFDP95cHIk2
	vxG9qpYXTuQfqdi8ZMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjS4g-00000009gIL-1qn5;
	Sat, 24 Jan 2026 01:04:26 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjS4e-00000009gHX-1ubf
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jan 2026 01:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769216665; x=1800752665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x49FFcIOTPr7nuBwVlrsQmqOzImuT0D19ZrJMQvhV4g=;
  b=l05n4sUffr4lJWDWFGRWXRqnSYYCDWJZtzZuO8le0M5OpoEhTMWKSZiY
   gHfNkTe6K1XsDwX+tzrB8mgalK5aZBxleIno3Nz0gtNixu90MpjNa/iHp
   97SpB/5a4u77nE/9lgjvEY/lBo7DmtOBaxJCDfEDxJwYK6Ep9mkUFPfg7
   FyCCNqJt7giIazPH+pkaP72mpnFLPDzdgig4a7nbLh7sNGfvBV6DevXgd
   fRwCmf7m/roG4jqPkqigGKEhiKIHnrSUbKgshsqRrC3qXrixpETyfBl3h
   DEFuVHUMv8f5Ud7npN0vwocCDJwCpZ+zzTMXjBAd9A4puAAnQVzIRrie2
   g==;
X-CSE-ConnectionGUID: /Yhyp8ISR7CezAYGgf70iQ==
X-CSE-MsgGUID: sC8qng9HR2Sky2H/q3N16Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81585956"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="81585956"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:04:24 -0800
X-CSE-ConnectionGUID: QRQM8/FmTJqxoTpLXJ95fQ==
X-CSE-MsgGUID: tVb6C3UTT6mNXHI9XUvDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="206971869"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:04:22 -0800
Date: Sat, 24 Jan 2026 03:04:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <aXQak2FKyQpdQW2M@smile.fi.intel.com>
References: <20260124005203.3167280-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124005203.3167280-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_170424_695324_1075D09F 
X-CRM114-Status: GOOD (  16.10  )
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

On Sat, Jan 24, 2026 at 01:52:03AM +0100, Andy Shevchenko wrote:
> Compiler is not happy about used stack frame:
> 
> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Fix this by factoring out do_write_buffer_locked().

...

>  	XIP_INVAL_CACHED_RANGE(map, initial_adr, initial_len);
>  	ENABLE_VPP(map);

It seems more logical to leave these two in the original call.

...

> +static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> +				    unsigned long adr, const struct kvec **pvec,
> +				    unsigned long *pvec_seek, int len)
> +{
> +	struct cfi_private *cfi = map->fldrv_priv;
> +	unsigned long cmd_adr;
> +	int ret, wbufsize;
> +
> +	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
> +	adr += chip->start;
> +	cmd_adr = adr & ~(wbufsize - 1);
> +
> +	/* Sharp LH28F640BF chips need the first address for the
> +	 * Page Buffer Program command. See Table 5 of
> +	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701) */
> +	if (is_LH28F640BF(cfi))
> +		cmd_adr = adr;
> +
> +	mutex_lock(&chip->mutex);
> +	ret = get_chip(map, chip, cmd_adr, FL_WRITING);
> +	if (ret) {
> +		mutex_unlock(&chip->mutex);
> +		return ret;
> +	}
> +
> +	ret = do_write_buffer_locked(map, chip, cmd_adr, adr, pvec, pvec_seek, len);

> +	DISABLE_VPP(map);

Otherwise this will seem dangling here.

>  	put_chip(map, chip, cmd_adr);
>  	mutex_unlock(&chip->mutex);
>  	return ret;

...

Another approach is to leave goto as is in the _locked() and move DISABLE_VPP()
there.

Tell me what do you prefer?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
