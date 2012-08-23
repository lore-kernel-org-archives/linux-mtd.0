Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4UQA-0007vr-7W
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 10:13:51 +0000
Message-ID: <1345717117.2848.232.camel@sauron.fi.intel.com>
Subject: Re: Current mainline (3.6-rc3) UBIFS errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
Date: Thu, 23 Aug 2012 13:18:37 +0300
In-Reply-To: <20120823112732.32ed62d5@archvile>
References: <20120823095048.6c6ee35a@archvile>
 <1345709408.2848.207.camel@sauron.fi.intel.com>
 <20120823103934.1028f491@archvile>
 <1345711673.2848.214.camel@sauron.fi.intel.com>
 <20120823112732.32ed62d5@archvile>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wA8d0wwoYLiFNlgrwPGP"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wA8d0wwoYLiFNlgrwPGP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 11:27 +0200, David Jander wrote:
> On Thu, 23 Aug 2012 11:47:53 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
>=20
> > On Thu, 2012-08-23 at 10:39 +0200, David Jander wrote:
> > > On Thu, 23 Aug 2012 11:10:08 +0300
> > > Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > >=20
> > > > On Thu, 2012-08-23 at 09:50 +0200, David Jander wrote:
> > > > > [    4.069409] UBI warning: ubi_io_read: error -74 (ECC error) wh=
ile
> > > > > reading 160 bytes from PEB 5616:87112, read only 160 bytes
> > > >=20
> > > > Hi, looks like a problem with your driver. For some reasons it retu=
rns
> > > > ECC errors when reading small amount of data (160 bytes). Did you r=
un
> > > > mtd tests - to they pass?
> > >=20
> > > I thought so at first, but this error appeared on two different hardw=
are
> > > platforms at the same time, when upgrading to latest mainline. I am c=
oming
> > > from kernel 3.1, which worked fine on the MPC5121e. The ARM platform =
also
> > > worked without problems on a previous version (I think it was 3.4-som=
ething,
> > > not so sure right now). The only common piece of hardware/driver is t=
he actual
> > > NAND flash chip on both boards (Samsung K9K8G08... SLC 8Gbit NAND), s=
o I
> > > thought this had to be a (temporary) issue in current mainline code.
> >=20
> > A change in the mtd layer probably caused this.
> >=20
> > > > So UBI just tells that it cannot read, the root-cause is in the dri=
ver.
> > >=20
> > > Two different drivers... same issue!?
> >=20
> > Quite possible if there is a bug in mtd layer. First try to find out th=
e
> > latest working kernel release.
>=20
> Ok, sounds reasonable.
> I found kernel 3.5 works fine. Now bisecting...

If you want to check whether it is UBI/UBIFS to blame, please, pull the
ubifs-v3.5.git back-port tree and test. The back-port tree contains all
UBI/UBIFS changes which we have done after 3.5.

git://git.infradead.org/users/dedekind/ubifs-v3.5.git

http://git.infradead.org/users/dedekind/ubifs-v3.5.git

--=20
Best Regards,
Artem Bityutskiy

--=-wA8d0wwoYLiFNlgrwPGP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNgN9AAoJECmIfjd9wqK0DlIP/i3AVqvDbUEdWB+on0g+5roh
WjwoCRdezQ7ay20gwweUxxG1c47+7q6jrOmzrFezFWFzP6JJjpxlgHoUfPJxLsfB
yFSP6FZoD0XJl3rgF/gMHb61Z95CJrfKv14AwjkFiPbIFf5Gz6s+mEg727Z72W0+
pq5L2GCh9p5IltDUaIUWLuvQHuDsJ09snNqNGqPhOchhMGPHRi+NwVLwzXB5G5U+
vgFTb25oiSisvJEusBksGUj+3BBOOzpWOonJcaVoh7Jtq4xTAZPYp4tm/bxrQezN
BTQqKrCy8kElsFcXfXk3t1HHcoHOI+e5oF0lvj+RnKfFUXUHqhw7CKzYyzYsN+2A
HckcVOQ1b1ZZiKD88QpZNo6su9isWMshLIMNSupFjq0ZVhpkhsw1cgbq4dYIGJbl
frJF9SNxM8B39bmokksUli10aeeY2wVEV5MpXnbSKbHF622XXUlsIngXdd/xde2q
clDMex3BkcuFU8OhpB8wQIGHwFryXaaX2s5rnWcEkA0xgquZ76ye0sWiz6BIISxW
JMJprQGEf13DOtYzK4iByVjlTCW7M2NrU4Ht4wwTgjKPvs0xZFYgQhmMCEveJt+3
mvcl5JSBe10GPCfVdR/YO2bgoXZp29EN/STi2XQ6qBgEv6zRYIya5grRb1ZW+dMO
w3yc4mV3ZSf9aDtElFHr
=/hmV
-----END PGP SIGNATURE-----

--=-wA8d0wwoYLiFNlgrwPGP--
