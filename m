Received: from pd90062a6.dip.t-dialin.net ([217.0.98.166] helo=splash)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 151oiZ-0007mL-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2001 13:23:23 +0100
Date: Mon, 21 May 2001 14:28:27 +0200
From: Jochen Schaeuble <psionic@psionic.de>
To: linux-mtd@lists.infradead.org
Subject: erase / interrupts
Message-ID: <20010521142827.A4829@psionic.de>
Reply-To: psionic@psionic.de
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have two questions. First of all, what happens to the interrupts during
an erase? Are they disabled?
The other one is, what happens if the power fails during a erase/write. Does
the init-code handle the reset of the chip?

Thx
  Jochen
