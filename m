Received: from tomts12.bellnexxia.net ([209.226.175.56] helo=tomts12-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169Asi-0006og-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 20:00:32 +0000
Received: from mike ([64.230.146.178]) by tomts12-srv.bellnexxia.net
          (InterMail vM.4.01.03.16 201-229-121-116-20010115) with SMTP
          id <20011128201039.LOQJ18252.tomts12-srv.bellnexxia.net@mike>
          for <linux-mtd@lists.infradead.org>;
          Wed, 28 Nov 2001 15:10:39 -0500
From: "Mike Ruthven" <mike@creonova.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: Mount problem
Date: Wed, 28 Nov 2001 15:10:46 -0500
Message-ID: <NPENLOCCCBDDFGHLFFBLOEEHCAAA.mike@creonova.com>
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

Having a problem getting my jffs2 image mounted.

mount -t jffs2 /dev/mtdblock0 /mnt/jffs2
gives
mount: /dev/mtdblock0 is not a valid block device

I'm using kernel 2.4.16, DOC2000 on a Versalogic vsbc-6

Has anyone run into this before?
Does this seem like a driver problem, or is it something I'm doing?
