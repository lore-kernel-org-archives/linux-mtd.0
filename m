Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QoOYd-0002y7-47
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 23:39:31 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd: cafe_nand: register master MTD at most once
Date: Tue, 2 Aug 2011 16:38:30 -0700
Message-ID: <1312328310-18003-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
References: <CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: dsd@laptop.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	linux-mtd@lists.infradead.org, Jamie Iles <jamie@jamieiles.com>,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch addresses a regression where a master MTD object might be
registered twice if no partitions are found. The initial bug report can
be seen here:
    http://lists.infradead.org/pipermail/linux-mtd/2011-July/037086.html

The regression is caused by:
    commit 0f7451bea72c64d3f0a47850328d52f0315e2ea6
    "mtd: cafe_nand.c: use mtd_device_parse_register"

The aforementioned commit was intended to basically just refactor the
codebase; however, it had unintentional side effects. The cafe_nand probe
behavior over time is as follows.

Previous functionality (before commit 0f7451be):
 A) register the master device with add_mtd_device()
 B) if partitions are found, register them as well

New functionality (at commit 0f7451be):
 A) register the master device with add_mtd_device()
 B) if partitions are found, register them as well
 C) if partitions are not found, register the master device (again)

Correct functionality (this patch):
 (remove step A)
 B) if partitions are found, register them
 C) if partitions are not found, register the master device

Thus, this fix means that we will never register both the master MTD and
its partitions, as we did before commit 0f7451be. This is probably the
expected behavior and should be a welcome change.

Reported-by: Daniel Drake <dsd@laptop.org>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 661e5dc..11a56df 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -797,9 +797,6 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, mtd);
 
-	/* We register the whole device first, separate from the partitions */
-	mtd_device_register(mtd, NULL, 0);
-
 	mtd->name = "cafe_nand";
 	mtd_device_parse_register(mtd, part_probes, 0, NULL, 0);
 
-- 
1.7.0.4
