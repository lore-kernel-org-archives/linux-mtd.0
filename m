Date: Wed, 19 Jan 2005 19:04:27 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20050119184300.56344.qmail@web51008.mail.yahoo.com>
Message-ID: <Pine.LNX.4.58.0501191854480.8174@phoenix.infradead.org>
References: <20050119184300.56344.qmail@web51008.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: some questions regarding the write operation on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Jan 2005, Vahid Fereydunkolahi wrote:

> If the application calls a write system call, which is
> more than the VFS page size, then the VFS will break
"VFS page size" = physical mem page size = PAGE_SIZE = 4K on x86
> this write operation based on the size of the page.
> this means that JFFS2 does not have any knowledge
> about the 
> whole write operation.
I fo you write X bytes and X = PAGE_SIZE + Y, Y < PAGE_SIZE, and
you write to PAGE_SIZE-aligned offset in the file (0 for example),
VFS will ask JFFS2 first to write PAGE_SIZE bytes, then Y bytes.
Yes, JFFS2 does not know about X, only PAGE_SIZE and Y.

> If power failure happens during
> the write operation, the data can be written
> partially.
Yes, if JFFS2 have already written PAGE_SIZE, and then you reboots 
uncleanly, you will lost your Y bytes. You may reboot your board uncleanly 
during the fist (PAGE_SIZE) write operation, so you will lost all X bytes.

In any case, JFFS2 will ignore the partially written data when you mount 
it next time.

In general, it is good to think you may lost any data which you have 
written after mount/last fsync/syncfs.

> 
> Can this happen?
> 
> --vahid
> --- "Artem B. Bityuckiy" <dedekind@infradead.org>
> wrote:
> 
> > On Wed, 19 Jan 2005, Vahid Fereydunkolahi wrote:
> > 
> > > 
> > > --- "Artem B. Bityuckiy" <dedekind@infradead.org>
> > > wrote:
> > > 
> > > > On Tue, 18 Jan 2005, Vahid Fereydunkolahi wrote:
> > > > 
> > > > > Hi All,
> > > > >  I traced the write operation from the Linux
> > > > kernel to
> > > > > the JFFS2. I have some questions:
> > > > >     1) Is there any chance that there could be
> > > > some
> > > > > partial writes on the NAND flash (if power
> > failure
> > > > > happens during write operation).
> > > > Yes, there is chance.
> > > 
> > > Does JFFS2 guarantee that if there is a partial
> > write
> > > then the data will be ignored? 
> > Yes it does.
> > 
> > > 
> > > > 
> > > > > 
> > > > >     2) Does SYNC has any meaning when using
> > the
> > > > JFFS2.
> > > > > As fas as I noticed the write operations are
> > > > > forwarded to the MTD device, and they are not
> > > > cached.
> > > > For NAND JFFS2 has per-NAND page buffer, so sync
> > > > flushes it. see 
> > > > jffs2/wbuf.c.
> > > > 
> > > > > 
> > > > > Thank you so much in advance,
> > > > > --vahid
> > > > You're welcome :-)
> > > > 
> > > > > 
> > > > > 
> > > > > 		
> > > > > __________________________________ 
> > > > > Do you Yahoo!? 
> > > > > Read only the mail you want - Yahoo! Mail
> > > > SpamGuard. 
> > > > > http://promotions.yahoo.com/new_mail 
> > > > > 
> > > > >
> > > >
> > >
> >
> ______________________________________________________
> > > > > Linux MTD discussion mailing list
> > > > >
> > > >
> > >
> >
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > > > > 
> > > > 
> > > > --
> > > > Best Regards,
> > > > Artem B. Bityuckiy,
> > > > St.-Petersburg, Russia.
> > > > 
> > > 
> > > 
> > > 
> > > 		
> > > __________________________________ 
> > > Do you Yahoo!? 
> > > Read only the mail you want - Yahoo! Mail
> > SpamGuard. 
> > > http://promotions.yahoo.com/new_mail 
> > > 
> > 
> > --
> > Best Regards,
> > Artem B. Bityuckiy,
> > St.-Petersburg, Russia.
> > 
> 
> 
> 
> 		
> __________________________________ 
> Do you Yahoo!? 
> Yahoo! Mail - Helps protect you from nasty viruses. 
> http://promotions.yahoo.com/new_mail
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
