Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AECDC5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR0O3rTCzLZxBITRugdRDZY+ByZN/hyNiRNJG9h/060=; b=HcRnZHx9xN9Cak+0rARus6UofQ
	VmsV/htQerl9XfVa2dg8nEcQZWu988w9WozwfIET3p7N7Q1UJ8ZG5+3lFQ8yh5DYyozIewAY6rocE
	NpbNmA6mISyrw+otqEeorJS6ICd2ojQmODgeHm4ttLseTZjfZPRBr96EZFDTT9caafMbVEq9lzpLm
	sxutkI3jhRsUuK3Gv/Qgv4pnC0EPQfXlcT7GDUygWhICua4ZKhpiDNZfxnWiyEziTubjFj38xl/l8
	JqkvOFZWhXQUKTEgkhCshH+0odP2XDnnlzUaJbBnaCO8HsALYXzwQ0lJz/a7e/nNIW30o0avTzjLv
	gHDZSdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoWR-00000002Rbd-37B5;
	Fri, 14 Aug 2026 09:48:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoWP-00000002Rar-3qnY;
	Fri, 14 Aug 2026 09:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 5F317600C3;
	Fri, 14 Aug 2026 09:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 882321F000E9;
	Fri, 14 Aug 2026 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700897;
	bh=VWz+imdVnkbTu/11eqAcvWDbo6t8+5/hRTqaRkt03Xs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=j+CZuGTflKvu56ukvMb6j8Fh+26sB80WXDPMEntQM3wu/RuEBFzds8N75ixmPI/qS
	 Se9GfVWqoD0rf+YnVRU8H7/gjG3Ol4tSFOXVPmeQEr6lwm456bNl82MiajfBD7YrlW
	 EbheSu4PvWYo3PiyKAXvdpSubjc6YlNuA5Yh5ZBAYBa70Ubd0808T7b73/nWq/l50a
	 8MYMhft7FrKPOuR7QszdOVuNwwZLgg5gs/NrFRVUSA/k7WWqhpvAysMKo+2lB6i2u6
	 /1TT+Ghd/SRgv6uwb5uwvf9juRIY5f6z+hbCd46HgGZ0WaRltPeXaQdrAVuRfXKjLT
	 BkfvTvW9x5IkA==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:48:13 +0200
Message-Id: <DKOKLV5T1BNI.2CW9UBFLOD83Q@kernel.org>
Subject: Re: [PATCH v3 14/23] mtd: spi-nor: winbond: Add support for
 W25Q02RV-Q/N
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-14-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-14-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7463965895545811366=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7463965895545811366==
Content-Type: multipart/signed;
 boundary=2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kXRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hWeQF9HWW8qaN8GBeNIv0SV2a0iTZpTSXMHutL
r3X5Y3AGtyacF1H9OcDzkxzubK+HQGOhAXwOSnUC1b12XjeRxcD9coh+bU1WVSpC
Iq9jvbkbTwFJfJ/cwJvxETi0KcUArg8uxMk=
=xmBz
-----END PGP SIGNATURE-----

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8--


--===============7463965895545811366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7463965895545811366==--

