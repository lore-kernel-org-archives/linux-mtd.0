Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeMSC-00018s-Lv
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 09:00:13 +0000
Message-ID: <1354266059.30168.59.camel@sauron.fi.intel.com>
Subject: Re: UBIFS error (pid 564): read_znode: bad indexing node at LEB
 484:66064, error 2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: micah anderson <micah@riseup.net>
Date: Fri, 30 Nov 2012 11:00:59 +0200
In-Reply-To: <87obixil6r.fsf@minnow.riseup.net>
References: <87625h85fd.fsf@minnow.riseup.net>
 <1353054666.3618.6.camel@sauron.fi.intel.com>
 <87obixil6r.fsf@minnow.riseup.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hzdXfWsjOzXRKAj3cKkM"
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


--=-hzdXfWsjOzXRKAj3cKkM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-16 at 11:09 -0500, micah anderson wrote:
> [   97.273764] UBIFS error (pid 564): read_znode: bad indexing node at LE=
B 484:66064, error 2
> [   97.282188] UBIFS warning (pid 564): ubifs_ro_mode: switched to read-o=
nly mode, error -22

Did you re-size you UBI partition? The corresponding code in
'read_znode' is:

                if (zbr->lnum < c->main_first ||
                    zbr->lnum >=3D c->leb_cnt || zbr->offs < 0 ||
                    zbr->offs + zbr->len > c->leb_size || zbr->offs & 7) {
                        ubifs_err("bad branch %d", i);
                        err =3D 2;
                        goto out_dump;
                }

But I do not see the 'bad branch' message. Your UBIFS code-base is so ancie=
nt?

Then, in 'out_dump' we actually dump the znode. But this is not in your
logs. Most probably because we dump with KERN_DEBUG level, which does
not make it to your console. You need to boot with the 'ignore_loglevel'
kernel parameter.

But anyway, this does not look like something related to your flash
driver - the znode CRC checksum is correct, but the contents makes no
sense. This can be an UBIFS bug, but this is the first time I see this.
Often things like this are caused by memory corruption - if you have a
buggy driver which corrupts memory and writes garbage to UBIFS memory,
this kind of stuff may happen. You can try to enable memory
instrumentation like full slab/slub debugging and red zones, and
validate your system. Read carefully the docs - AFAIR slub debugging
options in the kernel config only add debugging support, but do not
enable it by default - you need to enable it separately.

Also, try to take the latest code from a UBIFS back-port tree, although
ubifs-v2.6.32 is not supported any more, but at least it is a lot newer
than vanilla 2.6.32, which is only interesting for archaeologists
nowadays :-)

--=20
Best Regards,
Artem Bityutskiy

--=-hzdXfWsjOzXRKAj3cKkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuHXLAAoJECmIfjd9wqK0O2gQAKGm7TlaGR/BxAeuVFAe17M8
YFz4GQXobKZ/gHWuELJPdRqTJXa22tiDDZmSpYOa+PcELYKzjdoOxPh1IaoDZyNw
Kn7cJA0xt7iu5BpAaEEqUnH6WVlH7jigta0kQ74+c/NVyRaJ55zhLpEZKkdeEzzo
xAaFLU3R6SQ6UJZDucdIxjSo4alJnSuhiaYKzNgcfQqxeX2Yb62pqpGFUwxuj6Qf
Tg/uj1MBhKiGx4g/TGRDy/Zr8IrrIWQJBLkYDDk0LgQRs4uFP/UO/i3EmQM0xibJ
yLKUPOCiWJ3xi9dNbSrNBc/nx8oEbD16NYvyi/43P3pbxbwDZxZheQBk/4+Ldr8D
a9c4tjwwsbdRqThaYaczz+d2UtPP5ENFxChAlaDFpugZbMMW+zB1VSin73IN4wfl
pEhfRNZbKMfQQJqMFw3v8z+4x3EXn0guos4vz/kt1qinJc7t/68ATvu21Obq8AyK
ew2F2t78+/xwzbjUYMmoXJV0ayGUlM2rWByqDvJS/ZE7Cpaz/BgjJX4LDQlb9nPG
XpACBSDGLX/XsPep/jVNGPOboMC2owHIcRd/jFUvkB7kekDDQ3DCZ0I0pXC6R4Rf
LG2vQWXm9jVOFrJMwLmDMCvO20NBtaZxvwk3vQAXqNfjLwzcSrdp6uHrOI/pD8DR
cG4f/KjqBNauVeLPctgF
=ci4z
-----END PGP SIGNATURE-----

--=-hzdXfWsjOzXRKAj3cKkM--
