Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20610F9972
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSSZDL6TIigVjC0ks1MSDWDqjU2jnkl5e8MWevGCHDE=; b=rlYGrLW7vjXxjM
	F3v5y6eTPmgokUNPkAqqT7rkD7mo7IGCD5fj/tDSK98T+Jd2BWN9l4uAPBkJ3u0OzJmiNBjA+310z
	sRa4PbxD37PRLNvNsfb+9Ho1BJrnoyC4qSWMubWxsDTMo5j43mHOVlRf8Bxw7bA57WY3AUpYWw2t9
	M63MAcszMghK6ZFcZw+L8qZmmb7bokWrNDraZJ+h4fO99uILRNUbA/y4HaYJm0+6twksi6Y86clYI
	14wSUijLY0bRocZ227dXSr9C0xSckaE3WIqIx8ULuKy/JaEQsbY4ENu17dJFloDKRfd2GO++KnsSw
	FKQ/U1N4tnlNqWZPxlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZXs-00000009OJv-0Tft;
	Wed, 08 Apr 2026 20:30:40 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZXo-00000009OJW-3pjP
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 20:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775680237; x=1807216237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7K9rc7Jvu0xLEt4D5cCBB5y0D9JryPIU+Mrj4smQaPQ=;
  b=ahgAGFvPKSheILb3ZZRMlF51TXotZHZ3g69MFg++xjDpuKfo7/LlxYyi
   w3UYnnTKRLWlFiIbx7dqUL7LTlY8PsX3hzsrsYjdHkA+kzVbMQ1Xt5iUR
   HcadgfUPZuYpDlPuqkBdMCfWDRtRmCIdtxmf7efmpmci7DzmveWHR1qyB
   5bKYXXTVk4N/WwfSl+vLm3DPhoWHf4ttVUQhSnC8hFsFyXegmt7dyT2yH
   DbElurv82IIUcrAFP2W7e2WorbW/IKppgx2v0Ddxr/saoHHPatovEGRnD
   c1kuGAPgsnpBKfZmpy37AdhSSuolFk8ZVKeb1+75+Zj7T81hHuv4bRJai
   A==;
X-CSE-ConnectionGUID: kqCjJ/k0R0uDHKInLPpeVg==
X-CSE-MsgGUID: BDJJ3CmKTu6ntifsPItiZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80270115"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="80270115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:30:34 -0700
X-CSE-ConnectionGUID: UpexJm8jSiiXiOD5/cnpgg==
X-CSE-MsgGUID: sONWSbaxRqCIpi0BKeeZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="233536402"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:30:33 -0700
Date: Wed, 8 Apr 2026 23:30:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Re: arm allmodconfig
Message-ID: <ada65r2Poo08mJuc@ashevche-desk.local>
References: <20260405143513.268f59ae31ab905630d5fbc8@linux-foundation.org>
 <94610ba0-a1d3-4996-879c-0c05e24ba489@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94610ba0-a1d3-4996-879c-0c05e24ba489@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_133037_023143_CDD36A67 
X-CRM114-Status: GOOD (  16.31  )
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

On Mon, Apr 06, 2026 at 12:13:59PM +0530, Vignesh Raghavendra wrote:
> On 06/04/26 03:05, Andrew Morton wrote:
> > 
> > current mm.git, ARCH=arm, gcc-15.2.0
> > 
> > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > drivers/mtd/chips/cfi_cmdset_0001.c:1883:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> > 
> > Am I doing something wrong (or unconventional) here?
> > 
> 
> Thanks for the report. Adding Andy  who had attempted to fix this [1]

You meant [2]?

> make allmodconfig ARCH=arm  actually sets CONFIG_FRAME_WARN=2048. But, I 
> can see the warning when I change it to 1280 manually (bit strange as I 
> expected 1280 to be default based on definition in lib/Kconfig.debug)
> 
> I am not seeing any recent code change to this file in at least 6 weeks 
> (the changes are still minor code cleanup and nothing before that for 2 
> years). I can only assume newer gcc is exposing something here?
> 
> Wondering if you plan to work on your patches further, anytime soon?

Yes, I am about to read again the threads and compare my latest local version
with that. After additional checks I'll send a v3.

> [1] https://lore.kernel.org/linux-mtd/20260225162406.3815267-1-andriy.shevchenko@linux.intel.com/

[2] https://lore.kernel.org/linux-mtd/20260204012630.2211832-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
