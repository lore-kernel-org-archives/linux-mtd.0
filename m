Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF02C5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLc2tqHO1v42p30NkC82FX2W0/Hch/wFH+H0f/hQbLI=; b=41eU45qdhk0k53MhCKa6Ni9SVH
	hs6zt2gPYSobFH82eLPbkgnBvrHtHEvPwrlpyw+uax/CaDjE4dL1pVsZ8qYT5lIMT56/RfCRrh7kA
	dFYf9MGVXcs90XNdE59dFy/bd6ziLccWqDGnYqIWqI1gO2Zld5/aRrylB3v4nrZTqQmU2DPiKc987
	lXHoh7gX2fdyf+110FMuESgvojc9ONriD84qzxK3bNHE1E2jlZDnl/Pqf+AhDG+Tj8kkrSRugd31u
	YeThZkOEsj7cAyFtjPfG/93jTv0XSIpWiyIMIQu+iqRL/bv0ebdHt9TkQ8uNDldtvzMt9HRry8vYY
	6pKIDdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoab-00000002Sjz-0Kiw;
	Fri, 14 Aug 2026 09:52:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoaZ-00000002Siw-0j1Q;
	Fri, 14 Aug 2026 09:52:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E72B7411AF;
	Fri, 14 Aug 2026 09:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4BD681F000E9;
	Fri, 14 Aug 2026 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701154;
	bh=qXatzOtSlObI1NaAKiBYiFr18AMUInQma+wQu46aI+8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Kq37hFZT37KvXVkykLgDLlfoZpndrH8BENgvyImP2krHLEG1GxkMrhaoGsKcB6IML
	 49Ice9PCjHufQVfEpcGmOSl2gbElD2mGQlhHrb5ogatXwEnUghI4w7umohOcO08eUB
	 NiSW7ofCaGOGXOkbrOsbyw6ry+/4q0IWxNUk6CSw9N+YS+Y74esubopZBDsRn8mViZ
	 Pe3a56m2/vjaSsfhfeuFa+9ehJvw2QdXs9wkBHEkIRBv1gaiE9IhST22kiNvB8nl/N
	 r4MK8YxJpRYMZgYsqTRt5+7gvPw53nrqRA/aq5qwaUeNCQJjWRVRVdbGFYA8G+LGXK
	 BY5UiKBfhQa5g==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:52:31 +0200
Message-Id: <DKOKP5L9W231.2DH3ODA0MGU8Y@kernel.org>
Subject: Re: [PATCH v3 21/23] mtd: spi-nor: winbond: Add support for
 W25Q02RV-M
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-21-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-21-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7851756967056399518=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7851756967056399518==
Content-Type: multipart/signed;
 boundary=bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb
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


--bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lXxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hqdwGA40nA8+hyOwt2ZBmiYFgGwfUj94KADxtB
2d2+GTXqoSZJS7CAN2kZjFfSlY0kHY1uAX0eMi7n0NtTlXvkyOMGIzQpoZ+gB4Es
3lMDVv8rbRd93MlFg78w1q8HlNU647vWQjY=
=3J0s
-----END PGP SIGNATURE-----

--bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb--


--===============7851756967056399518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7851756967056399518==--

