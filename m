Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4od3-0008Od-GW
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 07:48:30 +0000
Message-ID: <1345794797.2848.264.camel@sauron.fi.intel.com>
Subject: Re: jffs2 copy too long after mounting
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
Date: Fri, 24 Aug 2012 10:53:17 +0300
In-Reply-To: <5019EE49.7000208@linux.vnet.ibm.com>
References: <5019EE49.7000208@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZVHDnPCURSgHdIpLUPjY"
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


--=-ZVHDnPCURSgHdIpLUPjY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-02 at 11:04 +0800, hejianet wrote:
> hi All
> my kernel is 2.6.16
> after mounting the nand flash with jffs2 partition, the first copy operat=
ion
> for a 15M file(from jffs2 partition to jffs2 partition) take 9
> minutes,but the
> second copy operation takes 1 minutes.
> the disk usage(df result) is over 85%.
> I wonder is there any patch ported to such old kernel?

His is because how JFFS2 is designed. When the mount operation is
finished, JFFS2 does not really finish mounting. There is the background
process which keeps working - it basically reads all files in the system
and checks the CRC, which is needed to find out which nodes are new and
which are obsolete.

So what happens is that you mount JFFS2, the background thread keeps
working (see 'top' for example).

While the background thread works, you can read files. But you cannot
write - writes will be blocked. Well, it is a bit more complex - you can
write a little, but from some point your writes will be blocked until
the background thread finishes. Then the write will continue and finish.

In you case, you mount, start writing your 15MiB file, write gets
blocked, waits for the background thread, then continues write. The
background thread takes ages to finish on big partitions.

The second write is fast because you do not wait for the background
thread any longer.

--=20
Best Regards,
Artem Bityutskiy

--=-ZVHDnPCURSgHdIpLUPjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNzLtAAoJECmIfjd9wqK0TrcP/3LgqlyanWEPZpNebJJA/Rru
VOuJPxDoI37ctU1DWN6KiUbD84HqY+Ar5cXTUxdzFnFB3hrMo++lbx+T5b4H1iVy
fq55P8+0d+9emeKJgau4gHXaY3XWk2FUuokYbqyVO8iuyUyNsJn8MfbXQWJh7myV
bCl7bAn0VWcm7NILMOYOQx/uw9DI0uSTa1v0Atnyl94EfiFHcGEcR9YL+k2Ot+GQ
xa2zVCJXFv2I7Tl5DvQpbfGzKYUr5to5XIrj+Py8ciruUqHsPGsfz78X2cNs6jAx
zQp8l7U0idXOldMMIjBGtxWPlNuscZP6g4wTIYuX7hO+vONhkw3WUTnxGts2X367
QlBfpUZOm4rTFtm6lPoQWXh9oLq40/8Ei2DoTTzKlJJVDVyVTCF8l16JTRyOuUhv
wlMq7Yj0Wu3GrXw/lsiSJB++NK8PpWsKWdGM068K8rMAT5kEBp6LQYtvWXp7cQYm
ZRxQPyU+78r2IpI/SMTxglZqqCHv+nWiR6IxrQni1ZthZ6izP58g2ghXNAPoAJAp
8YneiKDjAWJ+HI1QNt+BDj+u/U3W+dWVmSMUipMQ0FZWzEynoZ4rOvHaOC8PumDl
3ufBcYwXgewKJpRN2WBDwNIggSwpvfyFeSpAkak+JbI4Doj9KQWfas91gn/EH7dN
NxG3xMf+K/8twvPZXBa3
=nVM8
-----END PGP SIGNATURE-----

--=-ZVHDnPCURSgHdIpLUPjY--
