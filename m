Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf80s-00087D-D8
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 06:24:30 +0000
Subject: Re: corrupted ubi after reboot while busy
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080328000551.GA23610@cloud.net.au>
References: <20080327070541.GA10446@cloud.net.au>
	<1206625178.3856.38.camel@sauron> <20080328000551.GA23610@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Fri, 28 Mar 2008 08:21:10 +0200
Message-Id: <1206685270.3856.44.camel@sauron>
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

On Fri, 2008-03-28 at 11:05 +1100, Hamish Moffatt wrote:
> On Thu, Mar 27, 2008 at 03:39:38PM +0200, Artem Bityutskiy wrote:
> > On Thu, 2008-03-27 at 18:05 +1100, Hamish Moffatt wrote:
> > > I'm trying UBI for the first time; I have the kernel 2.6.24 with UBI
> > > backported from 2.6.25-rc7.
> > >=20
> > > I created a static volume (on NAND) and wrote a JFFS2 image to it wit=
h=20
> > > ubiupdatevol. mount succeeded, but the image was built wrongly so the
> > > jffs2 garbage collector thread to fix it.
> > Strange, the volume should be read-only, what could the GC thread do to
> > it?
>=20
> That's what I thought.

Actually, static volumes are protected by CRC checksums on the UBI
level, so UBI checks CRC of whole volume when you open it for the first
time, which may take time. What is the size of your static volume?

JFFS2 has its own data integrity checksums, so static volumes are not
really necessary. I'd suggest using a dynamic volume instead.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
