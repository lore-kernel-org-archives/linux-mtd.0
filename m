Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CEYqU-0002QO-LE
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 15:50:07 -0400
Received: from yagoo.io.ssji.net ([10.0.0.1] helo=yagoo)
	by zorglub.ssji.net with smtp (Exim 4.24) id 1CEYqP-0002hk-Sq
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 21:50:01 +0200
Date: Mon, 4 Oct 2004 21:50:01 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: linux-mtd@lists.infradead.org
Message-Id: <20041004215001.769d8017.nipo@ssji.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again

I updated to last CVS snapshot.
After tweaking necessary declarations to interface with 2.6.7, I remade
some modifications in order to be able to probe at 0x0.
I made a patch for this (I hope that way is not too bad):
http://nipo.ssji.net/patches/mtd/nulladdress.diff

I still need to use readb and writeb, but this is not in the patch.

This time, chip is probed as a DoC-Mil+ 32MB, driver complains about it
not being supported. It seems ok, and as mtd are much like rocket
science to me, I'll wait a little until it is (i hope) supported...

I'll try to understand the mmio vs readb/writeb issue as a time
holder. ;)

Thanks again for the support.

-- 
Nipo <nipo@ssji.net>
