Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPMvH-0007LM-RE
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 05:18:41 +0000
From: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>
To: Richard Weinberger <richard@nod.at>, Dan Carpenter
 <dan.carpenter@oracle.com>, David Gstir <david@sigma-star.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: RE: [patch] ubifs: potential uninitialized variable in
 truncate_data_node()
Date: Fri, 6 Jan 2017 05:18:12 +0000
Message-ID: <6139ebf22df34767873e7fce48ab5b54@SGPMBX1023.APAC.bosch.com>
References: <20170105124635.GA8525@elgon.mountain>
 <787dbd07f1ed419ca37f3bb0c6f6c84a@SGPMBX1023.APAC.bosch.com>
 <5f927d38-c92c-55eb-f2a7-bba3b5f0ebd8@nod.at>
In-Reply-To: <5f927d38-c92c-55eb-f2a7-bba3b5f0ebd8@nod.at>
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

Hi Richard,

I am using the kernel version-30.3.5

Is there any patches available to fix this issue...???

Best regards

Raghavan Anurag
RBEI/ETW1 =20

Tel. +91(422)667-4001 | Mobil 9986968950



-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Richard Weinberger
Sent: Thursday, January 05, 2017 6:42 PM
To: Anurag Raghavan (RBEI/ETW11) <Raghavan.Anurag@in.bosch.com>; Dan Carpen=
ter <dan.carpenter@oracle.com>; David Gstir <david@sigma-star.at>
Cc: linux-mtd@lists.infradead.org; kernel-janitors@vger.kernel.org; Adrian =
Hunter <adrian.hunter@intel.com>; Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] ubifs: potential uninitialized variable in truncate_da=
ta_node()

Raghavan Anurag,

Am 05.01.2017 um 13:54 schrieb Anurag Raghavan (RBEI/ETW11):
> Hi All,
>=20
> My appdata partition could not be mounted or where the partition was not =
able to be used. Anyone can help me to find out the root cause of this. Wha=
t are the possibilities of this ubifs corruption. Any patched are available=
 to fix this issue.
>=20
> Error logs:
>=20
> [    1.797141] UBI error: ubi_io_read: error -74 (ECC error) while readin=
g 253952 bytes from PEB 445:8192, read 253952 bytes
> [    1.808274] UBIFS error (pid 491): ubifs_scan: corrupt empty space at =
LEB 489:233760
> [    1.816037] UBIFS error (pid 491): ubifs_scanned_corruption: corruptio=
n at LEB 489:233760
> [    1.828660] UBIFS error (pid 491): ubifs_scan: LEB 489 scanning failed
> [    1.835215] UBIFS warning (pid 491): ubifs_ro_mode: switched to read-o=
nly mode, error -117
> [    1.843502] UBIFS error (pid 491): make_reservation: cannot reserve 58=
 bytes in jhead 2, error -117
> [    1.852569] UBIFS error (pid 491): do_writepage: cannot write page 0 o=
f inode 76584, error -117
> dpkg: error: unable to sync new file '/var/lib/dpkg/arch-new':=20
> Structure needs cleaning

Why are you hijacking this mail thread?

In your case UBIFS fails because of an ECC error in 0xFF bytes.
UBIFS does not expect this and the MTD driver has to make sure that it does=
 not happen.
Is this a recent kernel?

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
