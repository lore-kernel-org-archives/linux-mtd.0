Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B2Ip-00087w-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2002 00:19:43 +0000
Date: Sun, 10 Nov 2002 16:50:04 -0800
From: Marc Singer <elf@buici.com>
To: Wolfgang Denk <wd@denx.de>
Cc: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
  linux-mtd@lists.infradead.org
Subject: Re: crc32() optimization
Message-ID: <20021111005004.GA27214@buici.com>
References: <20021110184321.GB16087@buici.com> <20021110192544.0A34D10162@denx.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20021110192544.0A34D10162@denx.denx.de>
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

On Sun, Nov 10, 2002 at 08:25:38PM +0100, Wolfgang Denk wrote:
> In message <20021110184321.GB16087@buici.com> you wrote:
> > As it should.  I wonder if you'd do better changing the loop slightly.
> > 
> > Check for len == 0 and do a short-circuit return.  Then do this
> > 
> >   for (++len; len & 0x7; len >>= 3) {
> >      ONCE(); // repeat eight times
> >      ...
> >      len >>= 3;
> >   }
> >   while (--len > 0)
> >      ONCE();
> > 
> > This is the implementation I've written for another project which
> 
> Seems broken to me, since you "len >>= 3" twice.

That's what I get for writing it from memory.

> Also, Duff's Device comes to mind.

What would that be?


> 
> Best regards,
> 
> Wolfgang Denk
> 
> -- 
> Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
> Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
> See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325 
