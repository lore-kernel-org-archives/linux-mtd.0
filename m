Received: from web51006.mail.yahoo.com ([206.190.38.137])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BcwrR-0003h4-2P
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2004 21:47:38 -0400
Message-ID: <20040623014730.52022.qmail@web51006.mail.yahoo.com>
Date: Tue, 22 Jun 2004 18:47:30 -0700 (PDT)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: What is the best way of creating a jffs2 image and copying it to
	NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
 I create the jffs2 image by using mkfs.jffs2 and then
 I try to copy it to NAND flash. When I try to copy
the jffs2 image by fcp or nandwrite then I get
different errors.

If I use the eraseall -j command and then mount the
flash and copy the files directly it works fine!
 
 What is the best way of creating jffs2 image and
copying it to NAND flash.


Best Regards,
--vahid


		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail
