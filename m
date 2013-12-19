Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtbey-0003xk-GR
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 11:20:57 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Mike
 Frysinger (vapier@gentoo.org)" <vapier@gentoo.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: tests: oobtest: fix test failures for oobsize
 which are not multiples of 4
Date: Thu, 19 Dec 2013 11:20:20 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA57EE5@DBDE04.ent.ti.com>
References: <1382947607-27077-1-git-send-email-george.cherian@ti.com>
In-Reply-To: <1382947607-27077-1-git-send-email-george.cherian@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Cherian, George" <george.cherian@ti.com>,
 "Stefan Roese <sr@denx.de> \(sr@denx.de\)" <sr@denx.de>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: 'George Cherian <george.cherian@ti.com>'
>Date: Monday, October 28, 2013 1:37 PM
>Subject: [PATCH] mtd: tests: oobtest: fix test failures for oobsize which =
are not multiples of 4
>
>If oobsize is not multiple of 4 then the generated data to write to flash
>and data generated to verify are not same. This imapcts test cases 2,3 and=
 5.
>If mtd->ecclayout->oobavail is not a multiple of 4 then while generating p=
suedo
>random numbers to write to flash prandom_bytes_state () generates the extr=
a
>random bytes which wont be done if we do for the whole length. So check
>for mtd->ecclayout->oobavail if its multiple of 4 then generate for full l=
en
>(mtd->ecclayout->oobavail * pgcnt)
>else generate prandom of mtd->ecclayout->oobavail bytes pgcnt times.
>
>Signed-off-by: George Cherian <george.cherian@ti.com>
>---
> drivers/mtd/tests/oobtest.c | 45 +++++++++++++++++++++++++++++++++++++++-=
-----
> 1 file changed, 39 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
>index ff35c46..060ea32 100644
>--- a/drivers/mtd/tests/oobtest.c
>+++ b/drivers/mtd/tests/oobtest.c
>@@ -210,11 +210,29 @@ static int verify_eraseblock(int ebnum)
> static int verify_eraseblock_in_one_go(int ebnum)
> {
> 	struct mtd_oob_ops ops;
>-	int err =3D 0;
>+	int i, err =3D 0;
> 	loff_t addr =3D ebnum * mtd->erasesize;
> 	size_t len =3D mtd->ecclayout->oobavail * pgcnt;
>
>-	prandom_bytes_state(&rnd_state, writebuf, len);
>+	/*
>+	 * if mtd->ecclayout->oobavail is not a multiple of 4 then
>+	 * while generating psuedo random numbers to write to flash
>+	 * prandom_bytes_state () generates the extra random bytes
>+	 * which wont be done if we do for the whole length. So check
>+	 * for mtd->ecclayout->oobavail if its multiple of 4 then
>+	 * generate for full len (mtd->ecclayout->oobavail * pgcnt)
>+	 * else generate prandom of mtd->ecclayout->oobavail bytes
>+	 * pgcnt times.
>+	 */
>+
>+	if (mtd->ecclayout->oobavail % sizeof(u32)) {
>+		for (i =3D 0; i < len; i +=3D mtd->ecclayout->oobavail)
>+			prandom_bytes_state(&rnd_state, writebuf + i,
>+						mtd->ecclayout->oobavail);
>+	} else {
>+		prandom_bytes_state(&rnd_state, writebuf, len);
>+	}
>+
> 	ops.mode      =3D MTD_OPS_AUTO_OOB;
> 	ops.len       =3D 0;
> 	ops.retlen    =3D 0;
>@@ -266,7 +284,7 @@ static int verify_all_eraseblocks(void)
> static int __init mtd_oobtest_init(void)
> {
> 	int err =3D 0;
>-	unsigned int i;
>+	unsigned int i, j;
> 	uint64_t tmp;
> 	struct mtd_oob_ops ops;
> 	loff_t addr =3D 0, addr0;
>@@ -341,7 +359,6 @@ static int __init mtd_oobtest_init(void)
> 	err =3D verify_all_eraseblocks();
> 	if (err)
> 		goto out;
>-
> 	/*
> 	 * Second test: write all OOB, a block at a time, read it back and
> 	 * verify.
>@@ -591,10 +608,26 @@ static int __init mtd_oobtest_init(void)
> 	prandom_seed_state(&rnd_state, 11);
> 	pr_info("verifying all eraseblocks\n");
> 	for (i =3D 0; i < ebcnt - 1; ++i) {
>+		size_t sz =3D mtd->ecclayout->oobavail;
> 		if (bbt[i] || bbt[i + 1])
> 			continue;
>-		prandom_bytes_state(&rnd_state, writebuf,
>-					mtd->ecclayout->oobavail * 2);
>+	/*
>+	 * if mtd->ecclayout->oobavail is not a multiple of 4 then
>+	 * while generating psuedo random numbers to write to flash
>+	 * prandom_bytes_state () generates the extra random bytes
>+	 * which wont be done if we do for the whole length. So check
>+	 * for mtd->ecclayout->oobavail if its multiple of 4 then
>+	 * generate for full len (mtd->ecclayout->oobavail * pgcnt)
>+	 * else generate prandom of mtd->ecclayout->oobavail bytes
>+	 * pgcnt times.
>+	 */
>+		if (sz % sizeof(u32)) {
>+			for (j =3D 0; j < sz * 2; j +=3D sz)
>+				prandom_bytes_state(&rnd_state,
>+							writebuf + j , sz);
>+		} else {
>+			prandom_bytes_state(&rnd_state, writebuf, sz * 2);
>+		}
> 		addr =3D (i + 1) * mtd->erasesize - mtd->writesize;
> 		ops.mode      =3D MTD_OPS_AUTO_OOB;
> 		ops.len       =3D 0;
>--
>1.8.1


I think this patch never saw the linux-mtd list. so just fwding ..

with regards, pekon
