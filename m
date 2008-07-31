Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOTPZ-0001Ay-1W
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 08:21:25 +0000
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
Date: Thu, 31 Jul 2008 01:21:22 -0700
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<1217489583.3454.36.camel@pmac.infradead.org>
In-Reply-To: <1217489583.3454.36.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807310121.22219.david-b@pacbell.net>
Cc: trimarchimichael@yahoo.it, jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 31 July 2008, David Woodhouse wrote:
> Yes. We're planning to change the API so it looks a lot more like the
> block layer, and a lot less like the one we inherited from PCMCIA in the
> 1990s.

Yeah, there are still a few "old" driver structures lingering.  And
I expect the Linux community understands a LOT more about MTD than
it did way back in the day ... :)


> One of the design considerations we've spoken about has been the 
> fact that we want to make DMA work properly. 

Glad to hear that.  But am I right in reading between the lines that
this isn't "soon"?  So that the issue addressed by $SUBJECT won't be
able to rely on that as its fix.

- Dave
