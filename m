Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dylS-0001vu-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2002 20:52:38 +0100
Date: Sun, 11 Aug 2002 21:52:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: adr <mtd@mcmen.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Help with Dreamcast flash devices
Message-ID: <20020811195238.GA1638@wohnheim.fh-wedel.de>
References: <200208111908.06874.mtd@mcmen.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200208111908.06874.mtd@mcmen.demon.co.uk>
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

On Sun, 11 August 2002 19:08:06 +0100, adr wrote:
> I am one of the (too) small team of developers on the Linux on Dreamcast 
> project (http://sourceforge.net/projects/linuxdc). I am currently working on 
> developing a driver for the flash memory devices available for this machine.
> 
> Someone else started work on this months ago, but nothing has been done for 
> ages, so I'm hacking at it now.
> 
> The flash memory on the DC is "smart" - ie it's attached to an 8-bit 
> micro-controller. The device communicates with the rest of the system via a 
> high speed serial ("maple") protocol. The flash is not mapped into the sh4 
> (main cpu) physical memory at all. (http://mc.pp.se/dc/vms/index.html leads 
> to more information for those interested).
> 
> Well, the long and the short of it is that I am somewhat at sea here. Are 
> there any similar mtd devices I can look at?
> 
> Is there an explanation anywhere of how mapping works and how to 'virtual' map 
> something which isn't in the physical map at all?
> 
> Any other ideas (random or now) about how to make this work? Currently the 
> driver fails on mapping.

My best guess would be to create something similar to the slram
driver, but with different guts. Basically, you have to write some
functions for reading and writing to the flash through the controller.
Erasing, locking and so on might work directly, or it might have to be
emulated.
This should be some two weeks of work, if you trust my estimates more
than I do. :)

Just out of curiosity: Is the flash really only 128kiB? If so, will
there be anything much in it, except for the bootloader? And if even
that is true, shouldn't a userspace flasher do the job just as well?

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
