Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dhR-0001u7-OT
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:34:29 +0100
Received: from ash.lnxi.com ([207.88.130.242])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 190Sw6-0007dt-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 22:04:51 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Stefan Roese <stefan.roese@esd-electronics.com>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
References: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
Message-Id: <1049230283.25992.114.camel@tubarao>
Mime-Version: 1.0
Date: 01 Apr 2003 13:51:24 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-Sdb6OnbKsDi3vhkUGv0Y"
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Sdb6OnbKsDi3vhkUGv0Y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-04-01 at 07:18, Stefan Roese wrote:
> Hi!
>=20
> I am trying to use "jedec_probe.c" on our ppc based board to support two
> different flash types (AMD AM29VL160xT and SSTI SST39LF160). Both are use=
d
> in 16bit mode. Since the SST flash is not really CFI compliant, I have to
> use jedec_probe, right?
>=20
> Two problems:
> 1) 16bit support for the AM29LV160 device.
> The simple solution is to add the 16bit part as new device. Works here fi=
ne.

<snip>

I looked at your patch and saw this section where the AM29LV160 has byte
and word entries in jedec_table[]:

@@ -206,7 +218,20 @@
                mfr_id: MANUFACTURER_AMD,
                dev_id: AM29LV160DT,
                name: "AMD AM29LV160DT",
-               uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words,
not bytes!! */
+               uaddr: MTD_UADDR_0x0555_0x02AA, /* bytes mode */
+               DevSize: SIZE_2MiB,
+               CmdSet: P_ID_AMD_STD,
+               NumEraseRegions: 4,
+               regions: {ERASEINFO(0x10000,31),
+                         ERASEINFO(0x08000,1),
+                         ERASEINFO(0x02000,2),
+                         ERASEINFO(0x04000,1)
+               }
+       }, {
+               mfr_id: MANUFACTURER_AMD,
+               dev_id: AM29LV160DT,
+               name: "AMD AM29LV160DT",
+               uaddr: MTD_UADDR_0x0AAA_0x0554, /* word mode */
                DevSize: SIZE_2MiB,
                CmdSet: P_ID_AMD_STD,
                NumEraseRegions: 4,
@@ -219,7 +244,20 @@
                mfr_id: MANUFACTURER_AMD,
                dev_id: AM29LV160DB,
                name: "AMD AM29LV160DB",
-               uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words,
not bytes!! */
+               uaddr: MTD_UADDR_0x0555_0x02AA, /* byte mode */
+               DevSize: SIZE_2MiB,
+               CmdSet: P_ID_AMD_STD,
+               NumEraseRegions: 4,
+               regions: {ERASEINFO(0x04000,1),
+                         ERASEINFO(0x02000,2),
+                         ERASEINFO(0x08000,1),
+                         ERASEINFO(0x10000,31)
+               }
+       }, {
+               mfr_id: MANUFACTURER_AMD,
+               dev_id: AM29LV160DB,
+               name: "AMD AM29LV160DB",
+               uaddr: MTD_UADDR_0x0AAA_0x0554, /* word mode */
                DevSize: SIZE_2MiB,
                CmdSet: P_ID_AMD_STD,
                NumEraseRegions: 4,


Your diff indicates that MTD_UADDR_0x0AAA_0x0554 is for word mode and
MTD_UADDR_0x0555_0x02AA is for byte mode.

The AMD data sheet for AM29LV160D
(http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/22=
358B.pdf)
in table 9 - Am29LV160D command defenitions (page 24) indicates that the
unlock addresses for word mode are 0x0555 and 0x02AA while the unlock
addresses for byte mode are 0x0AAA and 0x0555.

Why the difference?  Are the data sheets in error?

--=20
Thayne Harbaugh
Linux Networx

--=-Sdb6OnbKsDi3vhkUGv0Y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+ifvLfsBPTKE6HMkRAu+pAJ0aZG865sdLFR8/pGsglQNFMCupdgCfbgzy
u/jXcBDeHe1AEbWxrB8fHNc=
=AclA
-----END PGP SIGNATURE-----

--=-Sdb6OnbKsDi3vhkUGv0Y--
