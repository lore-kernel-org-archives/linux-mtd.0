Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm14u-0000vJ-Ov
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 08:02:02 +0000
Message-ID: <4AAA03DF.9040205@gmail.com>
Date: Fri, 11 Sep 2009 11:01:35 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: UBIFS power cut issues
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>	<1252390936.5060.47.camel@localhost>	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
	<1252597344.5060.99.camel@localhost>
	<4AA922AF.8070001@billgatliff.com>
In-Reply-To: <4AA922AF.8070001@billgatliff.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, JiSheng Zhang <jszhang3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/10/2009 07:00 PM, Bill Gatliff wrote:
> Artem Bityutskiy wrote:
>> And the text here, just in case someone would review it.
>
> When you mean "something is lost", the correct spelling is "lose". To
> "loose" means to "disconnect", or "release" something.

Thanks, fixed:

http://git.infradead.org/mtd-www.git/commit/8b407024f4b8377eae6557644c29a31bc20e1350

>> However, UBIFS is sometimes used as a JFFS2 replacement and people may
>> want it to behave the same way as JFFS2 if it is mounted synchronously.
>> This is doable, but needs some non-trivial development, so this was not
>> implemented so far. On the other hand, there was no strong demand. You
>> may implement this as an excercise, or you may try to convince UBIFS
>> authors to do this.
>
> In summary, the differences in results between JFFS2 and UBIFS in the
> case of interrupted, large synchronous writes are related to differences
> in how the two store and/or compute file sizes?

Yes. JFFS2 stores inode size in data nodes. So every time it writes the
data node to the flash, it updates the inode size. When JFFS2 mounts the
flash, it does full scanning, finds the last written data node and thus,
it has correct inode size.

UBIFS does not store file size in data nodes, but stores it in separate
inode nodes, pretty much like any FS does. And UBIFS does not do scanning.
This is where the difficulties come from.

> Based on your documentation, my understanding is that with JFFS2 file
> sizes are stored along with the file data nodes, and are updated as the
> file grows in size--- so an interruption truncates the file at the point
> the interruption occurs.

Right.

> For UBIFS, in contrast, file sizes are stored
> in separate nodes which might not have been written at the point of
> interruption--- so the state if the file when power is restored depends
> highly upon the precise moment that the interruption occurs.

Not exactly. UBIFS never writes data nodes beyond the on-flash inode size.
If it has to write a data node and the data node is beyond the on-flash inode
size (the in-memory inode has up-to-data size, but it is dirty and was not
flushed yet), then UBIFS first writes the inode to the media, and then it
starts writing the data. And if you have an interrupt, you _lose_ data
nodes and you have holes (or old data nodes, if you are overwriting).

If you need information why UBIFS never writes beyond inode size, you may
take a look at file.c, there is a comment explaining this:

/*
  * When writing-back dirty inodes, VFS first writes-back pages belonging to the
  * inode, then the inode itself. For UBIFS this may cause a problem. Consider a
  * situation when a we have an inode with size 0, then a megabyte of data is
  * appended to the inode, then write-back starts and flushes some amount of the
  * dirty pages, the journal becomes full, commit happens and finishes, and then
  * an unclean reboot happens. When the file system is mounted next time, the
  * inode size would still be 0, but there would be many pages which are beyond
  * the inode size, they would be indexed and consume flash space. Because the
  * journal has been committed, the replay would not be able to detect this
  * situation and correct the inode size. This means UBIFS would have to scan
  * whole index and correct all inode sizes, which is long an unacceptable.
  *
  * To prevent situations like this, UBIFS writes pages back only if they are
  * within the last synchronized inode size, i.e. the size which has been
  * written to the flash media last time. Otherwise, UBIFS forces inode
  * write-back, thus making sure the on-flash inode contains current inode size,
  * and then keeps writing pages back.
...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
