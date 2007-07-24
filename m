Received: from www19.your-server.de ([213.133.104.19])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IDEwB-0000gW-HI
	for linux-mtd@lists.infradead.org; Tue, 24 Jul 2007 03:36:09 -0400
From: Uli Luckas <u.luckas@road.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
Date: Tue, 24 Jul 2007 09:35:23 +0200
References: <200706141509.50621.u.luckas@road.de>
	<1183056721.1170.188.camel@pmac.infradead.org>
In-Reply-To: <1183056721.1170.188.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="ansi_x3.4-1968"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707240935.26116.u.luckas@road.de>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, 28. June 2007, David Woodhouse wrote:
> On Thu, 2007-06-14 at 15:09 +0200, Uli Luckas wrote:
> > The problem seems to happen, when suspend kicks in, after the call to
> > try_to_freeze and before the while loop in jffs2_garbage_collect_thread.
> >
> > The pending freeze will cause signal_pending to return true until the
> > attempted suspend is over and thereby the while loop won't terminate
> > until the suspend times out.
> >
> > This patch will call try_to_freeze from within the while loop and adds an
> > extra check for jffs2_thread_should_wake before we actually do the GC to
> > avoid calling jffs2_garbage_collect_pass at every wakeup.
>
> Thanks. I've committed a slightly simpler fix:
> http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=e716dd3644c2a79d6ffa
>4359bac06f57479dcb34

Hi David,
could you please push this patch upstream?

regards,
Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
