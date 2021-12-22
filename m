Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0460BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHl0Q+uCyYVeAaKD65aF/xwbPelGO/9bpngHDZZzlr4=; b=V40/IvS2T1/hJI
	AwUrmGnwdBLBo7dBjEkLNlLHBe0dU3veL/R1FDdkkhPI8+BuChw7BygqSf5NgK8KEd2Vm5cn8Mr6F
	gasVY5l/aiMbr9uOFL77+sKAcLmgbM8X9JXBu09qipYWUM1JBXNM/6/ue+iyHV2bCJNauIOauJQqb
	YQFv/zHFN+1jmoopv5Dt6K9LO/vGKD8sXweRpC15Ffl+4hgeECBEh7roZJi9zJACeQZhhKLlvOeXI
	fBzxwKmH24AFrBk0IfFGp5gKQU+xilr30NI2zVQ2rlFuG8EsU+FJ7NvzN0E7+fK1snunYZo9y/+uL
	fgeluf/kYT+n3LYqRU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzx4F-009hxe-Bl; Wed, 22 Dec 2021 08:33:47 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzx4C-009hvx-3K
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 08:33:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BM8XZtX096476;
 Wed, 22 Dec 2021 02:33:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640162015;
 bh=CtBClcYs4kTqQlePGYuj4wJGIXjRizI2wK2+mdQwGtE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DcVBGrEB04BgcJbJjMq7dTmX2HhxusZHd3SNJDvwHbdvnB+MERJTlkr3NkW1QVZkA
 zyjy9xWHwk5vdQETda+3Bs1Ep6CDi3BSQqw6hqspNSUik+sQIDeaMh4ECnxiMh2RF2
 ab5t5BoL8k6Jnd8hD11cEy65REjjiqWq2zze/7os=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BM8XZCf047334
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Dec 2021 02:33:35 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Dec 2021 02:33:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 22 Dec 2021 02:33:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BM8XYXh013134;
 Wed, 22 Dec 2021 02:33:35 -0600
Date: Wed, 22 Dec 2021 14:03:33 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Message-ID: <20211222083331.bhc2tud4dkre2esg@ti.com>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-2-miquel.raynal@bootlin.com>
 <20211221184725.46lelrdfoxeom6uc@ti.com>
 <20211222092324.7ec6ec6a@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222092324.7ec6ec6a@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_003344_272810_88F9F565 
X-CRM114-Status: GOOD (  35.72  )
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

On 22/12/21 09:23AM, Miquel Raynal wrote:
> Hi Pratyush,
> 
> p.yadav@ti.com wrote on Wed, 22 Dec 2021 00:17:27 +0530:
> 
> > On 21/12/21 06:00PM, Miquel Raynal wrote:
> > > The Xilinx QSPI controller has two advanced modes which allow the
> > > controller to behave differently and consider two flashes as one single
> > > storage.
> > > 
> > > One of these two modes is quite complex to support from a binding point
> > > of view and is the dual parallel memories. In this mode, each byte of
> > > data is stored in both devices: the even bits in one, the odd bits in
> > > the other. The split is automatically handled by the QSPI controller and
> > > is transparent for the user.
> > > 
> > > The other mode is simpler to support, it is called dual stacked
> > > memories. The controller shares the same SPI bus but each of the devices
> > > contain half of the data. Once in this mode, the controller does not
> > > follow CS requests but instead internally wires the two CS levels with
> > > the value of the most significant address bit.
> > > 
> > > Supporting these two modes will involve core changes which include the
> > > possibility of providing two CS for a single SPI device
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > index 39421f7233e4..4abfb4cfc157 100644
> > > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > @@ -47,7 +47,8 @@ properties:
> > >        identified by the JEDEC READ ID opcode (0x9F).
> > >  
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2  
> > 
> > You allow up to 4 items in stacked-memories but only allow up to 2 CS, 
> > which would make the other 2 memories unusable. Should also change this 
> > to 4.
> 
> Yes, I allowed "more" theoretical devices in the
> stacked/parallel-memories properties because there is no real
> limitation on this side so I didn't want to constrain it too much,
> while still keeping a maximum value, hence 4 seemed a nice guess for a
> "maximum but can be bigger value we don't really care it's just for
> bounding". However on the SPI side this is a big change with deep
> consequences and I don't want to rush things so it is on purpose that I
> kept the limitation to 2. But we can change the maxItems to 2
> everywhere if this appears to be the thing to do.

Ok, sounds good to me.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
