Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2wo-0006Fc-Va
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:53:40 +0000
Date: Mon, 30 Nov 2009 10:53:31 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses and
	panics
Message-ID: <20091130105331.1e9e6c08@marrow.netinsight.se>
In-Reply-To: <1259574055.7518.80.camel@localhost>
References: <alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org>
	<1259566071.7518.48.camel@localhost>
	<20091130074603.GA30911@logfs.org>
	<1259571118.7518.56.camel@localhost>
	<20091130093541.GA14254@logfs.org>
	<1259574055.7518.80.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Nov 2009 11:40:55 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> > > +	/*
> > > +	 * Have we ever rotated around the circular buffer? If we never did,
> > > +	 * we have to have zeroes at the end.
> > > +	 */
> > > +	if (log_buf[end]) {
> > > +		s1 = log_buf + end;
> > > +		l1 = log_buf_len - end;
> > > +	} else {
> > > +		s1 = "";
> > > +		l1 = 0;
> > 
> > So now you are assuming that a) the buffer is initially zeroed and b)
> > noone ever writes NUL to it.  Is that correct?
> 
> a) seems to be true because the buffer is either a static array or a
> bootmem alloc, which seems to memzero the buffers it returns, at least
> AFAICS. But I did not test this.

True as far as I can see.

> vs b). well, the printk ring buffer should contain ASCII, so I assumed
> binary zeroes should not be possible there.

Yes, if this would be printed with printk it sounds like a bug to me.

I've tested your patch, and it seems to work fine both 1) before the
buffer is filled, 2) when the buffer has wrapped and 3) when log_end
wraps (although that part was a quick hack).

So

Tested-by: Simon Kagstrom <simon.kagstrom@netinsight.net>

// Simon
