Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7hqJ-0002hW-Dv
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 12:32:49 +0000
Date: Mon, 8 May 2017 14:32:24 +0200
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-ide@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: Race to power off harming SATA SSDs
Message-ID: <20170508123224.GA9311@amd>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <20170508092846.GA11029@amd>
 <1494236048.6528.32.camel@infradead.org>
 <20170508104953.GA17773@amd>
 <1494241760.5407.6.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494241760.5407.6.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> > 'clean marker' is a good idea... empty pages have plenty of space.
> 
> Well... you lose that space permanently. Although I suppose you could
> do things differently and erase a block immediately prior to using it.
> But in that case why ever write the cleanmarker? Just maintain a set of
> blocks that you *will* erase and re-use.

Yes, but erase is slow so that would hurt performance...?

> > How do you handle the issue during regular write? Always ignore last
> > successfully written block?
> 
> Log nodes have a CRC. If you get interrupted during a write, that CRC
> should fail.

Umm. That is not what "unstable bits" issue is about, right?

If you are interrupted during write, you can get into state where
readback will be correct on next boot (CRC, ECC ok), but then the bits
will go back few hours after that. You can't rely on checksums to
detect that.. because the bits will have the right values -- for a while.

> > Do you handle "paired pages" problem on MLC?
> 
> No. It would theoretically be possible, by not considering a write to
> the first page "committed" until the second page of the pair is also
> written. Essentially, it's not far off expanding the existing 'wbuf'
> which we use to gather writes into full pages for NAND, to cover the
> *whole* of the set of pages which are affected by MLC.
> 
> But we mostly consider JFFS2 to be obsolete these days, in favour of
> UBI/UBIFS or other approaches.

Yes, I guess MLC NAND chips are mostly too big for jjfs2.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
