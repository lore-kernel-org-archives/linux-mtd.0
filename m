Received: from [80.120.128.82] (helo=hofr.at)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xow3-00022o-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 21:10:07 +0100
Received: (from root@localhost)
	by hofr.at (8.10.2/8.9.3/SuSE Linux 8.9.3-0.1) id g6PJEbs25931
	for linux-mtd@lists.infradead.org; Thu, 25 Jul 2002 21:14:37 +0200
From: Der Herr Hofrat <der.herr@mail.hofr.at>
Message-Id: <200207251914.g6PJEbs25931@hofr.at>
Subject: MAX_NAME in jffs2
To: linux-mtd@lists.infradead.org
Date: Thu, 25 Jul 2002 21:14:37 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

HI !

 is there a particular reson for jffs and jffs2 to have a 254 character
 filename limit and ext2/ext3/reiserfs 255 (probably others to - excluding
 minix/msdos/M$) ?? There probably is hardly a case where this will realy 
 hurt, but a test bit it so I wondered what the reson for this 254 is...

thx !
hofrat
