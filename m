Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7gF5-0006w6-Sg
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 10:50:21 +0000
Date: Mon, 8 May 2017 12:49:53 +0200
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-ide@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: Race to power off harming SATA SSDs
Message-ID: <20170508104953.GA17773@amd>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <20170508092846.GA11029@amd>
 <1494236048.6528.32.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494236048.6528.32.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon 2017-05-08 10:34:08, David Woodhouse wrote:
> On Mon, 2017-05-08 at 11:28 +0200, Pavel Machek wrote:
> > 
> > Are you sure you have it right in JFFS2? Do you journal block erases?
> > Apparently, that was pretty much non-issue on older flashes.
> 
> It isn't necessary in JFFS2. It is a *purely* log-structured file
> system (which is why it doesn't scale well past the 1GiB or so that we
> made it handle for OLPC).
> 
> So we don't erase a block until all its contents are obsolete. And if
> we fail to complete the erase... well the contents are either going to
> fail a CRC check, or... still be obsoleted by later entries elsewhere.
> 
> And even if it *looks* like an erase has completed and the block is all
> 0xFF, we erase it again and write a 'clean marker' to it to indicate
> that the erase was completed successfully. Because otherwise it can't
> be trusted.

Aha, nice, so it looks like ubifs is a step back here.

'clean marker' is a good idea... empty pages have plenty of space.

How do you handle the issue during regular write? Always ignore last
successfully written block?

Do you handle "paired pages" problem on MLC?

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
