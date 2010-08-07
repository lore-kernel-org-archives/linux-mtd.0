Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohejh-0007Zi-Nw
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 08:26:34 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/7] UBIFS: recent patches
Date: Sat,  7 Aug 2010 11:26:10 +0300
Message-Id: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

while looking at the UBIFS gc_lnum  == -1 issue, and testing UBIFS in 2.6.35, I
found few issues and made several patches. Here they go. I've also pushed them
to ubifs-2.6 / master.

Note, the GC sorting fixes are presumably important to have, so please, test
them them before I've merged buggy versions upstream (2.6.37) and to back-port
trees :-)

Matthieu, I failed to figure out how gc_lnum can become -1 in the master node.
Most probably I'll have to create a debugging patch and ask you to reproduce
the error again, but do not thing I'll have time for this in August. So, you
could try to look at the code and put more printk's in interesting places
yourself, and find when exactly it becomes -1, and then how it ends up in the
master node. That would be helpful.

Artem.
