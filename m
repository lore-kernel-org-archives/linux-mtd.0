Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272B606A33C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SkMD957/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S4yOTFXY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Euu5mLMbylCusjZT6NvEz9IYXhZ0jo+iyNfDlDYfaq0=; b=SkMD957/Xt+zlyzBBz92CV7bEk
	6pf5h+TaxDHVe1ICR+FnEb8PDWArvsm6+/cKqQZn1JrWPHil4tq7qV2P8hS1mMkXh/HjWhhtqz8u/
	GorYuNJNPdYgBVE5G8+oVKGNrjBWkpbekB3qZ7N36se9ibNCx+fwhO9rRuiSM0dpLCIRI5aHMAKGZ
	ZtXd/jH9/CdMTKi5t+r/PGIQsggujNV0x94sPHt1FKd49PrB3HmUoNGPxz1BQ0hiu7xMLKQFS6rQT
	HVBJhR7jtUY/HiNlyRF3VFxkmop8Ko/YmE0EpNfWSnlEzhsSdVcgwDTq94IOObO6Jbd3vZV5tg3Wh
	ovD3BfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSm6-0000000Fmr0-0SQS;
	Fri, 20 Nov 2026 17:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSm4-0000000Fmpr-493q
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:51:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 630BD4344A;
	Fri, 20 Nov 2026 17:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF9B1F000EF;
	Fri, 20 Nov 2026 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197107;
	bh=VHowywnwgv+szuq/ds/5JQJQAxBZ3BU/Sr0rag1oQY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4yOTFXYlPAlAIiC5FyJq7AOziX/S0z49HZo9jiyPKwgkYqUlrBuu+3lLQKIakzZ0
	 iwblUOgnJxS/D9h/p2r8vtbqmQnpkkk/Me5GfrjSVLTkgmjEXQ+1zRMVj/rAv2fFFb
	 lN+i1hwYAZgM75bievOWLUefk0lX3VwWB+hyXKJMppgyJv3OGdLaRtGlJ2p8WwdI3M
	 LBaXI+gmTHcd3y9Fqd2Ni3zi5cxogQJyiYqhV8cUgodMKDGo9iyk/q8+LTKZuZJ/6g
	 IhCQcabIjHTIrpW9ad/kIVgwwNZQezu810bzM1t+smHFYTMF5hhov5KD7d8PzK5eYC
	 3KdSl75Wu6qdg==
Date: Fri, 20 Nov 2026 17:51:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 00/11] mtd/spi-mem: Enable DQS control
Message-ID: <164905f5-2857-4b8e-8d99-26939b45cde4@sirena.org.uk>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
X-Cookie: Error in operator: add beer
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1039403227680098862=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1039403227680098862==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PdZCEK8gmvk4jFLE"
Content-Disposition: inline


--PdZCEK8gmvk4jFLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2026 at 06:14:26PM +0100, Miquel Raynal wrote:

> This series applies on top of v7.4-rc2 and Santhosh's PHY tuning series.

Please don't send patches that depend on other in flight serieses, it
just makes things much harder to manage.

--PdZCEK8gmvk4jFLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAiK0ACgkQJNaLcl1U
h9Ah6Qf/RSPKeIR2si02KD6m/Vb6Ibcrg5ntfGu/YQWagtnyfUCD2YgLZPVCaibq
5HEpnLW02XdEZPlF8xN/6shfowKl5Eav9AuUiohzs7OYcyixiXsYuy309+QY7YBC
Dx96JtZAZz8UWSl7rez096kAoGQCdgxPsPKcAjijy/VQx18DLYsk4vLaQWS0JFME
cj1EZJ0sEpwKqPeqMp6N8Yiuq9jZBPhTcPb2itQ28aiUPi3lbJmR8MIQ3x9mZ7R7
u8S8+J3UrCn6r8F+Pmb6Xbar6GUcg20QFftZOkM9ani8OYvAemvmzc6lsU7I2oAX
yL0aRjtXvOftIAnWFevvA5sjuznfqg==
=S1p+
-----END PGP SIGNATURE-----

--PdZCEK8gmvk4jFLE--


--===============1039403227680098862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1039403227680098862==--

