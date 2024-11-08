Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3607D5C0C2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2024 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VE+7fQ7bfbXVV+aLalqC0F/9ZvQRWQEI/MzIdLOZrYg=; b=xTsz9hthPTonHxeoP7o+h/nF6x
	KoufQNd5e48BRFhu1sVqgCVtWKZNdwu60Dpo1QlHEMugp4ITionSTl0Y1m3INpFwkf7nagaReyJSj
	0CxBnduU2gtxAaKFmXKFgVcOnz19DwNI7/3/RZAjOdWslnihm+HXwvvl6eG6pPYaOzpC1SIolvKU4
	36T1BoY6n4+RupoZmAmXswNxg1z/GLgSPGJOhm3nY3NO0b17t0zBB8B/2YXs8OiAkKcGqDiGZT/xq
	QdmFXRMR6Fo98St1VuyB/rnhH6pk+5IubiobhGrWlYpvYFCIk8MNpWBSDasN0HSqckE4zXXWrRdRr
	bxygNJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Oa1-0000000AbRY-1eB0;
	Fri, 08 Nov 2024 12:59:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OZy-0000000AbQv-0YGc
	for linux-mtd@lists.infradead.org;
	Fri, 08 Nov 2024 12:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ACEE5C58D9;
	Fri,  8 Nov 2024 12:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B67EC4CECD;
	Fri,  8 Nov 2024 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731070749;
	bh=6kWrOSprHBdWpMGWOkcTlPWCrFTmXU5zNwwK77wqz1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOgNYNiBd3cqRb2XUKK4/2xgXjrSk2/EMXQyo8Xc6hea76iVOyQDsFuc2owXAvjey
	 beCaHqPjnce7ltswYhiPqDj5j6/9mmD6bcoTQ8pnqz6Pws+QpbeAt81dtJpNaYIiUH
	 lDzswaMIvWtUqh1t9tnloulT4d8xQm6JdM1LTNsZCW7jSP9eL79s7Kr2xYSm1SG/FE
	 pNIN5NFoeDa+ga5vrhHRzRX1rM8yZfliR1vkHQ1Ty41SN8H+LB/6WvQ5nYdIpUqz7p
	 8Vdp+vDWhSdxFrrTuSg8+AHzneGnAR+Za29QLI/8+UoRk/VOBB9Ebzjd026v1cQvgU
	 ibZChmgf8LYVw==
Date: Fri, 8 Nov 2024 12:59:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
Message-ID: <fa56bccd-b044-4fb1-be9d-dc143978ad3e@sirena.org.uk>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-3-miquel.raynal@bootlin.com>
 <586cf617-37ee-4859-a11b-67654d650380@sirena.org.uk>
 <871pznqqdb.fsf@bootlin.com>
 <f0ea6706-17a2-4500-b426-a53c836c52b8@sirena.org.uk>
 <87ttciayvo.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87ttciayvo.fsf@bootlin.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_045910_270402_5408A707 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Type: multipart/mixed; boundary="===============0554622293463662990=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0554622293463662990==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqiNPQ2PFHMUpvNQ"
Content-Disposition: inline


--nqiNPQ2PFHMUpvNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 09:55:07AM +0100, Miquel Raynal wrote:
> On 07/11/2024 at 17:15:03 GMT, Mark Brown <broonie@kernel.org> wrote:

> > Yes, that seems to have been the issue.

> Great, thanks for testing. I'll soon send a v2, but I guess that's too
> late for this merge window.

It should be fine at least for the core bits, the driver bits it might
be better to hold off for the next release but the core changes
shouldn't actually do anything until the drivers start enabling them so
they ought to be relatively safe.  That'd also make merging easier as
there'd be no cross tree issues.

--nqiNPQ2PFHMUpvNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuCxUACgkQJNaLcl1U
h9B4BQf/Y1K5ro5h+ed1EKxy1lpiWJ0TdiTK5iTOY6Kn8SpCmo3uaxRGzHlQkMk6
qNORE5be8GDO1Ovf5fVc1SnSTvD3IFV5lV2vxf96B6vADYo4OSmT9Z/zbwOiRsK2
ppracs+cE5EOiaj9L4nB7dYoN6kW0jxUCDGOWFP7xqQPwiEdsA8xbsGdHCSXRsQO
zURKPBj+BmGtq09S0u/01OKSO1X3aG5442ihzWReJm4CUWa+5j/KMendRv0UiRT2
VbUb7Dk+d0a04WinHleeh+Ik2R+chrrPK37Y5S7EZ/x2CLpF2V4kjJnS0lVWHQGw
I39ThnLWL22J8oNAfLJqRuaT1xaOIA==
=HuAN
-----END PGP SIGNATURE-----

--nqiNPQ2PFHMUpvNQ--


--===============0554622293463662990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0554622293463662990==--

