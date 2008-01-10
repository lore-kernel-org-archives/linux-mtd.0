Received: from web56002.mail.re3.yahoo.com ([216.252.110.181])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JD75Y-00050A-Cc
	for linux-mtd@lists.infradead.org; Thu, 10 Jan 2008 23:45:39 +0000
Date: Thu, 10 Jan 2008 15:38:50 -0800 (PST)
From: Jeff S <jsolman33@yahoo.com>
Subject: JFFS2 determine writing state
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <298338.39997.qm@web56002.mail.re3.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

How would one go about checking if JFFS2 is done with a file operation, or all current pending operations?  Is there something in the proc file system or sys file system that allows you to determine the JFFS2 state or something similar.  I need to be able to notify a user that the flash has been written successfully after open, write, and close operations. Thank you.

- Jeff




      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
