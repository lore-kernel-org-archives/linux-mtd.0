Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTJTY-0001Op-6T
	for linux-mtd@lists.infradead.org; Thu, 27 May 2004 07:55:10 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004052708051117735
	for <linux-mtd@lists.infradead.org>; Thu, 27 May 2004 08:05:11 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812A3@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Thu, 27 May 2004 07:56:45 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: Help with DOC Mil Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having major problems.  I have 2.4.21 running on an arm core.  I have
patched mtd with a recent snapshot.  I have had addressing problems with the
way the manufacturer designed the board.  Inw and Outw work with the chip.
I can read the chip ID reg but when DoC_ScanChips runs I get the wrong size
of the chip.  Looking at the code the size is a function of chipshift.  Can
someone explain what the chipshift variable represents????  I am not having
much luck getting the DOC to work, I could really use some help.......

Thanks,
John
