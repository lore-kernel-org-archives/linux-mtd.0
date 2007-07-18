Received: from wa-out-1112.google.com ([209.85.146.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IB2aa-0002NF-2O
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 02:00:46 -0400
Received: by wa-out-1112.google.com with SMTP id v33so95907wah
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Jul 2007 23:00:40 -0700 (PDT)
Message-ID: <966593f20707172300u429959feuf01842cd43da34de@mail.gmail.com>
Date: Wed, 18 Jul 2007 14:00:39 +0800
From: "rong shawn" <shawn.rong@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: question about nand_do_read_oob/nand_do_read_ops when
	"mtd_oob_ops.mode==MTD_OOB_PLACE"?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: rong shawn <shawn.rong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Based on doc "[MTD] Rework the out of band handling completely", I
think when MTD_OOB_PLACE is selected, the read length should have
nothing to do with value of mtd_oob_ops.oobavail, which is only
related with MTD_OOB_AUTO mode.(See reference in the end)

while in function nand_do_read_oob() and nand_do_read_ops() in
nand_base.c, the read length is affected by value of
mtd_oob_ops.oobavail, e.g.
========================================================
nand_do_read_oob():
if (ops->mode == MTD_OOB_RAW)
len = mtd->oobsize;
else
len = chip->ecc.layout->oobavail;
========================================================
nand_do_read_ops():
if (ops->mode != MTD_OOB_RAW) {
int toread = min(oobreadlen,
chip->ecc.layout->oobavail);
if (toread) {
oob = nand_transfer_oob(chip,
oob, ops, toread);
oobreadlen -= toread;
}
} else
buf = nand_transfer_oob(chip,
buf, ops, mtd->oobsize);
========================================================

Could anyone tell me why? I think handle above for mode MTD_OOB_PLACE
should be same to MTD_OOB_RAW, not MTD_OOB_AUTO.

Someone has also the same question:
lists.infradead.org/pipermail/linux-mtd/2007-February/017469.html

In his test, maybe this is a bug?

Any feedback would be appreciated, thanks!

Reference:
========================================================
lists.infradead.org/pipermail/linux-mtd-cvs/2006-May/005519.html

MTD_OOB_PLACE puts/gets the given oob data exactly to/from the place
which is described by the ooboffs and ooblen fields of the mtd_oob_ops
strcuture. It's up to the caller to make sure that the byte positions
are not used by the ECC placement algorithms.
========================================================

-- 
Best Regards!
Shawn RONG
