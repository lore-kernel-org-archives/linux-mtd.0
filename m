Received: from webmail.solarflare.com ([12.187.104.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubv6E-0000AM-CF
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 15:55:43 +0000
Message-ID: <1368460512.3305.13.camel@bwh-desktop.uk.solarflarecom.com>
Subject: Re: MTD and EEPROM
From: Ben Hutchings <bhutchings@solarflare.com>
To: <dedekind1@gmail.com>
Date: Mon, 13 May 2013 16:55:12 +0100
In-Reply-To: <1368427043.3208.21.camel@sauron.fi.intel.com>
References: <1366037284.2701.3.camel@bwh-desktop.uk.solarflarecom.com>
 <1368427043.3208.21.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-13 at 09:37 +0300, Artem Bityutskiy wrote:
> On Mon, 2013-04-15 at 15:48 +0100, Ben Hutchings wrote:
> > There is currently no MTD type defined for EEPROM - only RAM, ROM and
> > various types of flash.
> 
> I do not really know why, may be no one needed it?
> 
> > Is there any particular reason for this?  Is it simply that EEPROMs tend
> > to be rather small and not worth putting filesystems on?
> 
> One may want to have access to raw EEPROM without having any
> file-system. So bare /dev/mtdX could be useful.

Indeed, and the EEPROM on SFC4000 boards is already exposed as MTD by
the sfc driver.  It's labelled as type MTD_RAM.

The reason I asked was that I had became aware of this change:

commit dd02b67d5e9e7896891fa27eb5db65f55a290998
Author: Anatolij Gustschin <agust@denx.de>
Date:   Tue Jun 15 09:30:15 2010 +0200

    mtd: mtdchar: fix mmap for MTD RAM/ROM char devices
    
mmap() of an EEPROM would then do something very nasty, as the code in
mtdchar assumes that MTD_RAM indicates a device created by the mtdram
driver and uses its 'private' field accordingly.  I thought that it must
therefore be a bug for the sfc driver to use MTD_RAM.  (But I didn't
want to say too much immediately as this could be a security issue.)

I later realised that this code had more recently been disabled, so this
was not a bug in sfc:

commit f5cf8f07423b2677cebebcebc863af77223a4972
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Tue Oct 9 15:08:10 2012 +0100

    mtd: Disable mtdchar mmap on MMU systems

I requested this be applied to the earlier stable branches, which was
accepted, so this should all be cleared up now.

Ben.

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
