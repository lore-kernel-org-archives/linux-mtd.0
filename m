Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUpGg-000605-KZ
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 11:36:40 -0500
Date: Thu, 18 Nov 2004 11:34:56 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1100793112.8191.7315.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.61.0411181132440.12260@xanadu.home>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 18 Nov 2004, David Woodhouse wrote:

> On Thu, 2004-11-18 at 16:41 +0100, Adrian Bunk wrote:
> > Let's put the dependencies from the #error into the Kconfig file:
> 
> Looks sane to me. Nico?

And why is the current arrangement actually a problem?


Nicolas
