Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7PCi-0006E0-S5
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 11:16:01 +0000
Message-ID: <1346412061.9709.37.camel@sauron.fi.intel.com>
Subject: Re: UBIFS corruption after software upgrade
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell Zuck <rzuck@cincinnatitechnologies.com>
Date: Fri, 31 Aug 2012 14:21:01 +0300
In-Reply-To: <5037BFFA.1020208@cincinnatitechnologies.com>
References: <500F0D81.8050902@cincinnatitechnologies.com>
 <501923A9.7030002@cincinnatitechnologies.com>
 <1345641529.2848.185.camel@sauron.fi.intel.com>
 <5037BFFA.1020208@cincinnatitechnologies.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BCEElmBALC7R1GPW30I7"
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


--=-BCEElmBALC7R1GPW30I7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> $ ./integck -p /mnt/ubifs
>=20
> ..fails soon after I run the test.  There is a ton of logged data.  I've=
=20
> attempted to snip out the first error.

How exactly?

Sure there will be a lot of nise in dmesg because we emulate power cuts
and switch to R/O mode at random moments, so a lot of UBIFS operastions
fail and print a lot of error messages and dumps. But that's fine as
long as the system works.

The idea is that UBIFS switches to R/O mode randomly and integck will
fail with EROFS at some point. Then it will unmount the FS and mount it
back, and verify some files, then remove everything and continue, and so
on forever. This way we emulate huge amount of power cuts very quickly.

If integck fails, then the last messages of dmesg are interesting.

Last time I tested UBIFS this way, the only issues which I did not
resolve were that it was unable to mount because there was no space.
That was very rare and I had to run it for the night. I just did not
have time to dig this - must be some accounting issues.

> [  376.076585] UBIFS: cannot re-mount R/W due to prior errors
> [  376.082748] UBIFS: un-mount UBI device 1, volume 0
> [  376.095799] UBIFS error (pid 2103): ubifs_scan: bad node
> [  376.105554] UBIFS: recovered master node from LEB 1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D end snip =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Does anything in this output suggest a direction to start digging?  I=20
> would really appreciate any direction you could provide.

Hmm. I've just set up ubifs-v2.6.35 on a kvm virtual machine and started
testing like this:

$ cat ~/tmp/nandsim.sh=20
#!/bin/sh

umount /mnt/ubifs
rmmod ubifs ubi mtdram nandsim

dmesg -c > /dev/null
modprobe nandsim first_id_byte=3D0xec second_id_byte=3D0xd3 third_id_byte=
=3D0x51 fourth_id_byte=3D0x95
modprobe ubi mtd=3D0
modprobe mtdchar
ubimkvol /dev/ubi0 --lebs 4064 -N xyZ
mount -t ubifs /dev/ubi0_0 /mnt/ubifs
echo 1 > /sys/kernel/debug/ubifs/tst_recovery
#echo 'format "UBIFS DBG" +pf' > /sys/kernel/debug/dynamic_debug/control

$ sudo ~/tmp/nandsim.sh
# sudo ./integck /mnt/ubifs/

Let's see. I will try to look at failures, but so far it works fine. But
I do not promise anything - I have limited amount of time for this hobby
stuff.

--=20
Best Regards,
Artem Bityutskiy

--=-BCEElmBALC7R1GPW30I7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQJ4eAAoJECmIfjd9wqK0uCsP/0zf9Fcl8s0QXnjIUgwluXDz
/bRlHD0Mn/lFbDz8BWoqD4g+5x5F0jck67SwQofWFzchFXlyayjEpJecrnH27pfW
o974hZh1Wq+IrL1Vamazi/q+3rxiJySY5zqXRT52SlPYSgcOvGpNeuIbrRZ8CuRO
n0khzxPpgEO1OHWRQCOBs3ZjHEF/APRdLKCdcSHQEhEzExtpaKRlivzijty6NHmR
HNxYMenWLhHLz+DtRE6Ohl+97KjuncLPb60tFJbPp/LoL1mNHaNHs6s6auWGOoct
n0LeFQAAYdUQE/jB+3Y8CS9s6qFQ0mS8Ltq//zIRzP7JUZ0+OUXy2xDqTDDOQIDL
PsLDpc0Bo9WgQZNKDz1CVGZIHt4tPZ6aXEhOO/AyVM+UIshA3BXQSKmblOg6rmqB
fsMAc7ZcGw2lqVSop1TZjjrwwwrSSnlOWbAKU3oLUdB8ZBaalkCLPjlaepk0E/Xl
v2+s6TLSBmU3xYbNUmbN+HkyX5AlCn97oT2kXxEtSuU4sQX3SLq1aH8hY03QftSL
mhQjc1XdZEkStZRtpilh75XXJ6BpYVAlyO9AF2aIP/RIfIK+K6VxMLc3NRJ44jbU
kf7h4gsowi/+TbEuc5vqEk5jOIzEGPZjOncM50Q/yrjvABeej8XAk4Lwqq9saqGF
3lsij4gO4IgwD7NGCOna
=HI2R
-----END PGP SIGNATURE-----

--=-BCEElmBALC7R1GPW30I7--
