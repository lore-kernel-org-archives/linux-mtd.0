Received: from web51008.mail.yahoo.com ([206.190.38.139])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrKnG-0004DC-Jr
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 13:43:04 -0500
Message-ID: <20050119184300.56344.qmail@web51008.mail.yahoo.com>
Date: Wed, 19 Jan 2005 10:43:00 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501191745210.8174@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

If the application calls a write system call, which is
more than the VFS page size, then the VFS will break
this write operation based on the size of the page.
this means that JFFS2 does not have any knowledge
about the 
whole write operation. If power failure happens during
the write operation, the data can be written
partially.

Can this happen?

--vahid
--- "Artem B. Bityuckiy" <dedekind@infradead.org>
wrote:

> On Wed, 19 Jan 2005, Vahid Fereydunkolahi wrote:
> 
> > 
> > --- "Artem B. Bityuckiy" <dedekind@infradead.org>
> > wrote:
> > 
> > > On Tue, 18 Jan 2005, Vahid Fereydunkolahi wrote:
> > > 
> > > > Hi All,
> > > >  I traced the write operation from the Linux
> > > kernel to
> > > > the JFFS2. I have some questions:
> > > >     1) Is there any chance that there could be
> > > some
> > > > partial writes on the NAND flash (if power
> failure
> > > > happens during write operation).
> > > Yes, there is chance.
> > 
> > Does JFFS2 guarantee that if there is a partial
> write
> > then the data will be ignored? 
> Yes it does.
> 
> > 
> > > 
> > > > 
> > > >     2) Does SYNC has any meaning when using
> the
> > > JFFS2.
> > > > As fas as I noticed the write operations are
> > > > forwarded to the MTD device, and they are not
> > > cached.
> > > For NAND JFFS2 has per-NAND page buffer, so sync
> > > flushes it. see 
> > > jffs2/wbuf.c.
> > > 
> > > > 
> > > > Thank you so much in advance,
> > > > --vahid
> > > You're welcome :-)
> > > 
> > > > 
> > > > 
> > > > 		
> > > > __________________________________ 
> > > > Do you Yahoo!? 
> > > > Read only the mail you want - Yahoo! Mail
> > > SpamGuard. 
> > > > http://promotions.yahoo.com/new_mail 
> > > > 
> > > >
> > >
> >
>
______________________________________________________
> > > > Linux MTD discussion mailing list
> > > >
> > >
> >
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > > > 
> > > 
> > > --
> > > Best Regards,
> > > Artem B. Bityuckiy,
> > > St.-Petersburg, Russia.
> > > 
> > 
> > 
> > 
> > 		
> > __________________________________ 
> > Do you Yahoo!? 
> > Read only the mail you want - Yahoo! Mail
> SpamGuard. 
> > http://promotions.yahoo.com/new_mail 
> > 
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Helps protect you from nasty viruses. 
http://promotions.yahoo.com/new_mail
