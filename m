Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3yKt-0006Iw-E8
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 14:17:27 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUR00EMMZ9JVM@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 15:08:08 +0100 (MET)
Date: Thu, 18 Mar 2004 15:05:09 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <4059AADF.50902@cray.com>
To: David Updegraff <dave@cray.com>, linux-mtd@lists.infradead.org
Message-id: <200403181505.09909.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <4059AADF.50902@cray.com>
Subject: Re: large page NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 March 2004 14:57, David Updegraff wrote:
> Hi.
>
> There was a post or two a few months ago about support for larger
> (1,2,?,K) pagesize and the extra 2 bytes of config available in newer
> NAND chips..  And a cautionary about asking for advice before
> proceeding. Is there followup/progress on that front that I have missed?
> We are looking into these needs for some Samsung 2k-page NANDs.
>
> Advice & recommended directions appreciated.

http://lists.infradead.org/pipermail/linux-mtd/2004-March/009442.html

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
