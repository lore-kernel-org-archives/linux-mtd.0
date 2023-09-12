Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658A2CA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+/GRTz2RzoG5Tdk84BkTWLMg+ZDKKgZPq/zly3bNkY=; b=zt3fGhlRqBGFFpMyTqsO338JrQ
	i/RQIFgz1FP9ctmCFe+CIOl7C+oyPL3NqawD7ORNminxQzCXm1autFUOyTAdF1ksFrrRgakF51Rh7
	+q2cyW7HkmPBL9K7xS9/q9u2GB56o2HcpQvi7C+LMBAfFV93kjUZDU05aVxZ/51RK26SG53SFZ+sw
	QnFkHCdb1C6HrkVNADDOYN/OEyDoGyfczxWl3LfzEzeXqfi9uyXyjYw14i6SWfZrDNfU/GG03qNUo
	nv8gl0WDhABNUaUv+fGS1zX/mulTJbD5BbPEeCcG82JpLWXf03157ibnBc3kHTXJsTrmRlqem6wId
	Phcs5y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2Hv-003J3y-0R;
	Tue, 12 Sep 2023 12:14:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2Ht-003J3V-1V
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 12:14:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF61060D29;
	Tue, 12 Sep 2023 12:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B434C433C7;
	Tue, 12 Sep 2023 12:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694520876;
	bh=XkmC7wK5Cc/UAqB4TBuSfa6MYKHMEOm7EQvizmgqOAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVwai/lZtzmhpP30W6mex7F/Nfm+WrGAkueHjspW5LDRArScWMNMZNn7+V7ykhMPg
	 1dPtNAnZDtVQV7TFxILZ1H0MsBUDZzciBv16NI4o1jkOHRJYlNN5YzH4DXBUL2pGj3
	 9lMPgpMUaCrciKUL9lebhyyKD8MGIiVaZQl89YdtCSSYwx/xNIH+lMffDRucHZUD/W
	 pzkqcFfKpXgKxTO6WZeDkCNLVkQmTKqe+zS9U/t6cw3xkLaRaghx39pf72eIcLAMaU
	 v/k3JZohIaLYH7wns1+pqiVKHteNrHhhD/OeA/fkbmntvx9g9whmguxwYSw6Q82rud
	 05XGxDZtr2rQw==
Date: Tue, 12 Sep 2023 13:14:29 +0100
From: Mark Brown <broonie@kernel.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
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
Message-ID: <0d60a78b-0305-4cb3-babe-4eefe5001b29@sirena.org.uk>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
 <20230911094233.326fd936@xps-13>
 <CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_051437_542908_51C56B88 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: multipart/mixed; boundary="===============8738728142250601982=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8738728142250601982==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uKDrHREIXSOB633X"
Content-Disposition: inline


--uKDrHREIXSOB633X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 12, 2023 at 10:50:22AM +0000, Usyskin, Alexander wrote:

> The spi controller on discreet graphics card is not visible to user-space.
> Spi access flows are supported by another hardware module and relevant registers are
> available on graphics device memory bar.

No SPI controllers are directly visible to userspace, some SPI devices
are selectively exposed but that needs to be explicitly requested and is
generally discouraged.

--uKDrHREIXSOB633X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUAViIACgkQJNaLcl1U
h9BBwQf9HEhBAYTf1p6rEEjFlaLKxvrdg4ZwS0HnCh7FR7EL1va8yFb1PT8hrn3e
e8q3vfqaz1J5L8wUITwS9oyKzKiwfwwDCxXipW9y0+TSjhFEme5/ravNtEvpXN+M
2hqbmCjp53gDQiz5KKj6F4XsfSHrmLrmCQ+4/qfj1CigXHnxOWuqKJ35tX9y+oDA
4tngywE43hiLIPNTrVFnocrYzviXWoAMpKjESJiXaD/uRQrLUyOi5cLKb9BJgBaG
PqETDDh+9R+G3Rvaa8vrr3UqbU0NxZtm/7FPKW1eTUm7/ferGcyMn2LCUH2G1jdj
u69lmZ5Yhy0LiLVvrL3Ol49IzrUkdQ==
=/F96
-----END PGP SIGNATURE-----

--uKDrHREIXSOB633X--


--===============8738728142250601982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8738728142250601982==--

