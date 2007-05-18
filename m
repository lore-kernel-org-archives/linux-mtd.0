Received: from mailer.gwdg.de ([134.76.10.26])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1How2B-0006Mx-MV
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 02:33:52 -0400
Date: Fri, 18 May 2007 08:16:25 +0200 (MEST)
From: Jan Engelhardt <jengelh@linux01.gwdg.de>
To: Kyle Moffett <mrmacman_g4@mac.com>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <D458F595-921F-4FC0-88FC-38EEF1DCC920@mac.com>
Message-ID: <Pine.LNX.4.61.0705180813570.3231@yvahk01.tjqt.qr>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
	<Pine.LNX.4.61.0705171920330.3231@yvahk01.tjqt.qr>
	<20070517174532.GA26827@2ka.mipt.ru>
	<D458F595-921F-4FC0-88FC-38EEF1DCC920@mac.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>,
	LKML Kernel <linux-kernel@vger.kernel.org>,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On May 17 2007 21:00, Kyle Moffett wrote:
>> > > Opinions?
>> > 
>> > Why would we need another btree, when there is lib/rbtree.c?  Or does
>> > yours do something fundamentally different?
>> 
>> It is not red-black tree, it is b+ tree.
>
> It might be better to use the prefix "bptree" to help prevent confusion.  A
> quick google search on "bp-tree" reveals only the perl B+-tree module
> "Tree::BPTree", a U-Maryland Java CS project on B+-trees, and a news article
> about a "BP tree-top protest".

BP heh.. How about "struct bplustree"?


	Jan
-- 
