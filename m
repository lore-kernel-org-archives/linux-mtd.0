Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=AM1EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rg85p-0004JG-Ld
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 04:59:54 +0000
From: Prabhakar Kushwaha <prabhakar@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>
Subject: mtd/NAND:Fix issues with freescale IFC to support NAND 2K 
Date: Thu, 29 Dec 2011 10:29:37 +0530
Message-ID: <1325134779-3571-1-git-send-email-prabhakar@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This Patch series takes care issues with Freescale IFC driver for supporting 2K
page size NAND with ECC enabled.

[PATCH 1/2] mtd/nand:Fix wrong address read in is_blank()
  Fix driver issue when ECC enabled.

[PATCH 2/2] mtd/nand: Fix IFC driver to support 2K NAND page
  Fix driver during OOB updation
