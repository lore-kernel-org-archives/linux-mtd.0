Received: from riker.dsl.inconnect.com
	([209.140.76.229] helo=ns1.rikers.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uUor-0004pv-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 08:43:38 +0100
Message-ID: <3AEE6920.89563C1B@Rikers.org>
Date: Tue, 01 May 2001 01:43:28 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?)
References: <3AEE1067.599A8ACF@Rikers.org>  <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk> <13672.988701676@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> Tim@Rikers.org said:
> > Providing n is random, this is a good solution. Can the list be hacked
> > to change the top/bottom without actually walking through n blocks and
> > moving them? I have not looked at the source, but for a linked list
> > you could join top and bottom entries and then break n and n-1 nodes
> > and start becomes n, end becomes n-1, etc.
> 
> Yep, hacking the list is fairly easy. Coming up with a pseudo-random number
> of reasonable quality at boot time when the entropy pool is empty is the
> more interesting bit. The 'jiffies mod' trick would give repeatable
> results.

RTC should not be relied on as some hardware has this broken (iPAQ at
present ;-) What about totaling the checksums for each block as we scan
them at mount time and then mod that by numblocks? This would also be
repeatable given the same original filesystem. Every filesystem write
changes it. Reads do not, but then they don't need wear leveling do
they? ;-)

> Just to restate the obvious - it doesn't have to be _random_, just evenly
> distributed.

agreed

-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
