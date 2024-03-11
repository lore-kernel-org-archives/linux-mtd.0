Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5165C5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRuQeHdmDOwMaaYRHZYTz/KfY14btsEEfzlrZ7/XZMk=; b=qwKw2nA9EENHd0
	n+TbPKRj083uKFqPYR1BE06TL++yoOdHq1Mo2gPgneWmuDCBiMbXhRh3sGQ9cD35vM0VYepL83Z5M
	F/CTbip5+EPuKERdNIepiXhvDPd6+lyBb0Wegh3QdmmSflqozY0matIOi+zsAXo3uG/fk6RavwJ83
	d3eeNzmDX+iycixJuDFkI3Cz8JDtUacn3bkglzeBUySuW/E58KQpcEiQT1GBrcKwoUsoK0AWhKi1N
	/2OId0FdyGI4OOts7oUwYMpbfZb7RUip4dDjjqncWKCflRIvuP+onzSHM63BLOQ6l4vqCKPg0wlc3
	BQKN3Ok1VDTzurJaittw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjiOo-00000002I9f-1GUw;
	Mon, 11 Mar 2024 16:21:14 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjiOh-00000002I7s-2p5N
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 16:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710174068; x=1741710068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qgnk+NurW/dc0O021XzFvbekQGoW8NW7JLtzZnW170g=;
  b=I1lBzgx/Ql//+uIpqsRP2Sr5xPyUeseaJ33pwE5z/7V2nH9wADSwMWDT
   D13x0TzrXgvTbE7yg0L48KjSkMmfwKh8BxDpgY7tXXgvlVjtnwmGx9GGA
   NfjfCySc+TGZEq+Q8fCiKR/zKrJmBLzXMxb0VVv+kXBWaMj9W9XHe+4ab
   FZH4OwbUVRSduylKIQwVFOYzf4tPOiryKnIlTJYl6OHkT+rVG1HhTUiDS
   gsfkG4l4kzIi0WATsR6WjMYBpRVJiCX7w16x2Ld+JoLxM+ForwDghMqjp
   /nOoHS3jj9NbtmtnYJxNyw2TXjUUQW2OMOipQg4U6zcr5iRp1H6NnoFiq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27317298"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="27317298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 09:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15710843"
Received: from cindreic-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.141.11])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 09:21:02 -0700
Date: Mon, 11 Mar 2024 18:20:52 +0200
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] mtd: core: Don't fail mtd_device_parse_register() if
 OTP is unsupported
Message-ID: <xeqscncwirfaz77mtpcvkueo5xto7vis5khr3uwclcx4sfx6eb@35j3grcqrzo2>
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
 <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
 <CZQZXAB2GOCY.12YVJ6CRGG26B@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CZQZXAB2GOCY.12YVJ6CRGG26B@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_092107_773573_301F18C3 
X-CRM114-Status: GOOD (  24.65  )
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

Hi Michael

On Mon, Mar 11, 2024 at 03:38:17PM +0100, Michael Walle wrote:
> On Thu Mar 7, 2024 at 2:04 PM CET, Aapo Vienamo wrote:
> > Handle the case where -EOPNOTSUPP is returned from OTP driver.
> > +	/*
> > +	 * Don't abort MTD init if OTP functionality is unsupported. The
> > +	 * cleanup of the OTP init is contained within mtd_otp_nvmem_add().
> > +	 * Omitting goto out here is safe since the cleanup code there
> > +	 * should be no-ops.
> > +	 */
> 
> Only if that's true for both the factory and user OTP area.

I'm not sure I follow. I'm not seeing a path in mtd_otp_nvmem_add()
that would result in either mtd->otp_user_nvmem or mtd->otp_factor_nvmem
needing to be cleaned up by the caller, if an error is returned, if
that's what you are referring to.

> Also, you'll print an error message for EOPNOTSUPP, although that is
> not really an error. Is that intended? 

Well, when we hit this, the functionality of the SPI memory itself is
degraded in the sense that the OTP functionality is not available. What
would you suggest?

> 
> >  	ret = mtd_otp_nvmem_add(mtd);
> > -	if (ret)
> > +	if (ret && ret != -EOPNOTSUPP)
> 
> Maybe there is a better way to handle this, like controller
> capabilities instead of putting these EOPNOTSUPP checks
> everywhere? I'm not sure.

Trying to come up with clear semantics for a capabilities flag to solve
this is difficult. The issue is that on the SPI controller side, the
limitation stems from the really strict set of opcodes that are allowed.
For example, we already hit an error with the 0x35 (read configuration
register) not being on the set of allowed opcodes. While this
instruction is used by the OTP code, it's not a strictly OTP specific
operation.

If there was a flag that would signal OTP support, I think it would have
be defined as "the controller supports all operations that are
performed by the OTP code", which sounds brittle. The other way around
would be to have a really fine-grained set of flags that the MTD core
would check, but that feels tedious and error prone as well.

Best,
Aapo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
