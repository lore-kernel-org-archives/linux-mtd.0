Received: from smtprelay01.ispgateway.de ([80.67.18.13])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmdas-000257-Hy
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 10:18:07 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: nand: fix regression introduced by splitting off
 manufacturer dependent code
Date: Tue, 29 Aug 2017 12:17:11 +0200
Message-Id: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detection
logic in nand_samsung.c") introduced a regression for Samsung SLC NAND
chips by skipping the initialization of chip->bits_per_cell that is
done in nand_decode_ext_id() from which the manufacturer dependent
code was extracted.
The regression should also affect Hynix and Macronix chips whose code
was separated out in further commits but which I cannot test.
AMD/Spansion and Toshiba NAND are not affected, since they are calling 
nand_decode_ext_id() (which initializes bhip->bits_per_cell) in their
.detect function.

Fix the regression and add a warning to nand_is_slc() to prevent
further regressions of this kind.
