Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEXsR-0006VF-Ot
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 19:15:47 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Tino Keitel <tino.keitel@innominate.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Date: Fri, 16 Apr 2004 20:11:29 +0200
References: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
	<200404152050.25417.tglx@linutronix.de>
	<20040416081729.GN22670@tkeitel001.bln.innominate.local>
In-Reply-To: <20040416081729.GN22670@tkeitel001.bln.innominate.local>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404162011.29247.tglx@linutronix.de>
Subject: Re: JFFS2 writes fail with 2.4.25
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 April 2004 10:17, Tino Keitel wrote:
> On Thu, Apr 15, 2004 at 20:50:25 +0200, Thomas Gleixner wrote:
> > On Thursday 15 April 2004 16:40, Tino Keitel wrote:
> > > Hi folks,
> > >
> > > The system is an Intel XScale IXP425 board (ARM little endian) with
> > > 16 MB NOR flash. I use the JFFS2 from the 2.4.25 kernel. Any hints
> > > what's wrong here?
> >
> > Can you try  MTD CVS code ?
>
> What CVS tag or branch should I use? I tried HEAD, but I got this
> error:

HI Tino,

there was a fix for 2.6, which broke 2.4. 
Sorry, can you please revert mtdchar.c to v1.56 ? 

Will be fixed.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
