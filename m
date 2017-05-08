Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7eyc-0001s9-0V
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 09:29:12 +0000
Date: Mon, 8 May 2017 11:28:47 +0200
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-ide@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: Race to power off harming SATA SSDs
Message-ID: <20170508092846.GA11029@amd>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1494228094.6528.14.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon 2017-05-08 08:21:34, David Woodhouse wrote:
> On Sun, 2017-05-07 at 22:40 +0200, Pavel Machek wrote:
> > > > NOTE: unclean SSD power-offs are dangerous and may brick the device in
> > > > the worst case, or otherwise harm it (reduce longevity, damage flash
> > > > blocks).  It is also not impossible to get data corruption.
> >
> > > I get that the incrementing counters might not be pretty but I'm a bit
> > > skeptical about this being an actual issue.  Because if that were
> > > true, the device would be bricking itself from any sort of power
> > > losses be that an actual power loss, battery rundown or hard power off
> > > after crash.
> >
> > And that's exactly what users see. If you do enough power fails on a
> > SSD, you usually brick it, some die sooner than others. There was some
> > test results published, some are here
> > http://lkcl.net/reports/ssd_analysis.html, I believe I seen some
> > others too.
> > 
> > It is very hard for a NAND to work reliably in face of power
> > failures. In fact, not even Linux MTD + UBIFS works well in that
> > regards. See
> > http://www.linux-mtd.infradead.org/faq/ubi.html. (Unfortunately, its
> > down now?!). If we can't get it right, do you believe SSD manufactures
> > do?
> > 
> > [Issue is, if you powerdown during erase, you get "weakly erased"
> > page, which will contain expected 0xff's, but you'll get bitflips
> > there quickly. Similar issue exists for writes. It is solveable in
> > software, just hard and slow... and we don't do it.]
> 
> It's not that hard. We certainly do it in JFFS2. I was fairly sure that
> it was also part of the design considerations for UBI — it really ought
> to be right there too. I'm less sure about UBIFS but I would have
> expected it to be OK.

Are you sure you have it right in JFFS2? Do you journal block erases?
Apparently, that was pretty much non-issue on older flashes.

https://web-beta.archive.org/web/20160923094716/http://www.linux-mtd.infradead.org:80/doc/ubifs.html#L_unstable_bits

> SSDs however are often crap; power fail those at your peril. And of
> course there's nothing you can do when they do fail, whereas we accept
> patches for things which are implemented in Linux.

Agreed. If the SSD indiciates unexpected powerdown, it is a problem
and we need to fix it.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
