Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uFVZ-0002V2-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 16:22:42 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uFUo-0008EB-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 16:21:54 +0100
Received: from dns.uswo.net ([207.153.115.5] helo=mail.uswo.net)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14uFUm-0008E5-00
	for mtd@infradead.org; Mon, 30 Apr 2001 16:21:52 +0100
From: "Jason Walker" <jasonw@uswo.net>
To: "MTD Mailing List" <mtd@infradead.org>
Subject: MTD and 2.4
Date: Mon, 30 Apr 2001 11:22:15 -0400
Message-ID: <NEBBIDMHCLDPHDHEGDMLGEFCCBAA.jasonw@uswo.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Greeting all

	I have a rather interesting situation.  I have a box with a DickOnChip on
it, and someone else built a 2.2.x kernel for it.  I need to get a 2.4.x
kernel on it.  I did not build the 2.2.x kernel that is on it now, so I
don't know how it's done.  I *suspect* they used the kernel patxches from
M-systems, but I am not positive.  I have tried their patches for 2.4 but
they are incredibly outdated and don't compile (they were meant for
2.4.0pre8)  On the 2.2.x kernel the devices come up as /dev/fla.  I don't
need to maintain backwards compatibility with the 2.2.x formats, so if I
need to use another one that is cool.  I read all the documentation on the
website and the kernel *still* won't work.  This is a DiskOnChip Millenium
chip, btw.  If I need to post error messages or my kernel config, that is
fine.. Any help would be appreciated. thank!

Jason Walker

US Wireless Online



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
