Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jbTz-0007Pq-5E
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 10:18:23 +0100
Message-Id: <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
Date: Mon, 04 Aug 2003 11:18:17 +0200
To: linux-mtd@lists.infradead.org
From: llandre <r&d@wawnet.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Can't load yaffs.o (unresolved symbol __get_mtd_device)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm using recent YAFFS sources downloaded via CVS on Aug, 1st with the 
kernel linuxppc_devel_2.4.21-pre5.
I succesfully built the yaffs module but I can't load it with the insmod 
command.

Here what I get when trying to load:

bash-2.05# /sbin/insmod -v yaffs.o
Using yaffs.o
Symbol version prefix ''
yaffs.o: unresolved symbol __get_mtd_device
bash-2.05#

In the kernel's symbol list (System.map) I see the get_mtd_device symbol.
Why does the dynamic linker add two underscores '__'?
How to solve the problem?

Thanx in advance and best regards.

PS: I posted the message to the YAFFS's ml too, but unfortunately I got no 
answers :-(


llandre 
