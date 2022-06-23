Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FEEC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jun 2022 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5p1OQ2LlLo0ZzuLRVx6E0n7uzMrHrqcL0XUKHI3i18=; b=xBg9i5m7su2VYkv8skltEmB6GI
	zpBuwEmrlFYbsDdq+g0PCm3ZKl7whuzrQ7YRvhPeZ8k+HNTrIfODfLQt77kHe8tFiR64q+dCn+eIo
	Le9N4i/344AzsSli4rhrfD1Lsh71iUVboNQDRVi99tHwdIQSGK/xCELMqgh3dt3hn/CQDkUx8oQW+
	7s0csZSaLFEh2JsFfONfDsSq8ZAtZvOiGneD8VBYhBwjtXaesYQ8Zef9EqiIju2ISmHPNeQuEghDu
	WD0PvSOutDSWZFwwK00AaV2IGxxb88wf08fQkK4iWi9ZkG1TcXgQz1W+l1FjfY5ZDacrjccK85K0H
	xRBXfgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Lky-00Ewsa-La; Thu, 23 Jun 2022 12:16:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Lbj-00Esse-Kp; Thu, 23 Jun 2022 12:06:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E187B8204D;
	Thu, 23 Jun 2022 12:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EBAC3411B;
	Thu, 23 Jun 2022 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655986004;
	bh=prkXv/FDwz/GNUNq4CHR2FoAxl/6BZb1iYEJL1xkbaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFnXBFdhJh1lEppnNulL0vqhHWZWx3C8ZD67sU1TgrAwaYtOH4/87ZNE3kfl6RhGY
	 VprvQ0XT8HPsHF/VKWzTXJ3s6oquywH0ZdvixsR30Exe3b3QkNLud0IilTZLokMLI+
	 0a19osOwz6YrhaCp5r+2yJX/4eNELQIosHptPcP5RddDIrRBywULlaufWQUIK+E+83
	 du/wLbirZfbF6ACqL0YrxqvEcdIHToOL1uloveFoRRLCT4+TTMRwpwKCNNS6s6ceWg
	 rwcFLM+ve6t0AR/d4fCFB4r0JK6cdnmyX1j0lYaT+9NHLKtdZDP2zCnQaVJqNUvP90
	 /gkdWTIiOvzAQ==
Date: Thu, 23 Jun 2022 13:06:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"git@xilinx.com" <git@xilinx.com>,
	"michal.simek@xilinx.com" <michal.simek@xilinx.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
 device
Message-ID: <YrRXTrYN3BuShbzg@sirena.org.uk>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
 <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
 <YqHfccvhy7e5Bc6m@sirena.org.uk>
 <DM6PR12MB2809F6C7D80B60556218D627DCB59@DM6PR12MB2809.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB2809F6C7D80B60556218D627DCB59@DM6PR12MB2809.namprd12.prod.outlook.com>
X-Cookie: I had pancake makeup for brunch!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_050648_095468_47F744C8 
X-CRM114-Status: GOOD (  21.50  )
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
Content-Type: multipart/mixed; boundary="===============6341647650299868161=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6341647650299868161==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GX1MXlGRjMnY7i3+"
Content-Disposition: inline


--GX1MXlGRjMnY7i3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 11:39:19AM +0000, Mahapatra, Amit Kumar wrote:

> > >  	/* Mode (clock phase/polarity/etc.) */
> > >  	if (of_property_read_bool(nc, "spi-cpha"))

> > This is changing the DT binding but doesn't have any updates to the bin=
ding
> > document.  The binding code also doesn't validate that we don't have too
> > many chip selects.

> The following updates are done in the binding documents for adding multip=
le
> CS support:
> In jedec,spi-nor.yaml file " maxItems " of the "reg" DT property has been=
=20
> updated to accommodate two CS per SPI device. =20

This is a change to a binding for a specific driver, this is changing
the SPI core.

> > I'm also not seeing anything here that checks that the driver supports
> > multiple chip selects - it seems like something that's going to cause i=
ssues
> > and we should probably have something to handle that situation.

> In my approach the chip select member (chip_select) of the spi_device str=
ucture=20
> is changed to an array (chip_select[2]). This array is used to store the =
CS values=20
> coming from the "reg" DT property.=20
> In case of multiple chip selects  spi->chip_slect[0] will hold CS0 value =
&=20
> spi->chip_select[1] wil hold CS1 value.
> In case of single chip select the spi->chip_select[0] will hold the chip =
select value.

That doesn't address the issue, the issue is checking that the driver
can support multiple chip selects.

--GX1MXlGRjMnY7i3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0V00ACgkQJNaLcl1U
h9AeAgf9E2LUCkDCU4E/2lFo/mvDwRRmJroZIW6fnmZOrL88syRRlTBEw96cjlS2
cgtKnuJ8e5/r4IMyfvsZJHClZeZS21E1T0gXmiwtc1XuU7IVYVXQwo2ym0ifW0TU
+9pQUS+jkxcAbrSW2b6JnvwS9vHL+8XM9SgJdI53BjPqiwU2S0PJH3S+Cgfk8JYU
/KRGRLoSSn6sKLxosXks+8wzQ9hLuEOWo/RuqPAhL7vsqU7CON4YYnljmdY4cjlW
QgGEvIjq7CmOJ/Z8gPm84gA2Fr8Z7B1c8CfqRr2CxGUCSWa03xHKyGu5PcYrUdRy
42MCtduzSpT5hAJ3WXITBE2g0LGQng==
=2Knv
-----END PGP SIGNATURE-----

--GX1MXlGRjMnY7i3+--


--===============6341647650299868161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6341647650299868161==--

