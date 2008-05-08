Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtzjP-0007IX-7m
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 06:35:55 +0000
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080508001628.GA5014@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron> <20080505084617.GA11042@cloud.net.au>
	<1210055916.3645.21.camel@sauron> <20080506094642.GB23685@cloud.net.au>
	<1210069392.3645.34.camel@sauron> <20080508001628.GA5014@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Thu, 08 May 2008 09:34:59 +0300
Message-Id: <1210228499.3645.55.camel@sauron>
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

On Thu, 2008-05-08 at 10:16 +1000, Hamish Moffatt wrote:
> On Tue, May 06, 2008 at 01:23:12PM +0300, Artem Bityutskiy wrote:
> > Fundamentally, mkfs.ubifs has to know FS size because UBIFS maintains
> > and stores per-LEB information (like amount of dirty and free space in
> > each LEB) in so-called LPT area on the media. So obviously, the size of
> > this area depends on the total amount of LEBs, i.e. on the volume size.
>=20
> OK (and thanks for adding this information to the web site also.)
>=20
> In my case I am preparing images with mkfs.ubifs, and mounting them
> read-only on my embedded target. In that case, could the max LEB count
> be calculated automatically to fit the files and the LPT area?
>=20
> I added support for ubifs images into buildroot. The user must configure
> their LEB size, max I/O size, and max LEB count as these are all
> required for mkfs.ubifs. Is there a formula to calculate an approximate=20
> max LEB count from the volume size and LEB size?

Err, max LEB count =3D count of LEBs in the volume =3D volume size in
bytes / LEB size. If you know volume size is the same on each device,
just stick with this formula. If you are not 100% sure about volume
size, or you want the FS to automatically re-size when you put it on
larger volumes, then max LEB count =3D maximum possible volume size in
LEBs.

E.g., you you know your flash is 512MiB, which is 4096 128KiB PEBs, then
you may safely use max LEB count =3D 4096, because it is absolutely
maximum number. Well, actually UBI will reserve some amount of PEBs for
its own use in any case, so it is better to use 4095.

4095 is better because power of 2 numbers are "boundaries". The larger
max. LEB count is, the more UBIFS reserves for LPT area, the more levels
the LPT tree have, the more bits UBIFS uses for keys and pointers in the
LPT tree. So specifying max LEB count 3000 or 4000 makes few difference
in terms of amount of resources you spend, but 4095 and 4096 do make
slight difference.

But it does not hurt much if you use 4096, that's fine too and you'll
unlikely notice any difference.

>  I will need to improve
> the documentation for these parameters shown to the buildroot users
> (although probably I'm the only one using the ubifs target so far!).

Cool. Feel free to ask for help.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
