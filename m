Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE953C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hwJrmk1xN2NxRkB/Bvlwj4//yGd2EdCd1eB8jhgS8c=; b=fVYkr+zHquI3uk
	J5UvoVUURukZQP/fYNxOWz+6PV/VDL2NmioSd1iDTS6Rdt5d/RTJZfmXGEFnffLbk7q+ChI2EjZ5L
	CPkKBbmO2TDbrn/9YkzGIomsrF5MAk1JOLQfb3ObqGa9U1QDjvIJ4NXlC/gNBB7TReD4BA2ARXeoT
	ODSu2tJ42Hkbp5MvsjBFCgiSVOzb7M+FZ1odRFaGewhHEvhoIeZ5ZaLiBIfwcQ6/0a+rgXZrkiPed
	z+xr9bYvN1GgDqvUZ9cpGfgmcopF7vSPc+dIAZy3RMmCnqiDBR/k8+t2B2bgkzIj+DBRiz+8GwP1I
	kobicd5ft+z51zkouz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNj1-00GFxZ-3L; Thu, 22 Sep 2022 15:02:51 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNCt-00G22a-Ee
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663856979; x=1695392979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+VlwN1zov2/iN1IrUItCJyZSiR6sHADhvMpfIXIEwY=;
  b=azjCbIoInq8W0IbGz/1x1Qb+An792NFLdw97zZgBxiYIzNvSjCokmQmF
   UuIVIBPNL7jgMMnreeuj2EQcbSuSAHLBF9+NgRNgpKGmrz/pLW1uklUFt
   hYAs12Bi9CBb8UFFxRx+TFrPEwinAsObenSjYQWsehmHaQncA8iPdkN2U
   AshW9H0hZANGAzIk5gZyUeDxJs9ndeWa3U4CcEel6GfUyMd1CAsJVWdjg
   vvkUzo5tmsXThocyayO73ydf7SG6bQMyaexS84+KuSlUfmdfHxpBR6pBD
   JMxhW15iDP3AkfrCAEWtI/n1E1BADjCfJ8tulnvigE5fS/tZCKgbIJXTg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362078779"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="362078779"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="723684098"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2022 07:29:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 36147F7; Thu, 22 Sep 2022 17:29:50 +0300 (EEST)
Date: Thu, 22 Sep 2022 17:29:50 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Hongyu Ning <hongyu.ning@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()"
Message-ID: <YyxxXlAAa7R47uYI@black.fi.intel.com>
References: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
 <a383698ae4a8e400f4961da5cc42663c@walle.cc>
 <YyxuLAsc7XXo7yOC@black.fi.intel.com>
 <1d7659f23b48acee3117ebabd0c7a5cc@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d7659f23b48acee3117ebabd0c7a5cc@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_072939_646799_DA838E19 
X-CRM114-Status: GOOD (  18.59  )
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

On Thu, Sep 22, 2022 at 04:17:10PM +0200, Michael Walle wrote:
> Am 2022-09-22 16:16, schrieb Mika Westerberg:
> > On Thu, Sep 22, 2022 at 04:12:17PM +0200, Michael Walle wrote:
> > > Am 2022-09-22 15:48, schrieb Mika Westerberg:
> > > > This reverts commit 08412e72afba3a2daef3e7f3378c3753255a0017.
> > > >
> > > > The Intel SPI-NOR controller does not support this opcode so the driver
> > > > ends up returning -EOPNOTSUPP and that makes the SPI flash chip probe
> > > > fail like this:
> > > >
> > > >   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> > > >
> > > > Whereas previously it worked just fine (and hence the return value
> > > > probably was ignored in the first place).
> > > 
> > > Can't we just ignore that return code then?
> > 
> > Isn't this revert just doing that? ;-)
> 
> No? It also ignores other (valid) errors.

Okay, I will do that and ignore just -ENOTSUPP in v2.

However, there is also similar call in spi_nor_restore() where the error
also gets ignored so I wonder if it was originally intentional.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
