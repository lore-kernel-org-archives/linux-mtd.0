Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NViK1-0004bv-2o
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 09:18:29 +0000
Received: by fxm22 with SMTP id 22so411831fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Jan 2010 01:18:23 -0800 (PST)
Subject: Re: RFC: [PATCH V3 0/9 Integration of SmartMedia/xD into mtd subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <507734.29595.qm@web37605.mail.mud.yahoo.com>
References: <507734.29595.qm@web37605.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Jan 2010 11:18:19 +0200
Message-ID: <1263547099.3247.16.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-01-14 at 18:01 -0800, Alex Dubov wrote: 
> > > 
> > > Still bear in mind that FTL can destroy data,
> > especially if your flash
> > > card is worn out.
> 
> I sort of worry about this particular issue.
> 
> When I was doing my FTL, handling of bad blocks was one
> of the major (if not the primary) implementation problems.

This is more or less an disclaimer.
If I compare what windows driver does versus mine, I do much more
checking.

My FTL maybe is a bit erase happy, as it tries to erase blocks it found
errors that likely not result of wear but a cut in the power.


Here is a summary of algorithm that I do for scanning:


1. Test is block is marked as bad.
Here I don't cheat and read whole block, because data_status could be
set for a specific sector.
However this is a bit slow, because it causes oob of all sectors to be
read.

2. Read LBA of each sector. Due to mtd layering this makes me read oob
of each sector again.
If I find a sector with lba that can't be read or a sector that has a
different lba that first, I erase the block. This I might revisit.


3. Update the LBA->physical table. If I see that this LBA is taken, I
check again both candidatures, and this time I also read the sector
contents, which will fail if there are unrecoverable ECC errors.
If one of sectors turns out bad this way I pick the other one, if not I
just erase one of the sectors (this is likely a powerfalll situation
too)


Every time an erase is made, hardware will return errors if failed 
When this happens I mark block as bad.


Best regards,
Maxim Levitsky
