Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4vls-0000Pt-JW
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 15:26:06 +0000
Message-ID: <1345822171.2848.325.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Do not try to autoresize in readonly mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Date: Fri, 24 Aug 2012 18:29:31 +0300
In-Reply-To: <8381186.XTLIOQGYR2@pali>
References: <8381186.XTLIOQGYR2@pali>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-x4soqKbnJrGkr3yLRwvZ"
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


--=-x4soqKbnJrGkr3yLRwvZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-18 at 14:11 +0200, Pali Roh=C3=A1r wrote:
> I'm sending small patch which skip autoresizing ubi in readonly=20
> mode. I think it is really not good idea to try resize in ro=20
> mode.

Hi, I've just pushed a similar patch to linux-ubi.git, is this fine with
you? I've also CCed -stable.

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Sat, 18 Aug 2012 14:11:42 +0200
Subject: [PATCH] UBI: fix autoresize handling in R/O mode

Currently UBI fails in autoresize when it is in R/O mode (e.g., because the
underlying MTD device is R/O). This patch fixes the issue - we just skip
autoresize and print a warning.

Reported-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 355756b..8966088 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -799,6 +799,11 @@ static int autoresize(struct ubi_device *ubi, int vol_=
id)
 	struct ubi_volume *vol =3D ubi->volumes[vol_id];
 	int err, old_reserved_pebs =3D vol->reserved_pebs;
=20
+	if (ubi->ro_mode) {
+		ubi_warn("skip auto-resize because of R/O mode");
+		return 0;
+	}
+
 	/*
 	 * Clear the auto-resize flag in the volume in-memory copy of the
 	 * volume table, and 'ubi_resize_volume()' will propagate this change
--=20
1.7.10.4


> BTW, is there userspace tool for unpacking data from ubifs image=20
> without need to simulate nand device in kernel?

Unfortunately no.

--=20
Best Regards,
Artem Bityutskiy

--=-x4soqKbnJrGkr3yLRwvZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN53bAAoJECmIfjd9wqK0P7AQAIPhcMGKOdpfCt8ZQFftN3ZI
sf2KAbRT4Dl6qVkwEhngQ1At+PQ3DxECAxMAzxldvbxxr63dyKFFAzCoM9atAXLp
fo6Nu2EpZ2/1lyGKJmDslHNg6lHDUDuhJe38yiRfcT2MxuoWWVdrGMJLaoW/CnDR
3UGxxjZGVAGC7ppS1vMFBi1h3O3h9n17BlceXjw5G1ddmbHM2Nh75XFFyb4SPN2v
F2Rs/Z1FsNCqfM0Obf3BtBvfnDklQJtAlaobLyf/LCd1+M9ULPXetUELZuW+7Dl3
GSq/F0ezWCvlYP8D66QpBrvJMpdPMO2GPZMLlmWuhuZnr0cVW1qlLkEwku+2PMjj
6oh17tzbWSDtxn9b4FJGEO7pceDI83rxpTL+BzezgEs3xPsC6e1i8wt/hSE3+4kU
zbutnpOJZwQ9+q9nkn9WF2SYa8fYeklv1FmdnsKQUxiH62OP8Md6X+s9z4jH7tDI
pSFSTRV4S3ZLXlu739rpNfWvUithnD+jSs5Lk+s7XnzALJ0h6pq81+8qsb0eTVak
d9SLIJ43Y+/httfm68jnhe+8MFztjdyN3sNPZo4aviSCCzD8inxNfJIlSG2mQ9rT
f0OMhOuXH0Jt7OMRckLcMFs4nUMzUZkaEi9xZvd/YAzONFZAaTk5v65zNcNf5+1W
JUQ6SM/MaA9l1bIrrONh
=FACg
-----END PGP SIGNATURE-----

--=-x4soqKbnJrGkr3yLRwvZ--
