Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dvG7-0003rY-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 15:35:47 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOEKKFBAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLOEKKFBAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Feb 2002 15:47:03 +0000
Message-ID: <14794.1014306423@redhat.com>
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
>  Setting INOCACHE_HASHSIZE to 14(higher values makes it PANIC at
> mount, don't know why) 

Possibly because the superblock union gets too big. What does it say when 
it panics?

> and changed the beginning of jffs2_scan_make_ino_cache() to {
> is it OK to make *ic an static variable?

No - consider 'mount /opt & mount /usr' - it has to be per-filesystem. If
it's this which really makes a difference, then we can add the pointer to
the jffs2_sb_info. Can you make it keep a count of how many hits and misses
there are, and print the counts when it's finished mounting?

> Now my mount time is just half of what it used to be!!(well almost :-)

Cool - can you try each of these changes on its own and measure the benefit
of each? 

--
dwmw2
