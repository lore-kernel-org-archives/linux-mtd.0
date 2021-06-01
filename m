Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95597C47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 09:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5132861008
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 09:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5132861008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SW3oip/we+ZEN+d54zRnFfFXtniyiWz0nxbLLPFO9Jw=; b=oyWsZOc5E9Prpv
	7UAN8Y8gME0aLnTgEr1BGLQGbOFjRqGxosCLoOpb5WHZh9ZTk2cF8KURSh56phyrTmzLLZI3gzqmw
	xr0S+9Dlxz5wNk5oHvzs0n6Y5xlfRkrICnkDbB/bcewdm4eFujw/t+lSdLKN8tYzYhEi7HPjbq0MH
	3QvgQ6hNvZlQdlUgyhYsE4Zdp0+XoJeLe7LxkeCYMB63mZnhBl4nnTUPFrdx+vG4coLXt6F82S91r
	rQmcLNVC581beGZ0rS6m1hJjD3+g/YFIDLjcEXFXDNNkLMH+tmylKgx8Q06+piwlQLokb2ieTq8Ri
	0b9GG0ve9803A8LWguwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo159-00FjAG-S6; Tue, 01 Jun 2021 09:53:07 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo156-00Fj92-4O
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 09:53:06 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 8.0.0)
 with ESMTP id 83bc53ab63c74599b705a2029c7a2fe7.MSG
 for <linux-mtd@lists.infradead.org>; Tue, 01 Jun 2021 11:52:55 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 11:52:55 +0200
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.2176.009; Tue, 1 Jun 2021 11:52:55 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Michael Walle <michael@walle.cc>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "tudor.ambarus@microchip.com"
 <tudor.ambarus@microchip.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "Pratyush
 Yadav" <p.yadav@ti.com>
Subject: RE: [PATCH v1] mtd: spi-nor: add ACPI support for non-JEDEC SPI-NOR
Thread-Topic: [PATCH v1] mtd: spi-nor: add ACPI support for non-JEDEC SPI-NOR
Thread-Index: AQHW8/DSQFilXQ1vXUSgmqjMFBEDbqr92CQAgAHUbcA=
Date: Tue, 1 Jun 2021 09:52:55 +0000
Message-ID: <67ad7c365fa749209eab5ddae7f8ce80@asem.it>
References: <20210126143748.1546187-1-f.suligoi@asem.it>
 <20210531074424.16086-1-michael@walle.cc>
In-Reply-To: <20210531074424.16086-1-michael@walle.cc>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F24.60B60377.0096, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_025304_388838_FB7A4DDE 
X-CRM114-Status: GOOD (  27.70  )
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

Hi Michael,

...
> 
> > In a x86 machine, an additional device can be described
> > inside the BIOS ACPI tables.
> > For example, an I2C GPIO expander, a LED, etc.,
> > can be successfully declared in ACPI, so that the related
> > device driver can start automatically at the boot.
> >
> > But for the SPI NOR devices, the ACPI description works
> > for JEDEC-compatible devices only.
> >
> > For example, an Everspin MR25H40 MRAM device (non-JEDEC
> > compatible), declared using the following table,
> > does not work:
> >
> >     Scope (\_SB.SPI1)
> >     {
> >         Device (NVR0)
> >         {
> >             Name (_HID, "PRP0001")
> >             Name (_DDN, "Everspin MR25H40 MRAM")
> >             Name (_CRS, ResourceTemplate () {
> >                 SpiSerialBus (
> >                 1,                      // Chip select
> >                 PolarityLow,            // Chip select is active low
> >                 FourWireMode,           // Full duplex
> >                 8,                      // Bits per word is 8 (byte)
> >                 ControllerInitiated,    // Don't care
> >                 10000000,               // 10 MHz
> >                 ClockPolarityLow,       // SPI mode 0 ClockPolarityLow
> >                 ClockPhaseFirst,        // SPI mode 0 ClockPhaseFirst
> >                 "\\_SB.SPI1",           // SPI host controller
> >                 0,                      // Must be 0
> >                 ResourceConsumer,
> >                 ,
> >                 )
> >             })
> >
> >             Name (_DSD, Package () {
> >                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> >                 Package () {
> >                     Package () {"compatible", "mr25h40"},
> >                 }
> >             })
> >         }
> >     }
> 
> This isn't the correct compatible string, according to the devicetree
> binding [1], there is no compatible = "mr25h40" binding. The correct entry
> would be
>  compatible = "everspin,mr25h40", "jedec,spi-nor";
> 
> I'm not familiar with ACPI and don't know wether you can specify a list,
> nor am I convinced that it will work then. But it should be worth a try.

It works on our board with our custom BIOS.
I'm currently use this patch for the kernel of our x86 machines.
And that's is the only way I've found to describe the mr25h40 MRAM
presence in our BIOS.
Obviously, it works because of the above ACPI description is built-in
inside the custom BIOS of our boards.
Note that the mr25h40 is NOT jedec compatible.

> 
> [1] Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> >
> > To enable the detection of a non-JEDEC device described
> > in a BIOS ACPI table, it is necessary to add its id name
> > in the spi_nor_of_table structure.
> > With this change, all the SPI NOR devices (JEDEC and
> > non-JEDEC) can be detected by the kernel (and the above
> > example of ACPI table finally works).
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  drivers/mtd/spi-nor/core.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 6ae7d4c2d2b6..b6fb8b15c439 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3755,6 +3755,19 @@ static const struct of_device_id
> spi_nor_of_table[] = {
> >  	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
> >  	 */
> >  	{ .compatible = "jedec,spi-nor" },
> > +	{ .compatible = "m25p05-nonjedec" },
> > +	{ .compatible = "m25p10-nonjedec" },
> > +	{ .compatible = "m25p20-nonjedec" },
> > +	{ .compatible = "m25p40-nonjedec" },
> > +	{ .compatible = "m25p80-nonjedec" },
> > +	{ .compatible = "m25p16-nonjedec" },
> > +	{ .compatible = "m25p32-nonjedec" },
> > +	{ .compatible = "m25p64-nonjedec" },
> > +	{ .compatible = "m25p128-nonjedec" },
> > +	{ .compatible = "mr25h128" },
> > +	{ .compatible = "mr25h256" },
> > +	{ .compatible = "mr25h10" },
> > +	{ .compatible = "mr25h40" },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, spi_nor_of_table);
> > --
> > 2.25.1

Thank you very much for your suggestions,
Flavio

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
