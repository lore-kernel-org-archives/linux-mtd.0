Received: from web52705.mail.yahoo.com ([206.190.39.156])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DIS6J-0003pP-Sd
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 09:58:48 -0400
Message-ID: <20050404135849.4689.qmail@web52705.mail.yahoo.com>
Date: Mon, 4 Apr 2005 15:58:49 +0200 (CEST)
From: Gianluca Moro <giangiammy@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: JFFS2 and frequent/small write operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I need to use an embedded system to log some events,
which will be small as registered size (16 bytes each)
and frequent (up to 10 events/s).
The log file will be some sort of FIFO queue, 
as I will delete the old events to make space for
the new one when I'll go out of space.

I need to save on flash, I cannot keep them in RAM
and write from time to time as I cannont loose data
in a power fail event.

Does anyone have experience of using JFFS2 in this
way? do you think JFFS2 is the correct choice?
Does this type of usage can create problems?

Do you know of benchmark which analize a bhaviour
of this type?

sorry for all the questions, but I must choose
how to start my project.

thank
giammy





		
___________________________________ 
Nuovo Yahoo! Messenger: E' molto più divertente: Audibles, Avatar, Webcam, Giochi, Rubrica… Scaricalo ora! 
http://it.messenger.yahoo.it
