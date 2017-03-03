Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjub6-0004fw-OB
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 21:18:46 +0000
Received: by mail-qk0-x242.google.com with SMTP id g129so2033374qkd.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Mar 2017 13:18:23 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH V6, 0/1] mtd: nand: brcmnand: Add flash #WP pin status check
Date: Fri,  3 Mar 2017 16:16:52 -0500
Message-Id: <1488575813-12660-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V6 changes:

- Modified commit message
- Added 'Fixes:' tag for backporting changes

Kamal Dasu (1):
  mtd: nand: brcmnand: Check flash #WP pin status before nand
    erase/program

 drivers/mtd/nand/brcmnand/brcmnand.c | 61 ++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

-- 
1.9.1
