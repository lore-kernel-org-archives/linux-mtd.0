Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZ7MH-0007qa-91
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 11:25:14 -0400
Subject: Strange flash errors starting to appear
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Apr 2007 17:25:07 +0200
Message-Id: <1175700307.12080.67.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just got this on two boards(lots of them):
TMCU Flash Map Info: Waiting for chip to be ready timed out. Status c320
Write of 52 bytes at 0x0771392c failed. returned -5, retlen 0
Not marking the space at 0x0771392c as dirty because the flash driver returned retlen zero

Status c320 varies between boots. Seen
7574, 3034 and 5f32

Kernel 2.6.20, no summary, Powerpc, cfi_cmdset_0001(Intel P30, 16 bits wide)
I have removed SUMMARY support from my kernel recently.

 Ideas?
