Received: from smtp116.sbc.mail.sp1.yahoo.com ([69.147.64.89])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JexaI-00069x-IA
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 19:16:22 +0000
From: David Brownell <david-b@pacbell.net>
To: Randy Dunlap <randy.dunlap@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: some minor issues with 2.6.25-rc6-git7-default
Date: Thu, 27 Mar 2008 12:16:18 -0700
References: <213294492@web.de>
	<20080326131346.39efee07.randy.dunlap@oracle.com>
In-Reply-To: <20080326131346.39efee07.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200803271216.18672.david-b@pacbell.net>
Cc: devzero@web.de, linux-ide@vger.kernel.org, greg@kroah.com,
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>,
	linux-acpi@vger.kernel.org, linux-mtd@lists.infradead.org,
	alan@lxorguk.ukuu.org.uk, lenb@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 26 March 2008, Randy Dunlap wrote:
> 
> > > uh, "known problem": multiple rtc drivers are being run.
> > > 
> > > I don't really understand why we haven't been able to fix this - there have
> > > been numerous reports..
> > 
> > i will take a closer look to determine how/when this happens.
> 
> I thought that David B. sent a (Kconfig ?) patch for this...

He did.  In fact, one with a weak "nudge users away from this"
and then a stronger "don't effing allow it" update.  That's all
in the MM tree.

- Dave
