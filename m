Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNJgP-0006uQ-3T
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 10:13:14 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Date: Tue, 11 Mar 2014 10:12:41 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, Kent Li <kent.li@radisys.com>,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Few comments below...

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>
>Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
>will return all 1's (0xff). However, modern NAND (MLC, and even some
>SLC) experience bitflips in unprogrammed pages, and so they may not read
>back all 1's. This is problematic for drivers whose ECC cannot correct
>bitflips in an all-0xff page, as they will report an ECC error
>(-EBADMSG) when they come across such a page. This appears to UBIFS as
>"corrupt empty space".
>
I'm not sure, if any driver can solve this either. As if an erased-page has=
 no
ECC stored in OOB then how can any driver correct the bit-flips.
The only other way is to manually scanning through entire read_buf() and
count the bit-flips, which is similar what we are doing here.


>Several others [1][2] are attempting to solve this problem, but none is
>generically useful, and most (all?) have subtle bugs in their reasoning. L=
et's
>implement a simple, generic, and correct solution instead.
>
>To handle such situations, we should implement the following software
>workaround for drivers that need it: when the hardware driver reports an
>ECC error, nand_base should "verify" this error by
>
> * Re-reading the page without ECC
> * counting the number of 0 bits in each ECC sector (N[i], for i =3D 0, 1,
>   ..., chip->ecc.steps)
> * If any N[i] exceeds the ECC strength (and thus, the maximum allowable
>   bitflips) then we consider this to be an uncorrectable sector.
> * If all N[i] are less than the ECC strength, then we "correct" the
>   output to all-0xff and report max-bitflips appropriately
>
>Obviously, this sequence can be compute intensive if applied heavily.
>Ideally, MTD users should not need to read un-programmed pages very
>often and would require this software check, for instance, only during
>attach/mount checks or certain recovery situations.
>
>Drivers can request support for this new feature by OR'ing
>NAND_ECC_NEED_CHECK_FF into their chip->options.
>
>[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.htm=
l
>[2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051585.htm=
l
>
>Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>---
> drivers/mtd/nand/nand_base.c | 68 +++++++++++++++++++++++++++++++++++++++=
+++++
> include/linux/mtd/nand.h     |  5 ++++
> 2 files changed, 73 insertions(+)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 5826da39216e..f3723770e43a 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -1483,6 +1483,62 @@ static int nand_setup_read_retry(struct mtd_info *m=
td, int retry_mode)
> }
>
> /**
>+ * nand_verify_erased_page - [INTERN] Check a page for 0xff + bitflips
>+ * @mtd: MTD device structure
>+ * @buf: read buffer; will contain output data (either raw or "corrected"=
)
>+ * @page: page to check
>+ *
>+ * Check a page to see if it is erased (w/ bitflips) after an uncorrectab=
le ECC
>+ * error
>+ *
>+ * On a real error, return a negative error code (-EBADMSG for ECC error)=
, and
>+ * buf will contain raw data.
>+ * Otherwise, fill buf with 0xff and return the maximum number of
>+ * bitflips per ECC sector to the caller.
>+ */
>+static int nand_verify_erased_page(struct mtd_info *mtd, uint8_t *buf, in=
t page)
>+{
>+	struct nand_chip *chip =3D mtd->priv;
>+	int i, oobbits, databits;
>+	uint8_t *data =3D buf, *oob =3D chip->oob_poi;
>+	unsigned int max_bitflips =3D 0;
>+	int oob_step =3D mtd->oobsize / chip->ecc.steps;
>+	int ret;
>+
>+	oobbits =3D oob_step * 8;
>+	databits =3D chip->ecc.size * 8;
>+
>+	/* read without ECC for verification */
>+	ret =3D chip->ecc.read_page_raw(mtd, chip, buf, true, page);

You can re-use the *buf and *oobpoi  filled in by chip->ecc.read_page(),
Instead of re-reading the read_page_raw.=20
(1) Re-using buffers will ensure, that you do not re-count any bit-flips
    which were already corrected by driver.
(2) it will save overhead of re-reading the page.


>+	if (ret)
>+		return ret;
>+
>+	/* Check each ECC step individually */
>+	for (i =3D 0; i < chip->ecc.steps; i++) {
>+		unsigned int flips =3D databits + oobbits;
>+
>+		flips -=3D bitmap_weight((unsigned long *)oob, oobbits);
>+		flips -=3D bitmap_weight((unsigned long *)data, databits);

It was observed that this scanning of all(0xff) in both OOB and Data buffer=
s
caused significant performance penalty, especially with MLC and newer
technology NAND devices (as they exhibit extensive read-disturb errors
in erased-pages).

Hence as done in [2], a special function "count_zero_bits()" was introduced
which will return, as soon as 0-bit count exceeded ecc.strength. So that yo=
u
don't end-up counting complete buffer even if count exceeded the limit.

Also please use staggered approach of first counting bit-flips in OOB and
then in data buffer, so that you don't over count.
	int *bitflip_count;
	*bitflip_count =3D 0;
	/* count number of 0-bits in OOB */
	 If (count_zero_bits(oobpoi, eccbytes, eccstrength, &bitflip_count)) {
		return -EBADMSG;
	} else {
		if (count_zero_bits(read_buf, eccsize, eccstrength, &bitflip_count)
			return -EBADMSG;
		else
			break;
	}

=20
>+
>+		/* Too many bitflips */
>+		if (flips > chip->ecc.strength)
>+			return -EBADMSG;
>+
>+		max_bitflips =3D max(max_bitflips, flips);
>+
>+		data +=3D chip->ecc.size;
>+		oob +=3D oob_step;
>+	}
>+
>+	pr_debug("correcting bitflips in erased page (max %u)\n",
>+			max_bitflips);
>+
>+	memset(buf, 0xff, mtd->writesize);
>+	memset(oob, 0xff, mtd->oobsize);
>+

Now this leaves back to same question, is it correct to fill the region
with 0xff to fool UBIFS (and other upper layers)
OR
Let UBIFS (and other upper layers) try extracting whatever they
could from the corrupt/junk data. Refer discussion in [1]


Also, it makes more sense to introduce this check just before
chip->ecc.correct(), as you can avoid running through failures first.
But then that means  adding this inside nand_read_page_hwecc()
which is replacable.


[1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052501.html

with regards, pekon
