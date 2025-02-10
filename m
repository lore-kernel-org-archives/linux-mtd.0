Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084BDC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkU8rvrlVmW+eJ868tXfUOS9ZMySW320p/qI9yy6JO8=; b=t8sLyURpLSpwzzAndldovE2QCB
	PtOLvmder0kPOV6xBYweUqOMsPV1n2JszYZeCnXbdFoziumG3wW2x61tCFLiS6FJKodp/mJKx/4ec
	Kh6Roi5t7wrJdwZyfEOhA9jDC3n/ASFqosnvn7K2VTN5zFF4HGMtmPVJPRdt2LFnOSN9vXnQnzy5B
	GkzrOKs7D6QjXTEt4BF5Kx8fM8GI5JCGzQmo2v+7f/eXcIFH3tupq5+vpIXv6UTlB+rzJ+R+uEmQd
	fZP4GzoKX0CImAhcZnYNfPo6BIRX1VuH103ukhXCnIZ6naB4NLrq45A1YUYikz5GunWhbLO9CtGh5
	LCAr4n+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTPb-0000000HTyG-1Kpw;
	Mon, 10 Feb 2025 13:01:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTO6-0000000HTcM-3S7s
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 12:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1B95A41344;
	Mon, 10 Feb 2025 12:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A013BC4CED1;
	Mon, 10 Feb 2025 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739192385;
	bh=owpoSk7EuQEMFHDc/s6Anvm+qbdzkCtpH98wS+rR4qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L47QptUnYsLmPtLriLWk/mFFeLwNiicn+sgpWdC5JUSMTLZnSmIRzeQDhotnIur3r
	 T2PuqbTS/9961JLV3JPPepnAz8kzwwutEm5mDhmRhSHxuZH4PQnHKMkrLwb3GPOjHA
	 NpPVnElP0StXHHIoZj1w22xh56585gTSbrBY7+L57cEPFC6uCdNmrFC/MUkYw3SmRK
	 n5/QSF7k6FBHTpUbZ67QqyzIKpLf4ytrKpPtTZ0N6INEXGzBtjbEYsgzZUuU7v7aIl
	 JLWU2qWBoJkLmMZNXGQyO/SdAFBFganR7Bnr2lyPsoxWxMbx6VHV2JRJ0r/cgC/OB8
	 ON23cJ8tHySjg==
Date: Mon, 10 Feb 2025 12:59:35 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
 <Z6a_f03Ct9aB7Bbn@probook>
MIME-Version: 1.0
In-Reply-To: <Z6a_f03Ct9aB7Bbn@probook>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045946_992034_462B2B7E 
X-CRM114-Status: GOOD (  14.43  )
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
Content-Type: multipart/mixed; boundary="===============5159360088669655416=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5159360088669655416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Erlp5XHmWCbFSP4H"
Content-Disposition: inline


--Erlp5XHmWCbFSP4H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 08, 2025 at 02:20:47AM +0000, J. Neusch=E4fer wrote:
> On Fri, Feb 07, 2025 at 09:38:05PM +0000, Mark Brown wrote:

> > What's the story with dependencies here - why is all this stuff in one
> > series?

> The patches are independent of each other, except for the four elbc/nand
> patches. They are in the same series because they came up during the
> same project and achieve similar goals, but it isn't necessary.

Please don't do this, it just makes it harder to merge things since it
makes it look like there's cross tree merges needed when that's not the
case, complicating merging, and puts the entire series in everyone's
inbox which makes things more noisy.

--Erlp5XHmWCbFSP4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmep+DcACgkQJNaLcl1U
h9CQGgf/VRshpAxNRM+4y4pK3dFBOw1Ky/VAXan0LIOgCUmAP8+L3qoihpm6VZoz
o6W4ioH6XERLRHTxdkiieODuhDTDhXH7sNTVvzzLejKyo4DbHvQBsMo2X0+kEZ3X
n3ZFgc8GgqMbmv9EIVATYRnbBCUhhcD7EEZlTvxDDbErDipAGaaYMYTPsbMOZ1qY
WWHWlzndWagcVtYf4Qf5bx4FjpS97qnE+VS801C6WgxbmrOFcWrTga0hXVlhQeu/
V+FDM+XojBDbeAKOvkXZkHAybyY9U37wa0h0kmq6cDBuherZ5XdAXyw0K5uvqA4W
0ywZYqZ4Ucmy7mvcfUgmcUR9E3GnMg==
=m2SC
-----END PGP SIGNATURE-----

--Erlp5XHmWCbFSP4H--


--===============5159360088669655416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5159360088669655416==--

