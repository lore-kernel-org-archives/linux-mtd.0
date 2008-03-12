Subject: Re: physmap and "request_module: runaway loop modprobe net-pf-1"
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20080311225926.6515e18c.akpm@linux-foundation.org>
References: <97a0a9ac0803112235l157706adoa84b131549a46049@mail.gmail.com>
	<20080311225926.6515e18c.akpm@linux-foundation.org>
Content-Type: text/plain
Date: Wed, 12 Mar 2008 08:36:51 +0100
Message-Id: <1205307411.2592.120.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Gordon Farquharson <gordonfarquharson@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-03-11 at 22:59 -0700, Andrew Morton wrote:
> > This solution would require simply changing the parser configuration
> > options to bool in drivers/mtd/Kconfig. Is there a reason to allow the
> > parsing code to be built as a module?
> 
> That sounds reasonable.

I have no particular objection to that. But shouldn't we call
af_unix_init() earlier if modprobe doesn't run without it? 

> I'd suggest that you make your own decision as to what is the best fix, then
> send a patch.  Please cc me on it and I'll make sure that it gets
> appropriately handled.  This may take a bit of time, as the MTD patch
> backlog is rather large at present.

Yeah, things have been interesting. But I get to spend a whole three
weeks at home, starting next week. So feel free to LART me if I don't
catch up. Thanks, again, for your help in making sure things don't fall
through the cracks.

-- 
dwmw2
