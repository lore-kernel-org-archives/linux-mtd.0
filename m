Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93C0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 09:11:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D38860F21
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 09:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D38860F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kO7hRrHpDjSzjWgOzXcN+45brPq7vvc/1C2AIhwD+1A=; b=DgrwqHCm17Fqjl
	cVneggdJ66eE6APl8Who+QOi0ERAfaM9JqqQp0OfWiUd+gCWw7unZazsOrSg8cVNEXU01MbcxREYg
	DT3d26S4bZH0ts2De2tfci/n/xYzSSR3UfiZ+9qHAWLvQp79dnQY0N6JN7efvYvwM5v+jhVzMbAwK
	c7m+8/TlvzFnJ5GiergFzizwgNK2EsynLDkQSzZVG9NcAUn6ZXiG2BRM2qn08X+67YVPBa6jIpzCP
	6SAJSiQa4GSVcuTM//FvYj1B/gtt4QosWgIA7U0K8P5zQoIY+ONm2gR9GO3i4fUKt8JtI17c9DulU
	mOsplDgwWetXMAVkAFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYluN-0028yj-6f; Fri, 08 Oct 2021 09:11:15 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYluK-0028yJ-Gl
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 09:11:13 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="207277640"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="207277640"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:02:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="478904636"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:02:30 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Oct 2021 12:02:28 +0300
Date: Fri, 8 Oct 2021 12:02:28 +0300
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
Message-ID: <YWAJJLST7KYAD6Fw@lahna>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
 <20211004095239.dyowgkyq5lnfdag2@ti.com> <YVrSbyEsSLMOu1bU@lahna>
 <20211007123621.ld4aqasr3hlwq2c7@ti.com> <YV8kVKiMShWp4g7a@lahna>
 <20211007180029.6agt43vyiwpcgmjz@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007180029.6agt43vyiwpcgmjz@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_021112_594067_5943B4F3 
X-CRM114-Status: GOOD (  17.50  )
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

On Thu, Oct 07, 2021 at 11:30:31PM +0530, Pratyush Yadav wrote:
> > Probably but I would not call these "problems" - it is how the
> > controller is designed. This one is meant only for SPI-NOR flash access,
> > typically used by the BIOS. It is by no means general purpose SPI
> > controller (as you can see from the datasheet). The BIOS does need the
> > full SPI stack, it just issues these simple commands and let's the
> > controller figure out what actually needs to be done.
> 
> The problem is not the controller itself. It is perfectly fine piece to 
> have a controller like this IMO. The problem is how do we make it fit 
> into the SPI MEM model, which seems to be designed for general purpose 
> controllers only. This problem is shared with this and the Cadence xSPI 
> controller.

Fully agree. IMHO trying to shoehorn driver like this into a generic SPI
subsystem does not make much sense to me. These things can only talk to
SPI-NOR chips, nothing else.

Do you have any suggestions how to solve this "problem" so we can move
forward with the drivers?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
