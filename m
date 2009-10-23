Received: from mx2.mail.elte.hu ([157.181.151.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1EU5-0002pK-1l
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 07:22:53 +0000
Date: Fri, 23 Oct 2009 09:22:36 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091023072236.GA19169@elte.hu>
References: <20091016080935.GA3895@elte.hu>
	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
	<20091016101045.GA3263@elte.hu>
	<20091016140918.3981cfa2@marrow.netinsight.se>
	<1255952922.32489.505.camel@localhost>
	<20091019125017.GA9030@elte.hu>
	<alpine.LFD.2.00.0910220832580.9771@eeepc.linux-foundation.org>
	<20091022082500.602f9a7d@marrow.netinsight.se>
	<1256193368.29856.466.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1256193368.29856.466.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2009-10-22 at 08:25 +0200, Simon Kagstrom wrote:
> > On Thu, 22 Oct 2009 08:33:11 +0900 (JST)
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > 
> > > > > I wonder, via which tree this should go in. We are going to have mtdoops
> > > > > depend on this. Should we go one of these ways:
> > > > > 
> > > > >    * this patch goes to one of Ingo's tip trees, so we can pull it and
> > > > >      work on top.
> > > > >    * we have Ingo's / Linus' acks, and this goes via the MTD tree.
> > > > > ?
> > > > 
> > > > Either way is good to me. Linus, do you have any preferences?
> > > 
> > > Either works for me.
> > 
> > I would put it all through Artems MTD tree then so that we keep the new
> > API and the user of it close together then.
> > 
> > Thanks to everyone for the reviewing and suggestions!
> > 
> 
> It's dwmw2's tree actually. I just act as his secretary :-)
> 
> David, could you push this patch to your tree? Ingo's and Linus' acks 
> are there, AFAIU.

Yeah, the latest bits also have my:

Acked-by: Ingo Molnar <mingo@elte.hu>

	Ingo
