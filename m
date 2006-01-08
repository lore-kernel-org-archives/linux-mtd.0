Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EvOMo-0003Rj-K4
	for linux-mtd@lists.infradead.org; Sat, 07 Jan 2006 19:25:19 -0500
Date: Sun, 8 Jan 2006 01:24:57 +0100
From: Adrian Bunk <bunk@stusta.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060108002457.GE3774@stusta.de>
References: <20060107220702.GZ3774@stusta.de>
	<1136678409.30348.26.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1136678409.30348.26.camel@pmac.infradead.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
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

On Sun, Jan 08, 2006 at 12:00:09AM +0000, David Woodhouse wrote:
> On Sat, 2006-01-07 at 23:07 +0100, Adrian Bunk wrote:
> > This patch brings the MTD_SHARP driver back into life and removes the 
> > non-compiling MTD_AMDSTD and MTD_JEDEC with everything depending on 
> > them.
> 
> Please provide further background on your reasoning. I'll enumerate my
> questions to make it easy for you to answer each one fully.
> 
> 1. Precisely when were these chip drivers marked obsolete?

Since kernel 2.4.11-pre4, released Thu, 4 Oct 2001 20:47:23 -0700.

> 2. What was the reason for marking them obsolete?

The changelog says:
 - David Woodhouse: large MTD and JFFS[2] update

> 3. What are the factors which led you to conclude that _now_ is the time
> to actually remove them?

http://lkml.org/lkml/2005/12/12/43

> 4. What are the factors which led you to _remove_ the map drivers which
> currently use the obsolete chip drivers, rather than taking the obvious
> alternative solution for those map drivers?

It seems that for one and a half years noone considered it a problem 
that they were no longer available...

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
