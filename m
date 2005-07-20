Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvFKM-0000KU-QB
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 10:13:42 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DvFJi-0006PY-7l
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 16:12:58 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 16:12:57 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 16:12:57 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 20 Jul 2005 16:12:37 +0200
Message-ID: <dblm4l$802$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>
	<1121867130.12903.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
In-Reply-To: <1121867130.12903.15.camel@localhost.localdomain>
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>I have a "small" NAND device (32MByte) with JFFS2 on top used as the 
>>root-fs on my system. It's been working like a charm - until just now. 
>>After (over)writing a relative large file (11 megs uncomp. - 
>>~3-5compr.), the garbage collector (jffs2_gcd_mtd0) uses 8:45 minutes of 
>>CPU time (~99%) after booting - blocking any write operations.
>>Ok, I accept that some GC'ing should be performed when going "beyond the 
>>edge" - but shouldn't this be a one-time process, so the next time I 
>>boot this is done with?
>>I see it everytime I reboot - without touching any files on the system...
>>I use the mtd source from 2005-03-04...

> The garbage collection thread is also responsible for building up the
> node tree for every inode after mounting, so that we know for sure which
> nodes are valid and which are obsolete.
So you think this is what consumes the time?

> On NAND flash we can't actually mark nodes as obsolete.
> We've made some significant improvements to that process since March,
> especially where inodes with large numbers of nodes are concerned. We
> used to sort all the nodes into a linked list before building the tree,
> but now we use a tree data structure for that instead -- so it's
> O(n log n) instead of O(n²) in the number of nodes.

> Artem has patches which should improve it still further -- I'm not sure
> if they are committed yet.
Sounds interesting... Artems states it'll be ready sometimes soon (a 
week or so from now...)

BR,
  Martin
