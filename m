Received: from [80.68.89.115] (helo=mail2.shareable.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NS7oi-0006hw-Eo
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 11:43:20 +0000
Date: Tue, 5 Jan 2010 11:42:32 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: New mtd-utils release?
Message-ID: <20100105114232.GA4603@shareable.org>
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
	<874ontso69.fsf@macbook.be.48ers.dk>
	<1262590935.4512.3.camel@localhost>
	<20100104212543.GO17262@pengutronix.de>
	<1262672489.4512.46.camel@localhost>
	<87pr5plzfp.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pr5plzfp.fsf@macbook.be.48ers.dk>
Cc: linux-mtd@lists.infradead.org, Robert Schwebel <r.schwebel@pengutronix.de>,
	dwmw2@infradead.org, Daniel Mack <daniel@caiaq.de>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Korsgaard wrote:
> missing the new release when they browse
> ftp://ftp.infradead.org/pub/mtd-utils/.

Fwiw, I'm one of those people who browsers the FTP directory
occasionally to get whatever appears to be the latest version, and
would not have known to pick up the new release without the new tarball.

That's because my package build scripts, much like other distros
(Ptxdist, OE, uClinux etc.), include a URL to the original source they
are using, and to update the distro, it's natural to look in the same
place for new versions.

If an FTP/HTTP directory _was_ apparently the primary location of some
package, and then ceases to be kept up to date because it's moved or
because git has taken over, at least please put a README or similar on
the old site saying that the primary location has moved elsewhere.

However, in this case it appears that the FTP directory is still being
kept up to date, so there is no need.

Thanks a lot,
-- Jamie
