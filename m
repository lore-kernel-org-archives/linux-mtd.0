Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17esBa-00087X-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 08:03:18 +0100
Received: from tkeitel by tkeitel001.bln.gelonet.local with local (Exim 3.35 #1 (Debian))
	id 17esAO-0004Ox-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 09:02:04 +0200
Date: Wed, 14 Aug 2002 09:02:04 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: Bad blocks on NOR flash
Message-ID: <20020814070204.GA16910@tkeitel001.bln.gelonet.local>
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

if I got this right, JFFS2 has bad block handling only for NAND
flashes. I have also read that NAND flashes could be shipped with bad
blocks whereas NOR flashes don't. Does this mean that there nevver will
be something like a bad block on a NOR flash?

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
