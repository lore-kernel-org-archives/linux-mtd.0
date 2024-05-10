Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DFFC25B10
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2024 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aOBd80v/WVt0yzPAruSGgWKffng3UDsXqbdHjLTIN0=; b=t5m3SyuaZEM5vv
	lXgnfv92AmRiRBbJBy1rcW0N+AUM1Rc/CKJoHMeEvDuVOu+/iAlogompVwUDTiHyojmC81QUgUafx
	FbOoGFwsmo+/eApnc/HgfvklfrM28702p1me/a+P68pePcS71Bww5N8Y4XaIx/UqegKC1T2lyKxO5
	A1UZRG9ti1lLdgollS7gvBdY0rtoRjjLOAqm8yIRBQSY5TOe/fuPbH1oQUHn2I7EzzRhzq452ZEx0
	DYjY0W6CdnHkqoQl4OmE3mbMNmR3t9FURtYrp4E9KBDcBnACSTSPUanh57hzgfGvZh3MNCkISal7X
	hMyN+hqTsU1ICBLJEbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5REj-00000005Yy9-21Xh;
	Fri, 10 May 2024 14:28:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5REg-00000005YwU-1lSv
	for linux-mtd@lists.infradead.org;
	Fri, 10 May 2024 14:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715351315; x=1746887315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BpDfo0JyaiFAsLuhQN5rX/nDOzJtmaujSzQUgZhk2Ds=;
  b=MYzDyLolFW+24kbKakGFv4p4QKjTLhkWUGuViMegXXfzxF0tRYRXAUZq
   X01KW4i2wTAVB083ue5YTlYy6S9KZrB3Rxq87ZkYJmxTDC15acGeknt//
   YwIReWevkXxE5j3nxdG0EXiJi5LWIii7yzp2Ai43hzNmBbXq5aCjDJBHO
   XJ4AgG309ODtTtEEKuZozCeXTxW+UP4EeHFaGRY9LnW6rLS5/Bw3DCvQ+
   tsrhIgVNMiQpOqtefygFnU6+46S8NLuoLxSzqkBE+/q1+Z5/ymS2wFJTb
   8qiFbfODPM/cEzKZs3DPc9hiP3GPm5BiieBVPPxQ/K8YLULSkgfaa2RNU
   w==;
X-CSE-ConnectionGUID: KLKMSpJnStucGjk3lZBEkA==
X-CSE-MsgGUID: mYrW7NdcSc2l/dmJkbPFow==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22741973"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="22741973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:28:30 -0700
X-CSE-ConnectionGUID: G9O7mg33SY+jY6kgIpS3Ww==
X-CSE-MsgGUID: AUtjaV+hRx26k9WlB8JW+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29644128"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:28:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s5REW-000000067yK-3Wjo;
	Fri, 10 May 2024 17:28:24 +0300
Date: Fri, 10 May 2024 17:28:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] eeprom: 93xx46: drop unneeded MODULE_ALIAS
Message-ID: <Zj4vCGgPu2ERxewe@smile.fi.intel.com>
References: <20240414154957.127113-1-krzk@kernel.org>
 <20240414154957.127113-3-krzk@kernel.org>
 <Zju8HpBCiOjjIZ1j@smile.fi.intel.com>
 <6599e2a3-3b04-4ea2-aa5c-a916b66c8009@kernel.org>
 <ZjvEam5paLD0Iv6V@smile.fi.intel.com>
 <9a26dac6-d776-4b84-830d-6f622719d7eb@kernel.org>
 <5b29d981-aa8a-413e-8250-5fb33802f32d@app.fastmail.com>
 <cb8df682-c006-46d7-bcf1-7a0548e65c98@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb8df682-c006-46d7-bcf1-7a0548e65c98@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_072834_531272_3D7BED0B 
X-CRM114-Status: GOOD (  23.99  )
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

On Wed, May 08, 2024 at 09:17:59PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2024 21:11, Arnd Bergmann wrote:
> > On Wed, May 8, 2024, at 20:44, Krzysztof Kozlowski wrote:
> >> On 08/05/2024 20:28, Andy Shevchenko wrote:
> >>> On Wed, May 08, 2024 at 08:15:00PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 08/05/2024 19:53, Andy Shevchenko wrote:
> >>>>> On Sun, Apr 14, 2024 at 05:49:57PM +0200, Krzysztof Kozlowski wrote:
> >>>>>> The ID table already has respective entry and MODULE_DEVICE_TABLE and
> >>>>>> creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
> >>>>>> the alias to be duplicated.
> >>>
> >>> ...
> >>>
> >>>>>>  MODULE_ALIAS("spi:93xx46");
> >>>>>
> >>>>> I was stumbled over this (leftover?).
> >>>>> Commit message doesn't elaborate this bit.
> >>>>> Any comments?
> >>>>
> >>>> It is not present in ID table and commit msg removes only duplicated
> >>>> aliases. That alias has meaning - someone might be actually relying on it.
> >>>
> >>> It seems no users for it. The only user of platform data of this EEPROM uses
> >>> board files which AFAIU bypasses modalias matching.
> >>
> >> I don't think that's correct. The modalias of SPI board is there on
> >> purpose. 
> > 
> > Right, but I think a better workaround would have been to change
> > the board_info to pick a modalias that is part of the ID table:
> > 
> > --- a/drivers/misc/eeprom/digsy_mtc_eeprom.c
> > +++ b/drivers/misc/eeprom/digsy_mtc_eeprom.c
> > @@ -76,7 +76,7 @@ static struct gpiod_lookup_table eeprom_spi_gpiod_table = {
> >  
> >  static struct spi_board_info digsy_mtc_eeprom_info[] __initdata = {
> >         {
> > -               .modalias               = "93xx46",
> > +               .modalias               = "eeprom-93xx46",
> >                 .max_speed_hz           = 1000000,
> >                 .bus_num                = EE_SPI_BUS_NUM,
> >                 .chip_select            = 0,
> > 
> 
> That's kind of independent change.

I have done similar change in my patch series, after which I am 100% sure the
modalias can be removed. Can you look at that?

https://lore.kernel.org/r/20240508184905.2102633-1-andriy.shevchenko@linux.intel.com

> This commit *only* removed duplicated
> aliases, thus should have not functional impact except dropping
> redundant code. What you propose is to change spi board matching, which
> is reasonable, just a different thing.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
