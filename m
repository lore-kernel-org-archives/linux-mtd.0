Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E772AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyCftb5G4PRYJHrwmZfvpJtFn+JacWPysF2aZSiIl1g=; b=k3ztriN7R3ZxqaF0Gxdm4ncbSF
	J19RP80EnnerUaR+yfMYbBwgJrxM1HhnVEzS8/Y4pG0hEiaPDfp3Eunx1NJVDcrFG4OwumT38/dCQ
	Tq7BHQpu5I68IkA1hAxTM5mtjhSc8C/J8hYVbUw114tLQd1EOJpSJixCIEBoYKVevBvOBS2Pjgwmp
	fvrMO1IXzWJirMda0GG6ALE15yL+aPaQXgya9NTHEWn0gc0gdj4i1TCcLQS951FapRNqjjcFAyEnz
	D6ofCxK8i3UA74Kr3aQ+RsC9IlFJl1KK09XE2cqYYlnF7UJPiftJ9fXXC2BLRaWNQ48thmj9MopjP
	C0G4dvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNeD-008Xf3-Eo; Fri, 15 Jul 2022 15:54:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNe3-008XYK-0L; Fri, 15 Jul 2022 15:54:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE814B82D32;
	Fri, 15 Jul 2022 15:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4EBC34115;
	Fri, 15 Jul 2022 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657900456;
	bh=5daCr9QK24Hj+RUwhhq6jII9Hqcph8xnR3ZzTxWqL1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYpNxXxCNO7Q/dPoOq3aAeCPsQ3Az8oDxckCVf2lTsgFb1OwUbsRgPl7L32GEa4YC
	 9t8kbfwtOxmJGEVdh7pR6jQjjBzEamEfqblSQtxndBRnmhX+emy6GsfUAjk7BavTEp
	 ooh+TU5bskMLvEd2hQwsBkvqG0pkqbGkJ/hb8CyRagp+RHHonYcGJMbAfpymKp3zV7
	 TDntmKYo0lSQoD62KovtiMX8SD2u1uI+29K3PYjaAM3ZwrsRWvaZbY+jAWW8nOGm60
	 AgCOZb9EOmrR702cJ8fKuW+WKT0lVV6A4hnImGxj/qyI5hA6dhoI8fgmUbPlxmMiiu
	 AZAHUibkIm5Hg==
Date: Fri, 15 Jul 2022 16:54:05 +0100
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
Message-ID: <YtGNnT2cP5HIayp3@sirena.org.uk>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
 <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
 <YqHfccvhy7e5Bc6m@sirena.org.uk>
 <DM6PR12MB2809F6C7D80B60556218D627DCB59@DM6PR12MB2809.namprd12.prod.outlook.com>
 <YrRXTrYN3BuShbzg@sirena.org.uk>
 <DM6PR12MB28091BEB013B6F1903B5CDE3DC8B9@DM6PR12MB2809.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB28091BEB013B6F1903B5CDE3DC8B9@DM6PR12MB2809.namprd12.prod.outlook.com>
X-Cookie: You dialed 5483.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_085423_365375_79298469 
X-CRM114-Status: GOOD (  17.80  )
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
Content-Type: multipart/mixed; boundary="===============7544375252364031954=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7544375252364031954==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WLnYk1lIzSJ4ADtF"
Content-Disposition: inline


--WLnYk1lIzSJ4ADtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2022 at 03:35:49PM +0000, Mahapatra, Amit Kumar wrote:

> > That doesn't address the issue, the issue is checking that the driver c=
an
> > support multiple chip selects.

> To address this issue, in spi core we will check the number of items=20
> in the "reg" property of the flash node(which is nothing but the=20
> number of chip selects) against the "num-cs" property of the spi=20
> controller(which is total number of chip selects supported by the=20
> controller). If the number of items mentioned in the "reg" property=20
> is greater than "num-cs" value then we error out.

> For eg.,

> rc =3D of_property_read_variable_u32_array(nc, "reg", &cs[0], 1,=20
> 						SPI_CS_CNT_MAX);
> if(rc > ctlr->num_chipselect) {
> 	dev_err(&ctlr->dev, "%pOF has invalid 'reg' property (%d)\n",=20
> 							nc, rc);
> 	return -EINVAL;
> }

This would check that the controller has at least the number of chip
selects specified but it would not check that the controller is actually
capable of using more than one chip select at once.  We should be
validating both that the chip selects are available and that the
controller can do something useful with them (and probably have an
implementation in the core for doing so via GPIO).

--WLnYk1lIzSJ4ADtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLRjZ0ACgkQJNaLcl1U
h9DvNgf8CXWe2TL7deZzQsKFmwm4r44oFp98ORLdX9fjwHjXyvyWACyJHEKdf/DO
Tpngc2qCEoBpumurCNRrB8sUI7w6GoikYd0Q25+u6ggKF1Qr5bgkPr+jWVyEx9PY
XoJDU5nqv7GTLDkc88KG1pf3yyebiJfkyG1ZckcE0Gi7CMtVjTbPTJ9D+wFptMQM
FiHctGpxjWx6GNDefyyO7Rdc7f0brEiDy5WoRoLGRlF2RoKGOEUtjtPBNkoFQVSl
ldtIrzip4BxzLTfeDayqEyi2MRHqYlpYCH6gtlMVsRGwNq2fNejEa3KhSo4evar3
vql8mcvRgsrJgTDzC/aBH1VojkTC0A==
=AAV5
-----END PGP SIGNATURE-----

--WLnYk1lIzSJ4ADtF--


--===============7544375252364031954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7544375252364031954==--

