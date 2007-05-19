Received: from mailer.gwdg.de ([134.76.10.26])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HpLRo-0004JT-7j
	for linux-mtd@lists.infradead.org; Sat, 19 May 2007 05:42:01 -0400
Date: Sat, 19 May 2007 11:24:21 +0200 (MEST)
From: Jan Engelhardt <jengelh@linux01.gwdg.de>
To: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <200705190215.36334.rob@landley.net>
Message-ID: <Pine.LNX.4.61.0705191119330.9015@yvahk01.tjqt.qr>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<200705190215.36334.rob@landley.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>,
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


On May 19 2007 02:15, Rob Landley wrote:
>> > +
>> > +static inline struct logfs_inode *LOGFS_INODE(struct inode *inode)
>> > +{
>> > +	return container_of(inode, struct logfs_inode, vfs_inode);
>> > +}
>> 
>> Do these need to be uppercase?
>
>I'm trying to keep it clear in my head...
>
>When do you need to say __always_inline and when can you get away with 
>just saying "static inline"?

When using "static inline", the compiler may ignore the inline keyword 
(it's just a hint), and leave the function as a standalone function.

When CONFIG_FORCED_INLINING is active, and it is by default, inline is 
always substituted by __always_inline, to be on the safe side. Some code 
needs to be always inline; but not all code has been checked whether it 
is safe to go from __always_inline to inline.


	Jan
-- 
