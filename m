Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8pXb-0001mj-9L
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 09:35:27 +0000
Message-ID: <1346751620.12610.35.camel@sauron.fi.intel.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jaya Kumar <jayakumar.lkml@gmail.com>
Date: Tue, 04 Sep 2012 12:40:20 +0300
In-Reply-To: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-30aT2yXr1XbVyKZCZ9ri"
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


--=-30aT2yXr1XbVyKZCZ9ri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 18:45 +0800, Jaya Kumar wrote:
> Hi mtd friends,
>=20
> Sorry, I have a somewhat offtopic question. I'm using ubifs, and I'm
> trying to figure out what would be a good way to handle browser based
> firmware upgrades. I've implemented the following:
>=20
> - NAND is partitioned into bootloader, kernel, ubifs
> - system is running from ubifs
> - httpd with CGI is running from ubifs
> - user uploads firmware containing ubifs.img (150MB) using this CGI
> - during the upload, the CGI writes the temporary file (up to 150MB)
> to a fat partition on a empty microSD (a non-booting microSD has to be
> always present for this to work)
> - upon completion of the upload, the CGI unpacks the temporary file
> and validates checksums, this of course needs more space since now
> both the temporary file and unpacked results are present
> - then reboot since we can't ubiformat/reflash from the running ubifs
> partition and I can't detach from it for same reason.
> - upon reboot, u-boot script checks for the presence of the ubifs.img
> in the microSD fat partition, if it is there then it nand erases the
> ubifs partition, then does nandwrite of the ubifs.img
> - I realize this loses the erase counters since it is simplistic

If you use ubiformat for erasing, then the erasecounters are preserved.

> - system boots and then removes the upgrade files so that it doesn't
> repeat for each bootup

> This seems clunky and I recognize that if the upgrade is interrupted,
> the unit would be bricked. I was curious how other people implement
> this and what the best practices are. I was thinking whether I should
> have another partition for a small upgrade-only OS, so if u-boot
> detects ubifs.img or a user button press, it boots into the
> upgrade-only OS and then I can run ubiformat from there. I would
> welcome any advice/suggestions.

Well, if you use mSD, you may have space to save the contents of the
partitions which you are trying to update, which would allow to
roll-back to the old system should something go wrong.

Another approach people use is that they have "mirror" UBI volume of the
same size, like "ubifs-reserve". Then the update image is put to
ubifs-reserve, and after this you use the UBI volume rename feature and
rename "ubifs-reserve into" "ubifs". This will kill the old "ubifs"
volume. After this you may resize "ubifs" to something larger, and
create a new "ubifs-reserve" volume.

See "Volume update" here:
http://www.linux-mtd.infradead.org/doc/ubi.html

--=20
Best Regards,
Artem Bityutskiy

--=-30aT2yXr1XbVyKZCZ9ri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRcyFAAoJECmIfjd9wqK0LqYQAIcvk8dGQeCmioHOZg2mQTY8
+IBENicDOQt6PdtkqxOASNgALDtXDmg+K32CdEaMqZb4KvtyOkYfg+MxGYwLjcz4
22nFMWSl5WzPF0Q/7kyz8lTPY1FDvgtQFL7qK+z32md+qb2pJtb1jz95wq3rQj8Y
tcl06ee4CgctzF/dX87HR/xbxnTZJ4Q0v3WrWuy0Hp6VlcOqECzBkiDt7P4WjFlZ
RNVSmzn5ZTjlJMBhfJR2c8EuAHI7o8QQek3dOTfp2hrFDRGbnOahYlpfvoh8X3/Z
ZB39AHuPfQ5xwI6Gmac3jX4myvRs3Np57aQf3mJzopH+iAFhSSQ4QsOoQSRtH0IS
w/QSlXpej63akQWAkHpUP2BNcSarOCTjarynsa0rn2NBUc/cVu5vkUbwr5iQ3hbr
/Lm0PDoRGGFUMMzZaQwV2793JUqRWk/7tGtIT+/SBpVtmvRezFDaeLzKp4N04RgE
VWojo5VQsgKwFY6AUzFEaYVf6MKEimlf2l/M/1nKWs+NIWd/V69QmN7j6IogQKuL
vnZbYCJVxdl4VwwDM94I9pQwr1OH6CrWqC+ALhqmdAeYZxS0TzwjvP1dKVpMSO6Y
NzzdKiGoXM+HFrO9xZgE7217Tb8dNFvyoxFslwL5K92r6FjLzTP7h61uEt+kxh5J
viyK81e9bVEAt04mMYVw
=JBej
-----END PGP SIGNATURE-----

--=-30aT2yXr1XbVyKZCZ9ri--
