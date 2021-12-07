Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BC6C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ba9ruDmikv+Eq3itpPdw9BodQqU6rgjL14ZMHMLy7Vo=; b=EtoAIxls9kZrLz
	zvQpq/rQfdBiROXwv5zQSOXPBlZyHwjNvBhLrl3dofe0A/EQlmRb9e+JP8WuiG+0a4xTWBCoGAJ43
	9Ot+Uq9REWN/CbIG9UvkuB3xaLbQm9ccflC2dgVquuoY70oLOohFbDUbBgDtZ16uIHo1yveWXHxnm
	Wx8QLE9xNRBZXtRqcNaI1Pd3onp2cbMRMXSOITH0u8JM5LbIYMIU3Ht7Z2/OLtS9ESurP3rjmXVTV
	4gNUKPDMb9EHc57+Vzq0k0DzCK83X0BLWg1+ENLCU8b73uUIYn6l6mYicjPCQLcTl/yYU1XIonec9
	6Ovw/S+lKzrPjk+Ahy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVM1-007L1W-6Q; Tue, 07 Dec 2021 07:57:37 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVLw-007Kyr-7c
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 07:57:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B77vOsa068576;
 Tue, 7 Dec 2021 01:57:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638863845;
 bh=4CYkrt3/cNti78QF23qjaYBymX3CxscnpHgC9mIGM+I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=S3EQZUxlBl8QcQKeUBFNkwepMohq8NMKAfhb6fPM44bOgYL2DJrMlpkqlTwIlXfn8
 KM3GJrwzYGHmK/11iMT8HXdGImUh3ZW3cQeh1AFIifFkFlhy1x54n4DTYrcRk3xztA
 bsd6pySi4TUoeyWZvwOZkvq/BYeOBej7jp0cOKQk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B77vODB074865
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Dec 2021 01:57:24 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Dec 2021 01:57:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Dec 2021 01:57:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B77vNgW050445;
 Tue, 7 Dec 2021 01:57:24 -0600
Date: Tue, 7 Dec 2021 13:27:23 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <thomas.petazzoni@bootlin.com>, <monstr@monstr.eu>
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <20211207075721.ghwbruqcgi36fk72@ti.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-3-miquel.raynal@bootlin.com>
 <20211207071406.c2ajc3shqybevvjj@ti.com>
 <0d97a420-685e-5120-3c09-d433382c02aa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d97a420-685e-5120-3c09-d433382c02aa@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_235732_393348_672761D9 
X-CRM114-Status: GOOD (  31.21  )
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

On 07/12/21 07:35AM, Tudor.Ambarus@microchip.com wrote:
> On 12/7/21 9:14 AM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 06/12/21 10:59AM, Miquel Raynal wrote:
> >> Describe two new memories modes:
> >> - A stacked mode when the bus is common but the address space extended
> >>   with an additinals wires.
> >> - A parallel mode with parallel busses accessing parallel flashes where
> >>   the data is spread.
> >>
> >> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >> ---
> >>  .../bindings/spi/spi-peripheral-props.yaml    | 21 +++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> >> index 5dd209206e88..13aa6a2374c9 100644
> >> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> >> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> >> @@ -82,6 +82,27 @@ properties:
> >>      description:
> >>        Delay, in microseconds, after a write transfer.
> >>
> >> +  stacked-memories:
> >> +    type: boolean
> > 
> > I don't think a boolean is enough to completely describe the memory.
> > Sure, you say the memories are stacked, but where do you specify when to
> > switch the CS? They could be two 512 MiB memories, two 1 GiB memories,
> > or one 512 MiB and one 256 MiB.
> 
> If the multi-die flash contains identical dies then the die boundary can be
> determined with flash_size / number_of_cs. Are there any multi die flashes
> with different types of dies?

The way I see it, a multi-die flash is not much different from 2 
independent flashes attached to the same SPI bus. So if we are going to 
implement this feature, I want it to be generic enough to allow 
supporting this type of hardware setup as well.

I am not aware of any flashes with a different CS for each die (that 
isn't handled by the flash internally), let alone with different types 
of dies. IIRC from our IRC conversation, Miquel's use case was using 2 
smaller identical flashes connected to the same SPI bus with 1 CS each. 
Do I remember this right Miquel?

> 
> > 
> >> +    description: Several SPI memories can be wired in stacked mode.
> >> +      This basically means that either a device features several chip
> >> +      selects, or that different devices must be seen as a single
> >> +      bigger chip. This basically doubles (or more) the total address
> >> +      space with only a single additional wire, while still needing
> >> +      to repeat the commands when crossing a chip boundary. XIP is
> >> +      usually not supported in this mode.
> >> +
> >> +  parallel-memories:
> >> +    type: boolean
> > 
> > With this I assume both memories have to be the same size?
> 
> It looks like the assumption for both cases is that the dies are identical.

I would like to _not_ assume that for stacked-memories, unless 
implementing that becomes too complicated.

> 
> > 
> >> +    description: Several SPI memories can be wired in parallel mode.
> >> +      The devices are physically on a different buses but will always
> >> +      act synchronously as each data word is spread across the
> >> +      different memories (eg. even bits are stored in one memory, odd
> >> +      bits in the other). This basically doubles the address space and
> >> +      the throughput while greatly complexifying the wiring because as
> >> +      many busses as devices must be wired. XIP is usually not
> >> +      supported in this mode.
> >> +
> >>  # The controller specific properties go here.
> >>  allOf:
> >>    - $ref: cdns,qspi-nor-peripheral-props.yaml#
> >> --
> >> 2.27.0
> >>
> > 
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments Inc.
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
