Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVTbX-0004uy-Nc
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 07:08:21 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004060207182613644
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jun 2004 07:18:26 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812A9@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Wed, 2 Jun 2004 07:09:52 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Subject: MTD drivers for Arm core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

  I have been trying to get DOC Mil plus 32 working correctly on my Arm core
board.  The DOC driver doc2001plus can see the chip after changing the
doc200.h header file.  Seem that for arm core I couldn't use the way the
ReadDOC and WriteDOC worked.  I had to use the inw and outw functions.  Now
I am trying to get the mtd drivers working so I can use nftl_format.  When I
run nftl_format it reads an incorrect erase size.  I am wondering if this is
due to the same kind of problem I have with the DOC drivers.  If so in what
file can I correct the ioctl reading and writing to the DOC so I get the
proper values.  The native DOC drivers and utils read the chip correctly.

Thanks for the help,
John
