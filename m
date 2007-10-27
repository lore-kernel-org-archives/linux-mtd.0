Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlnBC-00041Q-H6
	for linux-mtd@lists.infradead.org; Sat, 27 Oct 2007 16:02:29 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: getdents64 problem in 2.6.23
Date: Sat, 27 Oct 2007 17:01:57 +0200
Message-ID: <000101c818aa$51e79ea0$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1193489069.2533.23.camel@shinybook.infradead.org>
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
> Sent: den 27 oktober 2007 14:44
> To: joakim.tjernlund@transmode.se
> Cc: 'Linux-MTD Mailing List'
> Subject: RE: getdents64 problem in 2.6.23
> 
> 
> On Sat, 2007-10-27 at 13:02 +0200, Joakim Tjernlund wrote:
> > 
> > +static int jffs2_release(struct inode *dir_i, struct file *file)
> > +{
> > +       //struct jffs2_sb_info *c = JFFS2_SB_INFO(dir_i->i_sb);
> > +       struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
> > +       struct jffs2_full_dirent **prev = &dir_f->dents;
> > +
> > +       if (atomic_read(&dir_i->i_count))
> > +               return 0;
> 
> That's certainly what I was thinking -- but do check that it's right.
> It's possible that you'll have to do refcounting some other way.

How do I do that? I can try booting it, but it has to wait until
I get acces to my board again, hopefully tonight.

What about locking? No need for down(&dir_f->sem)? Can I trust
that ->next ptr will be valid all the time?

 Jocke
> 
> > +       while (*prev) {
> > +               D1(printk(KERN_DEBUG "Releasing directory 
> inode:%d\n", (*prev)->ino));
> > +
> > +               jffs2_free_full_dirent(*prev);
> > +               prev = &((*prev)->next);
> > +       }
> 
> That'll kill _everything_, so if the inode is subsequently reopened
> before it's pruned from the icache, it'll appear empty. You were only
> supposed to remove the dirents where fd->raw == NULL; the ones which
> were acting as 'placeholders' to keep seeks in the directory's opened
> filedescriptors working consistently.

ehh, better add an if (!(*prev)->raw) test
before jffs2_free_full_dirent(*prev) then. Will clean it up too.

 Jocke
