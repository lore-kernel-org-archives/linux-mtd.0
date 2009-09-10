Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MllnJ-0000mT-Oc
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 15:42:49 +0000
Subject: Re: UBIFS power cut issues
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JiSheng Zhang <jszhang3@gmail.com>
In-Reply-To: <2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
	<1252390936.5060.47.camel@localhost>
	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Sep 2009 18:42:24 +0300
Message-Id: <1252597344.5060.99.camel@localhost>
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

On Wed, 2009-09-09 at 17:45 +0800, JiSheng Zhang wrote:
> Hi Artem,
> 
> 2009/9/8 Artem Bityutskiy <dedekind1@gmail.com>:
> > Hi,
> >
> > sorry for late answer, was very busy.
> >
> > On Wed, 2009-09-02 at 17:35 +0800, JiSheng Zhang wrote:
> >> If we cut power when copy file into ubifs, then remount ubifs and try
> >> to read the file, we found that the data at some offset of the file
> >> began different from the data of the original file at the same offset.
> >> Is this a bug of ubifs?
> >
> > This is expected behavior on any asynchronous FS. You may switch to
> > synchronous behavior with '-o sync' mount option. I wrote a lot of
> 
> I have tested with "mount -o sync", the result is the same. It's not
> empty file. For example:
> cp fileA /mnt/ubifs/fileB
> random cut power before "cp" completed.
> then remount
> From head of /mnt/ubifs/fileB to some offset offsetC is the same as
> fileA. But from offsetC to the end is different from fileA at the same
> offset offsetC, it's not empty either.
> Hope I expressed myself clearly.

I believe you have zeroes at the end. These are actually holes. And this
is actually expected. I've added these pieces of documentation for you:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_end_hole
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_semantics

And the text here, just in case someone would review it.

UBIFS in synchronous mode vs JFFS2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When UBIFS is mounted in synchronous mode (-o sync mount options) - all
file system operations become synchronous. This means that all data are
written to flash before the file-system operations return.

For example, if you write 10MiB of data to a file f.dat using the
write() call, and UBIFS is in synchronous mode, then UBIFS guarantees
that all 10MiB of data and the meta-data (file size and date changes)
will reach the flash media before write() returns. And if a power cut
happens after the write() call returns, the file will contain the
written data.

The same is true for situations when f.dat has was opened with O_SYNC or
has the sync flag (see man 2 chattr).

It is well-known that the JFFS2 file-system is synchronous (except a
small write-buffer). However, UBIFS in synchronous mode is not the same
as JFFS2 and provides somewhat less guarantees that JFFS2 does with
respect to sudden power cuts.

In JFFS2 all the meta-data (like inode atime/mtime/ctime, inode size,
UID/GID, etc) are stored in the data node headers. Data nodes carry 4KiB
of (compressed) data. This means that the meta-data information is
duplicated in many places, but this also means that every time JFFS2
writes a data node to the flash media, it updates inode size as well.

In practice this means that JFFS2 will write these 10MiB of data
sequentially, from the beginning to the end. And if you have a power
cut, you will just loose some amount of data at the end of the inode.
For example, if JFFS2 starts writing those 10MiB of data, write 5MiB,
and a power cut happens, you will end up with a 5MiB f.dat file. You
loose only the last 5MiB.

Things are a little bit more complex in case of UBIFS, where data are
stored in data nodes and meta-data are stored in (separate) inode nodes.
The meta-data are not duplicated in each data node, like in JFFS2. Lets
consider an example.

      * User creates an empty file f.dat. The file is synchronous, or
        UBIFS is mounted in synchronous mode. User calls the write()
        function with a 10MiB buffer.
      * The kernel first copies all 10MiB of the data to the page cache.
        Inode size is changed to 10MiB as well and the inode is marked
        as dirty. Nothing has been written to the flash media so far. If
        a power cut happens at this point, the user will end up with an
        empty f.dat file.
      * UBIFS sees that the I/O has to be synchronous, and starts
        synchronizing the inode. First of all, it writes the inode node
        to the flash media. If a power cut happens at this moment, the
        user will end up with a 10MiB file which contains no data
        (hole), and if he read this file, he will get 10MiB of zeroes.
      * UBIFS starts writing the data. If a power cut happens at this
        point, the user will end up with a 10MiB file containing a hole
        at the end.

Note, if the I/O was not synchronous, UBIFS would skip the last step and
would just return. And the actual write-back would then happen in
back-ground. But power cuts during write-back could anyway lead to files
with holes at the end.

Thus, synchronous I/O in UBIFS provides less guarantees than JFFS2 I/O -
UBIFS has an effect of holes at the end of files. In ideal world
applications should not assume anything about the contents of files
which were not synchronized before a power-cut has happened. And
"mainstream" file-systems like ext3 do not provide JFSS2-like
guarantees.

However, UBIFS is sometimes used as a JFFS2 replacement and people may
want it to behave the same way as JFFS2 if it is mounted synchronously.
This is doable, but needs some non-trivial development, so this was not
implemented so far. On the other hand, there was no strong demand. You
may implement this as an excercise, or you may try to convince UBIFS
authors to do this.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
