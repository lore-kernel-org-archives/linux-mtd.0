Received: from web51007.mail.yahoo.com ([206.190.38.138])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTQKV-0004Lb-Px
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 16:18:48 -0400
Message-ID: <20050504201852.7642.qmail@web51007.mail.yahoo.com>
Date: Wed, 4 May 2005 13:18:51 -0700 (PDT)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: Michael <xemc@yahoo.com>, dedekind@infradead.org
In-Reply-To: 6667
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: two questions about jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am not sure if you even understand the question, so
please behave.

The question is: if the file system supposed to
address the issue of the bad blocks then JFFS2, which
is the file system must handle the bad blocks, This
includes all the read and write operations. The only
thing MTD checks is the erase operation on the blocks.

--vahid
--- Michael <xemc@yahoo.com> wrote:
> 
> --- Vahid Fereydunkolahi <fereydunk@yahoo.com>
> wrote:
> > The comment "JFFS2 handles bad blocks just fine."
> is
> > an strange comment. As far as I know the handling
> of
> > the bad blocks must be managed by the file system
> and
> > mtd device will only check for bad blocks for
> erase operation.
> > 
> 
> I think you just embarrased yourself.  JFFS2 is
> Journalling Flash
> File System 2, which works overtop of MTD, the
> Memory Technology
> Devices [driver layer].
> 
> And I think it handles them just fine, too.  Did you
> look at
> linux-mtd.infradead.org?  There's lots of good info
> there, and it's
> a lot easier than searching the mailing list. (which
> is useful as
> well)
> 
> Mike
> 


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Small Business - Try our new resources site!
http://smallbusiness.yahoo.com/resources/ 
