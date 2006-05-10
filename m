Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdy6P-0000LP-8h
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 19:28:25 -0400
Date: Thu, 11 May 2006 00:28:09 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Steve Finney <saf76@earthlink.net>
Message-ID: <20060510232808.GA1778@mail.shareable.org>
References: <16539078.1147288371389.JavaMail.root@elwamui-little.atl.sa.earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16539078.1147288371389.JavaMail.root@elwamui-little.atl.sa.earthlink.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND read errors, R/O FS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steve Finney wrote:
> >On Wed, 10 May 2006 15:20:44 +0400, Vitaly Wool wrote:
> >> Josh Boyer wrote:
> >>
> >> >Not quite the case.  You need bad block skipping, yes.  But NAND can
> >> >get bit flips in good blocks still.  How do you deal with that?  You
> >> >can't leave the block in that state forever because it will continue
> >> >to get bit flips and then your data will be unusable.
> >> Yep, I know about the issue. The recommended way to go here AFAIK is to 
> >> mark the block as bad and copy its contents to a free one.
> 
> FWIW, on the Samsung K9F* NAND chip, the explicitly recommended
> procedure for single bit read errors is to do single bit Error
> Correction (assuming ECC is implemented) and to NOT remap (you _are_
> supposed to remap and copy one write errors). Apparently the chances
> of a 2nd bit error within a single 512 byte page (the ECC unit) are
> negligible.

Surely after observing one bit error, that doesn't reduce the
probability of observing another one later?  I'd expect the bits to be
independent.

In other words, is it not the case that, _after_ observing a single
bit error, the probability of observing another bit error is exactly
the same as the probability of observing the first one was, before it
was observed?

-- Jamie
