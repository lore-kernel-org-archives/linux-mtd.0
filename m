Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T493x-0005qc-Vz
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:25:30 +0000
Message-ID: <1345635015.2848.150.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 14:30:15 +0300
In-Reply-To: <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-V19UO1m711bR1Nob6YxU"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-V19UO1m711bR1Nob6YxU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 13:17 +0200, Richard Genoud wrote:
> 2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> > If the feature is not supported (the kernel is old), the tool will just
> > return success and the kernel will just ignore max-beb-per1024, which i=
s
> > not very nice.
> >
> > It would be better if ubiattach complained like this instead:
> >
> > ubiattach error: your UBI driver does not allow changing the reserved
> >                  PEBs count, probably you run old kernel? The support
> >                  was added in kernel version 3.7.
> yes, you're right, I'll change that.
> Thanks,

I see 2 ways.

1. Add a 'get device property' ioctl, similar to the 'set volume
property' ioctl we have. And use this ioctl to query the current bad
PEBs limit.

2. Just call the 'attach' ioctl with an insane max_beb_per1024 value
(say, -1) first. If it succeeded, than the driver does not support
max_beb_per1024 at all, and you may exit with a warning that you have
attached it, but the max_beb_per1024 was ignored because the kernel is
old.

If it fails with -EINVAL, this means the kernel checked the value and
the feature is supported, so you can call it for the second time with
the right max_beb_per1024.

The first approach is more complex but probably cleaner. The second is
easier to implement.

--=20
Best Regards,
Artem Bityutskiy

--=-V19UO1m711bR1Nob6YxU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNMLHAAoJECmIfjd9wqK0eTMQANNKqMmbgEF7IHtxZhTzUQIx
jS0ja8QgY3MFszJomo1jbwguT3PgdTSDx5RtTTgYeOSuiJ08K0NFPvLCDIHjem2p
xlCmFaaHz6TOTdj5PBL1cUTCS4OVOEEnHehxs3J01ysDTEwhKiWh5PXH/vpA3amd
NEMqWY+kbo6ZPIf/wUscA1i9/+1WfcvRNYbZwnR47MaooiGxwA70Uu5NEfhdBiXX
JjoxUBe72OmGxbCWEaayXaByrWfoVY+5zErg3WPs0NNEh+oeYh8sfYFLrhuMhKHU
8Q69ieAPumqbsIs3fiGpOT//IQHInxswaHQpQ0scajhi73ihVNOXloK6sywl7dJl
QuU7D7oQy8R+gIOoRFZJlpTJncVbjzTu8OYhsTA0tmhZabCjATTv6/LG3Dnt56wv
W27mC1w2l+o8bEo2PlTfVQ8KLisUytfeJeTFfW0Ltk7H49CphWWbzKNRZZ4v1Gmw
xzSfFj5Gbmse541KWmxbpx04Rgv0JTjHayepO+ahTlzMQcw4FbGzLZcWdwL9JSaL
DCA92WykkX26YG/kW+08qeFEVKKyhrllVJYUKibsJCLf39suCqVAE8e0NCizaKUH
COFiBNEXg+pf6SzTwjRDCqM7VVxLpjcqdIfRQFGLB3FASsCJrLkb9T3VDq/iLknz
cnIuJbYfah5I6DcM7Sqg
=356P
-----END PGP SIGNATURE-----

--=-V19UO1m711bR1Nob6YxU--
