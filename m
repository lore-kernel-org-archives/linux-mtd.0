Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163mwc-0005RW-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 23:26:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0111140207080.11644-100000@godzilla.axis.se> 
References: <Pine.LNX.4.21.0111140207080.11644-100000@godzilla.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: joakim.tjernlund@lumentis.se, linux-mtd@lists.infradead.org
Subject: Re: Fwd: Cache mappings and invalidate 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Nov 2001 23:35:42 +0000
Message-ID: <16717.1005694542@redhat.com>
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

bjorn.wesen@axis.com said:
>  So what you really want, is to rename those cache flushes in the mm
> code into a name saying what they try to do, let some archs implement
> that as a cache flush if needed, and reserve the real cache flush code
> into a function that you need to implement (and use that in MTD
> perhaps).

> You _dont_ want to implement the flush_cache_* functions that exist
> right now on all architectures, not the way they are used.

Agreed. But Linus didn't want to fix the silly names. He seems to like them.

--
dwmw2
