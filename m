Received: from mail1.bizmail.net.au ([202.162.77.164])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeKMJ-0003vJ-T3
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 19:14:20 -0400
Received: from webmail.bizmail.com.au (localhost.localdomain [127.0.0.1])
	by mail1.bizmail.net.au (Postfix) with ESMTP id B3F10CDC1EA
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 May 2006 09:25:34 +1000 (EST)
Message-ID: <1737.58.105.227.226.1147389934.squirrel@58.105.227.226>
Date: Fri, 12 May 2006 09:25:34 +1000 (EST)
From: yh@bizmail.com.au
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: write to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We use MTD on top of JFFS2 of our flash. Currently we download software to
the DRAM by TCP small packets (512 B), and then copy the whole file to
flash through mounted MTD. It works fine, but we have to reserve large
DRAM for this purpose, it wasts lots of memory. We are thinking to
directly write received TCP packets to flash, but we are not sure if it is
safe to write many small packets directly to the flash via MTD. Appreciate
your advices and comments.

Thank you.

Jim
