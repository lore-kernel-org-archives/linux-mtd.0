Received: from modemcable166.48-200-24.mtl.mc.videotron.ca ([24.200.48.166] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NzB5-0004Nq-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 17:37:15 +0000
Date: Mon, 16 Dec 2002 13:07:47 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Wolfgang Denk <wd@denx.de>
cc: David Woodhouse <dwmw2@infradead.org>, Paul Nash <paulnash@wildseed.com>,
   "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
In-Reply-To: <20021216174357.5DF01C6139@atlas.denx.de>
Message-ID: <Pine.LNX.4.44.0212161307000.25780-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 16 Dec 2002, Wolfgang Denk wrote:

> In message <Pine.LNX.4.44.0212161215550.25780-100000@xanadu.home> you wrote:
> > 
> > Fortunately on ARM the kernel seems to be sane with .text and .rodata 
> > actually being read-only.
> 
> Well, on PowerPC the .text and .rodata is read-only, too (normally) -
> but only after the patching took place :-(

... which is the same as saying it's not read-only with regard to XIP.


Nicolas
