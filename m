Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19l1i6-0003u2-QB
	for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2003 08:30:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Chuck Meade <chuckmeade@mindspring.com>
In-Reply-To: <IIEEICKJLNEPBBDJICNGOEHCDMAA.chuckmeade@mindspring.com>
References: <IIEEICKJLNEPBBDJICNGOEHCDMAA.chuckmeade@mindspring.com>
Message-Id: <1060327833.25209.271.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 08 Aug 2003 08:30:34 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-07 at 17:56, Chuck Meade wrote:
> David Woodhouse wrote:
> 
> > We _must_ retain the bad block table which was on the device when it
> > arrived from the factory. 
> 
> OK I see.  Would it be valuable then to have a Linux command-line
> utility which captures the BBT before calling nftl_format, then 
> is used to restore the BBT after calling nftl_format but before
> nftl tries to mount any partitions (via 'insmod nftl' or whatever)?

... or which writes it back as _part_ of the nftl_format process,
perhaps?

Yes, it would be extremely useful to do this.



> Since nftl_format can be called with an offset, I believe the utility
> would not necessarily put the BBT back at the exact device offset
> from which it was read.  For instance, when reading the initial BBT
> we might find the media headers in the first 2 blocks on the device,
> and read/save the BBT from there.  However, if nftl_format is called
> with an offset, we would need to write the saved BBT back to the
> device at the blocks with media headers written beyond that offset
> by nftl_format.
> 
> Does such a utility for the Linux command line sound like it would
> preserve the BBT correctly?
> 
> Thanks,
> Chuck

-- 
dwmw2
