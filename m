Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MRco-0003Gy-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 10:30:58 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOEIIFAAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLOEIIFAAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: CLEANMARKER question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Jan 2002 10:41:53 +0000
Message-ID: <9803.1010140913@redhat.com>
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
> OK, I suspected that much. So after a CLEANMARKER there can be a
> NODETYPE_INODE or a NODETYPE_DIRENT?

Or indeed any other type of node, when new ones get invented - yes.

> Why do you do 2 scan_empty() calls in scan_eraseblock() ?

Consider it loop unrolling. 

> Well, sofar I have only identified one improvement. One could add an 
> isempty() function in the mtd layer. That would improve scaning for 
> empy flash so that you dont have to mtd->read() into a buffer and then 
> check the buffer for 0xffffffff. How does that sound? 

Sounds ugly, but could be effective. Want to benchmark it to see if it's 
really worth it?

If there's a way to safely avoid having to check all the node CRCs on 
mount, that would also help.

The most useful thing to do, though, would probably be to implement 
checkpointing.

--
dwmw2
