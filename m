Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 1912vq-0001rH-RS
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 12:30:59 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1912w4-00048P-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 13:31:12 +0200
Date: Thu, 3 Apr 2003 13:31:12 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20030403113112.GA16455@tkeitel001.bln.innominate.local>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
Subject: 'unsecure' default permissions of mtd device nodes with devfs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

is there any reason for creating all flash device nodes with read and
write permisions for everyone in the devfs_register() calls?

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
