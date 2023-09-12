Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80489CA0EC3
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYa9OssZ7oQyd9JJBwn1w8FP787IysxNabwq2qQFGd0=; b=Pwilz7thnXpCggbEeHL8VRRhvJ
	LbYyE7p1Ea95oz0GXtn8ZrFQPul8UbBRlt2EMtHxuqVsmhwwBF9+UKuZPqoUjfAPzUErLFJUC383w
	S490KBxs7m2TIHV7Bv/EEnG/NukKZK1XQZ3CVAYK0xyLL6FyBtn8Eaqj7IXQLTh8VNefk5M5tu9aq
	m1ogydev7+8woblASXt1HVP7mwbVzrb81F6Ma7TIEfLbHnOUc3YWkgcyVvPWtidwumzxtjEN7PjKk
	xBAJduragothZjkIEZmXK7tnq1x6sxFE9uo4MIB16GbB8V0z/BSAOR5KkSMooHG0C+BH5rdSRKyyy
	PaoZTTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3Zj-003S9T-1l;
	Tue, 12 Sep 2023 13:37:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3Zg-003S8e-1g
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 13:37:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93CCB610E8;
	Tue, 12 Sep 2023 13:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046EDC433C7;
	Tue, 12 Sep 2023 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694525822;
	bh=wYJ8yKp7ajfNaJDIcAw7/RR8MBJtt232urChN4s3j4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INT9NgEkljBpOIgEmZBC7z4jC0vurEx2ZraXAr8zyISwMkv0cmbtSAW/6KTC9s8kM
	 0HAs0wg1JQaHS0t40xhMmBBFHgHXnidlpMQNhM6shALUq98LkQ1ORt+iPZtHeH7bM8
	 odwrpsuS3pqvJ8tAMDBeatrI4VVH7ks2qU1d+3R3bSEnW6hOJ/JPTZX6IiLN+LS+vE
	 wYw1jEtTmcLaQLCvTyFvaYOSWSGB6ADoklo+O8gGvl1lBlAn+LGhXQJO848OZXEu9Z
	 +XYcWB78Ns9yvfFH2FXD+mqB64LaJbkTU7aEIAKoGBK4tN5jrmo/BFTDdiQ8wip6u1
	 JjyOex+qcxerg==
Date: Tue, 12 Sep 2023 14:36:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"Lubart, Vitaly" <vitaly.lubart@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Message-ID: <ee4a85be-aa87-4c40-916c-0a796688ad6f@sirena.org.uk>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
 <20230911094233.326fd936@xps-13>
 <CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <0d60a78b-0305-4cb3-babe-4eefe5001b29@sirena.org.uk>
 <CY5PR11MB63667AB9958A23970B4B0D3EEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <20230912152102.0dfe7558@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230912152102.0dfe7558@xps-13>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_063704_601317_34CE643D 
X-CRM114-Status: GOOD (  16.93  )
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
Content-Type: multipart/mixed; boundary="===============4493541775288398802=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4493541775288398802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+a3x98bDpQ9nV2FW"
Content-Disposition: inline


--+a3x98bDpQ9nV2FW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 03:21:02PM +0200, Miquel Raynal wrote:
> alexander.usyskin@intel.com wrote on Tue, 12 Sep 2023 13:15:58 +0000:

> > > No SPI controllers are directly visible to userspace, some SPI devices
> > > are selectively exposed but that needs to be explicitly requested and=
 is
> > > generally discouraged. =20

> > What are the options here? Explicitly request exception is the one.
> > Any other way to add access to flash memory connected in such way?

> Register a spi controller with at least spi-mem ops, as suggested
> previously, is the standard way I guess. If you're not willing to do
> so, it must be justified, I guess?

Right, we already have a way of describing flash chips so that should be
used to describe any flash chips.

--+a3x98bDpQ9nV2FW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUAaXIACgkQJNaLcl1U
h9CtlQf/ecZXfTuYSyrp160gqtjUDltFUZ1D+eyXQQzPBrVS5xcbfjG6vAY5AIDf
Mi9qaTxAr9RbQ4EGfFT8TmiYbehg11PgPWhbTRhyJKyUfFVcZ5ntLtlsRlG3PMzS
7xlh/V6Xd0pSkawDpw/ebglHJt2Wt4ubMDkFYd6c9LhAJdcNPsuD8uG8+YSn2+Ze
V0j0cOsj/5kBwn2dcRT3PMbuwQ4OW4cPXlzZ3QYfz4cXdVjkKVe+CArF+/27+lC9
GhYIqznR59b4BIA11gXAfW02slKJ6Ot8oKRdS65ugv1vjF+AtDPS3lBMdTcZ+NzI
kgjSYoJHFM4/OX1br5DKalrItZdLfw==
=lE4O
-----END PGP SIGNATURE-----

--+a3x98bDpQ9nV2FW--


--===============4493541775288398802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4493541775288398802==--

