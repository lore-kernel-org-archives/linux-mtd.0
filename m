Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLvsf-000868-KA
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 19:58:51 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
CC: akpm@linux-foundation.org, "Boris Brezillon" <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org,
 "Tokunori Ikegami" <ikegami@allied-telesis.co.jp>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Brian Norris" <computersforpeace@gmail.com>,
 "Marek Vasut" <marek.vasut@gmail.com>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 "Cyrille Pitchen" <cyrille.pitchen@wedev4u.fr>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>,
 "Richard Weinberger" <richard@nod.at>
Date: Sun, 11 Nov 2018 19:49:05 +0000
Message-ID: <lsq.1541965745.726712886@decadent.org.uk>
Subject: [PATCH 3.16 096/366] mtd: cfi_cmdset_0002: Change write buffer to
 check correct value
In-Reply-To: <lsq.1541965744.387173642@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

3.16.61-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit dfeae1073583dc35c33b32150e18b7048bbb37e6 upstream.

For the word write it is checked if the chip has the correct value.
But it is not checked for the write buffer as only checked if ready.
To make sure for the write buffer change to check the value.

It is enough as this patch is only checking the last written word.
Since it is described by data sheets to check the operation status.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1541,7 +1541,7 @@ static int __xipram do_write_buffer(stru
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
