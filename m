Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192scU-0002cO-AC
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 13:54:34 +0100
Date: Tue, 8 Apr 2003 14:54:31 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030408125431.GF21794@wohnheim.fh-wedel.de>
References: 
	<20030407171037.GB8178@wohnheim.fh-wedel.de.suse.lists.linux.kernel>
	<p73r88exh3r.fsf@oldwotan.suse.de>
	<20030407194039.GF8178@wohnheim.fh-wedel.de>
	<1049790892.18045.120.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049790892.18045.120.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Andi Kleen <ak@suse.de>
cc: linux-kernel@vger.kernel.org
Subject: Re: [ANNOUNCE] New kernel tree for embedded linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 April 2003 09:34:52 +0100, David Woodhouse wrote:
> On Mon, 2003-04-07 at 20:40, Jörn Engel wrote:
> > Some more partitioning code that only applies to spinning discs of
> > some sort (ide, scsi) or code that emulates spinning discs is always
> > included. No config option.
> 
> We definitely want CONFIG_BLK_DEV. CONFIG_SWAP is a good start.

The child has a different name, currently, but yes. It will also be
interesting to see, what all should be covered by that option.

> > Another one is serial.c. In an ltp test run, plus serial console, some
> > 90% were unused. And the code gave me some shivers. Volunteers?
> 
> The new serial code is somewhat nicer. Still contains unconditional
> support for a lot of bizarre 8250 variations, but I don't think that's
> really taking up much space though.

You don't refer to your effort to support higher bitrates on some
chips, I guess. Do you have a URL or something?

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
