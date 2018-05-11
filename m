Received: from mail1.bemta12.messagelabs.com ([216.82.251.2])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fH2wX-0005lt-S3
 for linux-mtd@lists.infradead.org; Fri, 11 May 2018 07:58:24 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>, Boris Brezillon
 <boris.brezillon@bootlin.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v3] mtd: cfi_cmdset_0002: Change write buffer to check correct
 value
Date: Fri, 11 May 2018 07:58:05 +0000
Message-ID: <TY1PR01MB0954946451074852ED6D5C8FDC9F0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
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

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

For the word write it is checked if the chip has the correct value.
But it is not checked for the write buffer as only checked if ready.
To make sure for the write buffer change to check the value.

It is enough as this patch is only checking the last written word.
Since it is described by data sheets to check the operation status.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
No difference for the change itself from the original patch v1.
But just updated the patch subject to add version as v3.
Form the original patch v1 it is also changed to add Brian as Cc and the pa=
tch is sent to Boris-san as To.
  Note: This was changed from the second patch v2 and this v3 patch is not =
changed about this.

This fix is required to resolve the flash write error caused on our product=
s.

This patch itself is not depended to other related patches to fix for the f=
lash erase error.
The flash erase error is not able to still reproduce at this moment.
So I will do fix the flash erase error separately.

But the flash write error can be reproduced and this fix can resolve it.
So please review the patch again and if any problem please let me know.


 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 56aa6b75213d..5e9f2ca0a6c1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1879,7 +1879,7 @@ static int __xipram do_write_buffer(struct map_info *=
map, struct flchip *chip,
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
=20
-		if (chip_ready(map, adr)) {
+		if (chip_ready(map, adr) && chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
--=20
2.16.1
