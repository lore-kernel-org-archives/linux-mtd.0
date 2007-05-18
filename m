Received: from smtpout.mac.com ([17.250.248.185])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hoqrx-0006NR-1Q
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 02:02:59 +0100
In-Reply-To: <20070517174532.GA26827@2ka.mipt.ru>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
	<Pine.LNX.4.61.0705171920330.3231@yvahk01.tjqt.qr>
	<20070517174532.GA26827@2ka.mipt.ru>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <D458F595-921F-4FC0-88FC-38EEF1DCC920@mac.com>
Content-Transfer-Encoding: 7bit
From: Kyle Moffett <mrmacman_g4@mac.com>
Subject: Re: [PATCH] LogFS take three
Date: Thu, 17 May 2007 21:00:44 -0400
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, LKML Kernel <linux-kernel@vger.kernel.org>,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On May 17, 2007, at 13:45:33, Evgeniy Polyakov wrote:
> On Thu, May 17, 2007 at 07:26:07PM +0200, Jan Engelhardt  
> (jengelh@linux01.gwdg.de) wrote:
>>> My plan was to move this code to lib/ sooner or later.  If you  
>>> consider it useful in its current state, I can do it immediatly.   
>>> And if someone else merged a superior btree library I'd happily  
>>> remove mine and use the new one instead.
>>>
>>> Opinions?
>>
>> Why would we need another btree, when there is lib/rbtree.c?  Or  
>> does yours do something fundamentally different?
>
> It is not red-black tree, it is b+ tree.

It might be better to use the prefix "bptree" to help prevent  
confusion.  A quick google search on "bp-tree" reveals only the perl B 
+-tree module "Tree::BPTree", a U-Maryland Java CS project on B+- 
trees, and a news article about a "BP tree-top protest".

Cheers,
Kyle Moffett
