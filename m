Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17K5Ss-0003Sb-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 23:59:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEKPFEAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEKPFEAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] scan.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 23:59:13 +0100
Message-ID: <17597.1024354753@redhat.com>
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
>  hmm, I just save the jiffies from the beginning of
> jffs2_scan_medium() and printk the difference just before I leave that
> function.

The real kernel profiling shows a little more detail, which can sometimes 
be useful. Moving the crc32 routine out of line makes it show up nicely too.

>  :-), but seriously once it's on the flash, what's the probability for
> a random flipping bit?  

There are other ways to screw up your flash contents. It doesn't have to be 
a hardware error. I'd be a _lot_ happier if we could continue to expect 
such things and deal with them.

>  At mount time it will save us the trouble to CRC all the data in the
> inode's, won't it? 

Yeah, but we can avoid the need to do that at mount time _anyway_. We can 
probably also ditch most of build.c -- although that doesn't really seem to 
be showing up very high on the profiles anyway.

--
dwmw2
