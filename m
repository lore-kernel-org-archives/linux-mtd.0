Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9DDC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 08:23:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9838720738
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 08:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhXbUcwP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9838720738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Y9G7r8k+wzW1iTq+zTs/q+vYC08ckTeHV+5rQB+t5g=; b=YhXbUcwPC0n1eM8Ldv7T9OIDk
	RcscAfXU3OFMTJwO338w1R4pkVFwfuDJOmO5CGZOEajBITXbiTOhQ1fwQRFvcuHbPvdFyKUfKaD+X
	p+PjfOO7rpaaogKIL4ZhSTLZN5rUK5/pX6OKMyfhz4ZO/rXzAlHlk/58EYAmLejPn3Agq24BAiOBJ
	g3s7169yHDO97waO12+22CKxla4IUV/WiIxNUGVvPKkY+c1FOruE7g0QULOk5WcrWn3dZEK7vmZMS
	ERLgyk/l8SIK5GjJNYUXTajVWWgqzVUZTHeieQ7j8LL+wHYzHCzC605OEL6U80o5QIF6wHNMBWwR/
	qkT8IqyZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA7kZ-0006RT-AU; Mon, 24 Aug 2020 08:22:43 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA7kV-0006PS-Nc
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 08:22:40 +0000
IronPort-SDR: jgFiBZQelUsr5+YKFoJAQHKndRaQvW0q6WhcKgIus7qqxq4fTfi10+wMNpnqNB4K1HLbAREmeI
 sKttZ7YB4Deg==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="156913692"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="156913692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 01:22:37 -0700
IronPort-SDR: 83dFkHN98CUz5kwF5Qoia5wrbwvXZE09znrTf3Z4V9iEH0BvIugh8QyCpgO7GKZD3ludAlnV4c
 g5UpC9WlxZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="402245358"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 24 Aug 2020 01:22:29 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Aug 2020 11:22:27 +0300
Date: Mon, 24 Aug 2020 11:22:27 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI
 flash chip writable
Message-ID: <20200824082227.GU1375436@lahna.fi.intel.com>
References: <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
 <20200819091123.GE1375436@lahna.fi.intel.com>
 <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_042239_949744_91F6E702 
X-CRM114-Status: GOOD (  30.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Gutson <daniel@eclypsium.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Aug 22, 2020 at 06:06:03PM +0200, Arnd Bergmann wrote:
> On Wed, Aug 19, 2020 at 11:11 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Wed, Aug 19, 2020 at 10:38:24AM +0200, Arnd Bergmann wrote:
> > > On Wed, Aug 19, 2020 at 8:57 AM Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> >
> > > > Actually thinking about this bit more, to make PCI and the platform
> > > > parts consistent we can make the "writeable" control this for the PCI
> > > > part as well. So what if we add a callback to struct intel_spi_boardinfo
> > > > that the PCI driver populates and then the "core" driver uses to enable
> > > > writing when "writeable" is set to 1.
> > >
> > > If you are really worried about the write protection being bypassed by
> > > a different driver or code injection, the best way would seem to be to
> > > only enable writing in the mtd write callback and disable it immediately
> > > after the write is complete. I still don't see why this hardware would
> > > be more susceptible to this kind of attack than other drivers though,
> > > as it already has the safeguard against writing through the MTD layer
> > > without the module parameter.
> >
> > Hmm, is there already a mechanism at the MTD level to prevent writes? If
> > that's the case then sure we can use that instead.
> 
> The mtd core just checks both the permissions on the device node (which
> default to 0600 without any special udev rules) and the MTD_WRITEABLE
> on the underlying device that is controlled by the module parameter
> in case of intel-spi{,-platform,-pci}.c.

OK, thanks.

Since we cannot really get rid of the module parameter (AFAIK there are
users for it), I still think we should just make the "writeable" to
apply to the PCI part as well. That should at least make it consistent,
and it also solves Daniel's case.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
