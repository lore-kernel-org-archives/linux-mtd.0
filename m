Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IMZ8W-0007Nk-LK
	for linux-mtd@lists.infradead.org; Sat, 18 Aug 2007 20:59:26 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'Josh Boyer'" <jwboyer@gmail.com>,
	"'giulio fedel'" <giulio.fedel@andorsystems.com>,
	"'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: jffs2 kernel dump with 2.6.22-rc7
Date: Sun, 19 Aug 2007 02:59:19 +0200
Message-ID: <00bb01c7e1fc$2c810690$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <625fc13d0708181442k5efc6eb3g783ad32b2efdcadc@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Josh Boyer [mailto:jwboyer@gmail.com] 
> Sent: den 18 augusti 2007 23:43
> To: giulio fedel; David Woodhouse; Joakim.Tjernlund@transmode.se
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: jffs2 kernel dump with 2.6.22-rc7
> 
> On 8/17/07, giulio fedel <giulio.fedel@andorsystems.com> wrote:
> > In jffs2_do_unlink() in fs/jffs2/write.c
> > the jffs2_complete_reservation(c) is called even if
> > jffs2_reserve_space() is not called. This cause an unmatched
> > up(&c->alloc_sem) so the locking mechanism does not work.
> > People using MTD_CAP_NORFLASH flash _and_ 
> CONFIG_JFFS2_SUMMARY do not
> > see the problem (see  os-linux.h for the definition of
> > jffs2_can_mark_obsolete(c)).
> >
> > I think this is your problem (it was the mine).
> 
> Hm.  That would be a regression introduced by commit
> a491486a2087ac3dfc00efb4f838c8d684afaf54 I think.

Looks like it.

> 
> Your patch seems like the correct fix.  Could you make it a strip
> level of 1 and add the appropriate Signed-off-by line?  If so, we
> should probably push this to -stable for 2.6.22 and be sure to get it
> into 2.6.23.

Yes, can't be long until .23 gets released now, hopefully this 
correction will make it in time.

> 
> josh
> 
> 
