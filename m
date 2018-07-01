Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZf2P-00026A-CC
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 16:17:23 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 4.4 052/105] mtd: cfi_cmdset_0002: Change write buffer to
 check correct value
Date: Sun,  1 Jul 2018 18:02:02 +0200
Message-Id: <20180701153153.235749272@linuxfoundation.org>
In-Reply-To: <20180701153149.382300170@linuxfoundation.org>
References: <20180701153149.382300170@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

4.4-stable review patch.  If anyone has any objections, please let me know.

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
Cc: stable@vger.kernel.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1878,7 +1878,7 @@ static int __xipram do_write_buffer(stru
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
