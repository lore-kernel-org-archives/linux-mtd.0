Subject: Re: [PATCH] mtd: support for bit-reversed CFI cmd/query
From: David Woodhouse <dwmw2@infradead.org>
To: "Nikita V. Youshchenko" <yoush@cs.msu.su>
In-Reply-To: <200804222308.39071@blacky.localdomain>
References: <200802272348.13180@blacky.localdomain>
	<1208890591.9212.654.camel@pmac.infradead.org>
	<200804222308.39071@blacky.localdomain>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 20:23:54 +0100
Message-Id: <1208892234.9212.661.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Abraham vd Merwe <abraham@2d3d.co.za>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-04-22 at 23:08 +0400, Nikita V. Youshchenko wrote:
> > On Wed, 2008-02-27 at 23:48 +0300, Nikita V. Youshchenko wrote:
> > >     mtd: support for bit-reversed CFI cmd/query
> > >
> > >     Some embedded boards have flash chips connected with reversed bit
> > > order. Example for 16-bit width:
> > >      chip D0 is bus D15
> > >      chip D1 is bus D14
> > >      ...
> > >      chip D15 is bus D0
> > >     It works perfectly for data access, however probing and issuing
> > > CFI commands for such chips require bit reversing. This patch adds
> > > support for this.
> > >
> > >     Signed-off-by: Nikita Youshchenko <yoush@cs.msu.su>
> >
> > Am I missing something, or did you only reverse the bits on 16-bit and
> > 64-bit access, and not 8-bit or 32-bit?
> 
> Hmm... Looks so :(.
> The board I work with has 16-bit flash, so I could not test others.
> 
> Btw, the vendor of the board confirmed that such a strange flash chip 
> connection is 'an old hardware bug', however they decided to keep it in 
> current and future revisions of the board 'for backward compatibility'.
> 
> Is it a good idea to support such strange cases in the official kernel?
> If yes, I may send an updated patch.

I don't think it's particularly problematic. I _think_ that hacking it
into the endianness support is going to work, and isn't going to screw
up data access (which we really _don't_ want to byteswap/mangle since we
want the CPU to be able to execute from it).

Perhaps we should even go back to supporting the LART this way?

-- 
dwmw2
