Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3zDi-0001Op-UW
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 15:00:22 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: sync() takes minutes while erasing
Date: Thu, 28 Jun 2007 20:59:51 +0200
Message-ID: <001901c7b9b6$81e76340$0e67a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1183056861.1170.191.camel@pmac.infradead.org>
Cc: 'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
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
> Sent: den 28 juni 2007 20:54
> To: joakim.tjernlund@transmode.se
> Cc: Linux MTD mailing list
> Subject: Re: sync() takes minutes while erasing
> 
> On Wed, 2007-06-20 at 16:49 +0200, Joakim Tjernlund wrote:
> > Ok, found the cause:
> >  jffs2_erase_pending_blocks(c, 0) is called from
> >  jffs2_write_super() and it hangs until all
> >  pending erases are complete.
> > 
> > Why do jffs2_write_super() need to call 
> > jffs2_erase_pending_blocks(c, 0)? Seems like a bad idea to me. 
> 
> It's because pdflush is the best context I could find for 
> actually doing
> the erases we need. But now I think we can use pdflush_operation()
> instead of having to do it from write_super(), so maybe we can fix the
> thing that offends you.

Thanks, this stop the complaints from the test team. They
don't like to wait a few mins every time they delete an old install
and reboot.

  Jocke
