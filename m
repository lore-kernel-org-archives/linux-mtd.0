Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M0AO-0001eq-7F
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 07:48:36 +0100
Date: Sat, 31 May 2003 08:48:51 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "David S. Miller" <davem@redhat.com>
Message-ID: <20030531064851.GA20822@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
	<20030530174319.GA16687@wohnheim.fh-wedel.de>
	<20030530.171410.104043496.davem@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030530.171410.104043496.davem@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: matsunaga_kazuhisa@yahoo.co.jp
cc: linux-mtd@lists.infradead.org
cc: dwmw2@infradead.org
cc: linux-kernel@vger.kernel.org
cc: jmorris@intercode.com.au
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 May 2003 17:14:10 -0700, David S. Miller wrote:
> 
> Actually, your idea is interesting.  Are you going to use
> per-cpu workspaces?

Yes, I already am.

> I think the best scheme is 2 per-cpu workspaces, one for
> normal and one for softirq context.

Agreed.  Current patch doesn't cover softirq context yet.

> No locking needed whatsoever.  I hope it can work :-)

How about preemption?  zlib operations take their time, so at least on
up, it makes sense to preempt them, when not in softirq context.  Can
this still be done lockless?

Jörn

-- 
More computing sins are committed in the name of efficiency (without
necessarily achieving it) than for any other single reason - including
blind stupidity.
-- W. A. Wulf 
