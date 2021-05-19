Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74441C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 19:30:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E33B61184
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 19:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E33B61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jiyrvy+FI9osJOiHPUQmCWKjN6LGeicgjB0stGEU5YU=; b=aljIyKMY0AMF7R24jGseIV9FS
	5yqt8UpSb+dqjVVs3ZRoaTKUTqiSnuh1QaYScf+7hjJ61RaPy0Jk/EXVhVgcqpykq+1BfJgRJjTKC
	Op5Ly5qlz1QVjSzDPsV3B72sYbFMH1ujXhmbx9O4RzXHB2kWYW68JX8ojZQKjINNwm9xuXLC5a/Fe
	GgUet4W49c2eqrT3vl9CKMU8Ug/sdQKaJij+XEb6BHuKcPEKVzcA3vQhIzegLpmhUWPUpYrZLk468
	Vgo3nO2cOrOvU+HfF9utb1G/0LIXOI2jgbrmR524Xqhidkf8jaasU17FWJOWY78RXVBnJAKggVJhg
	ictXy/1vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljRsx-004tVQ-5X; Wed, 19 May 2021 19:29:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljRj3-004rNb-KK; Wed, 19 May 2021 19:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CxcjeXZphMX8ikSAW2LO8uJN2ihmCuUCEEwRVbN9D64=; b=Fpn+rS7fPGgh5um65D8qoiXZXy
 0AFOmJVs106Vw4YILs8aRIrGdQg793Xv7XcFy0GfVukIdBvQkLxeP4us5s9J9sWCpzUpZVcivOXAZ
 fYggueCJPt4E73Qx/kw14ZWVc8zPKtUwzNcDRLsSOPQ3bqcvS1uMk1ETMXyzDL3bnhhKGO/dMab4B
 2MBxHRY0re5MNPvXoRyrvdAhHoc1GWduvoU6HMD/JTr+RYkhqiy558gQEukRJzj/89yJeFU/7Nq2t
 RDWdzn0dgEdoGsO+pCbm+v7kgcyGgOiK4FUFl80psV1M1OXSd+ybTM2SIjzZ0fI5DDrL4CMUrIg4c
 MC9VMo6A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljRj0-00FjFj-AE; Wed, 19 May 2021 19:19:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CC79610E9;
 Wed, 19 May 2021 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621451961;
 bh=CxcjeXZphMX8ikSAW2LO8uJN2ihmCuUCEEwRVbN9D64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rSd5m9KJyLTnId6P36+q7OP6uzbpi1F5D6EjClmCZnsqr8IO1MPqHe6OIIuMT4KGT
 KpPRqvNevSsYV1A/VFjEbTG9aBAu4AylNczwHnCAHhA/k4JnCp7So1ZmFCXohu1lvU
 XlHrJjrcjUpc3+2mhqHYkOUYmeMp5diczczM+DBI+QETaguAEYOEKbwvDXc/B4xaB4
 7Lgvww82oDmgsrLZSLWdAwznDoGFvZKODayku9Sa6lAjHcIHgRlTKm6y71fV3fENQr
 nbCW4brWMJRvJGz0vUwTWhYYvI3udKVUio3bOjzYPGXS43xQKRkEle0LyWPN6j4P+f
 9sErHwMiDcYow==
Date: Wed, 19 May 2021 20:18:36 +0100
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 christophe.kerello@foss.st.com
Subject: Re: [PATCH v5 0/3] MTD: spinand: Add spi_mem_poll_status() support
Message-ID: <20210519191836.GH4224@sirena.org.uk>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210518162754.15940-1-patrice.chotard@foss.st.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_121922_394430_6895BFC1 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: multipart/mixed; boundary="===============1965164897944876167=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1965164897944876167==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline


--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 06:27:51PM +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> This series adds support for the spi_mem_poll_status() spinand
> interface.
> Some QSPI controllers allows to poll automatically memory=20
> status during operations (erase, read or write). This allows to=20
> offload the CPU for this task.
> STM32 QSPI is supporting this feature, driver update are also
> part of this series.

The SPI bits look good to me - should we merge via MTD or SPI?

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmClZIsACgkQJNaLcl1U
h9DUugf+L02+HoVRB3gbN5ZpyjjoHmHs9up8UEcNStI4z5NEGfSDlLbFbODRNFlP
E3sFR+ORhCM9vziPNYxXzkt6iqlVMmxNDyKntLntzno7g3v37ycpdpo1EVfRqCst
Zgi7FauC4EhvCQcWdh4MZZJw27U8T/zhoGNK8X8J6+eZkz/TWfTPZETa7C/p31pB
F3+Z8Nfd6EFKMJ++dJLmjgDpQPkcUV8xdiQIqKAAQFp8GTWNk5bKk3rZvA35VNcm
ERAEJyYhESA4iIBzVQMTdsZp1mPZUW2zOWTMgYuqsha766iYTz1DcM3tCwtPs/4I
1F+iui8vnadvaJxuv0ckWb+cZpfCGA==
=WZaQ
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--


--===============1965164897944876167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1965164897944876167==--

