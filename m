Received: from modemcable166.48-200-24.mtl.mc.videotron.ca ([24.200.48.166] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NySe-0004GZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 16:51:20 +0000
Date: Mon, 16 Dec 2002 12:21:50 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Wolfgang Denk <wd@denx.de>, Paul Nash <paulnash@wildseed.com>,
   "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
In-Reply-To: <18190.1040039149@passion.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.44.0212161215550.25780-100000@xanadu.home>
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
> wd@denx.de said:
> > Running the kernel XIP is not so insane. It can help to  reduce  boot
> > time.  We  still  more  than  3  seconds from power-on to application
> > start, which is not so  bad,  but  still  too  much  in  some  cases;
> > avoiding  the  memcpy()  of  some  2 MB of data is kind of attractive
> > then...
> 
> That's true, although even if you have the kernel on a separate flash chip
> to which you don't ever write, it does cost you later because you then run
> from flash which is slower than RAM. I wonder if we could copy the kernel
> from flash to RAM at runtime and fix up the page tables as we go, to get the
> best of both worlds?

On ARM this has no value since the kernel takes up at most 1 or 2 page table 
entries (1MB section descriptors that is).

Fortunately on ARM the kernel seems to be sane with .text and .rodata 
actually being read-only.

/me who incidentally just finished hacking a XIP kernel and filesystem patch
on ARM for a customer named Intel...


Nicolas
