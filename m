Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GiAcZ-0005Xo-De
	for linux-mtd@lists.infradead.org; Thu, 09 Nov 2006 14:11:13 +0000
Message-ID: <4553364F.1030406@transmode.se>
Date: Thu, 09 Nov 2006 15:08:15 +0100
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: flash error for Intel P30 chips
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i get this error on and off from cmd_0001 driver:

TMCU Flash Map Info: buffer write error (status 0xd0)

I looked into the current driver and found something that might a SW bug:
All chip status  looks like this:
 if (map_word_bitsset(map, status, CMD(0x1a))
but I think it should be:
 if (map_word_bitsset(map, status, CMD(0x80)) && map_word_bitsset(map, status, CMD(0x1a)))

because the Intel P30 specs says if the other status bits
is only valid iff bit 7 is also set.

Comments?

 Jocke
