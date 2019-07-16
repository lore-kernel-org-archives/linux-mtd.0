Return-Path: <SRS0=2WOf=VN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6CCC76192
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 11:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C632173B
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 11:10:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BG/SbGlX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Stdaqrb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C632173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ga5JwSeDPxzdwnJ4iIO1ooEu+Hs5XINxFlT/5Vnj1Tk=; b=BG/SbGlXU9I5N0QlEr1iAkk3A
	WigEbg96inlSkzRv0+YA3hmolUfx6rXfJgZEOyf3CBVzqDyXtuDxnG8PDVgrxM9gtDja/Zrb1oxtE
	Homsm5BVvewx4wPJ7JAyU6r4AHvMRvgNch3QS8Rm2U/GJR16+hSDbbJnj7H9G26l0+Ja5O4E82awL
	A8jk/wL+2UxcPIZOGwzCEdDdAaiBjzSRG3ytxuQEYc9G/mzXEYjQcf91p4sJBxvx2X2zxu59XDNWn
	s0rfN1UbRefGF32Gr5w0rfEkQ7o4fT9OiD8MQd/OBuxNkz3ABqSA8V2nEafBqKw7Vokndiuv4Yf4U
	v4nwSu1kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnLLD-00077c-OT; Tue, 16 Jul 2019 11:09:51 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnLL9-00075f-Fc
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2019 11:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GTNttLKfykU0fMB8TWGXww71EUURBDV6zbj9y9y9CVY=; b=Stdaqrb4Nzvjz4Bj7OxsqHHhD
 +Td7CdZOlzO+ek+Wlj1/FC/WJHeQ9gSPUYQBkEz/5sipVYr/hPyWPqlS7cSDQnO+iL3ns21zEDaGi
 3VvzwyAvDJ+Chvj8tqRy5yeKmx6ZrWTp1EMApgzMNqNyFnCUcN19Mpy6CuXjZ4JswoqRQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hnLKz-0004Sl-R4; Tue, 16 Jul 2019 11:09:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9164A2742C01; Tue, 16 Jul 2019 12:09:36 +0100 (BST)
Date: Tue, 16 Jul 2019 12:09:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Ensure child nodes are of type 'object'
Message-ID: <20190716110936.GA5428@sirena.org.uk>
References: <20190715230457.3901-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
X-Cookie: May be too intense for some viewers.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_040947_560511_799BC1F8 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: multipart/mixed; boundary="===============8167274046766727766=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8167274046766727766==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2019 at 05:04:57PM -0600, Rob Herring wrote:
> Properties which are child node definitions need to have an explict
> type. Otherwise, a matching (DT) property can silently match when an
> error is desired. Fix this up tree-wide. Once this is fixed, the
> meta-schema will enforce this on any child node definitions.

Acked-by: Mark Brown <broonie@kernel.org>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0tsG0ACgkQJNaLcl1U
h9DgRwf/RVQwM4uJZfc77Bg1QUPRV93uCJ6maAGlUjFImP1U0fpoRuD/zNm5kiIp
hJhe5TMTX5ua+ajO5DV9S4HD4tRJBv5imHYgx7edGX0XnD6uBhO/Fx91okJhKb54
hmWEPpZyjursasR/A6HjQi6+OYEnCqrMoTenaZQZ/R7MlS8Z57C5m8slR9m1tSBp
xam5qvxG3pn5oNarJlCWF9VcVmZckekdU+qutRLVc3xH8bCF6pjfyR5E1M+qRJV6
av5KFLsTopgBECl4QPHGqIXqhegIjWyeqeMC69s7Nh8pDFpLIwFJfXd7x7UGStgS
RrPGZDcB2vfMfsXwQAGfu5lyMqkYJA==
=IEmg
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--


--===============8167274046766727766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8167274046766727766==--

