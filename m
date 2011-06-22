Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZPNI-0001HC-UN
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 15:29:53 +0000
Received: by yib17 with SMTP id 17so444635yib.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 08:29:02 -0700 (PDT)
Message-ID: <4E020A36.6070708@gmail.com>
Date: Wed, 22 Jun 2011 11:28:54 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Preventing JFFS2 partial page writes?
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>
In-Reply-To: <1308722655.18119.40.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/22/2011 02:04 AM, Artem Bityutskiy wrote:
> On Tue, 2011-06-14 at 12:19 -0400, Peter Barada wrote:
>> I'm using a Micron 512MB NAND which has an internal 4-bit ECC engine,
>> and am finding lots of ECC errors while using JFFS2.  The same NAND
>> works find using YAFFS so I know the underlying MTD driver works properly.
>>
>> The big question I have is whether JFFS2 does partial page writes and if
>> so how to disable them.
> JFFS2 does not use sub-pages so it should never do partial writes. I
> think the ECC errors you see are because of JFFS2 using OOB area to
> store clean markers.
Sorry for using the wrong terminology - I assumed a "partial write" is 
where data/oob information is written into a page multiple times.

Yes, the issue I'm seeing is that JFFS2 writes into the OOB area into
bytes that perturb the ECC, then writes data (w/o OOB) and the next read 
fails.  Googling around I see GETECCLAYOUT is now obsolete, so it 
doesn't look like extending the structure returned from it is not the 
way to go.

I'm thinking a new ioctl (and data in the kernel accessible to the NAND 
FS layers) is needed (GETOOBLAYOUT?) that returns the oobfree array, as 
well as other arrays in a structure:
1) which OOB bytes perturb the data ECCs,
2) which OOB bytes are ECC'd (within the OOB area and separate from the 
data ECCs).

I think given the new large-sized NAND that these lists will have to be 
dynamic (and another GETOOBLAYOUTSIZE ioctl call to return its size) to 
prevent moving massive structure to userspace).

Then userspace can figure out:

1) what bytes can be written in the OOB.
2) what bytes in the OOB can only be written as part of a data write (or 
sub-page write)
3) if no OOB bytes are internally ECC'd(outside of those covered by a 
data area ECC) then the code needs to either use an ECC as part of the 
data written to the OOB, or use a bitflip-friendly way to compare the 
returned data - unless the OOB data it wants to write is part of a data 
area write.

In my initial attempt to solve this I ran into the issue (in 
linux-2.6.32) that nand_transfer_oob/nand_fill_oob make the assumption 
that chip->ecc.layout->oobfree is *always* zero terminated (I needed 
eight entries to describe my OOB area).  I'll put together a patch 
against the latest kernel and send it along.

Thoughts?

-- 
Peter Barada
peter.barada@gmail.com
