Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dvjj-0003uS-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 16:06:23 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_make_ino_cache() in scan.c very slow 
Date: Thu, 21 Feb 2002 17:14:19 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEKMFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <14794.1014306423@redhat.com>
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

> 
> joakim.tjernlund@lumentis.se said:
> >  Setting INOCACHE_HASHSIZE to 14(higher values makes it PANIC at
> > mount, don't know why) 
> 
> Possibly because the superblock union gets too big. What does it say when 
> it panics?
Kernel panic: VFS: Unable to mount root fs on 1f:04
> 
> > and changed the beginning of jffs2_scan_make_ino_cache() to {
> > is it OK to make *ic an static variable?
> 
> No - consider 'mount /opt & mount /usr' - it has to be per-filesystem. If
> it's this which really makes a difference, then we can add the pointer to
> the jffs2_sb_info. Can you make it keep a count of how many hits and misses
> there are, and print the counts when it's finished mounting?

Well, I already have counters to measure elapsed jiffies between entry and exit
of jffs2_scan_medium()

Here are the results:
Both optimizations: 1665 jiffies
extra cache and INOCACHE_HASHSIZE = 1: 2040 jiffies
no extra cache and INOCACHE_HASHSIZE = 14: 1813 jiffies
no optimization: ~3000 jiffies 

I think both are needed.

HZ is 200, this is on a mppc860, 80Mhz

 Jocke

> 
> > Now my mount time is just half of what it used to be!!(well almost :-)
> 
> Cool - can you try each of these changes on its own and measure the benefit
> of each? 
> 
> --
> dwmw2
> 
> 
> 
