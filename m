Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeOgh-0004mz-BH
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:23:20 +0000
Message-ID: <1354274647.30168.99.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 30 Nov 2012 13:24:07 +0200
In-Reply-To: <20121125093621.47f9cb25@pixies.home.jungo.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
 <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
 <20121125093621.47f9cb25@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nQCF51oCLWcMRDH/K66S"
Mime-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nQCF51oCLWcMRDH/K66S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-11-25 at 09:36 +0200, Shmulik Ladkani wrote:
> Hi Ezequiel,
>=20
> On Sat, 24 Nov 2012 18:02:59 -0300 Ezequiel Garcia <elezegarcia@gmail.com=
> wrote:
> > I've started working on a workload scenario to measure if ubiblock writ=
e
> > is useful or just plain nonsense.
>=20
> Please note eraseblock wear is just one aspect of using a standard r/w
> filesystem over ubiblock.
>=20
> There's another potential hazard of using r/w ubiblock, which is the
> lack of power-cut tolerance.
> Changing a file atomically in ubifs or jffs2 is tolerant to power
> cuts (see [1]).
> I'm not sure this is possible in ubiblock case, due to the 1-LEB
> writeback cache: if a file (in the mounted fs) is synced, are there any
> guarantees the 1-LEB cache is flushed synchronously?
> (you mentioned the actual write is only done when a request arrives to
> read or write to a different LEB or when the device is released).

Why would not it be? ubiblk is just like a hard drive or and SSD fro a
file-system. If it caches something, it is just like an internal disk
cache. The I/O barrier should flush it. And we have an atomic LEB change
operation, so when you want to change the LEB contents, you can do it in
power-cut-safe manner.

Do I miss something?

>=20
> > Since read-only ubiblock is less controversial, I'll post a read-only
> > version of ubiblock (with an option to use a vmalloced
> > buffer to cache reads?).
> > We can add write support later, if it's not useless.
> >=20
> > Any thoughts?
>=20
> Well I was about to suggest that approach :)
> I would even split your patch further: the core stuff (with r/o
> support), and an additional patch with all the DEBUG stuff. This may
> ease reviewer's job.

I do not see why R/W ubiblock is controversial. You can use FAT on top
of this, which is a use-case many people wanted. Or even ext4.

--=20
Best Regards,
Artem Bityutskiy

--=-nQCF51oCLWcMRDH/K66S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuJdXAAoJECmIfjd9wqK0tYQP/3nbJUZ+RLlBb4Uow8mBxkFI
5caMv+r2oQoUN8+0N2U20A1dGATSKvfbNJHWTkShDxu5FwggYj/d/OGnvlNZumlQ
Pd2uIGALwLXIsPMWmYG+NrgEDDwQrmkA7XMcwXbj6U7V1+zNrkSVPNo5YYzIGy5u
NL0CnA0JKhf+aQrUZDmWRF8oTv5KzqJPghu5ipc+sKSAjhWrDrqHxuQtuNKqOGG2
acMjGw9CCSzD0gS03UAN8wybgDmsRFHfzfQdre306VzGCyKL/MIzNXuRyGp+YgMB
ZlQVUGdy7zDhL4uVxUqK3QAfskKyHrwivpg1UTPUOBIowwIu2RNsxnel2BRXrgPz
hADB9VVLKQkZ6C3c7PmPyWZ0bxSeLHCfXBgP+mvUywwc+AnQs+v+MYd5m0WTbagK
+b+PRWUbbVyhlfo63M8ppfUVblZyaB7Lia1QF82aweki5jYQ5vyB17OaCbbg68Ns
u1XTul17+JXkfr7NxKf+GrWq6WcOdHk1a2xAbTFF14peg2QfkfEtiLQz25um2VgS
mQ+jNDmATwfVjehOXN1MHORKUQwcu/kYNqWpWr02EBtLuWDUU5imVOtvGX0boKKp
FjTUCQextThjxH+CQfY24o5ZsiWjc0G8D/A4FUa0WJoZBQHeaIsRoA69KJAZzUSH
WayVkax2anymHZ6yH703
=SoJe
-----END PGP SIGNATURE-----

--=-nQCF51oCLWcMRDH/K66S--
