Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0635A1062872
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrAflSpPrNv6z8fQj0O2XhrjJEU5wsoNmRB5SIYWyvs=; b=TL7ikKq/v3Bv4E
	PRCgd8UiRJojsM5Afmx2vIEz3NT6I4YSa1ya+4WyTN58L8reQoor6rrwAr7UPnU6shPZA3/fvBpLZ
	hGVpm/B526T4OODhdUiHL1c+zMgSv3yTm69P9vKvQj4BbRksb25oRHeAt94SZ7zhPidjl39j52/lw
	aAmHkro8PDYABTwwxNJy/8YjDTmqUPORSdlLQj37Lrl7BTIs6aph7a4HP9Y/85LDbQQYEbtAOM9dk
	oyusM1Bko9ks8EAH4BaQaDuvJbgM8K3iZdOntCIFhGcA09ljTOyOoZplLydaYRXXkr2LMmy+HI4fJ
	k+lY8MVMS7bmWFsoVuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IMy-0000000BXSC-0B5f;
	Wed, 11 Mar 2026 12:08:56 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IMi-0000000BXQD-0Uqw
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 12:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773230920; x=1804766920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/7rVkSG9iP24p1/+gcW6MgxSWNy07goaOW18JGJc75s=;
  b=ASoxeFDV75GjDMBrq7aKyimMF6q3OOQtNftcQ7TnOV+/W/ujmS3DA7sZ
   TjdYEGri5ZEictqfy/tGT30EXIo9+rLmqlS2Sgzes/yP59npTg1oNZrtG
   qjfbEqFsOG+UN5EiRoZ2GqYhSTBn30Ks2d+30ABO7AQlyI5TwUj5H9csg
   D0cx3YuJn5MrkH25nx5TNNgNbNzGNIP1T0QM7eww8NFKlaY29mWErXlAf
   0Xbk0pom9jhQ/Nb1S3lGfLVUvkvgyqRvyzl2FstAaUOhu81fn/zZTiL1W
   o6HaYcbJjLbAMfNsfsGORa46wMJkX9tnY+V3dQTs++7V3Tg66+7uOTD8U
   w==;
X-CSE-ConnectionGUID: RQ6dOntLR26Q+smHqwPgFg==
X-CSE-MsgGUID: mYB2bPuaT2SrQMfH5cnBQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99760525"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99760525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 05:08:09 -0700
X-CSE-ConnectionGUID: Lb2VjBjwSx2NX4hIwnoUIA==
X-CSE-MsgGUID: OZuH9n5OTTiAuTLWbuDkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220628678"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.178])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 05:08:06 -0700
Date: Wed, 11 Mar 2026 14:08:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/1] mtd: physmap: physmap-bt1-rom: Remove
 not-going-to-be-supported code for Baikal SoC
Message-ID: <abFbJFQoF0QUQjDP@ashevche-desk.local>
References: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
 <abAEN7_1aQjSxYhc@ashevche-desk.local>
 <875x72n35c.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875x72n35c.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_050846_957904_8E19CF95 
X-CRM114-Status: GOOD (  13.09  )
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

On Wed, Mar 11, 2026 at 10:09:35AM +0100, Miquel Raynal wrote:
> On 10/03/2026 at 13:44:55 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Wed, Feb 25, 2026 at 05:23:34PM +0100, Andy Shevchenko wrote:
> >> As noticed in the discussion [1] the Baikal SoC and platforms
> >> are not going to be finalized, hence remove stale code.
> >
> > Can this be moved forward?
> 
> Yes, I reviewed it and I plan to apply it. I will do a round of
> applied/thanks soon.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
