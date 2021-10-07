Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCEEC433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 16:49:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B5761350
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 16:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1B5761350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRJfqflPT7swQIChLjxVoLolx0CYL7dC8AMZjTjEz1Q=; b=24UnYeM6ZrcJiZ
	yKsWaRmNRj5m5qeOONAejNyrUxX7lzAqIhiq5Tq2DP8zmFPV2kS2nJZoCMP+XOV/OkaIAiI9+pQyn
	goOyuxvcpyWIZkL03poJejfQBm1SmDsXWIiaF38SvKMulVgeStWgWechyRkTASozB15FdJGFbEVNd
	/V9TkfInybHB07iEnJmh64sXJPvd5Fa/pl+ERqz51Y66OKCKeByh5Ec7VWXbi+LG/dH3xKxZhz6yo
	P8rIIhdQ6x7B/5/Mnve2Z0QHcCtmNJzEspj1tn8J8afPYbIOC5hPRej+VsZhaIIG3HjhYX3F9/Mdb
	1X8lNKOhDokRvHSjtYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYWZM-000IOX-Bm; Thu, 07 Oct 2021 16:48:32 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYWZJ-000IOE-Vn
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 16:48:31 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287190714"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="287190714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:46:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="522666265"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:46:15 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 07 Oct 2021 19:46:12 +0300
Date: Thu, 7 Oct 2021 19:46:12 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <YV8kVKiMShWp4g7a@lahna>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
 <20211004095239.dyowgkyq5lnfdag2@ti.com> <YVrSbyEsSLMOu1bU@lahna>
 <20211007123621.ld4aqasr3hlwq2c7@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007123621.ld4aqasr3hlwq2c7@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_094830_097215_4D0FCF41 
X-CRM114-Status: GOOD (  22.32  )
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

On Thu, Oct 07, 2021 at 06:06:23PM +0530, Pratyush Yadav wrote:
> > Unfortunately there is no way to tell the controller any of these. It
> > simply does "read" or "write" (as we command it) and internally then
> > uses whatever it got from the SFDP tables of the flash chip. That's why
> > we just claim to support all these operations and let the controller do
> > its thing (whatever it is).
> 
> That is not ideal. SPI NOR uses this to negotiate the best available 
> protocol with the controller. Say you have a flash that is capable of 
> octal mode but the controller can only support quad mode. Your driver 
> will happily tell SPI NOR that it can support octal mode. I think you 
> should check the SPI mode bits to make sure the protocol bus width is 
> supported at least (see spi_check_buswidth_req() in spi-mem.c).

Okay, I'll see if I can add that check somewhere.

> As for opcodes, is there no way to find out what opcodes the controller 
> discovered via SFDP? Maybe we can't change them, but can we at least 
> take a peek at them?

AFAICT no. The controller only allows "higher" level commands like read,
write, erase but does not expose any of that to software. You can see
yourself if you want, the spec is here:
 
  https://cdrdv2.intel.com/v1/dl/getContent/636174

Page 403 has the control register.

> I think this has problems similar to the Cadence xSPI controller [0].

Probably but I would not call these "problems" - it is how the
controller is designed. This one is meant only for SPI-NOR flash access,
typically used by the BIOS. It is by no means general purpose SPI
controller (as you can see from the datasheet). The BIOS does need the
full SPI stack, it just issues these simple commands and let's the
controller figure out what actually needs to be done.

> Sorry I only replied to this after you posted a new version. It got lost 
> in the heap of emails in my inbox :-(

No worries :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
