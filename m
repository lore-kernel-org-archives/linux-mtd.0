Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cP7Zh-0007E7-Ue
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 12:55:25 +0000
From: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Richard Weinberger
 <richard@nod.at>, David Gstir <david@sigma-star.at>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: RE: [patch] ubifs: potential uninitialized variable in
 truncate_data_node()
Date: Thu, 5 Jan 2017 12:54:49 +0000
Message-ID: <787dbd07f1ed419ca37f3bb0c6f6c84a@SGPMBX1023.APAC.bosch.com>
References: <20170105124635.GA8525@elgon.mountain>
In-Reply-To: <20170105124635.GA8525@elgon.mountain>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

My appdata partition could not be mounted or where the partition was not ab=
le to be used. Anyone can help me to find out the root cause of this. What =
are the possibilities of this ubifs corruption. Any patched are available t=
o fix this issue.

Error logs:

[    1.797141] UBI error: ubi_io_read: error -74 (ECC error) while reading =
253952 bytes from PEB 445:8192, read 253952 bytes
[    1.808274] UBIFS error (pid 491): ubifs_scan: corrupt empty space at LE=
B 489:233760
[    1.816037] UBIFS error (pid 491): ubifs_scanned_corruption: corruption =
at LEB 489:233760
[    1.828660] UBIFS error (pid 491): ubifs_scan: LEB 489 scanning failed
[    1.835215] UBIFS warning (pid 491): ubifs_ro_mode: switched to read-onl=
y mode, error -117
[    1.843502] UBIFS error (pid 491): make_reservation: cannot reserve 58 b=
ytes in jhead 2, error -117
[    1.852569] UBIFS error (pid 491): do_writepage: cannot write page 0 of =
inode 76584, error -117
dpkg: error: unable to sync new file '/var/lib/dpkg/arch-new': Structure ne=
eds cleaning

Best regards

Raghavan Anurag
RBEI/ETW1 =20

Tel. +91(422)667-4001 | Mobil 9986968950


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Dan Carpenter
Sent: Thursday, January 05, 2017 6:17 PM
To: Richard Weinberger <richard@nod.at>; David Gstir <david@sigma-star.at>
Cc: kernel-janitors@vger.kernel.org; linux-mtd@lists.infradead.org; Adrian =
Hunter <adrian.hunter@intel.com>; Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] ubifs: potential uninitialized variable in truncate_data_n=
ode()

GCC doesn't complain, but my static checker warns that if the data is not c=
ompressed and not encrypted then "ret" isn't initialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c index a459211a1c21..c5=
4f04d88236 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1281,7 +1281,8 @@ static int truncate_data_node(const struct ubifs_info=
 *c, const struct inode *in
 			      int *new_len)
 {
 	void *buf;
-	int err, dlen, compr_type, out_len, old_dlen;
+	int dlen, compr_type, out_len, old_dlen;
+	int err =3D 0;
=20
 	out_len =3D le32_to_cpu(dn->size);
 	buf =3D kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
