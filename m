Received: from bay2-f11.bay2.hotmail.com ([65.54.247.11] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DgZB2-0006at-Pb
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 03:23:24 +0100
Message-ID: <BAY2-F11432519227105B42F84CDDAFF0@phx.gbl>
From: "tong changda" <tongcd@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 10 Jun 2005 10:23:09 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello
     I am new to jffs2, Now we apply it on linux phone with Intel Xscale 
and arm-linux 2.4.20, Very rarely , We can't access one or more file on 
jffs2, ls the file shows:
Eep. Child "pointcal" (ino #766) of dir ino #6 doesn't exist
a few days , I even found jffs2 can't mount, how could I repair it without 
resorting to eraseall?
     BTW jffs2 keeps sms and phonenumber, so we can't allow this filesystem 
corrupt.
     Thanks

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
