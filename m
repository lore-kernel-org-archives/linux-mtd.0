Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dtsX-0003k1-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 14:07:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOEKHFBAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLOEKHFBAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Feb 2002 14:18:24 +0000
Message-ID: <2078.1014301104@redhat.com>
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
>  I have made some crude measures in jffs2_scan_medium() and friends to
> see where most of the time is spent. It turns out that
> jffs2_scan_make_ino_cache() is takes about 50 % of the total mount
> time!

How did you do your profiling? Are you sure it's not spending the time in 
jffs2_get_ino_cache() and jffs2_add_ino_cache()? I suspect it is.

> What can be done to decrease this time? 

Try increasing INOCACHE_HASHSIZE - that'll make the hash table more 
efficient - well, it'll make the hash table into a hash table instead of a 
linked list :)

You'll probably find that it's looking up the same inode over and over 
again too - in which case caching the last used inode in 
jffs2_scan_make_ino_cache() would probably be useful.



joakim.tjernlund@lumentis.se said:
>  PS.
>     I sent a patch (Subject:  cfi_cmdset0001.c: bug fixes and new
> features) a week ago
>     and I haven't got any comments so far.


Sorry. Can you make sure it still applies to the current CVS tree and 
resend it?

--
dwmw2
