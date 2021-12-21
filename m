Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F22C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtLEHpp5c68t3k/1GTmgkKkOPCOWKC7Eu8rDWX+XH70=; b=htAU+fiF647ELf
	3iBqpvh+iC1mrK8rsozM4IWP3V2Iln5FAg4Gqota+XkXZABmHcdVj44dggN5P4BU2fWZfyNegJmXC
	5yuMH2Szmlf9DYg1VJTJhMEKFHrDKDZmuQznH/4Qy6JMQdELcCIf/HEAojN3jfYZm8yiPtrq/D942
	cdWCEvcTSo8FaVBgDndABCSiK3ClnqJWpeNnOkGpEUx3JhUeAeFf1wVUvHaFOpGmsuS60hZ0QvgLB
	GygJeGCPz+gUqN+wb9CjE6EKXZxas6dyiik7tI5Xfmfil/1asQdLuxRPCdyrBUoKEmQ+zJ+pksXsk
	28f62xvdcWD8NT/Yw3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzdtW-006fiA-H3; Tue, 21 Dec 2021 12:05:26 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzdtG-006fe6-8n
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 12:05:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BLC51BJ014650;
 Tue, 21 Dec 2021 06:05:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640088301;
 bh=IoDKNjD9NU5YMdk/i9v5dC2VH0TaHk51G9MxJZmYdgY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=S+Kn3+g8mXCnII2XzsdsHsqQKy4gVRlKczUCUgw4Lc4Mjq2HIdEKvR9/KLUEFJl2F
 SPnWoDzi6RMg6sdTr3Uhdq6L+z+Ijhc4uJitsGW9OnlMXfDYN1/qwPBSASRQFa2pAC
 gcDkZfETb1GUclQ4hZmhe2MkQyQ87MaHk9Ln2Vm4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BLC51l8008875
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Dec 2021 06:05:01 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Dec 2021 06:05:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Dec 2021 06:05:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BLC50Bd033434;
 Tue, 21 Dec 2021 06:05:01 -0600
Date: Tue, 21 Dec 2021 17:35:00 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 04/14] spi: cadence: Provide a capability structure
Message-ID: <20211221120458.4l7expkdznnw6u3u@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-5-miquel.raynal@bootlin.com>
 <20211220185515.wujhgn66mnwns7bw@ti.com>
 <20211221111605.352285f5@xps13>
 <20211221104108.t563gg2hulfqt2uh@ti.com>
 <20211221121947.5c779bfd@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221121947.5c779bfd@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_040510_428176_EADF69D4 
X-CRM114-Status: GOOD (  35.44  )
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

On 21/12/21 12:19PM, Miquel Raynal wrote:
> Hi Pratyush,
> 
> p.yadav@ti.com wrote on Tue, 21 Dec 2021 16:11:10 +0530:
> 
> > On 21/12/21 11:16AM, Miquel Raynal wrote:
> > > Hi Pratyush,
> > > 
> > > p.yadav@ti.com wrote on Tue, 21 Dec 2021 00:25:18 +0530:
> > >   
> > > > > Subject: [PATCH v7 04/14] spi: cadence: Provide a capability structure    
> > > > 
> > > > s/cadence/cadence-quadspi/  
> > > 
> > > Right.
> > >   
> > > > 
> > > > On 17/12/21 05:16PM, Miquel Raynal wrote:  
> > > > > This controller has DTR support, so advertize it with a capability now
> > > > > that the spi_controller_mem_ops structure contains this new field. This
> > > > > will later be used by the core to discriminate whether an operation is
> > > > > supported or not, in a more generic way than having different helpers.
> > > > > 
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > ---
> > > > >  drivers/spi/spi-cadence-quadspi.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> > > > > index 101cc71bffa7..98e0cc4236e3 100644
> > > > > --- a/drivers/spi/spi-cadence-quadspi.c
> > > > > +++ b/drivers/spi/spi-cadence-quadspi.c
> > > > > @@ -1388,10 +1388,15 @@ static const char *cqspi_get_name(struct spi_mem *mem)
> > > > >  	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi->chip_select);
> > > > >  }
> > > > >  
> > > > > +static const struct spi_controller_mem_caps cqspi_mem_caps = {
> > > > > +	.dtr = true,
> > > > > +};
> > > > > +
> > > > >  static const struct spi_controller_mem_ops cqspi_mem_ops = {
> > > > >  	.exec_op = cqspi_exec_mem_op,
> > > > >  	.get_name = cqspi_get_name,
> > > > >  	.supports_op = cqspi_supports_mem_op,
> > > > > +	.caps = &cqspi_mem_caps,    
> > > > 
> > > > I just noticed you put it under struct spi_mem_ops, not under struct 
> > > > spi_mem. This is not an operation per se so wouldn't it be better if it 
> > > > is moved to struct spi_mem?  
> > > 
> > > I had a hard time taking a decision but my conclusion was that these
> > > caps are static controller capabilities and exclusively tight to the
> > > controller. The spi_mem structure defines a SPI peripheral. The
> > > spi_mem_ops structure is the only spi-mem related field of the
> > > spi-controller structure. I could have added my own field there but
> > > as these caps are only meant to be used by the spi_mem_ops anyway
> > > (exclusively ->supports_op() for now), it seemed to be a good location,
> > > at least better than the spi-mem structure.  
> > 
> > Can we have a 3rd person chime in and break the tie? :-)
> 
> I don't quite get why we should put controller specific information
> into the memory device structure?

Hmm, you're right. struct spi_controller would probably be a better 
place.

> 
> Anyway, do you mind if we move forward first? Not that I don't think
> that this choice should be discussed further, but I think this can
> easily be changed in the near future if there is a desire to
> reorganize spi-mem objects. In fact, these capabilities are accessed
> through a helper so that hypothetic change would be almost transparent.

Okay. I would still like to hear other opinions on this, but fine by me 
if you want to take this in as-is.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
