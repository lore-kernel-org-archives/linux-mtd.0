Received: from gateway.innominate.fta-berlin.de ([141.16.74.40] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GeFI-0002bF-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 11:51:16 +0000
Received: from tkeitel by tkeitel001.bln.gelonet.local with local (Exim 3.35 #1 (Debian))
	id 18Gel2-00025D-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 13:24:04 +0100
Date: Tue, 26 Nov 2002 13:24:04 +0100
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: Basic question how jffs2 uses mtd
Message-ID: <20021126122404.GA7962@tkeitel001.bln.gelonet.local>
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

Hi folks,

I try to debug a strange problem with jffs2 here. That's why I wonder
what JFFS2 uses the MTD layer for. I remember that I read somewhere
that JFFS2 only uses the MTD layer to obtain a handle to the actual
flash device. Is that right?

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
