Received: from mailer.gwdg.de ([134.76.10.26])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HojyQ-0005Wp-2a
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 13:42:33 -0400
Date: Thu, 17 May 2007 19:26:07 +0200 (MEST)
From: Jan Engelhardt <jengelh@linux01.gwdg.de>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <20070516000630.GD1220@lazybastard.org>
Message-ID: <Pine.LNX.4.61.0705171920330.3231@yvahk01.tjqt.qr>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
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


On May 16 2007 02:06, Jörn Engel wrote:
>
>> > +/* memtree.c */
>> > +void btree_init(struct btree_head *head);
>> > +void *btree_lookup(struct btree_head *head, long val);
>> > +int btree_insert(struct btree_head *head, long val, void *ptr);
>> > +int btree_remove(struct btree_head *head, long val);
>> 
>> These names are too generic.  If we later add a btree library: blam.
>
>My plan was to move this code to lib/ sooner or later.  If you consider
>it useful in its current state, I can do it immediatly.  And if someone
>else merged a superior btree library I'd happily remove mine and use the
>new one instead.
>
>Opinions?

Why would we need another btree, when there is lib/rbtree.c?
Or does yours do something fundamentally different?


	Jan
-- 
