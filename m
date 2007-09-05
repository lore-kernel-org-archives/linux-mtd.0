Received: from smtpout10-04.prod.mesa1.secureserver.net ([64.202.165.238]
	helo=smtpout10.prod.mesa1.secureserver.net)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISxUu-0002Mi-Vc
	for linux-mtd@lists.infradead.org; Wed, 05 Sep 2007 12:13:02 -0400
Message-ID: <46DED5D3.7080502@techmoninc.com>
Date: Wed, 05 Sep 2007 11:14:11 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: backtrace.S & printk()
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russel:

While attempting to build a kernel without printk in it, I ran across an 
error in your backtrace.S file.  It appears that you are assuming that 
all arm kernels will be built with printk().  What is your reason for 
this?  What are the ramifications of me taking out those three sections 
of code?

Andy Kennedy
TechMon Inc.
