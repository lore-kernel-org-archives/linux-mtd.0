Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08017C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2024 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRoc1E2vzfYtzfc8gUYDkV1gwCrjlpYkhSb+/6N7S34=; b=Uc6aRzIifbtrWjs7B0JBof2BnY
	uegBgL+uxRBOXs2/txTqB3ZRfRTyS9uNAeSb4RSCwwPz3dNoMccHmzolLqz2Al3pYmPN5SIu5XMDz
	2IuGAbTx8bOkQfPBxcRrPJuhxjA6+3QoMvuYgOUuMA47pfLsKo7Pc5KMhVALYKhRirQTDHCVDGXEt
	zhWQekruyyCulIzXLMFh72X4e20L2Zg7uqyxA/zW1X88dbhbI+JBHXApziSuBaItIOMME6tryIwOB
	mGIvBXwl0qYzXXEDboOhNBnqVaeCBVoikh379MtHsxNTBq2DFnI3fJ6+pTL9jKcrXf07Z3zFrHCM0
	A6mswy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RM4-00000002zYP-1xDx;
	Mon, 29 Apr 2024 13:47:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RM1-00000002zXY-0z1O
	for linux-mtd@lists.infradead.org;
	Mon, 29 Apr 2024 13:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CAAC60DBB;
	Mon, 29 Apr 2024 13:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A29C4AF19;
	Mon, 29 Apr 2024 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714398456;
	bh=YTDBu7i4Qm3uWNrBtZ6iNRK3KTpA55FXccHlI6B3vMM=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=Xv72g4GlaEdk3wBng8Z5HiexlLCD8loaMEjgufAWr7g/rzguM8zgkXjP2Fvhf0W20
	 380Us1/2fnsnNAemrg0MlTNuE65w1ocXpnyyfiOl0kkndIS7NAruS5J8auWZdw3Z+y
	 o1nY4Go5/KENX23/KTMwixIjLdlVVinVGvWKPy1MvF+cYDB4jAdJT5MMEgYKXM2E4a
	 XYXVFEaTxcih5FnogwMYiq6RBhloy1E/y1BpYA/Bdmx+SMFK54oddp1pOlQvnMpJNR
	 OQs/fn7d7rlkRru4/xBUW34o6dcF05Bvu1YnVkaMyRnEDqBFFdqeFBqzBrePWoownx
	 dqsqHedEUh2QQ==
Date: Mon, 29 Apr 2024 15:47:13 +0200
Message-Id: <D0WNIVK1DBL5.3KQOD1K2O128P@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: replace unnecessary div64_u64() with
 div_u64()
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240429121113.803703-1-mwalle@kernel.org>
 <mafs05xw0cn8v.fsf@kernel.org>
In-Reply-To: <mafs05xw0cn8v.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_064737_352124_F78E82C4 
X-CRM114-Status: GOOD (  14.17  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3435875218670688911=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3435875218670688911==
Content-Type: multipart/signed;
 boundary=835c43056ed51c66bddab6950631070232af469583daba94213c5b42a3fe;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--835c43056ed51c66bddab6950631070232af469583daba94213c5b42a3fe
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Apr 29, 2024 at 3:27 PM CEST, Pratyush Yadav wrote:
> On Mon, Apr 29 2024, Michael Walle wrote:
>
> > Both occurences of div64_u64() just have a u8 or u32 divisor. Use
> > div_u64() instead.
>
> Does this improve performance or is this only for correctness?

See function doc for div_u64():

 * This is the most common 64bit divide and should be used if possible,
 * as many 32bit archs can optimize this variant better than a full 64bit
 * divide.

> Patch LGTM otherwise.
>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>
> BTW, I also noticed that there is a do_div() call in spi_nor_write()
> that also uses a u64 dividend and u32 divisor. I was wondering why it
> uses do_div() and not div_u64() (I am not sure what the difference
> between the two is) but I suppose it doesn't matter much since your
> spring cleaning series will delete that code anyway.

do_div() is a macro and is modifying the dividend in place, whereas
div_u64() will return it. do_div() is using u32 for the divisor
anyway.

-michael

--835c43056ed51c66bddab6950631070232af469583daba94213c5b42a3fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZi+k4hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hNLgF+LlPVrs+XYNoNPY3HJktt+35X6xG0B4sa
6xZL8RX95pozeOpjBoMygK1kDKUwqFOMAYDKZIyCD1kN0n0Wj7tiRpY/YCRQJjxd
yZfQNMubH2WhzSpI0oA45LJLEfYadWaoCqg=
=2oCk
-----END PGP SIGNATURE-----

--835c43056ed51c66bddab6950631070232af469583daba94213c5b42a3fe--


--===============3435875218670688911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3435875218670688911==--

