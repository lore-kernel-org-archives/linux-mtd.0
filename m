Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132wrm-0003hF-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 15:13:02 +0100
Date: Fri, 16 Jun 2000 16:13:30 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org,
        =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@matrox.com>
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c' 
In-Reply-To: <22037.961158685@cygnus.co.uk>
Message-ID: <Pine.LNX.4.10.10006161601090.32348-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 16 Jun 2000, David Woodhouse wrote:
> alex@cendio.se said:
> >  A lot of it is whitespace changes. Some are optimizations, fixes and
> > changes I've seem to have done after S=E9bastien branched his version.
>=20
> I can compare a diff of the two an eliminate the obvious ones where the=
=20
> code is actually the same, or even where one version is obviously bette=
r.=20
>=20
> Some of it I should probably leave to you, at least till I know the cod=
e a=20
> bit better.
>=20
> Rather than doing conflicting patches, do you want me to do the obvious=
=20
> ones now and then let you know, or leave it all to you?

I've now checked in a version that moves the 2.3 and 2.2 version much
closer to each others (M-x ediff-buffers rules my world!). I haven't
actually tried to compile it though.

I did the most obvious conversions, but i had to leave a couple of things
because that need more thinking and testing:

jffs_read_super() - Does it really has to lock the superblock here?

jffs_read_page() - I've done some changes here in the 2.3 version that
might be intresting to 2.2. These are mainly page handling stuff, you nee=
d
to check that carefully.

jffs_file_write() - The 2.3 version has some file-size handling (SIGXFSZ)
that could be interesting for 2.2. There is also some semaphore locking
that 2.2 doesn't have which I'm a bit unsure of if it is needed in 2.2.
The *pos handling can maybe also be moved over.

There are also some comments (/* Is this really needed in 2.2?
*/) sprinkled in the code. These are mainly corner-cases which I and al
viro has removed from the 2.3 code because they are handled by the VFS.
Probably most of these are handled by the 2.2 VFS too...

Also there are some french comments in the code that i left there, becaus=
e
i don't understand them.

> Then, as my only testbed is an Alpha, we'll find out if it's 64-bit cle=
an :)

It is *not* clean with respect to treating userspace vs kernel-pointers
correctly. In jffs_file_write() it passes userspace pointers to the mtd
flash write functions. This works for x86, but it might break for Alpha.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
