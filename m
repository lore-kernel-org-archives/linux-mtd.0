Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB68C47096
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 18:09:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3680D60FE7
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 18:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3680D60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WrbMIOJZgh271JL0vx4rbTaXIZtrxoUUA1xTmFdBhQ=; b=e1l7+dfzL1uAj2
	klxEmAgD1F5gUJo8VnYwifP7kWQ6vnp1fWn/MYcBSzSY0zzSte2jTfeyU1glYpZcJVUmPjRuZqGTU
	HmimJGGh1koBYLs7wGMhVELIYuYF0OM7ZU54Kc+SqP9dxQCosydDJh/pX1WrS/enml0TxIH1A6ZVB
	yII5cP+Mti0YMgz9VIincguirPyDvsWhcRgV01QeIJIyei6vUesmmW9i/zZn2Qkdgs7D/wXclqWxN
	GTyk9WH4k7IOysihq/JHSQsdaX/hxVM/EN2hdTnXI0i6BRu0XaE4dAhNKIQLxUPXiapEf4YHTk7eE
	obEwFCRej4YU9a9s/bGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorm6-00A3dj-Gt; Thu, 03 Jun 2021 18:08:58 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorm2-00A3c4-41
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 18:08:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 153I8lYL099709;
 Thu, 3 Jun 2021 13:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622743727;
 bh=a6woUSiRPwVmYHSHy6o5MrXffOKGnDS3P4j3dK8UANk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=xg3OPg6rNtFCU9Pc5KdgP9ZM8Ebzq7sPtK9q+4OSIqeE8li2Wq9UQrrlxhLiFxDRX
 C/+Gzdk+hulinYs5zbO6T4A3g+mKKRF71yyBz/BIPAMZTyNcY39LpOXHk1ThaKMT64
 NCEZToQFaxLqTa6cgQQVSlrK62qzqftCUj+MlSuw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 153I8lac092999
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Jun 2021 13:08:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 3 Jun
 2021 13:08:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 3 Jun 2021 13:08:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 153I8kUq050570;
 Thu, 3 Jun 2021 13:08:46 -0500
Date: Thu, 3 Jun 2021 23:38:45 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Message-ID: <20210603180843.hjzynysgby3d3e5r@ti.com>
References: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
 <20210525191414.dc45h27rzqen4dce@ti.com>
 <20210526091250.GY291593@lahna.fi.intel.com>
 <20210526092417.GA291593@lahna.fi.intel.com>
 <e82f44552d0d4284fc5ed22ee0bee85a@walle.cc>
 <20210526102810.GB291593@lahna.fi.intel.com>
 <YLTILUh+bPhZ4ToR@lahna.fi.intel.com>
 <YLi3/DRqGzdlosNf@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLi3/DRqGzdlosNf@lahna.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_110854_340499_5CAE846E 
X-CRM114-Status: GOOD (  37.77  )
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

+Mark, linux-spi list,

On 03/06/21 02:07PM, Mika Westerberg wrote:
> Hi Tudor,
> 
> On Mon, May 31, 2021 at 02:29:59PM +0300, Mika Westerberg wrote:
> > Hi guys,
> > 
> > On Wed, May 26, 2021 at 01:28:16PM +0300, Mika Westerberg wrote:
> > > Hi,
> > > 
> > > On Wed, May 26, 2021 at 11:31:58AM +0200, Michael Walle wrote:
> > > > > Oh, I see now this commit:
> > > > > 
> > > > > a314f6367787 ("mtd: spi-nor: Convert cadence-quadspi to use spi-mem
> > > > > framework")
> > > > > 
> > > > > So "SPI MEM" means generic SPI subsystem for memory mapped devices.
> > > > > Unfortunately Intel controller at least is not capable of running
> > > > > generic SPI transactions. It only supports accessing SPI-NOR flashes and
> > > > > for those there is small set of commands that supports. I don't think it
> > > > > is even possible to convert the driver to generic SPI subsystem.
> > > > 
> > > > AFAIK it stands for SPI memory device (memory mapped is not a requirement).
> > > > Eg. spi-nxp-fspi doesn't support generic SPI devices either, but just SPI
> > > > flashes. So I'd guess SPI MEM is exactly what you are looking for.
> > > 
> > > OK, I see that there is ->mem_ops that can be used to implement
> > > different higher level commands. What I'm not seeing is that how the
> > > child SPI flash is created using this scheme? DeviceTree and ACPI are
> > > supported fine but what about scanning? I mean the intel_spi driver has
> > > this:
> > > 
> > >   spi_nor_scan(&ispi->nor, NULL, &hwcaps);
> > > 
> > > But if the driver is to be moved under drivers/spi/* you can't really
> > > call these functions anymore or can you? Or the point is to keep the
> > > driver under controllers/ and just call spi_nor_scan(), and in addition
> > > implement the new mem_ops?
> > > 
> > > Thanks in advance and sorry about many questions but there does not seem
> > > to be a conversion guide nor any (non-DT/ACPI) examples that I can take
> > > a look. :-)
> > 
> > Can you provide some guidance here? So in order to use the generic SPI
> > subsystem with "SPI MEM" parts of it, I would need to be able to create
> > the child SPI-NOR flash device without using ACPI or DT (as these
> > systems do not have any ACPI/DT description), or use spi_nor_scan() but
> > none of the driver under drivers/spi are calling it.
> 
> As the main SPI-NOR maintainer, what's your take on this?

I think this is more of a SPI or SPI MEM question, and less of a SPI NOR 
question. SPI MEM would call spi_nor_probe() which in turn calls 
spi_nor_scan().

So the question that needs to be answered is how to probe SPI MEM based
drivers without ACPI/DT.

> 
> Thanks!

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
