Received: from elproma-gw.hbz.pl ([213.77.124.176] helo=elproma.com.pl)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187HCI-0003JD-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 15:25:26 +0000
Received: from ptroja by elproma.com.pl with local (Exim 3.35 #1 (Debian))
	id 187Hey-0006bh-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 16:55:04 +0100
Date: Thu, 31 Oct 2002 16:55:04 +0100
From: Piotr Trojanek <ptroja@elproma.com.pl>
To: linux-mtd@lists.infradead.org
Subject: how to compile CVS stuff
Message-ID: <20021031155504.GA25329@elproma.com.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello!

I work with DOC with nftl driver from vanilla 2.4.19.
Now I wan't to take fresh stuff from CVS, but I'm unable to comile it.
I was trying many ways, but can you give me step-by-step instruct how to
do this? When I just copy things into kernel tree, it won't work.

And one more question:
can I make 2 partitions on my DOC: nftla[12] and put bootloader stuff
and bzImage on first, with JFFS2 on second?
JFFS2 needs mtdblock device, and whole chip is seen as mtd0.

or maybe I miss something?:)

-- 
Piotr Trojanek
