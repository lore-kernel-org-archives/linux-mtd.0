Received: from web51006.mail.yahoo.com ([206.190.38.137])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cr6PY-0006Em-9m
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 22:21:37 -0500
Message-ID: <20050119032133.28108.qmail@web51006.mail.yahoo.com>
Date: Tue, 18 Jan 2005 19:21:33 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: some questions regarding the write operation on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
 I traced the write operation from the Linux kernel to
the JFFS2. I have some questions:
    1) Is there any chance that there could be some
partial writes on the NAND flash (if power failure
happens during write operation).

    2) Does SYNC has any meaning when using the JFFS2.
As fas as I noticed the write operations are
formwarded to the MTD device, and they are not cached.

Thank you so much in advance,
--vahid


		
__________________________________ 
Do you Yahoo!? 
Read only the mail you want - Yahoo! Mail SpamGuard. 
http://promotions.yahoo.com/new_mail 
