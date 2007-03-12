Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQifi-0003mq-I8
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 07:26:39 -0400
Date: Mon, 12 Mar 2007 11:58:54 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: Does mtd support two-plane page program for nand flash?
Message-ID: <20070312105853.GA19574@lazybastard.org>
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
	<20070309114246.GA4897@lazybastard.org>
	<91b24a870703112149ucba512ahc8976d0f10a6e625@mail.gmail.com>
	<200703121953.58185.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200703121953.58185.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org, Marteo Tim <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 March 2007 19:53:58 +1300, Charles Manning wrote:
> On Monday 12 March 2007 17:49, Marteo Tim wrote:
> > MLC NAND Flash has already become the mainstream flash for
> > large-capacity on the market. But due to its low writting speed, there
> > will be introduced more parallel writting features such as multi-bank,
> > interleave, etc. So I think it is very necessary to modify MTD
> > structure to support multi-plane & interleave feature for speed
> > issure.

Flash will evolve much like hard disks and RAM does.  Size and bandwidth
will scale up, while latency remains roughly unchanged.  And just like
hard disks and RAM, much effort will be spent, trying to reduce the
effect of latency.

In case you don't remember: increasing bandwidth is trivial.  Reducing
latency is the real challange.

> > It is a good method to shield the details of flash type by composing
> > two or more page as a large page. 
> This approach works, but also forces you to have more bad blocks than you'd 
> have otherwise. MLC will tend to have more bad blocks than SLC.

And it will increase latency instead of reducing it.  Instead of sending
multiple independent commands to multiple planes, a single command is
sent to all planes.  Not only is the slowest of all planes dominating
the latency now, but the remaining independent commands still need to
run.

It is possible to reduce the number of commands somewhat by writing
larger amount of data in one go.  But that has disadvantages of its own
is not always possible.

> > Although it will be more slower for 
> > small segment data read/write. But for large-capacity flash,
> > continuate writting speed maybe is more concerned.

Again, increasing bandwidth is trivial, as you just showed.  Latency is
the real killer.

> I think anyone really wanting speed probably writes their own drivers anyway 
> (well that's what people woho are most interested in speed tell me 
> anyway :-)).

Absolutely.  Going down the easy route coupling all planes may be a
simple first step to get bandwidth up.  But supporting independent
operations is the interesting route to follow.

Jörn

-- 
"[One] doesn't need to know [...] how to cause a headache in order
to take an aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
