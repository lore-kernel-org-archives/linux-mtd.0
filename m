Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXP3-0003f3-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:41:09 +0000
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8406456E99@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: =?iso-8859-1?Q?Bj=F6rn_Eriksson?= <mdeans@algonet.se>,
        linux-mtd@lists.infradead.org
Subject: RE: From 2.4.9 to CVS ???
Date: Fri, 4 Jan 2002 11:51:39 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

No I dont have 'bad cramfs magic' !!! I tought it could be the case ... =
but
I looked at the mkcramfs.c from the 2.4.9 and 2.4.17 version and there =
is no
difference So the generated code should be the same.

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual.=20
If you can't see it, but it is there, it's hidden.=20
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: Bj=F6rn Eriksson [mailto:mdeans@algonet.se]
> Sent: January 4, 2002 11:40 AM
> To: linux-mtd@lists.infradead.org
> Subject: Re: From 2.4.9 to CVS ???
>=20
>=20
> On Fri, Jan 04, 2002 at 11:19:13AM -0500, Patrick Allaire wrote:
> > Every thing is compiled fine ... at boot up, MTD=20
> find(probe) my flash, it
> > printout the partioning it will do ... after that I get=20
> >=20
> > VFS: Mounted root (cramfs filesystem) readonly.
> > Freeing unused kernel memory : 36k freed
> > Kernel panic: No init found....
> >=20
> >=20
> > I know from the last line that the problems is that the=20
> kernel cannot find
> > /sbin/init ... but it is there, it is exactly the same=20
> cramfs I used on
> > 2.4.9 when it was working !!! To be sure it was not=20
> corrupted, I redid the
> > flashing of the /dev/mtdblock0 with my cramfs file ... with the =
same
> > results.
>=20
>  Are you sure you're not getting a 'bad cramfs magic' as=20
> well? I know I
> did when I tried booting a 2.4.9 cramfs-initrd with a 2.4.17 kernel.
> Anyways, read fs/cramfs/README:
>=20
>   <<The disadvantage is that the generated cramfs cannot always be
>     shared between different kernels, not even necessarily kernels of
>     the same architecture if PAGE_CACHE_SIZE is subject to change
>     between kernel versions.>>
>=20
>=20
> --=20
> //Bj=F6rnen
>=20
