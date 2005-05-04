Received: from web51001.mail.yahoo.com ([206.190.38.132])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DT7Y6-0007WW-U6
	for linux-mtd@lists.infradead.org; Tue, 03 May 2005 20:15:35 -0400
Message-ID: <20050504001538.77696.qmail@web51001.mail.yahoo.com>
Date: Tue, 3 May 2005 17:15:38 -0700 (PDT)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: two questions about jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
 How does jffs2 handle the bad blocks on the NAND
flash? ( I noticed that at initialization jffs2 scans
the devivce and creates a bad block list, but it never
uses the bad block list. It seems that if the block is
bad it is not put into the block list).

Does current jffs2 and mtd support the NAND devices
with Page size more than 528 bytes?


Regards,
--vahid



		
__________________________________ 
Do you Yahoo!? 
Make Yahoo! your home page 
http://www.yahoo.com/r/hs
