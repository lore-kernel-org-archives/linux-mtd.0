Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uUSq-0004nW-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 08:20:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AEE1067.599A8ACF@Rikers.org> 
References: <3AEE1067.599A8ACF@Rikers.org>  <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk> 
To: Tim Riker <Tim@Rikers.org>
Cc: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 May 2001 08:21:16 +0100
Message-ID: <13672.988701676@redhat.com>
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

Tim@Rikers.org said:
> Providing n is random, this is a good solution. Can the list be hacked
> to change the top/bottom without actually walking through n blocks and
> moving them? I have not looked at the source, but for a linked list
> you could join top and bottom entries and then break n and n-1 nodes
> and start becomes n, end becomes n-1, etc.

Yep, hacking the list is fairly easy. Coming up with a pseudo-random number 
of reasonable quality at boot time when the entropy pool is empty is the 
more interesting bit. The 'jiffies mod' trick would give repeatable
results.

Just to restate the obvious - it doesn't have to be _random_, just evenly 
distributed.

> This will still be somewhat pattern oriented. last blocks scanned will
> be either at front or back so I suspect wear numbers will increase
> towards the end of scanned blocks. ie: first scanned blocks would never
> be on the end of the dirty list.

Agreed.

--
dwmw2
