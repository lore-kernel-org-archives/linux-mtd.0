Received: from web52709.mail.yahoo.com ([206.190.39.160])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DY4Bk-00066o-3V
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 11:40:56 -0400
Message-ID: <20050517154056.91995.qmail@web52709.mail.yahoo.com>
Date: Tue, 17 May 2005 08:40:56 -0700 (PDT)
From: Gianluca Moro <giangiammy@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: JFFS2 cycling write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have not found an answer to the following question
about JFFS2:
The write on the flash are clycled, so to write everywhere
on the flash to use it at the better, but, if my flash
is 70% full with data I never touch, and on the other 30%
I  continuously write, the driver write onfluy on the
30% free space, or does it uses even the 70% moving around
data?

In the first case I would end to acocmplish all the allowed write
on a 30% of my flash, having the other 70% almost new!

bye
giammy




		
___________________________________ 
Nuovo Yahoo! Messenger: E' molto più divertente: Audibles, Avatar, Webcam, Giochi, Rubrica… Scaricalo ora! 
http://it.messenger.yahoo.it
