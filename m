Received: from mailout.zma.compaq.com ([161.114.64.105] helo=zmamail05.zma.compaq.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18CSA9-0008JU-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2002 22:08:38 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: cmdline.c file name collision
Date: Thu, 14 Nov 2002 17:39:01 -0500
Message-ID: <D99C1FB421989A40818B6370E3187094040A3ABD@tayexc19.americas.cpqcorp.net>
From: "Hicks, Jamey" <Jamey.Hicks@hp.com>
To: "Scott Anderson" <scott_anderson@mvista.com>
Cc: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I think we should change the filename to avoid the collision in 2.4.x =
kernels.  I do not think we should do surgery on the CVS repository even =
though that means the file history gets split.  I've renamed my copy to =
cmdlinepart.c in the handhelds.org CVS repository, but I have not done =
so on the MTD repository.  If no one objects, I will add cmdlinepart.c =
and remove cmdline.c in the infradead cvs.

Jamey


> -----Original Message-----
> From: Scott Anderson [mailto:scott_anderson@mvista.com]
> Sent: Wednesday, November 13, 2002 2:32 PM
> To: Hicks, Jamey
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: cmdline.c file name collision
>=20
>=20
> "Hicks, Jamey" wrote:
> > hmm.  My first thought was to rename drivers/mtd/cmdline.c to=20
> > drivers/mtd/mtdcmdline.c or drivers/mtd/cmdlinepart.c.
>=20
> That sounds reasonable.  Does someone that has direct access=20
> to the CVS
> repository want to move the files around in the repository=20
> (so we don't
> lose history) or should I just submit a patch that removes=20
> the file and
> adds the file back with a different name?
>=20
> > Actually, that was my second thought.  My first thought was=20
> to wonder
> > why CONFIG_MODVERSIONS flattens the kernel source file namespace.
> > I just turned on CONFIG_MODVERSIONS to build an ipaq=20
> kernel, and I find
> > I also have a name conflict on arch/arm/mach-sa1100/pm.c=20
> and kernel/pm.c.
>=20
> I've been told third hand or so that it is a "known=20
> limitation" in 2.4.
> I just looked in 2.5, and this limitation has been eliminated=20
> (there is
> a hierarchy of files under include/linux/modules that parallels the
> source hierarchy).
>=20
> With that new found information, I guess a new question comes up: does
> working around the 2.4 limitation warrant the rename when the=20
> limitation
> is removed in 2.5?
>=20
>     Scott Anderson
>     scott_anderson@mvista.com   MontaVista Software Inc.
>     (408)328-9214               1237 East Arques Ave.
>     http://www.mvista.com       Sunnyvale, CA  94085
>=20
