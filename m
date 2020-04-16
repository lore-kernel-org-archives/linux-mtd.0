Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6225CC2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D6E2192A
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DiNpeFBE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D6E2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLWN+qONCDArw9ExGnVXGNHAsYeH2E1SmCdEBB2gsRo=; b=DiNpeFBELYbOXY
	YZ6e6ItL+HmGek+E272BSOqRB26h/aRVgeVGkyOWN8h/rJxrzVdmbDLlYgAxUYoB4WiB7IN/7iERt
	8OGCnma3/FwsHzroKNJuZSFzX6Lo/+H0k2j8xW496KNFWtYwwr/JQ/crYg3e+peNVCwefDjIt879H
	lizGqc3P0EtVUy0tkxOxQwaS+UsKI8pdDEho8VzAeaPPPk+RLaQFcWYrEPFsaHodZMkfiA6W/BI+v
	YpAbmNpM7xLmWe5iysyUdh7krx8/sOBd8IAdd6X6hGCLbSj5G2V9TY2CxmNo6PR/KCz63/cyS8W/r
	qGjJaPy0kXvY2XLeI1wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1j2-0000wy-DT; Thu, 16 Apr 2020 10:26:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1j0-0000wD-8W
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 10:26:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7C98B2A1375;
 Thu, 16 Apr 2020 11:26:23 +0100 (BST)
Date: Thu, 16 Apr 2020 12:26:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200416122619.2c481792@collabora.com>
In-Reply-To: <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_032626_428667_AB386B73 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, andriy.shevchenko@intel.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 16 Apr 2020 17:45:49 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> >>>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >>>>
> >>>> This patch adds the new IP of Nand Flash Controller(NFC) support
> >>>> on Intel's Lightning Mountain(LGM) SoC.
> >>>>
> >>>> DMA is used for burst data transfer operation, also DMA HW supports
> >>>> aligned 32bit memory address and aligned data access by default.
> >>>> DMA burst of 8 supported. Data register used to support the read/write
> >>>> operation from/to device.  
> >>> I am wondering how this new hardware is different from the Lantiq NAND
> >>> controller IP - for which there is already a driver in mainline (it's
> >>> in drivers/mtd/nand/raw/xway_nand.c).
> >>> The CON and WAIT registers look suspiciously similar.
> >>>
> >>> As far as I understand the "old" SoCs (VRX200 and earlier) don't have
> >>> a built-in ECC engine. This seems to have changed with ARX300 though
> >>> (again, AFAIK).
> >>>
> >>> A bit of lineage on these SoCs (initially these were developed by
> >>> Infineon. Lantiq then started as an Infineon spin-off in 2009 and
> >>> was then acquired by Intel in 2015):
> >>> - Danube
> >>> - ARX100 from 2008/2009
> >>> - VRX200 from 2009/2010
> >>> - ARX300 from 2014
> >>> - GRX350 from 2015/2016
> >>> - GRX550 from 2017
> >>> - and now finally: LGM from 2020 (est.)
> >>>
> >>> The existing xway_nand driver supports the Danube, ARX100 and VRX200
> >>> SoCs.  
> >> Lantiq upstreamed a driver for an older version of this IP core 8 years
> >> ago, see here:
> >> https://elixir.bootlin.com/linux/v5.5.6/source/drivers/mtd/nand/raw/xway_nand.c
> >> It does not support DMA and ECC.  
> > Then let's just extend this driver to support the new features. Plus,  
> We do not have the platform to test also it's very old legacy driver .

Well, if it's similar enough, we want to have one driver.

> > we'll be happy to have one more of the existing driver converted to  
> > ->exec_op() ;-).  
> 
> I have completely adapted to ->exec_op() hook up to replace the legacy 
> call-back.

I suspect porting what you've done to the xway driver shouldn't be too
complicated.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
