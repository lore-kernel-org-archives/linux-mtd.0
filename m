From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1092751232.9001.90.camel@icampbell-debian>
References: <1092731553.9001.18.camel@icampbell-debian>
	<1092734138.3777.50.camel@imladris.demon.co.uk>
	<1092751232.9001.90.camel@icampbell-debian>
Content-Type: text/plain
Message-Id: <1092751654.14552.252.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 17 Aug 2004 15:07:34 +0100
Content-Transfer-Encoding: 7bit
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: MTD patches
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-17 at 15:00 +0100, Ian Campbell wrote:
> What is the procedure WRT updating upstream when committing to CVS?
> Should I commit and then send a patch via Linus or do you like to bundle
> up changes and send them all together?

It depends -- in general I prefer changes to go to Linus _via_ CVS, so
that the $Id$ change gets to Linus too, and then it's easier for me to
later work out what changes have been made in Linus' tree by comparing
against the version in CVS with matching $Id$.

In this case, however, there have been other changes to that file since
I last merged with Linus, which probably want a little more testing
before they're sent upstream. So if you're desperate for it to go
upstream immediately, just send it without the ident change (and _also_
commit to CVS).

-- 
dwmw2
