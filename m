Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c4mP-0006PX-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 14:53:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020806135217.GA17427@wohnheim.fh-wedel.de> 
References: <20020806135217.GA17427@wohnheim.fh-wedel.de>  <IGEFJKJNHJDCBKALBJLLAEIBFFAA.joakim.tjernlund@lumentis.se> <30768.1028636087@redhat.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: joakim.tjernlund@lumentis.se, Dave Ellis <DGE@sixnetio.com>,
    linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Aug 2002 14:53:32 +0100
Message-ID: <7034.1028642012@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
> Just a wild thought: With three command sets already implemented (0020
> is not in the tree yet), wouldn't it make sense to go through them and
> try to collect as much common code, as possible? I really dislike code
> multiplication, especially bug multiplication.

Yes, it would. We've done some of it already -- the cfi_cmd() bits, etc. 
Some helpful stuff for handling the state machine and scheduling 
appropriately would also be good.

--
dwmw2
