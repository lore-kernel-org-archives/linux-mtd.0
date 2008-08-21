Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW4Ui-0004m3-FJ
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 07:22:08 +0000
Subject: Re: [PATCH] use $(MAKE) rather than make
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1219254725-21918-1-git-send-email-vapier@gentoo.org>
References: <1219254725-21918-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 21 Aug 2008 10:20:14 +0300
Message-Id: <1219303214.18027.55.camel@sauron>
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


On Wed, 2008-08-20 at 13:52 -0400, Mike Frysinger wrote:
> If you execute straight `make`, this prevents the active make env from
> being passed on to sub children.  This prevents parallel building as
> well
> as build flag passing.
>=20
> I also dropped the recursive make in ubi-utils/Makefile for the all
> target
> as this causes problems when building in parallel.  All of the targets
> that we actually care about are handled by the $(NTARGETS) target
> anyways.
>=20
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Thanks, applied on top of Sebastian's patch. Fixed conflicts. Please,
check.

--=20
>=20
> Best regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
