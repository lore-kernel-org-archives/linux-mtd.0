Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NrEB-0003Ml-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 09:07:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021216092801.80539C6139@atlas.denx.de> 
References: <20021216092801.80539C6139@atlas.denx.de> 
To: Wolfgang Denk <wd@denx.de>
Cc: Paul Nash <paulnash@wildseed.com>,
    "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Dec 2002 09:38:34 +0000
Message-ID: <2466.1040031514@passion.cambridge.redhat.com>
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

wd@denx.de said:
> Also you might find problems running recent (and future)  kernels  in
> XIP  mode  -  the kernel text segment is often not exactly read-only.
> Especially when you use one f the existing real-time extensions  (but
> not only then). It seems the amount of tweaking that is necessary for
> XIP  is  growing  with  each new kernel release - to a level where it
> becomes impractical. 

Also true. Of course we have to distinguish between XIP of file system 
pages and of the kernel -- I was ignoring the latter because it's even less 
sane than the former. If you ever want to write to the chip, you have to 
disable all interrupts and wait while the chip is busy. For up to 20 
seconds, in the case of a slow erase.

Of course, you could poll the interrupt controller while polling the flash
for completion, and suspend the flash operation to service pending
interrupts if they happen -- but that's really not the kind of thing that
should be encouraged. Until people start making flash chips were every part 
of the chip other than the part which is being erased/written is readable 
during an erase or write operation, XIP is just a silly buzzword, for any 
writable application.

--
dwmw2
