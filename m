Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS8CN-0002cQ-0Y
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 18:34:56 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH RESEND 0/2] mtd: nand: pxa3xx-nand: fixes
Date: Wed, 19 Aug 2015 20:30:13 +0200
Message-Id: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

As promised, here are the remaining fixes I have on pxa3xx-nand I'd like you to
queue up. The other changes I have submitted are under review and not of "fixes" type.

Cheers.

--
Robert

Robert Jarzmik (2):
  mtd: nand: pxa3xx_nand: fix early spurious interrupt
  mtd: nand: pxa3xx-nand: fix random command timeouts

 drivers/mtd/nand/pxa3xx_nand.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.1.4
