Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JmSaZ-0005wY-0H
	for linux-mtd@lists.infradead.org; Thu, 17 Apr 2008 11:47:39 +0000
Subject: Re: [PATCH] compr_lzo.c: allocate enough memory for lzo compressor.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Riku Voipio <riku.voipio@iki.fi>
In-Reply-To: <20080411093337.GA22045@kos.to>
References: <20080411093337.GA22045@kos.to>
Content-Type: text/plain; charset=utf-8
Date: Thu, 17 Apr 2008 14:47:16 +0300
Message-Id: <1208432836.5965.296.camel@sauron>
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


On Fri, 2008-04-11 at 12:33 +0300, Riku Voipio wrote:
> This is the same bug as in kernel, pointed out the LZO author
> (Markus Oberhumer):
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmitdiff;h=3Df2a11b158a24301e9158e9c873fa88e5eb775486
> ---
>  compr_lzo.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Both patches are pushed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
