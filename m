Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C400DE6F088
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Nov 2024 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w77gNzKy7JHVnTtmvh4E86wYu0SWtS/JYbRmLz4OabA=; b=1o7CVHFcDPui2aS3ZhB+vzVv3B
	axi4q4jGXzXjf7HPD6K/6dHHRiXGKqlIaSIlzUOF34IFssnZn9ECLPIY93bj5JsQf5DcB3UyCC4Ql
	uudLywOMLUwOuoqLAFrdcUkIvG0Qp9uoodXgJ/4dIRj/uqkcnUQRE+D6Kk6yDs2Xu6VyFRkegdkVH
	5N66bdVz1RLHLiZTUcPOKVmKP96iwgb58cUDyme0FCCAJm7CvRMqhTglAhn7WIOfhOEj1aP2qG6rL
	/04TabATdsC2cQ4698Bqz+OuR18wSQXw9cjkYtdz7A0giQnvoSh32ttDAgIARo82PQKQcQf8iiYPI
	XGZ2OMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6y6F-00000008EOF-1t8u;
	Fri, 01 Nov 2024 20:18:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6y5V-00000008EF7-1rbx
	for linux-mtd@lists.infradead.org;
	Fri, 01 Nov 2024 20:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3DF25C58A9;
	Fri,  1 Nov 2024 20:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92945C4CECD;
	Fri,  1 Nov 2024 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492260;
	bh=DTMvimcaPJL7Uwv0Ncbed8oxLceIdgnzJxEcOPQzz0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRRjd1uzGdPH97UxA6QIE+UJHRmfNiWeTTusFWRUe2d5S3AmmxBHBb6co14uEdnlm
	 N154o7MAvQnlrTy6tHLLb8Lfmx317jFmWMasep24lVQNwcuvTTmE8TYgCyjjkfgquW
	 85Yt6kVHu0aNFn0GMU7xVPUu4/MCNqO/WCs5szyO7490cike3H+xUOT3+lims6lg96
	 ltpbmp4+Ub/eGb9lurv6pLiRkwV0tNlEit7F4nmSXJau/JFLLp30SQZTdoOBeT7VtG
	 8rzGcdGWT1Tm60RKy7AwQ6orEpDeT9BNBU+ACxI68m/CCiiGI1alVCsszxMRHeRBos
	 mZFvE26Jn0rTA==
Date: Fri, 1 Nov 2024 20:17:33 +0000
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
Message-ID: <586cf617-37ee-4859-a11b-67654d650380@sirena.org.uk>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20241025161501.485684-3-miquel.raynal@bootlin.com>
X-Cookie: We read to say that we have read.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_131741_551292_D7349D2B 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: multipart/mixed; boundary="===============2284721487679915735=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2284721487679915735==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R9v6F9gj3D0509P0"
Content-Disposition: inline


--R9v6F9gj3D0509P0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 25, 2024 at 06:14:39PM +0200, Miquel Raynal wrote:
> There are spi devices with multiple frequency limitations depending on
> the invoked command. We probably do not want to afford running at the
> lowest supported frequency all the time, so if we want to get the most
> of our hardware, we need to allow per-operation frequency limitations.

After applying this patch (I bisected the series) my Avenger96 board
started failing to probe the SPI NOR flash it has:

[    3.567876] spi-nor spi0.0: probe with driver spi-nor failed with error -95

Full job:

   https://lava.sirena.org.uk/scheduler/job/925156

I didn't spot anything with the code on a recheck but it's late on a
Friday so I've not looked too hard.  My other boards are all fine though
there's limited coverage.

--R9v6F9gj3D0509P0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmclN1wACgkQJNaLcl1U
h9Aqzwf+M4nDW7XRYbgeIzByr8yYSw9oapqWDeYjRlCHLC6wQgZ9h9kWLKw6xZ4V
Hxn/c9mAKJtjFZLynYIKtjtYskph0CgtVHuWDx6UfAbMOiHFjfoXLJISNNBpjzV1
VpZFT4bohJBqMbFvd4ph8Id+XUF6QgiKOIKEp8YPJxCOm7t+dHHNJ69K09acWItg
q+eK2fh53Fi1j/IG0lT5hitbLzM4MJsCGi7an+kdCgRqL11c/LFqTrD0oueGN5m2
EHULNgHt5J/5gBPTILkkTDhN6V1/ykmXI5UIYTkgYfTwpqzbGf1XmUf8wnqHpkl9
phi4fN1+Sq4ya+p6nLrGBC5Ke8GGQA==
=cWfe
-----END PGP SIGNATURE-----

--R9v6F9gj3D0509P0--


--===============2284721487679915735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2284721487679915735==--

