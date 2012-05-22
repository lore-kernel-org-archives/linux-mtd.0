Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWk7l-0005UE-Vf
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 08:07:22 +0000
Message-ID: <1337674258.2483.123.camel@sauron.fi.intel.com>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Homann <homann@bury.com>
Date: Tue, 22 May 2012 11:10:58 +0300
In-Reply-To: <4FBB3E7F.3080807@bury.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VzJgPFlq22rUWgTQ+S4H"
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


--=-VzJgPFlq22rUWgTQ+S4H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 09:21 +0200, Robert Homann wrote:
> OK, thanks. Actually, writing such a tool is not completely out of
> question in my case... How hard do you think it would be to implement it?
> Would such a tool simply change some values in a few structures or would =
it
> have to do something much more complicated? Or could some existing tool f=
rom
> mtd-utils be extended to do the job?

The idea is that we have on-flash area called "lprops area" which stands
for "LEB properties" and this area contains per-LEB information, e.g.,
how much free space this LEB contains. Obviously - the larger is the UBI
volume, the more LEBs it has, the larger is the lprops area. The lprops
area sits at the beginning of the flash.

When you create the file-system you can specify the size of the lprops
area indirectly using the --max-leb-cnt option. To re-size beyond that,
you need to extend the area, which means that you need to relocate the
contents of LEBs which follow this are further to the end of the device.
This this will change the position of UBIFS nodes, and will re-quire to
amend the indexing information. This is not a simple task, but doable.

However, it may be easier to copy the contents of the entire file-system
to a local machine, then re-create a new image with those files, and
re-flash the device with the new image...

--=20
Best Regards,
Artem Bityutskiy

--=-VzJgPFlq22rUWgTQ+S4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu0oSAAoJECmIfjd9wqK0HwQQALP6xb1npH54E8iSYmMG9YdQ
cpUD17xJwQuYbItjLVVohYWHVgEzSWbeW8DuB46wKvjzhBpOjveHf82qR9v9RUvN
U+bRWfwNyguqdRmWKbRw2/C8mmYOqVwBUBhw1ySmq2E58MAkoOiOwJ841K2QTSKg
VZDht8xO+nHVFauIeT1aWYkI+Jzf/AQb2YsVyz9lozmgPirjrvbGMzDzck+s/sA8
xc7cPdG+cD3N/KBFlP7B+rqfhIk9S+rcDRZBXBKI97CTeJBbnzdLe5CBeIU8SAvn
1XUvsR5s0ONu09lOGk3IhcfvkqrF6lOxeKWxWwwwjDdbFiUdsLNSCiTJRY7uzXHZ
xWqVwIq5+pudfEi2ZOeLC0PH1D72twZvxoQ4j4JEhtUXq8u2qFXtiUGexBJnsdcF
fma2zFq1K3lXgwVT/p4Rv+UWq+aRkpuZSCgnTURWWEglHJ9naSY1GQVwYo4yGonx
q5ibigbbVxKtuPI3Rsu/8KfI2W/Zuf3mdiaq69t62yCU1ruuO0LJ2OeOj0t7Qzd1
KCc72GvuXx2M+QRldQmo87M0CD6kkFejeqldT2gBVOGRT3jCAlpDbufnVNh+G+gg
5hV4CS/U43/7MucxRyjJNtqI8+we7RBm1Cg1V2L4oPZ3abacNuLQ5BQr2qGd0PF+
dxJMw2hfC/PLn5th2JhW
=LdC/
-----END PGP SIGNATURE-----

--=-VzJgPFlq22rUWgTQ+S4H--
