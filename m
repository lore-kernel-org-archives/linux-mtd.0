Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163guh-0004y4-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 16:59:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEEPJEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLEEPJEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fwd: Cache mappings and invalidate 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Nov 2001 17:09:20 +0000
Message-ID: <11915.1005671360@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  OK, just checked my arch(MPC860) and they are implemented. Are there
> other functions that I should used instead? 

No. I suggested we implement simon_says_flush_dcache_range() et al, but 
Linus didn't seem to like that :)

> > Linus seems to think this is a Good Thing. 
> hmm, why should this be a Good Thing?

No clue.


--
dwmw2
