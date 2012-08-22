Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Al2-0005Jw-EL
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 13:14:05 +0000
Message-ID: <1345641529.2848.185.camel@sauron.fi.intel.com>
Subject: Re: UBIFS corruption after software upgrade
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell Zuck <rzuck@cincinnatitechnologies.com>
Date: Wed, 22 Aug 2012 16:18:49 +0300
In-Reply-To: <501923A9.7030002@cincinnatitechnologies.com>
References: <500F0D81.8050902@cincinnatitechnologies.com>
 <501923A9.7030002@cincinnatitechnologies.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qpTxTand0miB33+Sq7T7"
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


--=-qpTxTand0miB33+Sq7T7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-01 at 08:40 -0400, Russell Zuck wrote:
> On 7/24/2012 5:02 PM, Russell Zuck wrote:
> > I have not yet attempted to reproduce this issue using nandsim nor do I
> > have a simple reproducer for the problem yet.  Please provide some idea=
s
> > about how to simulate the reboot using nandsim as I think the reboot
> > portion of this scenario will be critical to reproducing the issue.
>=20
> Can anyone direct me to some information that might help me simulate a=
=20
> reboot using nandsim to attempt to reproduce my UBIFS corruption issue?
>=20
> Additionally, I would really appreciate any suggestions, tips, tricks,=
=20
> criticisms of the upgrade process I outlined previously, or "Have you=20
> considered this" type questions.  I've read everything I could find that=
=20
> even remotely pertains to my scenario but nothing is clicking for me=20
> yet.  I'm desperately trying to resolve my issue.  Any guidance would be=
=20
> welcome.

Do you have a kernel which worked for you? One strategy would be to
bisect or look at the differences.

WRT power-cut testing. Could you try your kernel + nandsim. Just do the
following:

$ modprobe nandsim first_id_byte=3D0x20 second_id_byte=3D0xac third_id_byte=
=3D0x00 fourth_id_byte=3D0x15
$ modprobe ubi mtd=3D0
$ ubimkvol /dev/ubi0 --lebs 4064 -N test_fs
$ mount -t ubifs /dev/ubi0_0 /mnt/ubifs

You should end up with something close to your system.

Please, then try to do:

$ echo 1 > /sys/kernel/debug/ubifs/tst_recovery
$ cd $HOME/git/mtd-utils/tests/fs-tests/integrity
$ ./integck -p /mnt/ubifs

This should start recovery testing. Does it work?

The "integck" test is part of the mtd-utils repository.

But from your description it looks like something related to your
system, not UBIFS.

--=20
Best Regards,
Artem Bityutskiy

--=-qpTxTand0miB33+Sq7T7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNNw5AAoJECmIfjd9wqK0RowP/jTNc6oeX+/2sotxA+4kSJzL
hdL6Frh8R9xJKebmfSI5NMy2ux2ly6SUEBXwyNLXQsnC4swNGevh1te9UCPiZHUD
8rOOTBcqbdCxHcr2/WZiOFLzs0gcduW+foEMSEfGF7KG9P/GC6zRKOM2TmzUw0VE
shBWmxu3lOB5DPpZp0pepT5X91hK3lFVm730rFUkSltZgqjMPBEPFjYknWeThjGi
K+OFC/kfThc2Vxc6S9xNtN/r95spFEoZIkQp3ommEA9GUBFFLFIT9D/9gj7AiFc4
0Fd9z0W8NovGIbJnuqbYqDDIz4S/e1xBaLl9BMfCeCBMjUA0mpLCN2UKVvMAJlK2
wUt6oxru/HdbDIcaM0n+nvBJh/ESjkFgTq+nyZ7hWM3yGFhN461H5NV/4xGidgbq
4nXORJkIrAj/WjISOw+7zfHFCLfEZ3vfa9KIi2tpMkFm7mQl+aIziPIAD8DcY9Tc
ZhGSrt9GK3buFMmZ1PJfwKRMGJHwU7fkB2VJNff4DJnrsJ2e1Pbw63sDtJe7pKZu
/LKiuR/3vjn7TZpBhtRpSAeBzGN8Pdyhgq9fv3JvYM0Kc9oy+dfgn8ihPZU5RLYC
9rN5mcSZC5TUmJW71VX+PHG/Bo/W3EBtI5Pds+5bA4duLXwwfJsn1gSuOKN0slIy
U5qdKRihFLvVgXWRgrHj
=xCRD
-----END PGP SIGNATURE-----

--=-qpTxTand0miB33+Sq7T7--
