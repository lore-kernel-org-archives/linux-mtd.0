Received: from mgw-dax2.ext.nokia.com ([63.78.179.217])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17u6IO-0002pD-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 08:09:16 +0100
Received: from davir04nok.americas.nokia.com (davir04nok.americas.nokia.com [172.18.242.87])
	by mgw-dax2.ext.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id g8P79iM08591
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 02:09:44 -0500 (CDT)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Interest in DOC and YAFFS? --> YAFFS bootloading
Date: Wed, 25 Sep 2002 00:09:11 -0700
Message-ID: <F252EE46074AB645B4F44947EEAD57272E4EEC@mvebe001.americas.nokia.com>
From: <Srinivasan.Ramasubramaniam@nokia.com>
To: <elf@buici.com>, <Russ.Dill@asu.edu>
Cc: <kenneth.johansson@etx.ericsson.se>, <linux-mtd@lists.infradead.org>
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

Hi all !

I request your help to clarify a doubt with regard to initrd-filesystem =
and cramfs.=20

If we use cramfs in place initrd-filesystem, will the entire filesystem =
will be uncompressed and loaded onto the RAM ? =20

But in initrd-filesystem, the entire filesystem is uncompressed and =
loaded.=20

Regards
R Srinivasan=20
Nokia Internet Communications=20
PH: +91 40 3553343=20
Mobile: 098480 32996




> -----Original Message-----
> From: ext Marc Singer [mailto:elf@buici.com]
> Sent: 25. September 2002 1:53
> To: Russ Dill
> Cc: Kenneth Johansson; mtd
> Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
>=20
>=20
> On Tue, Sep 24, 2002 at 11:47:43AM -0700, Russ Dill wrote:
> >=20
> > > > cramfs is a read only filesystem not an archive format=20
> like zip or tar
> > > > so you do not have to copy the data into another=20
> filesystem to use it.
> > > > You use cramfs instead of initrd+filesystem.
> > >=20
> > > That isn't really the issue here.  We're talking about=20
> using gzip'd
> > > ext2 versus cramfs to do initrd.  The thing is that in my tests,
> > > cramfs images are larger than compressed ext2 images.  Not what I
> > > would expect.
> >=20
> > if you are talking about an initrd, then the features of=20
> cramfs aren't
> > quite as usefull, as the whole thing will be loaded into=20
> ram anyway. On
> > the other side:
>=20
> I see.  That is where my understanding comes from.  Now it=20
> makes sense.
>=20
> > A cramfs will always be exactly as small as it needs to be,=20
> no guessing
> > on an image size. cramfs is created by population, not by making an
> > image, formatting it, mounting it loopback, and then copying files.
>=20
> Indeed.  It can be inconvenient knowing how big to make the loopback
> file.
>=20
> > incedentally, I have a copy of mkcramfs with device table=20
> support (as
> > seen in mkfs.jffs2) as well as permission squashing, so=20
> that a cramfs
> > image can be made withoutt root (complete with suid root=20
> programs, and
> > /dev entries)
>=20
> I'd appreciate a copy of your mkcramfs changes.
>=20
> Thanks.
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
