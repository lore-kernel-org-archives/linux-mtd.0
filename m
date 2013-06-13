Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un8OY-00063g-HX
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 14:20:59 +0000
Date: Thu, 13 Jun 2013 16:20:28 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Raiger Helmut <helmut.raiger@hale.at>
Subject: Re: UBIFS: How to reserve space to be used right before power cut
Message-ID: <20130613162028.3d17bac2@parrot.com>
In-Reply-To: <1142745477.330790.1371130164128.JavaMail.root@mail.hale>
References: <20130613135031.59037201@parrot.com>
 <1142745477.330790.1371130164128.JavaMail.root@mail.hale>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Thu, 13 Jun 2013 14:29:24 +0100,
Raiger Helmut <helmut.raiger@hale.at> a =E9crit :

>=20
>=20
> > ----- Original Message -----
> > From: "Matthieu CASTET" <matthieu.castet@parrot.com>
> > To: "Helmut Raiger" <helmut.raiger@hale.at>
> > Cc: linux-mtd@lists.infradead.org
> > Sent: Thursday, June 13, 2013 1:50:31 PM
> > Subject: Re: UBIFS: How to reserve space to be used right before
> > power cut
> >
> > Hi,
> >
> > Why do you do this in ubifs ?
> >
> > If you do it in ubi/mtd this will be a lot's of easier.
> >
> > Matthieu
>=20
> I wasn't aware of an userspace interface for ubi/mtd, but just found
> out about gluebi. Is this the path you suggest?
>=20
> Could you please elaborate a bit more on this, I'm still unsure if
> this will meet our timing constraints (background operation of ubi?)
>=20

Not gluebi

you have a userspace inferface to ubi : /usr/include/mtd/ubi-user.h


You could create a small ubi volume (dynamic or static) of 1 LEB next to
ubifs (on the same ubi device).
When you start you make sure the LEB have enough space and that the LEB
is mapped.

on a power fail signal you write the LEB with your data. Because the
LEB is already mapped, the write should be imediate.


If the ubi volume is on the same ubi device than ubifs, the wear
leveling will be shared with ubifs.
