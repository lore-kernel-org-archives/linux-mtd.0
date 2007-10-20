Received: from dns1.vpop.net ([216.193.240.2] helo=mail.vpop.net)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjIcP-0007nP-R9
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 19:00:17 +0100
Subject: Re: [PATCH] MTD: treat any negative return value from correct() as
	an error
From: Matthew Reimer <mreimer@vpop.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071020174006.GA1520@lazybastard.org>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
	<f383264b0710200937j25dd2c62pba1f39767c9ff9d8@mail.gmail.com>
	<20071020174006.GA1520@lazybastard.org>
Content-Type: text/plain; charset=ISO-8859-1
Date: Sat, 20 Oct 2007 10:59:36 -0700
Message-Id: <1192903176.6230.8.camel@bilbo.vpop.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Matt Reimer <mattjreimer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-10-20 at 19:40 +0200, Jörn Engel wrote:
> On Sat, 20 October 2007 09:37:16 -0700, Matt Reimer wrote:
> > 
> > My mistake: I did most of this analysis in the 2.6.21 code, where
> > cafe_ecc.c:cafe_correct_ecc() did return -EIO, not diskonchip.
> > 
> > But as for the rest of the description, I'm just reading the code
> > that's there. An error return from ecc.correct bumps stats.failed,
> > which in nand_do_read_ops does become -EBADMSG:
> > 
> >         if (mtd->ecc_stats.failed - stats.failed)
> >                 return -EBADMSG;
> > 
> >         return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
> > 
> > So I was just following what I found there, assuming it was standard practice.
> 
> Fair enough.  Description aside, your patch, my two, plus your patch to
> return -1 on uncorrectable ecc errors instead of 0 should be turned into
> a patch series.  Better yet, change your patch to return -EBADMSG.
> 
> Do you volunteer or should I do it?

I'll do it, if the next couple of days is soon enough. I'd rather keep
you free to work on LogFS. :-)

Matt
