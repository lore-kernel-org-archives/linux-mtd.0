Date: Thu, 22 Oct 2009 08:33:11 +0900 (JST)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on oopses
	and panics
In-Reply-To: <20091019125017.GA9030@elte.hu>
Message-ID: <alpine.LFD.2.00.0910220832580.9771@eeepc.linux-foundation.org>
References: <20091015093133.GF10546@elte.hu>
	<20091015161052.0752208e@marrow.netinsight.se>
	<20091015154640.GA11408@elte.hu>
	<20091016094601.4e2c2d3e@marrow.netinsight.se>
	<20091016080935.GA3895@elte.hu>
	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
	<20091016101045.GA3263@elte.hu>
	<20091016140918.3981cfa2@marrow.netinsight.se>
	<1255952922.32489.505.camel@localhost>
	<20091019125017.GA9030@elte.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Mon, 19 Oct 2009, Ingo Molnar wrote:
> > 
> > I wonder, via which tree this should go in. We are going to have mtdoops
> > depend on this. Should we go one of these ways:
> > 
> >    * this patch goes to one of Ingo's tip trees, so we can pull it and
> >      work on top.
> >    * we have Ingo's / Linus' acks, and this goes via the MTD tree.
> > ?
> 
> Either way is good to me. Linus, do you have any preferences?

Either works for me.

		Linus
