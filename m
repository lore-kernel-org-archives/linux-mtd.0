Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DAFC00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDkNrYaFFT4yMk9E3T6TEjxS+kc38ZGcK+9NK4xAHPc=; b=AZKu3BXXM1lyT3
	j5wzzQF44SlMLHh9WRP6IkiicqTgaQ5yAhH5Hft+qo7AB96vIyKKF9HxFUDoC/ARxuubjlsPznTV6
	J2UCFapUN4+Ctrhcw5XIvJTWMsXqIMk2liatqjPh6bPOE7kGbDpdvIJk4wfsuCsMwNV1gueT96ASh
	Rlk9UBSt71gsJfkjQgHSGQWX2TBNARv7mcTkZXEsoZfwICH4Bt7yOLKxWrqwazbPf6+PCRpotPmh3
	+mU6A6ZYzz6/tbzrWegGK1Z1E7c4oqMvicQFDPCAsozDPAf0PdIzlHzPN3d5ybuir2yt6ZMrbNm5S
	7iy+eVnQvIC/IbXqjiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDZq-009Hul-0r;
	Tue, 24 Oct 2023 09:19:54 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDZn-009Hu2-0l
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 09:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698139191; x=1729675191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2nhajNAdRYJlbrDuQ/yj4fPHTTxLS3ZUphedGiZKuQ=;
  b=D41iYgvoKr7QmBAXAr/ugC4QYeAKVxmR5rwUDwzWfL1W7KiU/VbBkpg8
   uDur5oWTtBdOg+vE3WuKmU4tlvQ90sy9rT4IG+CPBpOmqdWrS4KZQH4Yl
   4DpzB1NNFt6Civd3pQ/j4CulwfUzNnvNqPvuGmbYjVAXdJpEh+2Keix9f
   U+IPEFGljpkICTVj4PVP9vbFMc3mMjscp0urnu3J6gG1qyXjRsIuXIaS/
   mPu0IqIAYwHikiT1CJ3H9YjabD3ccQYGyEHTwz+IGKaT/mmcJMVNdfJD5
   E2kgWz7UrihHDafzJkZRbwvg4aEFhROvojOJXKPC/QZ2mtrWXrHADsGlf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366362798"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="366362798"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 02:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="849074498"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="849074498"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2023 02:19:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 974B994; Tue, 24 Oct 2023 12:19:43 +0300 (EEST)
Date: Tue, 24 Oct 2023 12:19:43 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: AceLan Kao <acelan.kao@canonical.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Improve reporting for software reset
 failures
Message-ID: <20231024091943.GD3208943@black.fi.intel.com>
References: <20231024074332.462741-1-acelan.kao@canonical.com>
 <4c11d06931f9b4e29c0e8feafc18e763@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c11d06931f9b4e29c0e8feafc18e763@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_021951_313689_E736CC89 
X-CRM114-Status: GOOD (  23.18  )
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

Hi,

On Tue, Oct 24, 2023 at 10:59:50AM +0200, Michael Walle wrote:
> [+Mika]
> 
> 
> > From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> > 
> > When the software reset command isn't supported, we now report it as an
> > informational message(dev_info) instead of a warning(dev_warn).
> > This adjustment helps avoid unnecessary alarm and confusion regarding
> > software reset capabilities.
> > 
> > v2. only lower the priority for the not supported failure
> > 
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 1b0c6770c14e..76920dbc568b 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor
> > *nor)
> > 
> >  	ret = spi_mem_exec_op(nor->spimem, &op);
> >  	if (ret) {
> > -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> > +		if (ret == -ENOTSUPP)
> 
> It bothers me that we use ENOTSUPP here. We should really use EOPNOTSUPP.
> The core uses EOPNOTSUPP everywhere except for the intel things.
> 
> Please have a look at changing that to EOPNOTSUPP. See also:
> https://lore.kernel.org/linux-mtd/85f9c462-c155-dc17-dc97-3254acfa55d2@microchip.com/

Makes sense.

> > +			dev_info(nor->dev, "Software reset enable command doesn't support:
> > %d\n", ret);
> 
> I'm not sure this is helpful. It's only the intel SPI controller which
> does magic things (instead of just issuing our commands). Mika, do you
> know wether your controller will do a reset on it's own? I presume so,
> because AFAIR you have some kind of high level controller which also does
> SFDP parsing and read opcode handling on their own.

Yes, that's right.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
