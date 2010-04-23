MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Date: Fri, 23 Apr 2010 14:22:01 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] MTD: Fix Orion NAND driver compilation with ARM OABI
In-reply-to: <20100423110037.f8790476.akpm@linux-foundation.org>
Message-id: <alpine.LFD.2.00.1004231421130.7232@xanadu.home>
References: <20100325152505.17612.40158.stgit@pauliusz>
	<alpine.LFD.2.00.1003251225500.694@xanadu.home>
	<4BB33988.9070608@gmail.com> <1272023778.6917.6.camel@localhost>
	<alpine.LFD.2.00.1004230853230.7232@xanadu.home>
	<1272035596.11751.1437.camel@localhost.localdomain>
	<alpine.LFD.2.00.1004231308300.7232@xanadu.home>
	<20100423110037.f8790476.akpm@linux-foundation.org>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, jamie@shareable.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de, simon.kagstrom@netinsight.net,
	dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Apr 2010, Andrew Morton wrote:

> On Fri, 23 Apr 2010 13:50:10 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > > Fine with me, but not up to me. But I guess Andrew could merge it.
> > 
> > The patch is providing a fix to my own code, and I acked it already. The 
> > root of the problem is a defficiency in gcc, and dwmw2 asked that a PR 
> > be filled for that and a reference to it added to the patch.  This has 
> > been done.
> 
> Well, I merged it and can send it upstream.  But Jamie's observations
> give me pause?

What observation?  Let me find that.


Nicolas
