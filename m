Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5452C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rReCVstd+GmZXlumCfO/UWhgkNW5ZRwlrttaScuFfzw=; b=w+vQSicjfYcLGz
	fXKp9vviaE+C5PUPsM5rwP2DMKurPg3uqBfriBwCm+uVANadYh+gKcdGdOxrphjQXBEwDs9vPPR+T
	9tQpR1AYmQX3ezhEboF9znfG5B9mxmYl3eR6CC4NLcx8/O/2q+POwaxEHo0EVtzYsIuAZuj7fns/b
	2LOoYI8Wi8D5cpJrrYNT3QsRKHdXk4vopdkjFH49YZNCn1ta1Sjffy6QmK+BskR82i4/XA+b4+Egw
	E97WRTyKNofoB6aA/YrIq9Zugm2iKAowRGsMPutQQrl7jJvnwlvKsJw0+X6q2M681d54SPz9BOZYN
	mOUeru/FM5AkRZ0idAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzc6x-006Keh-AT; Tue, 21 Dec 2021 10:11:11 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzc6r-006Kdk-Ff
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 10:11:09 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BLAAuYd113637;
 Tue, 21 Dec 2021 04:10:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640081456;
 bh=MyTlXd+JvUH2f7zfJ8YonT0PYM6b5k65iBjzl1xz2j4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BtrlC1MYqQ+wyBMILyM9+4bvF3nlYddhZQKAWdn83t43STov52Qb8tdMRQAf/MeGo
 OQ/0J26AeODoeYxaEruM1o4fqGXpKGzELGIjE0HPn0u5PxhmmW11kKphGJwWvSrgNY
 A4twlYg3IP1xM3Ha5S1aS/kzr+QxNvavggBql8JQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BLAAuaw107091
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Dec 2021 04:10:56 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Dec 2021 04:10:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Dec 2021 04:10:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BLAAsjF055112;
 Tue, 21 Dec 2021 04:10:55 -0600
Date: Tue, 21 Dec 2021 15:40:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 06/14] spi: spi-mem: Kill the
 spi_mem_dtr_supports_op() helper
Message-ID: <20211221101052.rgcikxeh3aygdjgh@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-7-miquel.raynal@bootlin.com>
 <20211220185840.ox5hs44hej6nhkxo@ti.com>
 <20211221105803.1596cf89@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221105803.1596cf89@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_021105_655387_19C82289 
X-CRM114-Status: GOOD (  31.18  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/12/21 10:58AM, Miquel Raynal wrote:
> Hi Pratyush,
> =

> p.yadav@ti.com wrote on Tue, 21 Dec 2021 00:28:42 +0530:
> =

> > On 17/12/21 05:16PM, Miquel Raynal wrote:
> > > Now that spi_mem_default_supports_op() has access to the static
> > > controller capabilities (related to memory operations), and now that
> > > these capabilities have been filled by the impacted controllers, there
> > > is no need for a specific helper checking only DTR operations, so let=
's
> > > just kill spi_mem_dtr_supports_op() and simply use
> > > spi_mem_default_supports_op() instead.
> > > =

> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/spi/spi-cadence-quadspi.c |  5 +----
> > >  drivers/spi/spi-mem.c             | 10 ----------
> > >  drivers/spi/spi-mxic.c            | 10 +---------
> > >  include/linux/spi/spi-mem.h       | 11 -----------
> > >  4 files changed, 2 insertions(+), 34 deletions(-)
> > > =

> > > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > > index e137b1ec85d4..67d05ee8d6a0 100644
> > > --- a/drivers/spi/spi-mxic.c
> > > +++ b/drivers/spi/spi-mxic.c
> > > @@ -335,8 +335,6 @@ static int mxic_spi_data_xfer(struct mxic_spi *mx=
ic, const void *txbuf,
> > >  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
> > >  				     const struct spi_mem_op *op)
> > >  {
> > > -	bool all_false;
> > > -
> > >  	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
> > >  	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
> > >  		return false;
> > > @@ -348,13 +346,7 @@ static bool mxic_spi_mem_supports_op(struct spi_=
mem *mem,
> > >  	if (op->addr.nbytes > 7)
> > >  		return false;
> > >  =

> > > -	all_false =3D !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
> > > -		    !op->data.dtr;
> > > -
> > > -	if (all_false)
> > > -		return spi_mem_default_supports_op(mem, op);
> > > -	else
> > > -		return spi_mem_dtr_supports_op(mem, op);
> > > +	return spi_mem_default_supports_op(mem, op);  =

> > =

> > Does this controller support mixed DTR modes? If it doesn't then it =

> > should reject mixed DTR ops before calling =

> > spi_mem_default_supports_op(). Anyway, the current driver doesn't check =

> > for it either so this change does not make anything worse at the very =

> > least.
> =

> The Cadence SPI driver does something like:
> =

> all_true =3D cmd.dtr && addr.dtr ...;
> all_false =3D !cmd.dtr && !addr.dtr ...;
> if (!all_true || !all_false)
> 	return false;
> =

> This basically rules out any mixed DTR operation.
> =

> I believe Macronix code is inspired from this function, but they
> intentionally dropped the all_true check, making the situation boolean:
> either there is at least one DTR op, or there is none. So I believe
> this was done on purpose and this controller supports mixed DTR ops.

I see that your other patches in this series touch this driver so you =

should have the datasheet right? Can you look and see for sure if it =

does? I am fine with the patch as it is but if we can make the check =

stricter it would be nice.

> =

> > Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> =

> Thanks,
> Miqu=E8l

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
