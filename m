Received: from web20721.mail.yahoo.com ([216.136.226.73])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AltxD-0003HH-GV
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2004 17:58:19 +0000
Message-ID: <20040128175816.99925.qmail@web20721.mail.yahoo.com>
Date: Wed, 28 Jan 2004 09:58:16 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: David Woodhouse <dwmw2@infradead.org>,
  "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <1075305569.1633.178.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: 64 bit bus access on a customed MPC8245 board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > I'm working on a customed MPC8245 board with
> flash
> > > chip Am29LV320 and trying to enable MTD driver
> > > support.
> 
> > I looked and I can't find documentation for that
> chip.
> > Is it an atmel one?
> 
>
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26518.pdf
> 
> It's 16-bit, CFI-compliant, and (obviously) AMD
> command set.

Sorry for this mistake. I mean Am29PL320D, which is
here
(http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/24075.pdf).
And it's 32-bit, CFI-complaint.

-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
