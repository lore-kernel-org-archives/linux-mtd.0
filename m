Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GdNSg-000770-4k
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 04:53:14 -0400
Subject: Re: [PATCH] Allow variable block sizes in mtd_blkdevs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1161936573.5019.55.camel@localhost.localdomain>
References: <1161936573.5019.55.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 27 Oct 2006 11:52:54 +0300
Message-Id: <1161939174.3080.3.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,


On Fri, 2006-10-27 at 09:09 +0100, Richard Purdie wrote:
> Currently, mtd_blkdevs enforces a block size of 512, even if the drivers
> can seemingly request a different size. This patch fixes mtd_blkdevs so
> block sizes other than 512 work correctly.
>=20
> Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

Looks OK for me.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
