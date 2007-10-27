Subject: RE: getdents64 problem in 2.6.23
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <000101c818aa$51e79ea0$5267a8c0@Jocke>
References: <000101c818aa$51e79ea0$5267a8c0@Jocke>
Content-Type: text/plain
Date: Sat, 27 Oct 2007 13:09:25 -0400
Message-Id: <1193504965.2915.11.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-10-27 at 17:01 +0200, Joakim Tjernlund wrote:
> How do I do that?

Add some debugging and check that it's happening at the times you
expect. And there's no _real_ substitute for the Feynman algorithm to
problem-solving. :)

>  I can try booting it, but it has to wait until
> I get acces to my board again, hopefully tonight.
> 
> What about locking? No need for down(&dir_f->sem)? Can I trust
> that ->next ptr will be valid all the time?

You'll definitely need locking, to protect against it being opened while
you're playing with it. I think that just locking dir_f->sem before
checking i_count probably ought to suffice.

> ehh, better add an if (!(*prev)->raw) test
> before jffs2_free_full_dirent(*prev) then. Will clean it up too.

You might try the unconventional step of _not_ using the dirent
structure after freeing it, too. And remember that if you're not freeing
the whole list, you're going to have to play with the list pointers to
keep it intact.

-- 
dwmw2
