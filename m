Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB37C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sam8dU4KaQmGxxtmmFnc5Egc4IBvoyc6ZqOjvudKGq0=; b=I0fesjgqIvqxSGvLuUHMjf75y+
	p3yXzfv5/n+KnHxd8jyiRBJ6GUZx8gxzL6qD7u3t4rlRguvElkTSbmY9Drh8Vhixx7gaqYwaWME9Y
	qezSI2niHJUSTlup6c4xO8ipKERB31G+OWOoTnvwSVl+98PGt4OZfk8iE1Ny4VFaZFWXe7qs1P5oC
	wPBBex9W+9Fqvjr1ZmJFT1YE1fpRe3B39yE9xRHaxxTDJqK2ewWL0zfI7p9REznYJ1xyivx7YT3di
	tRSCDLKSxtEonPdr6jfrLAE/IelA9CcGSBiRRdyT1NekssICKufFUczScfvrAXF21iKUDfHI9n4x5
	22KODdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxnG-0000000AvoS-0K6c;
	Wed, 15 Jan 2025 07:26:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxnC-0000000Avo4-30FE
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 07:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 585E5A4175F;
	Wed, 15 Jan 2025 07:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07D1C4CEDF;
	Wed, 15 Jan 2025 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736925981;
	bh=s7ksFoD/PqRd2O9wRPOKsmEaBFHXMs0QFuIKBQdmC7I=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=ti7jmkeK2s7uUVmgymsakoiQZssYQ7HivyLIgHp6+wpz7P4Atn5aL1KpAeFlp6YGq
	 DtY3DQcvHrfSAGhyFYWNhxq2/wIo/NOUjltxsm8D8KNpo1n95dxAv0Kc5ygT4d6KiD
	 SyEaNjtgKgN69HMViCOVl0Hf6oZI1Jn+LPOqKVzZB5AYrVX4Ckth4q7sd5ZF9E/qkc
	 E8WsED9Alpfd48G0j/LfwLlKWVDRO7Eh7jCLkHwiJ8WP/sTn4d1Ld2czSXTxWGV3jR
	 9+5BqszsQB9kC7bkB7xsnvoMHVdSUfcc8xFXLuq5+pXxgGF+K2qCZpcb5YDXRFb0Oc
	 Xt85+GDnmRzNA==
Date: Wed, 15 Jan 2025 08:26:11 +0100
Message-Id: <D72GVBSZNP5J.1NMQYXQ4SZLNF@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
Cc: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 <tudor.ambarus@linaro.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alvinzhou@mxic.com.tw>, <leoyu@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>, <stable@vger.kernel.org>, "Cheng Ming Lin"
 <linchengming884@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20241112075242.174010-1-linchengming884@gmail.com>
 <20241112075242.174010-2-linchengming884@gmail.com>
 <3342163.44csPzL39Z@steina-w> <mafs0zfjt5q3n.fsf@kernel.org>
 <87wmexp9lh.fsf@bootlin.com> <mafs0ldvd5l2k.fsf@kernel.org>
In-Reply-To: <mafs0ldvd5l2k.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_232622_886726_72EEB38B 
X-CRM114-Status: GOOD (  23.62  )
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
Content-Type: multipart/mixed; boundary="===============0349087539075897595=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0349087539075897595==
Content-Type: multipart/signed;
 boundary=8424e5f124607425b50bbb8b9c6837db20f9d6f50f7d8ea68da8b2a9e0fc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8424e5f124607425b50bbb8b9c6837db20f9d6f50f7d8ea68da8b2a9e0fc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> >>>> --- a/drivers/mtd/spi-nor/core.c
> >>>> +++ b/drivers/mtd/spi-nor/core.c
> >>>> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor =
*nor,
> >>>>  		op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
> >>>> =20
> >>>>  	if (op->dummy.nbytes)
> >>>> -		op->dummy.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
> >>>> +		op->dummy.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
> >
> > Facing recently a similar issue myself in the SPI NAND world, I believe
> > we should get rid of the notion of bits when it comes to the dummy
> > phase. I would appreciate a clarification like "dummy.cycles" which
> > would typically not require any bus width implications.
>
> I agree. All peripheral drivers convert cycles to bytes, and controller
> drivers convert them back to cycles. This whole thing should be avoided,
> especially since it contains some traps with division truncation.

Here is the relevant discussion:
https://lore.kernel.org/linux-mtd/f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc=
/

TLDR: yes, please use the notion of (clock) cycles. But there are
some problems to solve first.

> >> Since we are quite late in the cycle, and that changing
> >> spi_mem_check_buswidth() might cause all sorts of breakages, I think t=
he
> >> best idea currently would be to revert this patch, and resend it with
> >> the other changes later.
> >>
> >> Tudor, Michael, Miquel, what do you think about this? We are at rc7 bu=
t
> >> I think we should send out a fixes PR with a revert. If you agree, I
> >> will send out a patch and a PR.
> >
> > Either way I am fine. the -rc cycles are also available for us to
> > settle. But it's true we can bikeshed a little bit, so feel free to
> > revert this patch before sending the MR.
>
> To be clear, since the patch was added in v6.13-rc1 I want to revert it
> via a fixes pull request to Linus before he releases v6.13 this week. I
> want to fix it in v6.13, not in v6.14.

Since it's clearly a regression, I'd revert it.

-michael

--8424e5f124607425b50bbb8b9c6837db20f9d6f50f7d8ea68da8b2a9e0fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ4djFBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g9WwF+KmWxaegQjOB76I7ox+ZlfZRBAxtBAqFI
KLSqgdy6UK7HbU1T9OFWXZHZCdqs4N2hAYD8QyeubcUT7mTp+a4TGMyH0ca6wbKd
yOHdmBPqoya1MS4yk1X8en3nMXSs8GIKp6k=
=K/Pe
-----END PGP SIGNATURE-----

--8424e5f124607425b50bbb8b9c6837db20f9d6f50f7d8ea68da8b2a9e0fc--


--===============0349087539075897595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0349087539075897595==--

