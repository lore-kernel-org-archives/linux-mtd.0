Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlpLh-00065j-F6
	for linux-mtd@lists.infradead.org; Sat, 27 Oct 2007 18:21:28 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: getdents64 problem in 2.6.23
Date: Sat, 27 Oct 2007 19:20:56 +0200
Message-ID: <000201c818bd$bc3e3c60$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1193504965.2915.11.camel@shinybook.infradead.org>
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org] 
> Sent: den 27 oktober 2007 19:09
> To: Joakim Tjernlund
> Cc: 'Linux-MTD Mailing List'
> Subject: RE: getdents64 problem in 2.6.23
> 
> On Sat, 2007-10-27 at 17:01 +0200, Joakim Tjernlund wrote:
> > How do I do that?
> 
> Add some debugging and check that it's happening at the times you
> expect. And there's no _real_ substitute for the Feynman algorithm to
> problem-solving. :)
> 
> >  I can try booting it, but it has to wait until
> > I get acces to my board again, hopefully tonight.
> > 
> > What about locking? No need for down(&dir_f->sem)? Can I trust
> > that ->next ptr will be valid all the time?
> 
> You'll definitely need locking, to protect against it being 
> opened while
> you're playing with it. I think that just locking dir_f->sem before
> checking i_count probably ought to suffice.
> 
> > ehh, better add an if (!(*prev)->raw) test
> > before jffs2_free_full_dirent(*prev) then. Will clean it up too.
> 
> You might try the unconventional step of _not_ using the dirent
> structure after freeing it, too. And remember that if you're 
> not freeing
> the whole list, you're going to have to play with the list pointers to
> keep it intact.

:), I noticed that. Now I do:
  while (*prev) {
                this = *prev;
                if (!this->raw) {
                        *prev = this->next;
                        jffs2_free_full_dirent(this);
                }
                prev = &((*prev)->next);
        }

However that doesn't matter because the relese method isn't called while
doing rm!

I added som printk's and they were quiet. On the other hand doing an
ls does call the release method.

You need to come up with a better method I think :)
