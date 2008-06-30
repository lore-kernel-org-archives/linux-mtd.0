Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDIl6-0004QZ-0e
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 12:45:29 +0000
Message-ID: <414829586.31683@cqu.edu.cn>
Subject: UBIFS error (pid 4687): compr_init: cannot inittialize compressor
	zlib, error -2
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 30 Jun 2008 20:44:10 +0800
Message-Id: <1214829850.2771.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello everyone
 
I have created a UBI layer on top of mtd and create a volumes in
2.6.26-rc5-01191-g23baa5b-dirty.
and when i met such error when i modprobe ubifs:
 
FATAL: Error inserting ubifs
(/lib/mdules/2.6.26-rc5-01191-g23baa5b-dirty/kernel/fs/ubifs/ubifs.ko):
Unknown symbol in module, or unknown parameter (see dmesg)
 
and in the /var/log/message: 
kernel: UBIFS error (pid 4687): compr_init: cannot inittialize
compressor zlib, error -2
 
I've try to install zlib module,but I only found a similar module named
zlib_deflate 
which is useless for the problem. Maybe seting CONFIG_UBIFS_FS_ZLIB = n
can solve this problem.
But are there some ways else and more advisable?
I need you help, thands in advance.
 
xxc. 
