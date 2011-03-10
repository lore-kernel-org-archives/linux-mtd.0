Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxg2W-0005rL-LU
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 13:36:29 +0000
Received: by ewy3 with SMTP id 3so566578ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 05:36:27 -0800 (PST)
Subject: Re: Perf issue with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bhaveshparekh1@gmail.com>
In-Reply-To: <AANLkTik_-ZAau27j+7r5EbGyNiPPCH_9a0o9M_H9fsXb@mail.gmail.com>
References: <AANLkTin4FHcpvhsQJkU7pOUPk3-gV+N+1cb0W6_3KC8P@mail.gmail.com>
	<1299587464.2754.27.camel@localhost>
	<AANLkTik_-ZAau27j+7r5EbGyNiPPCH_9a0o9M_H9fsXb@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 15:34:55 +0200
Message-ID: <1299764095.6676.22.camel@localhost>
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

On Thu, 2011-03-10 at 15:39 +0530, Bhavesh Parekh wrote:
> Basically I was testing with Random file/binary file,here compression was enabled.

But then it is not really fair to compare to YAFFS2 which does not spend
time for decompressing.

> >> request from the upper layer comes in 16K. It work fine with the
> >> YAFFS2 and we see a perf gain of 3-4MB/s but UBIFS request pattern
> >> remains same 4K +48 byte. Is there anything we can do here so that
> >> UBIFS respect mtd->writesize
> >
> > Yeah, you can try to do this.
> I tried to increase the UBI_BLOCK_SIZE to 16K, but later found that it can't be greater than system PAGE_SIZE which means it can't be greater than 4K.

Yes, you cannot make it larger.

> For getting any Perf improvement from the page-cache mode, I needed bulk request from the upper layer(>=16K)

Well, bulk-read is doing this, if the file data is not fragmented. But
on fragmented file-system it is difficult to do bulk-reads. You can read
about UBIFS bulk-read here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_readahead

Feel free to improve the doc.

> In case of YAFFS2, if I change mtd->writesize to 16K yaffs2 allocation
> unit changed to 16K from default 2K. When I tried the similar change
> in ubifs it didn't work.

Yes, this is right.

> One approach which I am thinking is to have a pool of buffer of 16K,
> and when-ever there is a read-request come read 16K from the flash
> assuming that next read request will be for next page.
> 
> This approach will work fine initially as write for the first time
> will be contiguous and the request from the UBI will be for
> sub-sequent pages. But after a while there will be fragmentation or
> wear-leveling done by the UBI, so request won't be for the subsequent
> pages.
> 
> Is there a way to force writing to contiguous 16K to the flash so that
> advantage from the page-cache mode can be taken

Yes, you can do this with the very latest UBIFS. We have introduced the
notion of max_write_size, and UBIFS tries to write in max_write_size
chunks, if possible. Make max_write_size to be 16K and UBIFS will use
this more.

However, since LEB starts at offset 2KiB, then UBIFS will write in 16KiB
only starting from offset 16KiB. The patches were sent to the MTD ML in
this thread:

http://lists.infradead.org/pipermail/linux-mtd/2011-March/034277.html

They are also in my ubifs-2.6.git tree - you can pick them from there -
and I'm going to send them upstream soon.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
