Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16du8x-0003l7-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 14:24:19 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_make_ino_cache() in scan.c very slow 
Date: Thu, 21 Feb 2002 15:34:29 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <2078.1014301104@redhat.com>
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
> 
> 
> joakim.tjernlund@lumentis.se said:
> >  I have made some crude measures in jffs2_scan_medium() and friends to
> > see where most of the time is spent. It turns out that
> > jffs2_scan_make_ino_cache() is takes about 50 % of the total mount
> > time!
> 
> How did you do your profiling?
I accumulated the difference of jiffies from the entry of jffs2_scan_make_ino_cache()
to it returned.

 Are you sure it's not spending the time in 
> jffs2_get_ino_cache() and jffs2_add_ino_cache()? I suspect it is.

That is so, allmost all time is in jffs2_get_ino_cache().

> 
> > What can be done to decrease this time? 
> 
> Try increasing INOCACHE_HASHSIZE - that'll make the hash table more 
> efficient - well, it'll make the hash table into a hash table instead of a 
> linked list :)
> 
> You'll probably find that it's looking up the same inode over and over 
> again too - in which case caching the last used inode in 
> jffs2_scan_make_ino_cache() would probably be useful.

OK, will try an see what happens.
> 
> 
> 
> joakim.tjernlund@lumentis.se said:
> >  PS.
> >     I sent a patch (Subject:  cfi_cmdset0001.c: bug fixes and new
> > features) a week ago
> >     and I haven't got any comments so far.
> 
> 
> Sorry. Can you make sure it still applies to the current CVS tree and 
> resend it?

Well, I not using the current CVS at the moment. It will take some time
until I upgrade again.

 Jocke

> 
> --
> dwmw2
> 
> 
> 
