Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEHSi-0001Db-Ge
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 14:10:49 +0000
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
From: "Franklin S Cooper Jr." <fcooper@ti.com>
Subject: Testing generic empty page bit flips recovery
Message-ID: <5683E5CC.6020008@ti.com>
Date: Wed, 30 Dec 2015 08:10:20 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to follow up on this discussion from this patch
set (https://patchwork.ozlabs.org/patch/539059/) which
suggested that Michael instead test the generic bitflips
recovery that is implemented by Boris "mtd: nand: properly
handle bitflips in erased pages" patchset
(http://lists.infradead.org/pipermail/linux-mtd/2015-September/061617.html).
I would like to test Boris patchset but first I need to
recreate the error that his patch is fixing.

The error that the patchset is attempting to fix isn't
something I have ever encountered before. Currently I am
trying to reproduce this issue on a TI K2E evm that uses the
davinci nand driver. I flashed the nand's file-system
partition with a ubi filesystem and the board is currently
set to boot using the file-system on the nand. After about
60 secs I cut the power from the board and boot the board
again. What I would expect is that the board will eventually
fail to mount the ubi filesystem but currently the board has
ran for over 24 hours and powered on and off over 1400 times
and its still mounting the file-system perfectly fine.

Any suggestions on a test case that I can use to force the
empty page bit flips error?
