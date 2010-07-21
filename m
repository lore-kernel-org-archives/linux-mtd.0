Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ObXjR-0003A4-Jr
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 11:45:04 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L5W00BY2OMXU060@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 20:44:57 +0900 (KST)
Received: from vivekd ([107.108.214.54])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L5W003J7OMWLC@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 20:44:57 +0900 (KST)
Date: Wed, 21 Jul 2010 17:14:59 +0530
From: Vivek <v.dalal@samsung.com>
Subject: RE: [PATCH 0/4] mtd: add mtd repartition ioctl
In-reply-to: <1279706323.2306.2.camel@localhost>
To: dedekind1@gmail.com, 'Roman Tereshonkov' <roman.tereshonkov@nokia.com>
Message-id: <00bd01cb28ca$2cbade20$86309a60$%dalal@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: quoted-printable
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1278568257.12733.34.camel@localhost>
	<1279706323.2306.2.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Artem Bityutskiy
> Sent: Wednesday, July 21, 2010 3:29 PM
> To: Roman Tereshonkov
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH 0/4] mtd: add mtd repartition ioctl
>=20
> On Thu, 2010-07-08 at 08:50 +0300, Artem Bityutskiy wrote:
> > On Fri, 2010-06-18 at 13:08 +0300, Roman Tereshonkov wrote:
> > > Adding mtd master device after all partitions should provide
> > > minimum effect on the created partition enumeration.
> > >
> > > The master mtd device can be repartitioned in runtime through
> > > the mtd ioctl MTDREPARTITION. The ioctl passed argument is
> > > the set of the new partitions defined by the structures:
> > > struct mtd_partitions and struct mtd_partition_user.
> > >
> > > All at once partition configuration is used and caused by
> > > the all at once partition removing. Only unused partitions are
> deleted.
> > > If any of the partitions for given mtd device is used then user
> gets error.
> > > The care should be taken to close all applications which access
> > > the partitions.
> > >
> > > Roman Tereshonkov (4):
> > >   mtd: add new ioctl structures to be used for repartitioning
> > >   mtd: add the possibility to modify partitions in runtime
> > >   mtd: add MTDREPARTITION ioctl
> > >   mtd: create the mtd master device for given set of partitions
> > >
> > >  drivers/mtd/mtdchar.c          |  110
> +++++++++++++++++++++++++++++++++++++++-
> > >  drivers/mtd/mtdpart.c          |   45 ++++++++++++++--
> > >  drivers/mtd/onenand/omap2.c    |    8 ++-
> > >  include/linux/mtd/partitions.h |    2 +
> > >  include/mtd/mtd-abi.h          |   15 ++++++
> > >  5 files changed, 170 insertions(+), 10 deletions(-)
> >
> > I've pushed this to my l2-mtd-2.6.git / master, looks good to me.
>=20
> Removed from l2-mtd-2.6 - please, address the comments from me and =
Arnd.

We have also developed the similar solution for run-time partitioning =
support; it includes 3 ioctl's(for creating,deleting,changing =
permissions of partitions) and the mtd utility for partitioning(which =
supports resizing and deleting partitions, changing permissions).=20
Very shortly we are going to release that.

Regards
Vivek Dalal and Rohit H.S
>=20
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
