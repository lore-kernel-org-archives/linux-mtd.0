Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dv5V-0003qg-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 15:24:49 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <joakim.tjernlund@lumentis.se>, "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_make_ino_cache() in scan.c very slow 
Date: Thu, 21 Feb 2002 16:34:55 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEKKFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se>
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

> > 
> > 
> > 
> > joakim.tjernlund@lumentis.se said:
> > >  I have made some crude measures in jffs2_scan_medium() and friends to
> > > see where most of the time is spent. It turns out that
> > > jffs2_scan_make_ino_cache() is takes about 50 % of the total mount
> > > time!
> > 
> > How did you do your profiling?
> I accumulated the difference of jiffies from the entry of jffs2_scan_make_ino_cache()
> to it returned.
> 
>  Are you sure it's not spending the time in 
> > jffs2_get_ino_cache() and jffs2_add_ino_cache()? I suspect it is.
> 
> That is so, allmost all time is in jffs2_get_ino_cache().
> 
> > 
> > > What can be done to decrease this time? 
> > 
> > Try increasing INOCACHE_HASHSIZE - that'll make the hash table more 
> > efficient - well, it'll make the hash table into a hash table instead of a 
> > linked list :)
> > 
> > You'll probably find that it's looking up the same inode over and over 
> > again too - in which case caching the last used inode in 
> > jffs2_scan_make_ino_cache() would probably be useful.
> 
> OK, will try an see what happens.

Setting INOCACHE_HASHSIZE to 14(higher values makes it PANIC at mount, don't know
why) and changed the beginning of jffs2_scan_make_ino_cache() to
{
   	static struct jffs2_inode_cache *ic = NULL;

	if(ic && ic->ino == ino)
		return ic;
...

is it OK to make *ic an static variable?

Now my mount time is just half of what it used to be!!(well almost :-)
