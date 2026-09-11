Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E72C88E45
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEVLqrCAfWdIyCWvWbcl+OlYu8pQG++LhlqybfFDcXM=; b=x86UAMSCwFW+d36T8pxoLTD5Ly
	XXPkHtmx4rXNTc+eQ03WYtFXETXCW/85tezuZ4/zbhSiIeGLa5x28qnuBOvoV3XsFYhJ7K3Jkdqfb
	lv9hDKE/s/rXL8+jVFq6fg+SMEPVudMlfwFy7mAi1CzYXQlewtYGIl6qsr7X95bFoShSPnX+tk6GA
	ymqIPvK2iGQg6o/UpjQNcXO8pESpng+umgi9KOkq956SeUz6jwieN9AUjt0xCDSLNX9vVO2pR4JX3
	xyAEnCmpxk+yBwSiC9Nuwd1fzTTlTDDYnn6Y3VnHlrIqbL/s84SrpLTrg+e6cEfAB8V46QgL2riMW
	5fajsZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vkA-0000000G24e-0Oha;
	Fri, 11 Sep 2026 07:32:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vk8-0000000G24N-1bFC
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 07:32:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 8C8F4601EF;
	Fri, 11 Sep 2026 07:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B797E1F000FF;
	Fri, 11 Sep 2026 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111935;
	bh=ZzDLyjy/8rt4GojjG6IKZ6vwVdI0G4dwLRnaYESoj7U=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=OwmiAGF/ad83I6IjbAzG1vAD6cQUdDUj8l/2v1CypFl21VraST4jSWqBbU71BUpTJ
	 1rHYHd9cUHtoNZbCfC0xJSQ7IdpkyqvhhZA/PuhK+cR7CLoPBxvHtUZwJq28w3BUm3
	 29T7NggqeOzV7UAssltSib4HDRb1KCAsgfd89fAR5hx+jvA/G+WD+c2e8ylZwidaqK
	 9+OpxR6NDrraGVjRHRxbrcJXGWM0fTWszuRSyfMVTjBKL+7Um4c9gtZdlJIQmBviAw
	 N/CVmQDaNAp5uqDlbT+xe/xMnzOW6c4zCDu2s8DxZpMDr0OAz1xr3M2hi4jKTFdv/E
	 gPViIZ9HAozuQ==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 09:32:11 +0200
Message-Id: <DLCB8YQF6G49.1YQJBPWBMZ6IE@kernel.org>
To: "Chen Minqiang" <ptpt52@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: allow force unlocking via DT property
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <2026-08-05171214.2934-1-ptpt52@gmail.com>
 <20260806113733.31042-1-ptpt52@gmail.com>
In-Reply-To: <20260806113733.31042-1-ptpt52@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6524052378196046490=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6524052378196046490==
Content-Type: multipart/signed;
 boundary=4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 6, 2026 at 1:37 PM CEST, Chen Minqiang wrote:
> Some SPI NOR flash chips (such as generic or unlisted chips used in vendo=
r
> devices like Tenda AX12L Pro) have Block Protection (BP) bits set in the
> Status Register by bootloaders or factory settings, locking flash blocks.
>
> Because vendors frequently switch between various generic SPI NOR flash
> chips ("Flash Lottery"), it is impractical to upstream explicit chip ID
> flags (SNOR_F_HAS_LOCK) for every possible generic chip variant.
>
> This patch introduces support for the "linux,force-sr-unlock" Device Tree
> property:
> 1. In spi_nor_init_flags(), set the SNOR_F_HAS_LOCK flag on the flash
>    instance if "linux,force-sr-unlock" is present in the flash DT node. T=
his
>    allows spi_nor_late_init_params() to automatically populate default
>    locking_ops without altering swp.c.
> 2. In spi_nor_init(), trigger spi_nor_try_unlock_all() if "linux,force-sr=
-unlock"
>    is set, invoking Linux kernel's native spi_nor_unlock() mechanism.
>
> Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
> ---
> v1 -> v2:
> - Set SNOR_F_HAS_LOCK in spi_nor_init_flags() when "linux,force-sr-unlock=
"
>   is present in DT, allowing spi_nor_late_init_params() to set default
>   locking_ops automatically without modifying swp.c.

I've given you feedback on the v1, there was no reply, so I'm going
to ignore this.

-michael

--4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqOuexIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hrUgGAukRRdtCACr9LIqwoWtJi1CwUZH+C0qZN
ZYxM3iKH8SYDHGn6eF7W1my5ebpLbiiiAX4rBV7ScNtHNztqk82pK2whLVWl31/B
qHDS9PKkFncD5+GPwAWjVU8MyZnG2WEbC9c=
=M7iX
-----END PGP SIGNATURE-----

--4411212e04818fb73d29c77707a3998c98d48509491f0db3f0c7977b0839--


--===============6524052378196046490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6524052378196046490==--

