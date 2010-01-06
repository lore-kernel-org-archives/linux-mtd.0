Date: Wed, 6 Jan 2010 23:05:46 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Sending UTF-8 patches (was: [PATCH 2/2] Remove now-defunct ts7250
	nand driver)
Message-ID: <20100106230546.GD24250@shareable.org>
References: <201001051459.58621.hartleys@visionengravers.com>
	<1262784693.3181.8034.camel@macbook.infradead.org>
	<20100106180705.GC11773@shareable.org>
	<alpine.LFD.2.00.1001061342240.21025@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001061342240.21025@xanadu.home>
Cc: joff@embeddedarm.com, mcrapet@gmail.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	H Hartley Sweeten <hartleys@visionengravers.com>,
	David Woodhouse <dwmw2@infradead.org>,
	ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> On Wed, 6 Jan 2010, Jamie Lokier wrote:
> 
> > I guess it's time for a "send-hook" to use a different setting
> > specially for Linux mailing lists.
> > 
> > Do you instead mean send the patch in UTF-8 embedded in a mail encoded
> > as 8859-1?  That sounds quite difficult, if the patch is inline rather
> > than attached.
> > 
> > An option to git-am to DTRT sounds infinitely better to me.  Shame
> > it's not there; unfortunately it doesn't emit enough information to
> > make it easy with a wrapper script.
> 
> I think your idea of enhancing git-am is really a good one, and I 
> certainly encourage you to submit a patch to git.  The utility actually 
> doing the work is git-mailinfo corresponding to builtin-mailinfo.c in 
> the Git source tree.

As I don't work with Git source and don't have enough time, I won't be
doing this, but I'd be delighted if someone else took the idea to the
Git people.  This thread could be used to explain why :-)

-- Jamie
