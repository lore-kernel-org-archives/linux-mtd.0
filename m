Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hy7S9-00010D-8H
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 10:34:38 -0400
Subject: cfi_cmdset_0001 get_chip()put_chip() contender/loaner, what does
	it do?
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Jun 2007 16:34:35 +0200
Message-Id: <1181658875.30670.233.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: nico@cam.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the beginning of get_chip() and put_chip for the cfi_cmdset_0001
driver there is this "fight" over access to the chip that I don't
understand. Why is it there and why don't the other drivers need it?

This construct has been there for a long time and git blame does not
tell me the author of this code. I can see though that
Nicolas Pitre(CC:ed) fixed something in this code long time ago.

 Jocke
