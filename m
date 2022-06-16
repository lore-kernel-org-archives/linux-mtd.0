Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8949DC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 05:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxVHRttlKd7JT0/rp2NmqIIjFld7iUxUO87l6U+nLFk=; b=1Wm13NgX63e2i3
	G4o9VxXda5Ee5+PgVP3avC63Q9f91Jkl0zaZwpwqbVHTQ/nqyCt+90psK2imrOAOWt7Pl0IbQxdEb
	dJ4No5wJjQjZRV5kl5zV/dk1BZ380zcvsnBuswX0O7H2axna3Cy3OaTV9g7HhyE0p7+eC34J8eO+O
	8jSaHjn20Fq5OMLXcNmymfY6h20dLfLXHNxkcQIVfuHZXfPnWe5K8TNIo6MsfREIptEFZZ6oroXR3
	tl3g//u0gSzT0VziDvW0yj/NgoYfnrtDimdA8I5KhIfoSFeX12N+S1eBybmzTu4t3+HytSLPBiOKr
	LS8Ue71NZ+6iBdTQ9MTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1i4e-000WmL-CA; Thu, 16 Jun 2022 05:29:44 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1i4a-000WlE-Sz
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 05:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655357380; x=1686893380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yxLlY5sY3j1BaSU2opYF6e/oGGZzthY7yGLwx6OFor0=;
  b=kM/2+7I5AGJSiXlGoHN1zpnqlgBrelEXfQFfSTvLHeAy7jLhti0G3VV5
   SC13v8vZSdIk2VuYsbpqTE76lrDgmqSbsczzLBIcmXef3N0LGp0qM+OzG
   8NLyAVGrFaxvtAoRA+m+cNWb9bAu3D743sQB/WDLdqNHqsk/CID795++J
   P/SbmQgmtHZdFjj8IrZZuvRZfT/PC7/sVbTJ1WEWH4XS1Xah6NQRVpzK7
   Zaqsshzj728z5HdkHZ/Mm7N2DLh6CmB9a0cob7OYm0ak8STs8t0+HkPSX
   L0TgwsJ9WW+Y7T0RcyNaI1U5zKsmWq/Ka1tofJh0kcqt5KU/2W9YkhcSo
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280203294"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="280203294"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:29:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="687664970"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:29:34 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Jun 2022 08:29:31 +0300
Date: Thu, 16 Jun 2022 08:29:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: "Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco)" <oocheret@cisco.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
	"lee.jones@linaro.org" <lee.jones@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <Yqq/u9SAjE0lhxap@lahna>
References: <YmZUCIE/ND82BlNh@lahna>
 <20220610191548.3626218-1-oocheret@cisco.com>
 <YqbWt9f3of+7Z76e@lahna>
 <BYAPR11MB27570F2863F7BCDFE629B3DFCDAA9@BYAPR11MB2757.namprd11.prod.outlook.com>
 <YqmrIsOEsFoKTwEK@lahna>
 <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_222941_064032_9DC381DF 
X-CRM114-Status: GOOD (  17.29  )
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

On Wed, Jun 15, 2022 at 08:10:13PM +0200, Michael Walle wrote:
> Am 15. Juni 2022 11:49:22 OEZ schrieb Mika Westerberg <mika.westerberg@linux.intel.com>:
> >Hi,
> >
> >On Tue, Jun 14, 2022 at 05:56:54PM +0000, Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco) wrote:
> >>    Hello Mika,
> >> 
> >>    in my case (I work with memory chip n25q128a13 for recent kernels) I'm
> >>    getting return value -ENOTSUPP from spi_mem_exec_op() call in the
> >>    micron_st_nor_read_fsr() method
> >>    [[1]https://elixir.bootlin.com/linux/v5.19-rc2/source/drivers/spi/spi-m
> >>    em.c#L326]. So I decided to provide the same errorcode to
> >>    intel_spi_hw_cycle() method because older kernel versions throw the
> >>    error there. It is fine to use -EOPNOTSUPP return value instead.
> >> 
> >>    I suspect we need to cover both cases to check -ENOTSUPP as well as
> >>    -EOPNOTSUPP to let the driver work properly.
> >> 
> >>    if (ret == -ENOTSUPP || ret == -EOPNOTSUPP)
> >
> >I think we should follow the same in the Intel driver and return
> >-ENOTSUPP too.
> 
> AFAIK ENOTSUPP is for nfs and shouldn't be used.

Yes, but that's what the SPI-NOR core is using so I think we want to be
consistent with it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
