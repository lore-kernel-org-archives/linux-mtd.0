Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B6C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyvSvKoh/uAGqYyEW7U74OFztXE7Qj4X9ed5PapPEbQ=; b=07JB6RGK+jVZgF
	7x7ORUd/VXjPFjrNz1GvzcAL3qhlskrjtuWHNr+447BmTP4us3fuXhfLCSAulqc9+UrPcsVtSCjnZ
	tWmMyefGVfGhvfjFDXwBIU+hRA7UbatCm7sRmrYgm7fGuid9ipj1XWoPtgMUfssmGMXD1YXU8AAST
	1SoN9wxRa+nR9loNw/PXAjGlK+rrxURwT1BpZIuatLtpykYScLRBMn/b74NvCM++RhD0ICb7ROO1L
	+tZZlWOv96dB3zjso42MyTjDjj0tkjTDQ07/7mCiiT48T7s0sOy3k8LnyA9/jl/yKv7Wl96dPzD+H
	BD3VH5tLCnF5myITdM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP8f-0000000AJt6-16vT;
	Wed, 13 Mar 2024 13:59:25 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP8W-0000000AJpF-0jma
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 13:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710338356; x=1741874356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ObhAjMMSUSjidRVrJtIshpIU3PRlAw7QTAnpjAyYG3w=;
  b=f5BOjVCCegw5kQcc5AsRyiC/0Qz6DBECgSwOvU6XgTFHxGwiejBOJ2RX
   zvmFyX8nB7AT8wGKElhIQEK61lG2ivtbpx3OTfTI8HSf9WsOodPNn03Yp
   j2g22Focu1HyBCNWAuC5ZQSl7Q848Jc2eP+/a8WKUAOJEw4qqBz8eSTwS
   fU7NL9ygF2Kx/dHy/MgwOFufkwsXHTMyytF4PkLnSNDMsWHd08KcC2voT
   TD3CZx4SQaAx9uzNjKIk4IJ+ZoG4iZ3Pt4VIkOWTQ+XC+57kJEY/sbq1v
   EyBOQQjD5zFoc7Z5sl/7gz9CvoK1wC5eyWSBaAS5cU1fMda5QLnrfG1dm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16253099"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="16253099"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 06:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11854200"
Received: from svigh-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.52.216])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 06:59:10 -0700
Date: Wed, 13 Mar 2024 15:59:02 +0200
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] mtd: core: Don't fail mtd_device_parse_register() if
 OTP is unsupported
Message-ID: <lxl3zzgq4kgbgxkya2c6zyagcnrcyp2lzewu553mkmgdlooeca@m2wyltn7qpog>
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
 <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
 <CZQZXAB2GOCY.12YVJ6CRGG26B@kernel.org>
 <xeqscncwirfaz77mtpcvkueo5xto7vis5khr3uwclcx4sfx6eb@35j3grcqrzo2>
 <CZSIHWU6IYXB.2DUCUUYFTAB2X@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CZSIHWU6IYXB.2DUCUUYFTAB2X@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_065916_332041_90B0DF9B 
X-CRM114-Status: GOOD (  15.25  )
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

On Wed, Mar 13, 2024 at 10:24:13AM +0100, Michael Walle wrote:
> On Mon Mar 11, 2024 at 5:20 PM CET, Aapo Vienamo wrote:
> > On Mon, Mar 11, 2024 at 03:38:17PM +0100, Michael Walle wrote:
> > > Also, you'll print an error message for EOPNOTSUPP, although that is
> > > not really an error. Is that intended? 
> >
> > Well, when we hit this, the functionality of the SPI memory itself is
> > degraded in the sense that the OTP functionality is not available. What
> > would you suggest?
> 
> But it's not really an error, I mean, we are ignoring that one on
> purpose now :) I'd just guard it with "if (ret != -EOPNOTSUPP)".

To clarify, are you suggesting a modification like this to the code at
the end of mtd_otp_nvmem_add()?

err:
	nvmem_unregister(...);
	if (ret != EOPNOTSUPP)
		return dev_err_probe(...);
	return 0;

Best,
Aapo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
