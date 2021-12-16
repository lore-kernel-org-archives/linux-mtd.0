Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1521DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FRpypRyRlLNaLzqwz4SGXj14xU2htYUiigJmqZaeWs=; b=aP0pmWfQEVfdS+
	ECkudGYW/536MFq9w6WVe66iGHu20eXVBTNzaaHAvh5pv+RadOlMYIGJmaqcCWtA3uIKbnduZLO/b
	DHHU8sWw2kksF6V9JpeJtlyMIGzzLU999EC31Bg6t24/nDZPVZvKd7wwIvjyp0axyu7mgaiHqebCa
	ptWRK54Es7nvmDGSsOCAyX8jAQNEU2NgfDxdpLj5EDXV3qK7VoERJlrwXOl/VxDFsXjDTwrPQErKH
	vTDCIl2mco9DIm8hH97NhoBHNf9NhIl1x7sHlhsX3hrPAuEGM7vYz4N8YPM5mB5RzsVshjCaSzdEg
	kZCb5L/7qMTI+/M7yj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxtlE-006f6M-Qm; Thu, 16 Dec 2021 16:37:41 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxtWx-006aPA-F0
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 16:22:56 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239482674"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239482674"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 08:22:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="611522820"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 08:22:48 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Dec 2021 18:22:45 +0200
Date: Thu, 16 Dec 2021 18:22:45 +0200
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
Message-ID: <Ybtn1VTsspxdIeT8@lahna>
References: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
 <20211118130543.11179-3-mika.westerberg@linux.intel.com>
 <20211216115100.448351e4@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216115100.448351e4@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_082255_589866_F1E0CFFF 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, Dec 16, 2021 at 11:51:00AM +0100, Boris Brezillon wrote:
> On Thu, 18 Nov 2021 16:05:42 +0300
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> > +static bool intel_spi_cmp_mem_op(const struct intel_spi_mem_op *iop,
> > +				 const struct spi_mem_op *op)
> > +{
> > +	if (iop->mem_op.cmd.nbytes != op->cmd.nbytes ||
> > +	    iop->mem_op.cmd.buswidth != op->cmd.buswidth ||
> > +	    iop->mem_op.cmd.dtr != op->cmd.dtr ||
> > +	    iop->mem_op.cmd.opcode != op->cmd.opcode)
> > +		return false;
> > +
> > +	if (iop->mem_op.addr.nbytes) {
> > +		if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
> > +		    iop->mem_op.addr.dtr != op->addr.dtr)
> > +			return false;
> > +	}
> 
> Hm, are you sure you want to allow op->addr.nbytes > 0 when
> iop->mem_op.addr.nbytes == 0? Feels like the command should be reported
> as unsupported in that case. Unless 0 is a wildcard meaning 'any', but
> that would be confusing, since operations with 0 address bytes are
> valid, and I actually expect the number of address cycles to be fixed 
> or bounded.

Indeed. I will change it to:

	if (iop->mem_op.addr.nbytes) {
		if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
		    iop->mem_op.addr.dtr != op->addr.dtr)
			return false;
	} else if (op->addr.nbytes > 0) {
		return false;
	}

in v5 if that's what you meant.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
