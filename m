Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZZMW-00018H-Bo
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 10:13:46 +0000
Subject: Patch "mtd: cfi_cmdset_0002: Change write buffer to check correct
 value" has been added to the 4.17-stable tree
To: Joakim.Tjernlund@infinera.com, boris.brezillon@bootlin.com,
 boris.brezillon@free-electrons.com, chris.packham@alliedtelesis.co.nz,
 computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 gregkh@linuxfoundation.org, ikegami@allied-telesis.co.jp,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com, richard@nod.at
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Jul 2018 12:09:21 +0200
Message-ID: <153043976122194@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a note to let you know that I've just added the patch titled

    mtd: cfi_cmdset_0002: Change write buffer to check correct value

to the 4.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-cfi_cmdset_0002-change-write-buffer-to-check-correct-value.patch
and it can be found in the queue-4.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From dfeae1073583dc35c33b32150e18b7048bbb37e6 Mon Sep 17 00:00:00 2001
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Date: Wed, 30 May 2018 18:32:26 +0900
Subject: mtd: cfi_cmdset_0002: Change write buffer to check correct value

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
@@ -1880,7 +1880,7 @@ static int __xipram do_write_buffer(stru
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}


Patches currently in stable-queue which might be from ikegami@allied-telesis.co.jp are

queue-4.17/mtd-cfi_cmdset_0002-change-erase-functions-to-retry-for-error.patch
queue-4.17/mtd-cfi_cmdset_0002-change-write-buffer-to-check-correct-value.patch
queue-4.17/mips-bcm47xx-enable-74k-core-externalsync-for-pcie-erratum.patch
