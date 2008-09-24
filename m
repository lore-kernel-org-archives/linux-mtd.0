Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KiOLo-0002Fb-2p
	for linux-mtd@lists.infradead.org; Wed, 24 Sep 2008 06:59:52 +0000
Subject: Re: [PATCH][MTD-UTILS] Allow an absent 'image' in the ubinize
	configuration.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Titmuss <richard_titmuss@logitech.com>
In-Reply-To: <48D9524A.3050300@logitech.com>
References: <48D9524A.3050300@logitech.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 24 Sep 2008 09:59:07 +0300
Message-Id: <1222239547.28651.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2008-09-23 at 21:32 +0100, Richard Titmuss wrote:
> Some recent changes to ubinize prevent the 'image' parameter from being=20
> absent in the configuration file. The following patch fixes that.
>=20
> Signed-off-by: Richard Titmuss <richard.titmuss@logitech.com>

The patch did not apply cleanly, probably because your e-mail client
wrapped it. But after some hand-work I've applied it and pushed.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
