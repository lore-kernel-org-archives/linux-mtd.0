Received: from smtp113.sbc.mail.mud.yahoo.com ([68.142.198.212])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I42op-0007F7-AN
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 18:50:32 -0400
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
Date: Thu, 28 Jun 2007 15:45:36 -0700
References: <200706241509.14367.david-b@pacbell.net>
	<200706281308.46022.david-b@pacbell.net>
	<1183066751.1170.208.camel@pmac.infradead.org>
In-Reply-To: <1183066751.1170.208.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706281545.37013.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 28 June 2007, David Woodhouse wrote:
> On Thu, 2007-06-28 at 13:08 -0700, David Brownell wrote:
> > They applied just fine against 2.6.22-rc6 ... did you apply them
> > in the correct order? 
> 
> No, sorry. I did now though, with a small cleanup patch to follow.

Whew!  Thanks for the update.  I was hoping there wasn't another
patchset around that I had somehow missed.  ;)

- Dave
