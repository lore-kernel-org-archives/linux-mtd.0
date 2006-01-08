Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EvPcv-0004WB-KD
	for linux-mtd@lists.infradead.org; Sat, 07 Jan 2006 20:45:49 -0500
Date: Sat, 7 Jan 2006 17:45:23 -0800
From: Andrew Morton <akpm@osdl.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-Id: <20060107174523.460f1849.akpm@osdl.org>
In-Reply-To: <1136680734.30348.34.camel@pmac.infradead.org>
References: <20060107220702.GZ3774@stusta.de>
	<1136678409.30348.26.camel@pmac.infradead.org>
	<20060108002457.GE3774@stusta.de>
	<1136680734.30348.34.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, bunk@stusta.de
Subject: Re: [2.6 patch] no longer mark MTD_OBSOLETE_CHIPS as BROKEN and
 remove broken MTD_OBSOLETE_CHIPS drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote:
>
> > > 2. What was the reason for marking them obsolete?
>  > 
>  > The changelog says:
>  >  - David Woodhouse: large MTD and JFFS[2] update
> 
>  I didn't ask who; I knew that. I asked you _why_. Admittedly, I happen
>  to know that too - but I want to know if _you_ know it.
> 
>  Since you've taken it upon yourself to decide the timescale of the
>  removal, surely it's reasonable to expect that you do actually know what
>  you're removing and why it's obsolescent?
>

Hey, Adrian isn't an MTD developer - give him a break.

What he's doing here is to poke other maintainers into getting the tree
cleaned up.  It's a useful thing to do.

If you, an MTD maintainer, can tell him what we _should_ be doing, I'm sure
Adrian would help.
