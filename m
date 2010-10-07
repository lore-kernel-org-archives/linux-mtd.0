Received: from mailout4.samsung.com ([203.254.224.34])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3i9R-0002T6-St
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 04:32:25 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9W00GC1KLIFL40@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 13:32:06 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9W00BU6KLF4Q@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 13:32:06 +0900 (KST)
Date: Thu, 07 Oct 2010 10:02:02 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: RE: [PATCH RESEND][MTD]MLC device check in OneNAND driver
In-reply-to: <1285329124.29268.175.camel@localhost>
To: dedekind1@gmail.com
Message-id: <000f01cb65d8$984b15b0$c8e14110$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: quoted-printable
References: <001701cb5bdd$3fd69a80$bf83cf80$%hs@samsung.com>
	<1285329124.29268.175.camel@localhost>
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Friday, September 24, 2010 5:22 PM
> To: Rohit Hassan Sathyanarayan
> Cc: linux-mtd@lists.infradead.org; gupta.raghav@samsung.com; =
v.dalal@samsung.com
> Subject: Re: [PATCH RESEND][MTD]MLC device check in OneNAND driver
>=20
> On Fri, 2010-09-24 at 17:10 +0530, Rohit Hassan Sathyanarayan wrote:
> > Signed-off-by: Rohit HS <rohit.hs@samsung.com>
> > Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>
>=20
> Almost perfect. However:
>=20
> 1. All mtd patches should have "mtd:" prefix.
> 2. Add some description about what you do and why into the commit
> message.
> 3. I think combining is not good, better do it old way - first patch
> introduces the flag, second uses it in OneNAND
>=20

  We made changes as per your comments and have posted two patches,
  Links of two patches,
  =
http://lists.infradead.org/pipermail/linux-mtd/2010-September/032333.html=

  =
http://lists.infradead.org/pipermail/linux-mtd/2010-September/032334.html=


   =09
> Sorry for being picky, but I really want to show you how to send =
patches
> properly once and later get good series from you.
>=20
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)
