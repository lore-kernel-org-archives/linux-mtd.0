Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EQxw-0004nx-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2001 08:39:25 +0100
Date: Mon, 25 Jun 2001 09:45:55 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Russ Dill <Russ.Dill@asu.edu>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
Message-ID: <20010625094555.D32358@crystal.2d3d.co.za>
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621155737.A26310@crystal.2d3d.co.za> <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com> <20010621163537.A26714@crystal.2d3d.co.za> <3B32668F.8020000@asu.edu> <20010622102154.E1828@crystal.2d3d.co.za> <3B337EF5.3030009@asu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline
In-Reply-To: <3B337EF5.3030009@asu.edu>; from Russ.Dill@asu.edu on Fri, Jun 22, 2001 at 10:23:01 -0700
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

--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russ!

> > Yes, this is something in the lines I was thinking of. But what complic=
ates
> > things is if you start taking things like avoiding damaged blocks into
> > account, wear levelling (this is fairly easy to solve) and keeping the =
flash
> > unfragmented.
> >=20
> if you only eraseblocks when you need to, you always have at least N-1=20
> eraseblocks of pevious data, (where N is the number of eraseblocks=20
> used). A CRC can be done after the store to see if the node written is=20
> ok, if not, write it again (in the next node). since its a small amount=
=20
> of data (maybe 4-8k) and written linearly, wear leveling and=20
> fragmentation is not a problem. Lets say 4 parameter blocks of 16k a=20
> peice are used, that would be 1 erase cycle per 8 configs written, this=
=20
> would allow 800,000 configs to be written on standard flash. If a config=
=20
> was written at a rate of once an hour, it would last 93 years. If it=20
> were on 2 128k standard blocks, then you wolud have 3.2M configs=20
> written, which at the same rate, would last about 332 years. Remember,=20
> you are only performing an erase cycle after a block fills up, not for=20
> every write.

True, but once the flash fills up you have to start moving things around to
erase entire blocks and then the whole 4k-8k thing doesn't hold anymore.

But anyhow, like you said, it's not the most complicated thing in the world.

--=20

Regards
 Abraham

You don't have to know how the computer works, just how to work the compute=
r.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7NuwzzNXhP0RCUqMRAtyzAJ9xEYYzCtdpqEIPx0Sa5bPe5Z4wQACdE2WL
2QzwJ6kJW8S1LJGeCF3xWLA=
=w5Ah
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
