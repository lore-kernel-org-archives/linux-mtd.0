Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FAR0GbnA7QKCx4xatn1x0P9x1LHEKOtlT2S3y4LA8Q=; b=Eu2IRVbDnHX0J+
	ka0asAPGiCH86BjF4eEpLEyfyWIfG35ohue8XTdI4FUqMCy8UsQonEuFxXqq5V2fZEFILDhsXqCEQ
	XFFYExKAztmIuiY9B8MinjvGz2qqoBuOWlj57FFYjzQf/M1zDwZRN7/DrwJX+i438jbQKn6c2lWsW
	qVD0eSB9mQbYrAe/NrRwAbP7yuptKsJ9dyEAICIJJ9CnLH+SoeHVnfupI5+qvDwDHY3d+5hOLKMwh
	u+dgwShm1iGcvCAhJckAfURP0ngVrl/fJxvaZdHpKU+EfGAgSHv5qE5KJlYlFHwuSohbQtpZQyAX8
	aFop/ys8ELIl6Z+npcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myB4B-009fjc-7G; Fri, 17 Dec 2021 11:06:23 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myB3O-009fUi-1I
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 11:05:35 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="237272478"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="237272478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 03:05:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="612088757"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 03:05:27 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 17 Dec 2021 13:05:25 +0200
Date: Fri, 17 Dec 2021 13:05:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <Ybxu9eNCBy3OgWLN@lahna>
References: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
 <20211118130543.11179-3-mika.westerberg@linux.intel.com>
 <20211216115100.448351e4@collabora.com> <Ybtn1VTsspxdIeT8@lahna>
 <20211216174347.69cf611c@collabora.com> <Ybxotgb927kpCizL@lahna>
 <20211217115206.33da307c@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217115206.33da307c@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_030534_166647_78BD9342 
X-CRM114-Status: GOOD (  20.68  )
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

On Fri, Dec 17, 2021 at 11:52:06AM +0100, Boris Brezillon wrote:
> On Fri, 17 Dec 2021 12:38:46 +0200
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> > Hi,
> > 
> > On Thu, Dec 16, 2021 at 05:43:47PM +0100, Boris Brezillon wrote:
> > > Why no just
> > > 
> > > 	if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
> > > 	    iop->mem_op.addr.dtr != op->addr.dtr)
> > > 		return false;
> > > 
> > > then?  
> > 
> > That would be too simple ;-)
> > 
> > I'll do this change in v5.
> 
> I didn't review the driver thoroughly, but it looks clean an tidy. Feel
> free to add
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks!

> One more thing. I think it'd be good to implement the dirmap hooks (in
> a follow-up series, not here), so you don't have to iterate over the ops
> table every time a read/write request is issued. Should be as simple as
> storing the exec_op() pointer in the driver-private dirmap pointer, and
> calling this function when ->dirmap_{read,write}() is called.

Okay.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
