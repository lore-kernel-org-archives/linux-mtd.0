Received: from web14903.mail.yahoo.com ([216.136.225.55])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tocY-0000q8-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 13:16:54 +0100
Message-ID: <20020924121649.52716.qmail@web14903.mail.yahoo.com>
Date: Tue, 24 Sep 2002 05:16:49 -0700 (PDT)
From: Sriram Neelakandan Iyer <sriramneelakandan@yahoo.com>
Reply-To: sriramneelakandan@yahoo.com
Subject: JFFS2_RESERVED_BLOCKS_BASE
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

hi,

I need JFFS2 to store only the configuartion files,
which are hardly 200K, but JFFS2 reserves 5 blocks
minimum. (Each block is 64K)
As of now i am running JFFS2 over 512K mtd partition,
Which i cannot afford.

Will JFFS2 work fine with JFFS2_RESERVED_BLOCKS_BASE
set to 1?

Or how do i make JFFS2 work with lesser Reserved -
BLOCKS ? Is there any patch avaiable readily ?

TIA
sriram


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
