Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BFqyh-0002y8-Cl
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 09:51:39 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1BFqyb-0004Nr-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Apr 2004 10:51:33 +0200
Date: Tue, 20 Apr 2004 10:51:33 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <20040420085133.GD2171@tkeitel001.bln.innominate.local>
References: <20040416081729.GN22670@tkeitel001.bln.innominate.local>
	<200404162011.29247.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200404162011.29247.tglx@linutronix.de>
Sender: Tino Keitel <tino.keitel@innominate.com>
Subject: Re: JFFS2 writes fail with 2.4.25
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 16, 2004 at 20:11:29 +0200, Thomas Gleixner wrote:
> On Friday 16 April 2004 10:17, Tino Keitel wrote:
> > On Thu, Apr 15, 2004 at 20:50:25 +0200, Thomas Gleixner wrote:
> > > On Thursday 15 April 2004 16:40, Tino Keitel wrote:
> > > > Hi folks,
> > > >
> > > > The system is an Intel XScale IXP425 board (ARM little endian)
> > > > with 16 MB NOR flash. I use the JFFS2 from the 2.4.25 kernel.
> > > > Any hints what's wrong here?
> > >
> > > Can you try  MTD CVS code ?
> >
> > What CVS tag or branch should I use? I tried HEAD, but I got this
> > error:
> 
> HI Tino,
> 
> there was a fix for 2.6, which broke 2.4. 
> Sorry, can you please revert mtdchar.c to v1.56 ? 
> 
> Will be fixed.

v1.56 fixes the compilation errors, I also don't get any Oopses
anymore.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/
