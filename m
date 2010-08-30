Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq0AN-00077A-Ur
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 08:56:37 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L7Y00JV8JI8HLC0@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 17:56:32 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L7Y00E1AJI5NJ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 17:56:32 +0900 (KST)
Date: Mon, 30 Aug 2010 14:26:28 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: RE: Is repartitioning possible while one of the partitions is mounted?
In-reply-to: <1282637086.24044.133.camel@localhost>
To: dedekind1@gmail.com, 'Tim Cussins' <timcussins@eml.cc>
Message-id: <000001cb4821$3d913c00$b8b3b400$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: quoted-printable
References: <1280755953.2174.24.camel@pc816>
	<1282637086.24044.133.camel@localhost>
Cc: v.dalal@samsung.com, linux-mtd@lists.infradead.org
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
> From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Artem Bityutskiy
> Sent: Tuesday, August 24, 2010 1:35 PM
> To: Tim Cussins
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Is repartitioning possible while one of the partitions is =
mounted?
>=20
> On Mon, 2010-08-02 at 14:32 +0100, Tim Cussins wrote:
> > Hi all,
> >
> > I just spotted post regarding upcoming Runtime Partitioning Support
> > =
(http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html)
> >
> > After taking a cursory glance at the patch it's not immediately =
obvious
> > ( uh, to me anyway :D ) whether you can create/delete partitions =
while
> > a filesystem (e.g. rootfs) is mounted from another partition on the =
same
> > mtd device.
> >
> > Under what conditions can you create/delete partitions?
>=20
> I guess it is good idea to put the authors of that patch in CC, no?
>=20
> I think this case should be handled. If it is not, the solution is not
> very good. But this is just IMHO.
>=20
Its possible to partition/delete/resize the other partitions of the =
device even
if rootfs is mounted on one partition.
The utility even gives freedom to change the permissions of the =
partitions and=20
merging adjacent partitions apart from above features.

> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
