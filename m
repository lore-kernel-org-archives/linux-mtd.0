Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NrkX-0003RP-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 09:41:21 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C8D5@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Wolfgang Denk <wd@denx.de>
Cc: "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: Intel sez: Synchronous Flash and XIP is the future -- thought
	s?
Date: Mon, 16 Dec 2002 02:11:50 -0800
MIME-Version: 1.0
Content-Type: text/plain
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

Actually, Intel's L18/L30 series of "wireless flash" has that feature,
Read-while-erase-or-write as long as the reads are not to the 8MBit
partition being dealt with in an erase or write.

But I agree with the points made here. :-)  I'm sure the above costs even
more... ;-)

-Paul


-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Monday, December 16, 2002 1:39 AM
To: Wolfgang Denk
Cc: Paul Nash; Linux-MTD (E-mail)
Subject: Re: Intel sez: Synchronous Flash and XIP is the future --
thoughts? 



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
