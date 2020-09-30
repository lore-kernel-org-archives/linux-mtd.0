Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4555AC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:54:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B942075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Smpm7ozO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fFTnK5Qr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B942075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3EQ2n4zIic1Mv1T/3F8TJt5TPjXmUyW7aotdyVvu5KQ=; b=Smpm7ozOpmCaoA6OYhRWGRBNH
	zmeIzmG8F50miWoHoZEEG7yBv3eYrT6ZhMtyownyRDEp7jVEoSik4bfAYDfgWr8qEbh5xw6dzHXIn
	l99o8o0c478ZTOUI0M3OXuF0bVtrdl5iw4hDoGJvz2624q2iYyoCMp2GQWk0svjuSsTB5EPNRmoug
	cHCfesOGCAGCxM5Pqq8c5+gx8faRd2w1UKHsJIHS+hpkTL9qy6hbOxdgiIvad+ML40crdjXTaof4L
	oiIRyKgEnt2D3HTiDWFEl6nZMzZXlMpAStlvzusFC6JJwcHeph9AfBe8MzpM+Vr/OM6G1w0P4XHyD
	n1aGp6z7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNVzd-0005iV-2v; Wed, 30 Sep 2020 06:53:37 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNVzb-0005hu-0V
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:53:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U6rTN5110868;
 Wed, 30 Sep 2020 01:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601448809;
 bh=kuqOovhebiQ7NwjpoSxWqBC4z/r9Z+K+9RBLLoXIuqU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fFTnK5Qr0rOuIGmKdM+ZKUmKMez01uIPlUntsNCx4QD/JhHi4zpATFkXPqcmOWl3w
 N9MhYnJUSS+7rWac67Fh1rlzfz9/Wno+6jAgNOowgo/sHweogimWebqm/pRKYK3PyY
 Ur/vboEWTkyux8icLHGzBJh6BRYGGej7YQSmmGgM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U6rTCP026890;
 Wed, 30 Sep 2020 01:53:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 01:53:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 01:53:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U6rS0n111859;
 Wed, 30 Sep 2020 01:53:28 -0500
Date: Wed, 30 Sep 2020 12:23:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 06/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Message-ID: <20200930065325.umw6kf3m3vzq4r5z@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-7-p.yadav@ti.com>
 <c4ff4fba-cad5-de10-93e8-97a4e2edecf0@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4ff4fba-cad5-de10-93e8-97a4e2edecf0@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_025335_201033_2D362E98 
X-CRM114-Status: GOOD (  26.12  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 30/09/20 06:44AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > This table is indication that the flash is xSPI compliant and hence
> > supports octal DTR mode. Extract information like the fast read opcode,
> > dummy cycles, the number of dummy cycles needed for a Read Status
> > Register command, and the number of address bytes needed for a Read
> > Status Register command.
> > 
> > We don't know what speed the controller is running at. Find the fast
> > read dummy cycles for the fastest frequency the flash can run at to be
> > sure we are never short of dummy cycles. If nothing is available,
> > default to 20. Flashes that use a different value should update it in
> > their fixup hooks.
> > 
> > Since we want to set read settings, expose spi_nor_set_read_settings()
> > in core.h.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c |  2 +-
> >  drivers/mtd/spi-nor/core.h | 10 +++++
> >  drivers/mtd/spi-nor/sfdp.c | 91 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 102 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 7445d7122304..cbb1aab27d03 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
...
> > @@ -1108,6 +1110,91 @@ static int spi_nor_parse_4bait(struct spi_nor 
> > *nor,
> >         return ret;
> >  }
> > 
> > +#define PROFILE1_DWORD1_RDSR_ADDR_BYTES                BIT(29)
> > +#define PROFILE1_DWORD1_RDSR_DUMMY             BIT(28)
> > +#define PROFILE1_DWORD1_RD_FAST_CMD            GENMASK(15, 8)
> > +#define PROFILE1_DWORD4_DUMMY_200MHZ           GENMASK(11, 7)
> > +#define PROFILE1_DWORD5_DUMMY_166MHZ           GENMASK(31, 27)
> > +#define PROFILE1_DWORD5_DUMMY_133MHZ           GENMASK(21, 17)
> > +#define PROFILE1_DWORD5_DUMMY_100MHZ           GENMASK(11, 7)
> > +#define PROFILE1_DUMMY_DEFAULT                 20
> > +
> > +/**
> > + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> > + * @nor:               pointer to a 'struct spi_nor'
> > + * @profile1_header:   pointer to the 'struct sfdp_parameter_header' describing
> > + *                     the 4-Byte Address Instruction Table length and version.
> 
> Profile 1.0 Table

Oops! Will fix.
 
> > + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
...
> > +       /*
> > +        * We don't know what speed the controller is running at. Find the
> > +        * dummy cycles for the fastest frequency the flash can run at to be
> > +        * sure we are never short of dummy cycles. A value of 0 means the
> > +        * frequency is not supported.
> > +        *
> > +        * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
> > +        * flashes set the correct value if needed in their fixup hooks.
> > +        */
> > +       dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
> > +       if (!dummy)
> > +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
> > +       if (!dummy)
> > +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
> > +       if (!dummy)
> > +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
> > +       if (!dummy)
> > +               dummy = PROFILE1_DUMMY_DEFAULT;
> 
> just a dev_dbg here, without assuming what default value means

And we leave dummy to 0, correct?

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
