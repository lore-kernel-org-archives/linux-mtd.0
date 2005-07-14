Received: from web31714.mail.mud.yahoo.com ([68.142.201.194])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dt2p3-0005RP-Qt
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 08:28:18 -0400
Message-ID: <20050714122812.33576.qmail@web31714.mail.mud.yahoo.com>
Date: Thu, 14 Jul 2005 05:28:12 -0700 (PDT)
From: Sunil Khandelwal <sunil_khandelwal@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Nand Flash driver for dedicated conroller
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

I have an ARM based board, which has a flash
controller on chip.

There is no way I can control the signals like ALE, CE
etc to flash directly. 

How can I use nand.c of mtd in my driver specially as
it expect me to control IO lines.

Regards,
Sunil


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
