Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9icd-0000hC-Ic
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 16:06:11 +0000
Date: Mon, 8 Dec 2008 09:06:20 -0700
From: Tom Rini <trini@embeddedalley.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: ubi-utils updates for gcc-4.3.x
Message-ID: <20081208160620.GK15204@smtp.west.cox.net>
References: <20081208080138.GJ15204@smtp.west.cox.net>
	<1228734052.13686.103.camel@sauron>
	<1228741782.13686.124.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1228741782.13686.124.camel@sauron>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 08, 2008 at 03:09:42PM +0200, Artem Bityutskiy wrote:
> On Mon, 2008-12-08 at 13:00 +0200, Artem Bityutskiy wrote:
> > >From man scanf:
> > 
> > RETURN VALUE
> > These  functions  return  the  number  of input items successfully
> > matched and assigned, which can be fewer than provided for, or even zero
> > in the event of an early matching failure.
> > 
> > The value EOF is returned if the end of input is reached before either
> > the first successful conversion or a matching failure occurs.  EOF is
> > also returned  if a read error occurs, in which case the error indicator
> > for the stream (see ferror(3)) is set, and errno is set indicate the
> > error.
> > 
> > On this basis, I would say you should test for EOF, not for 0.
> > 
> > > +		if (!scanf("%3s", buf))
> > > +			return 0;
> > 
> > Similarly.
> > 
> 
> If you are fine with this, I may amend your patch and push it, because
> otherwise it looks OK for me.

Sounds good to me, thanks.

-- 
Tom Rini
