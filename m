Received: from modemcable166.48-200-24.mtl.mc.videotron.ca ([24.200.48.166] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Nz9a-0004NX-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 17:35:43 +0000
Date: Mon, 16 Dec 2002 13:06:14 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Wolfgang Denk <wd@denx.de>, Paul Nash <paulnash@wildseed.com>,
   "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
In-Reply-To: <3806.1040060329@passion.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.44.0212161300420.25780-100000@xanadu.home>
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

On Mon, 16 Dec 2002, David Woodhouse wrote:

> 
> nico@cam.org said:
> >  On ARM this has no value since the kernel takes up at most 1 or 2
> > page table  entries (1MB section descriptors that is).
> 
> But you could still start up quickly from flash without having to memcpy 
> the entire kernel into RAM first, then once you're running copy the kernel 
> text into RAM and alter the page tables so you're running from the RAM copy 
> instead of the flash.
> 
> This gives you the fast startup of XIP without the runtime pain of XIP. But 
> it's probably overkill.

Well at that point I prefer the penalty of about half a second with storing
a compressed kernel in flash and let it decompress to RAM directly.  Oh and
btw we've made the ARM kernel decompressor XIP from flash long time ago.


Nicolas
