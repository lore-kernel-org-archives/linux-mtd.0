Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NWFoy-0000MF-VP
	for linux-mtd@lists.infradead.org; Sat, 16 Jan 2010 21:04:41 +0000
Received: by fxm22 with SMTP id 22so1455298fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Jan 2010 13:04:33 -0800 (PST)
Subject: Re: ubi2- a proposed design for reducing mount time of ubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shweta Shetty <shyamashweta@gmail.com>
In-Reply-To: <c58fcbf21001080301h4847f425u2fdecd9085fafbe@mail.gmail.com>
References: <c58fcbf21001080301h4847f425u2fdecd9085fafbe@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Jan 2010 23:04:30 +0200
Message-Id: <1263675871.8276.85.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2010-01-08 at 16:31 +0530, Shweta Shetty wrote:
> We are 4 computer engineering students who are working on ubi2 as our
> final year computer project.

Nice. Is this going to be open?

> We are focusing on reducing the mount time by writing the header data
> in a contiguous format on flash itself.

Did you read Adrian Hunter's suggestions WRT this stuff?

http://lists.infradead.org/pipermail/linux-mtd/2009-February/024437.html

Take a look at the discussion, he briefly describes a sensible way to
go.

But if you read this FAQ:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_attach_faster

you should have probably seen the discussion.

I've read the below and found that description for me not enough to
understand the design, sorry. I did not catch, for example:

1. Why you use hash?
2. Why only 1 chain block is enough to guarantee that the anchor blocks
   do not wear out too early.
3. What does "header to bucket" mean, and what is stored in the header
   block (HB) (see below)
4. What are you going to do with hash collisions
5. How you will update your MEBs and guarantee that power cuts do not
   harm
6. Are you going to have any journals? Or you will re-write whole MEB
   when you need to update something?

May be algorithms description would help. E.g.:
1. how you find PEB by LEB
2. an LEB is written to, what happens to all these MEB/HB, buckets.

Some in-line comments are below as well.

> We present the following design for your consideration and would be
> grateful for any constructive comments.
> 
> Overview:
> 
> MEB – A PEB that contains only header data.

What does MEB stands for?

> 1)For each individual PEB, the following header data will be stored
> Pnum (Physical block number)
> Lnum (Logical block number)
> Ec(Erase count)
> Sequence number(For versioning)
How this will be used? Is this needed?

> Vid – Volume id to which the leb belongs

> Scrub info
Do you really need to store this on flash?

> (This is basically the information stored in the rb trees in Ram)
> 
> 2) This data will be stored consecutively within each MEB. This
> information requires 34 bytes . Thus 1 MEB can contain metadata for
> (Size of PEB/34) number of PEBs. We can thus compute the total no of
> MEBs required from the total number of physical blocks in flash.
> 
> 3) The different MEBs will be maintained as a singly linked closed
> hash bucket. Reason for this is given later.

Still did not catch the reason, sorry.

> 4)1 PEB will act as a header to this bucket.

What does "header to bucket" mean?

> 5)2 PEBs (say PEB 0 and PEB 1) are reserved as anchor blocks.
> 
> 6) 1 PEB is present as a chain block. Anchor blocks will contain a
> pointer to chain block which will contain a pointer to the header
> block.

Is 1 chain block always enough?

> 7) The anchor blocks CANNOT be wear-levelled. The chain block, header
> block and all MEBs may be wear-levelled by the existing UBI
> wear-levelling subsystem. The chain block and header block are present
> to guarantee that by the time the anchor blocks go bad, the entire
> flash will have gone bad.

Why 1 chain block and 1 header block are enough?

> 8)The anchor blocks, chain block and header block will be handled by
> dividing them into sectors. This is the same as the anchor block
> concept given in the JFFS3 design document by Artem Bityutskiy. It is
> mentioned briefly below:
> 
> 9) The anchor blocks, chain block and header block will be divided
> into sectors of size min i/o units. Initially the 1st sector will
> contain valid pointers to next block. If the location of the next
> block changes, then the next sector will be written to, without
> erasing the entire block. The valid sector can be determined by
> reading the block into a buffer and finding the first sector before
> 0xFF data starts. The entire block needs to be erased only if first
> sector needs to be re-written.
> 
> 10)The MEB hash bucket is maintained as follows:

I thought MEB stores the "header data", now you say int stores hash
buckets. Confused. What the header block stores?
	
> 1)We will be assigning a logical volume for all of the above blocks.
> 2)We will be mapping required no of blocks i.e required no. of MEBs +
> 4 to this volume.
> 3)Each PEB’s header data will then be mapped to its corresponding MEB
> by hash function. The hash function will give the logical number of
> the MEB. The data will then be written to the corresponding physical
> MEB.
> 4) During use of flash, whenever header data is updated, we can
> directly obtain the corresponding MEB using the hash function and
> update it too.
> 
> 11)Construction of these blocks on flash will be done only on first
> use of flash by ubi2. At all other mounts only the MEBs will be read
> for constructing the rb trees.
> 
> We would be grateful for any suggestions.

Sorry, but I'd need a more detailed description to catch the ides :-(

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
