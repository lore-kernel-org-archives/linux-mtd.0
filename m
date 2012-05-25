Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXuRl-00087y-2k
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 13:20:50 +0000
Message-ID: <1337952271.30969.37.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: compute KSA size and store in superblock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 25 May 2012 16:24:31 +0300
In-Reply-To: <alpine.DEB.2.00.1205251509220.2989@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205251509220.2989@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KPmpepioGWYnejquzGV+"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KPmpepioGWYnejquzGV+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 15:10 +0200, Joel Reardon wrote:
> This patch makes the super block reserve space for the KSA. It computes t=
he
> number of KSA LEBs and adds the ksa_lebs to on-medium superblock. The val=
ue is
> read off the media. The decision to use a KSA is controlled by use_ubifse=
c
> switch, also added to the superblock, ubifs_info, and is controlled as a =
mount
> option.
>=20
> This is tested by creating a drive and checking the mount debug output. T=
he
> number of LEBS assigned during create_default_filesystem was changed to e=
nsure
> that remounting does infact read the old value. When the use_ubifsec opti=
on
> was not enabled, no LEBs were assigned. Integck was run and the drive was
> filled to capacity. The LEBs in the KSA were not used when filled.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

I do not have to time to review it now, but please, make sure that the
KSA size is according to 'max_leb_cnt' (see the --max-leb-cnt of the
mkfs.ubifs tool). Also, think about this use-case in general: you have
UBI volume of size X, then the volume is resized to Y > X, then mounted
- UBIFS should work and resize itself to Y, up to the 'max_leb_cnt'. If
Y > 'max_leb_cnt', we resize only to 'max_leb_cnt'.

>  struct ubifs_sb_node {
>  	struct ubifs_ch ch;
> @@ -649,7 +651,9 @@ struct ubifs_sb_node {
>  	__le32 time_gran;
>  	__u8 uuid[16];
>  	__le32 ro_compat_version;
> -	__u8 padding2[3968];
> +	__le32 ksa_lebs;
> +	__u8 use_ubifsec;

If it is only one bit, document that only one bit (LSB?) is used. In the
future someone can add more bits there, and rename it, theoretically
(unlikely though).

--=20
Best Regards,
Artem Bityutskiy

--=-KPmpepioGWYnejquzGV+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv4gPAAoJECmIfjd9wqK0MB8P/3XKw3VkYSMRNgyr9it6GRvA
dUMi4hyu9GROVuEQakxkbdAMDtP1R/vepIhCbECyq8UrIQjyLwo078ILFvo6T+zm
DGqnOiKgYp3WN8mWWZQ2aUCSRYmP2PYgRSuBW1496irGJg+8TGfxZXUIX1o7NCA8
OtTfrYvdOiUfytlI/BEwbkzzFajdB5JLHDgrmXDXlxPczGYYIVlZ3OT3VvC70uYr
Y8vzWeh1O/kaT0sIOtmiuE4WYGiIteilr2a/TtYBFl6p+VygXz8HmmBtW5ScoCK8
yaSRxHcxMtgb5Qgd6hFaItlOSCNrPxuWXZb3AadA7py8GCaZHo2W1EJWIe42nEBY
lReKBjebeKgn4T5FbPeOgh2uOm07RaLDz4q/WhfWQV62+wAxbIslLWZDaX31IOB0
39KW2z3mI/a3J3WaEGH3fg4G4TNZi3Zvz2zks3w5guVUSogvc3qgCMbI7234MeHJ
vGrPaulhupPeorawOurxNwIIQOT9pe+qEy2xcOZcZJoOZJIO2aruj6Lld06rvclB
OsNGf/G5XJ/QTpKnDcxlQkMWDkLEEIsmlJ5sljTt+6bnsKnFw0+6VHgse5L0mwGt
hEoMJo6a7/a9MQITcIi/SSd6WU/vfm1bq+epVMYqx3OHxjaFI+r3ukgMB6i4ZLOU
UVEGN85iwPtLWwY1W/ux
=lCPV
-----END PGP SIGNATURE-----

--=-KPmpepioGWYnejquzGV+--
