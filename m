Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vL2o-0000x0-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 16:29:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AF178EB.89D9D094@daniel.com> 
References: <3AF178EB.89D9D094@daniel.com>  <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 May 2001 16:29:48 +0100
Message-ID: <30342.988903788@redhat.com>
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

vipin.malik@daniel.com said:
> As hypothesized, the every few minutes cycling was what was screwing up
> the wear leveling algorithm. After the cycling stopped, all sectors
> showed up in the log and additionally each was cycled the same number
> of times!

Good :)

> In my opinion, there should be no need to fix the algorithm to
> accommodate the frequent cycling. Power going down every few minutes
> is (usually) NOT a normal mode of operation of an embedded system.

It's not normal, but given that it's quite easy for us to deal with it by
attempting to start in a different place each time, we might as well do so.

If it were more difficult, I'd be inclined to agree with you that it's not 
worth the effort.

--
dwmw2
