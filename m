Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gX0V-0005sM-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 20:46:12 +0100
Date: Mon, 10 Sep 2001 20:52:06 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Chris Lesiak <clesiak@licor.com>
cc: <linux-mtd@lists.infradead.org>,
    "Siders, Keith" <keith_siders@toshibatv.com>
Subject: Re: Partition question...
In-Reply-To: <86256AC3.006369F1.00@hooper2.licor.com>
Message-ID: <Pine.LNX.4.33.0109102046090.30849-100000@imladris.demon.co.uk>
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

On Mon, 10 Sep 2001, Chris Lesiak wrote:

> I also have two banks mapped contiguously into virtual memory that I would
> like to be seen as one.

Should be fine, as long as the two chips are identical. At the moment, 
they need to be mapped with no space between them. However, aliases are 
OK. So, for example, if you have

 0xbe000000-0xbe7fffff Chip 1
 0xbe800000-0xbeffffff Chip 1 again
 0xbf000000-0xbf7fffff Chip 2
 0xbf800000-0xbfffffff Chip 2 again. 

That'll be fine. It'll detect the aliases in there. It will quit scanning 
the region when it finds something that's not a flash chip, though, so if 
those aliases _weren't_ there it'd break (and you could trivially fix it 
the your 'map' driver by munging the addresses).

> The problem is that RedBoot (and ECOS) seems to only support one flash
> logical device.  I wrote an ECOS flash driver that treated both banks
> as a single large logical device.  RedBoot stores its partition table
> in the last erase block of the device.  So in my case, a single
> partition table is store in the last erase block of the second bank
> but partitions the space of both banks.
> 
> When I get to the linux, mtd seems to expect a partition table for each bank.
> 
> What is the best way to reconcile the problem?

Change your map driver to encompass the whole region, then it should 
appear as a single MTD device and it'll look for a single partition table.

> I have two 32-bit Flash devices (or so I'm told). Since this is a MIPS
> application the reset vector is 0xBFC00000. The Flash devices are
> 0xBE000000-BEFFFFFF and 0xBF000000-BFFFFFFF, so I have 4Megs at the
> top of the second device, with the first device and lower 12Megs of
> the second giving me 28Megs of linear Flash

You should be able probe the two chips as a single device with no 
problems, as I said above. But then you want two non-contiguous regions to 
appear as a single partition. 

That's not handled by the existing partition code - but the partition code 
is just a simple set of wrappers that add an offset and pass control 
through to the methods of the underlying MTD device. It's simple enough to 
hack up your own wrapper which does what you want.

-- 
dwmw2
