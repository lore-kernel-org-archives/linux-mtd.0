Received: from mailserver5.natinst.com ([130.164.80.5]
 helo=spamkiller05.natinst.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULMjQ-0007uU-Kw
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2013 23:59:45 +0000
Date: Thu, 28 Mar 2013 19:00:18 -0500
From: Josh Cartwright <josh.cartwright@ni.com>
To: Matthieu Castet <matthieu.castet@parrot.com>
Subject: Re: RE : UBI(FS) issues: how to debug?
Message-ID: <20130329000018.GF24548@beefymiracle.amer.corp.natinst.com>
References: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
 <C429A122CB68254FACED4BEF16AA357A538A5392AB@OPALE.xi-lite.lan>
MIME-Version: 1.0
In-Reply-To: <C429A122CB68254FACED4BEF16AA357A538A5392AB@OPALE.xi-lite.lan>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 28, 2013 at 08:17:40PM +0000, Matthieu Castet wrote:
> Hi,

Hey Matthieu,

Thanks for the response.

> I saw that you have :    - NAND chip - Micron 8GB, on-die 4-bit ECC
>
> Could you post the patch you are using to use internal ecc ?

It was linked in my original post.  At this point, the vendor-provided
NAND driver has this hacked in.

> Did you try to add bitflip in nand (disable internal ecc, read block, add bitflip to data, erase et write) to check if bitflip are detected.
> Idem if you add more that 4 bit flip, do you have an incorrectable error ?

I like this idea.  I'll figure out how to give this a test.

> >  Loading file '.safe/linux_safemode.itb' to addr 0x08000000 with size 29085407 (0x01bbcedf)...
> >  UBIFS error (pid 0): ubifs_check_node: bad CRC: calculated 0x60c5bc7f, read 0x26c2f675
> >  UBIFS error (pid 0): ubifs_check_node: bad node at LEB 237:49728
> >  UBIFS error (pid 0): ubifs_read_node: expected node type 1
> >  UBIFS error (pid 0): do_readpage: cannot read page 7097 of inode 66, error -117
> >  Error reading file '.safe/linux_safemode.itb'
> Does it happen on readonly file ?
>
> If yes can't you compare the data/node between a working target and a bad target ?
>
>
> When doing your test in room temp, did you try to enable SLAB_DEBUG or other ram test ?
>
> RAM corruption can produce weird result, but I expect I cause some oops that you will notice.

Good idea, the extent of kernel debugging features enabled for the test
runs in the chamber were fairly limited, I'll see to adding more checks
in place to eliminate other non-NAND related issues.

Thanks again,

  Josh

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRVNmSAAoJEEef0niEbw+lQ4MP/2DSwsjs2zHyljfyHfX3K71o
uInHtqkGqoDtXvUxv6tEINwkGe2pXtOEHk4E/aTMV3B4CAg536KZIqnW42Vs3arG
FWLZhoca7QrUszjX/MUH/2tTLhNEFVBJBSMy+kTR5q89XemvXO+lJw+5pNE7i3kZ
OCWncwdsCrkCry9ubQa7qgZf4wnGvTixWzO18Vy3JZM0gr90pqPVnZO0lJBSOknN
0fiPSYYWTMN+VbK9R3nl2HpW5iQpxAFOz00/VxfdfCXoOGRDsY0sS8rs9rBOdJLx
5xa6Bzrw1CTqCSp3XeTGlFPfUVQ99T09M1xNuUxq06RRiS7Iu84U1k00I5cK0Gzm
yJW6Gb7KWAUd0BXuwFgzAM+3T6+C/b2e6cgTuYmUgV4RquFGGvO80bAgqcyLzIbb
43NQsLlS0O8aXHwlICH6rt+uR3/y+/evVDW2RCFJQVco7IeBlic4kfRYE/iZYDK6
4mj1jwsqgj0xcf1YdAvXsxG/nON4Q65oqN9mQwW85RmttYAWprn++b8n1xkv/Ijh
hRLz4y9ptH3eLroLs/UADrgYQuhfWvNI92vhowNIaebnD99UGeh3xaaJgY0d1R1j
Q8Fzt6NDeHVWHo+vyBe0YRSt0rd9eYh4kb+g9zOypfu7J2XHD6RBHfYMwcORxWVX
0+f1eE0lF9NQ1F2tHVFX
=e4gz
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
