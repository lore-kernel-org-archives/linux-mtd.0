From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.61.0411211932000.3732@xanadu.home>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
	<20041118213232.GG4943@stusta.de>
	<Pine.LNX.4.61.0411181727010.12260@xanadu.home>
	<20041118232527.GI4943@stusta.de>
	<Pine.LNX.4.61.0411182041130.12260@xanadu.home>
	<20041119133500.GF22981@stusta.de>
	<Pine.LNX.4.61.0411191130190.3732@xanadu.home>
	<20041121195617.GB13254@stusta.de>
	<Pine.LNX.4.61.0411211932000.3732@xanadu.home>
Content-Type: text/plain
Date: Mon, 22 Nov 2004 07:38:52 +0000
Message-Id: <1101109132.9988.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-11-21 at 19:38 -0500, Nicolas Pitre wrote:
> But I continue to disagree with your proposed patch.
> And I'll bet that you will continue to disagree with mine.
> 
> Can we let the MTD maintainer arbitrate on this?

Personally I prefer the #error. People with platforms which _don't_ yet
provide the underlying primitives which the XIP code needs will see the
option, turn it on and work out what they need to do. Otherwise, they'll
continue to be unaware that it even exists. 

I consider that to be more important than the case of someone who turns
it on when they don't actually want it.

-- 
dwmw2
