Received: from web11608.mail.yahoo.com ([216.136.172.60])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1OS1-0002e7-9r
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 07:38:42 -0500
Message-ID: <20050216123840.3449.qmail@web11608.mail.yahoo.com>
Date: Wed, 16 Feb 2005 04:38:40 -0800 (PST)
From: prasadam kumar <prasadamkumar@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: How to make my IQ80321 flash Read/Write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hai to all,

I am working on intel IQ80321 flash, it is configured
as a ROM flash(map_rom.c) it supports only Read
functionality  here i am using as a char device
(/dev/mtd ) if i want to get Read/Write functionality
i am planning to move cfi_probe, so how should i
configure the cfi, if i am trying to do this it is
giving a kernel pannic like

  Cannot open root device "mtdblock2" on 1f:02

plz  suggest me to come out of this problem.


prashanth



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Easier than ever with enhanced search. Learn more.
http://info.mail.yahoo.com/mail_250
