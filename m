Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C80C43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 11:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1D720820
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 11:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TKg9IkNA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1D720820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eeGwlem8C/bRk2GIBzQcPiOvNkX+SMz/kO7oJShTPs=; b=TKg9IkNAdNPD7m
	YbJhtVVd9d69evEHeTnFwjfNGmr0VAfEo7LEuqroPVKeaA1O6SThaQEhbr2dMfTbxvzBDXL74HCEn
	duTKveEMo1l84LmkOy9mUOP/iYISuvqH9FLThjG15iocVKqsIloohzOllTUmS7GQ9iYykCr1Wb7sB
	TF5djVzfxwsTXFKKrHvJYV18LcSD36wXUgtlQNfDIuW7lF6X9PxT3gkH3CrdNHEb7gCLRoUciQBk+
	KI1XJsxZUjpB/7EpmFVjQFpwjiNIQefaJy1sDyWRtwDo2BLGVZ1PsVkV22Ptl2zgqjy19+oViA/pi
	tMyW59LHoeSB5JVUndoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfMn4-0004e0-3M; Mon, 24 Jun 2019 11:05:38 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMn0-0003Nx-Hc
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 11:05:37 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 04:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="182613716"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 24 Jun 2019 04:02:50 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Jun 2019 14:02:49 +0300
Date: Mon, 24 Jun 2019 14:02:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH 1/2] spi-nor: intel-spi: Add support for Intel Elkhart
 Lake SPI serial flash
Message-ID: <20190624110249.GH2640@lahna.fi.intel.com>
References: <20190620122629.20838-1-mika.westerberg@linux.intel.com>
 <ec7b30dc-87cf-f8de-edc0-fded95c93223@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec7b30dc-87cf-f8de-edc0-fded95c93223@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_040535_813301_78FFCFB0 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: vigneshr@ti.com, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jun 22, 2019 at 12:03:55PM +0000, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 06/20/2019 03:26 PM, Mika Westerberg wrote:
> > External E-Mail
> > 
> > 
> > Intel Elkhart Lake has the same SPI serial flash controller as Ice Lake.
> > Add Elkhart Lake PCI ID to the driver list of supported devices.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> The patch's subject should begin with "mtd: spi-nor:". Did the change and
> applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
> spi-nor/next branch.

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
