Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD94C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 11:08:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194F560F11
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 11:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 194F560F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEMsZqhSVoGxkKqW1eRNqRwIJIn6DIkA50Iu0n0tqpo=; b=p3Rdb3tDXmeRsF
	vQOqvpW2P6tboBgdU8yXGfSfIAkjaBPvR2CzZRVMPyeB7ZyjGPnE0+oBPkjFIF2fjBZWWbBBk0U6i
	5VoNlW15/QMUKhxw0IqzcR4qM9boG7FmbdphnSK7dnssw+FH7uzsgFCjP1pw+wVXzupriB7egy7Xq
	YoeJ1ngCOjyI1DWmZHiP4A4x8XNQ69GjAbPuBKz4SiZCcCs7WUbY9R8JJyAiH4OShA+OhLfeRgEOt
	bNqrHAO4wh5LdjcUTKCYGtZu+YUx//rf/lSXPaeW/HpdSf6BSkouk/QYiGrOW5smRtC8lW+Zaq1Xd
	HaO9NZkFP2STPd6oPALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mac7I-00GCIJ-Mz; Wed, 13 Oct 2021 11:08:13 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maaB7-00FhZg-Be
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 09:04:02 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="214328813"
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="214328813"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 02:04:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="441574840"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 02:03:56 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 13 Oct 2021 12:03:53 +0300
Date: Wed, 13 Oct 2021 12:03:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mauro Lima <mauro.lima@eclypsium.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
Message-ID: <YWag+RpkujjggPsW@lahna>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-2-mika.westerberg@linux.intel.com>
 <CAArk9MPWh4f1E=ecKBHy8PFzvU_y_ROgDyUU_O3ZQ0FuMhkj5Q@mail.gmail.com>
 <YVqOjF/xjqFV+Dl3@lahna>
 <CAArk9MPY+rCQse+JXtvb4KqunN9FZ=toK_v=PV-ro4cO6=5s7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAArk9MPY+rCQse+JXtvb4KqunN9FZ=toK_v=PV-ro4cO6=5s7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_020401_509467_5170E93D 
X-CRM114-Status: GOOD (  31.37  )
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

On Tue, Oct 12, 2021 at 03:49:22PM -0300, Mauro Lima wrote:
> Hi Mika
> 
> On Mon, Oct 4, 2021 at 2:18 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Fri, Oct 01, 2021 at 05:23:23PM -0300, Mauro Lima wrote:
> > > Question for maintainers: With these changes is it safe to remove the
> > > *(DANGEROUS)* tag from menuconfig?
> >
> > I don't think we want to remove that. This driver is not for regular
> > users, at least in its current form.
> Do we know why this is still dangerous for the user?

There was a bug in the driver in the past (that was already fixed but it
did not yet reach the stable trees or something like that). At this
unfortunate time there was no DANGEROUS in the name so Ubuntu kernel
went and enabled it. Combined with the bug certain Lenovo laptops BIOS
turned into read-only which prevented booting from non-default devices.

This happened even when the driver did not do any "write" or "erase"
operations, just clearing the status register or so.

We don't want that to happen again.

> My plan is to make a sys/class driver to query write protection status
> of the SPI, this will be
> used by fwupd to gather information about vendors, also should be easy
> for the user to use
> 'cat' and see the information from userspace. For this to be possible
> we need kernel engineers
> to compile the kernel with this driver enabled, but the (DANGEROUS)
> tag is a no go for most
> of them.
> Is there anything I can do to make this possible?

IMHO we can make certain parts of the driver, that are known not to
cause any issues available without the DANGEROUS. I mean the controller
exposes some information that I think you are intersted in and that does
not cause anything to be sent to the flash chip itself.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
