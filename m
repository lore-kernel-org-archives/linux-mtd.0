Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kiEp-00008Y-TW
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 11:43:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Chuck Meade <chuckmeade@mindspring.com>
In-Reply-To: <IIEEICKJLNEPBBDJICNGAEENDMAA.chuckmeade@mindspring.com>
References: <IIEEICKJLNEPBBDJICNGAEENDMAA.chuckmeade@mindspring.com>
Message-Id: <1060252989.25209.39.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 11:43:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-08-06 at 05:27, Chuck Meade wrote:
> I have a DiskOnChip device soldered onto a PowerPC target and
> would appreciate if someone could verify if I am using the 
> correct commands to put a filesystem on it.
> 
> Also I am concerned from what I have read in the archives about
> the bad block table.  From what I see in the archives and in
> Karim Yaghmour's book, I needed to save this off.  Unfortunately
> however I cannot run DOS or its utilities on this target board,
> so I don't think that there is any way to do this.

You can read from /dev/mtd0 after first loading the DiskOnChip driver.
It's in there somewhere (see the NFTL and nftl_format code for more
details of precisely where). In fact, you could probably hack nftldump
to dump it, quite easily. 

> I use the following commands:
> 
>   nftl_format /dev/mtd0
>   fdisk /dev/nftla

Not without 'insmod nftl' or 'reboot -f' between them, I hope.

> 1. Have I destroyed any bad block table in the device by
>    doing this command sequence?

Yes.

> 2. If so, is this a bad block table needed by firmware
>    internal to the DOC, or just needed by some DOS utilities
>    that I won't be using anyway?

Neither. It's a bad block table needed by _all_ DiskOnChip drivers,
including the Linux driver. There is no firmware internal to the DOC now
-- there used to be a BIOS driver in there but you've removed it.

The bad block table is there to prevent the drivers from using blocks
which were marked bad during the factory testing. 

> 3. What I would really prefer to use is JFFS2 on this DOC.
>    I have seen messages from David that this may now be 
>    possible.

It's becoming possible. Give me a few weeks.

>    When I use other targets with NOR flash I typically write
>    an MTD partition map file for the target, then I use dd to
>    put my jffs2 image file into the right mtdblock partition.
>    How would I do this with a DOC device?

See a response I sent to the list a week or so ago -- basically we don't
currently do partitioning on the DiskOnChip's _raw_ flash, although
there's a patch around which hacks up hardcoded partitions, and the
INFTL format on the newest DiskOnChip units does seem to have a
partitioning scheme we might be able to abuse.


-- 
dwmw2
