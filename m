Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp7KZ-00069E-93
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 10:56:18 -0500
Message-ID: <41E699F9.10704@redhat.com>
Date: Thu, 13 Jan 2005 09:55:37 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: NAND fail testing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Is there a simple way (using existing drivers and utilities) to "wear 
out" one byte on a NAND type chip by repeatedly rewriting a single byte 
(single address)?

I want to cause a single byte failure on a chip in order to perform 
tests on erase and write error processing, but I only see how to write a 
'page' of data, not a single address.


Thank you,

d.marlin
