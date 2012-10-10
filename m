Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM0FX-0003vz-EM
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:39:16 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so994531pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:39:14 -0700 (PDT)
From: Charles Hardin <ckhardin@exablox.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Subject: [QUESTION] MLC NAND and ECC over OOB area
Date: Wed, 10 Oct 2012 10:31:08 -0700
Message-Id: <0A090286-986E-4B22-AEC3-EE1C48EC466E@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0 (Apple Message framework v1283)
Cc: Mike Dunn <mikedunn@newsguy.com>, Jeremy Fitzhardinge <jeremy@exablox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

So, in working with the latest linux MTD driver updates to support BCH =
ECC and other requirements for MLC NAND parts, I noticed something that =
was a bit odd from the data sheets and a few conversations with some =
Flash Hardware engineers that bit errors are expected in the OOB area as =
well.

For instance, on a MT29F16G08CBACA - the error correction is stated in =
the data sheet to be 24-bit over 1080 bytes (which I thought was a typo =
and should have been 1024).

This makes sense once you get the stats of the NAND part that is=20

Page Size: 4096
OOB: 224
Total: 4096 + 224 =3D 4320
=46rom the data sheet: 1080 * 4 =3D 4320

After testing the NAND I did find bit errors in the OOB (the bad block =
marker pattern in particular) so ECC is required over the =
"mtd->writesize + mtd->oobsize".

This is not supported in the latest mtd drivers in the 3.6 or 3.5 =
because of some assumptions in nand_base.c like=85

int nand_scan_tail(struct mtd_info *mtd)
{
	=85 snip snip snip =85

        /*
         * Set the number of read / write steps for one page depending =
on ECC
         * mode.
         */
        chip->ecc.steps =3D mtd->writesize / chip->ecc.size;
        if (chip->ecc.steps * chip->ecc.size !=3D mtd->writesize) {
                pr_warn("Invalid ECC parameters\n");
                BUG();
        }
        chip->ecc.total =3D chip->ecc.steps * chip->ecc.bytes;

	=85 snip snip snip =85
}

This assumption that the ecc is only over the "write size" might =
permeate more of the code, so I really have two questions
- Is anyone already working on handling ECC including the OOB as well?
- Is the expectation that this is going to have to be flagged as =
specific to MLC or a generic relayout of the ECC when using BCH over the =
entire data set instead of the write payload alone?

Regards,
Charles Hardin

--
This email is probably not that important
