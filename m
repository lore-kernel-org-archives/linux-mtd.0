Received: from mail-am1on0654.outbound.protection.outlook.com
 ([2a01:111:f400:fe00::654]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPorn-0006po-3b
 for linux-mtd@lists.infradead.org; Mon, 23 Feb 2015 08:59:52 +0000
From: Alexander Aronsky <alexander_ar@rad.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: RE: Resizing mtd partition
Date: Mon, 23 Feb 2015 08:59:09 +0000
Message-ID: <DBXPR03MB432FC3A84BE9DDDEAB12DC1E2290@DBXPR03MB432.eurprd03.prod.outlook.com>
References: <DBXPR03MB4327478CB0DB83D82615D9DE2280@DBXPR03MB432.eurprd03.prod.outlook.com>
 <alpine.DEB.2.02.1502230907230.17631@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1502230907230.17631@lnxricardw1.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Ricard Wanderlof [mailto:ricard.wanderlof@axis.com]
> Sent: 23/02/2015 10:14
> To: Alexander Aronsky
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Resizing mtd partition
>=20
>=20
> On Sun, 22 Feb 2015, Alexander Aronsky wrote:
>=20
> > Hi everyone,
> >
> > I have to resize an existing mtd partition on a NOR flash of an
> > embedded device (PPC architecture) without losing the data on this
> partition.
> >
> > To be more specific, I have /dev/mtd0 and /dev/mtd1 devices on my
> > flash, and I want to increase the size of the file system mounted on
> > /dev/mtdblock0 at the expense of the one on /dev/mtdblock1. For
> > example, eliminate the
> > /dev/mtd1 altogether and give the /dev/mtd0 all the available space on
> > the flash.
> >
> > What is the proper way to do it?
>=20
> I don't think there is a 'proper' way, i.e. a resize application.
>=20
> However, if the file system on the partition is jffs2, then I believe one=
 could
> do the following:
>=20
> - Unmount /dev/mtd0 (and /dev/mtd1)
> - Erase /dev/mtd1
> - Rewrite the partitioning info so that /dev/mtd0 now includes both
>   partitions.
> - Mount /dev/mtd0 .
>=20
> When /dev/mtd0 is mounted, jffs2 will now see that the size is larger. Si=
nce
> there is no global file system information within a jffs2 file system, it=
 will see
> the newly erased space as unused when scanning the partition during the
> mount operation.
>=20
> If you can't unmount /dev/mtd0 because it is the root file system, you co=
uld
> do most operations with /dev/mtd0 mounted, and a reboot in
> between:
>=20
> - Unmount /dev/mtd1.
> - Erase /dev/mtd1.
> - Rewrite partitioning info so that /dev/mtd0 new includes both old
>   partitions.
> - Reboot the system, when it starts it will use the new larger
>   /dev/mtd0 .
>=20
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30

Thank you very much, Ricard!

Only one more detail re. the second scenario you suggest:  what do you mean
by "rewrite partitioning info"?  I was just thinking of rebooting with anot=
her
device tree blob containing the desired partitioning info.  Is that going t=
o work
or there is something else to it?

Thanks and best regards,
A.
