Received: from mercury.sun.com ([192.9.25.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MzdQ-0002Z4-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 23:17:36 +0100
Message-ID: <3B560DDC.55ECB635@sun.com>
Date: Wed, 18 Jul 2001 15:29:48 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002 and writes
References: <3B560681.4D216FF3@sun.com> <26325.995493875@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> thockin@sun.com said:
> >  The flash can be erased by 64k blocks.  Since it is flash, you can
> > only reprogram '1' bits to '0' bits, and never vice versa.  What I
> > don't find is any hooks in cfi_cmdset_0002 to read a whole block,
> > erase it, make changes to the in-memory block and write it back to
> > flash.

> It doesn't. Doing that kind of thing is scary and dangerous, and certainly
> doesn't belong in the low-level driver. We have real filesystems and
> translation layers which work on flash instead.

Right, but this is our boot ROM we're dealing with :)  Can you suggest a
better alternative?  The device is rarely ever loaded, but when it is
loaded we want to read and re-program the whole thing as safely as
possible.

MTD seems to be geared more towards flash devices that get lots of use. 
How should I go about plugging this into MTD?
 
> However, the primitive read/erase/modify/pray_we_don't_lose_power/writeback
> behaviour you described is available in the 'mtdblock' driver, and it's sane
> enough to use it if you only write to it during setup, then run it normally
> in read-only mode.

We'll be loading the driver for our flash after potentially months of
uptime.  The new image will be flashed in, and the driver will be unloaded
until the next flash update.


-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
