Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPXuu-000283-RG
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 09:31:17 +0000
Subject: Re: UBIFS performance measurements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTikVqjmLiBDq6bdtTcHKwZxlxAVCBg3-WGXMzbmF@mail.gmail.com>
References: <AANLkTikVqjmLiBDq6bdtTcHKwZxlxAVCBg3-WGXMzbmF@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jun 2010 12:28:38 +0300
Message-ID: <1276853318.19028.442.camel@localhost>
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

On Thu, 2010-06-17 at 10:42 +0200, Leo Barnes wrote:
> I have a few questions regarding sequential write speeds in UBIFS and
> how to measure them.

Measurements are always tricky... :-) But I'm happy to help answering
specific UBIFS questions, of course.

> 1. If I want to measure sequential (and later on, random) write speed
> in UBIFS, should I do the writes using the O_SYNC flag or just do a
> fsync after writing? I worry that using the O_SYNC flag will reduce
> the write performance since the file system is meant to be used
> asynchronously and I want my measurements to be as close as possible
> to how the file system is meant to be used.

With O_SYNC you will get a guarantee that when your 'write()' call
returns, every single byte of your buffer will be on the flash media.
Yes, this is slow. This is un-optimal, because UBIFS will waste a lot of
space flushing the write-buffer every time.

With out O_SYNC you will do your writes to the page cache, then when you
call fsync(), UBIFS will flush this all, but this should be faster
because UBIFS will waste less space and pack data nodes nicely to the
write buffer.

It makes sense to measure both. But yes, write all / fsync is closer to
real life.

> 2. If I do not use O_SYNC, will using fflush and fsync guarantee that
> all written data has been written to flash when they return?

Yes.

> 3. If I do not use fflush before fsync, I assume, after reading the
> FAQ, that I am not guaranteed that all data has been written. Is this
> correct?

Yes, because some amount of data is cached in usre-space somewhere in
libc, and was not even sent to the kernel yet. fsync() will just call
the syscall without flushing that buffered data.

> 4. Does the commandline sync command do the same thing as fflush/fsync?

It syncs all (kernel) dirty pages, for all files. fsync synchronize only
one file.

> 5. Does sync/fsync force garbage collection?

No, they do minimum stuff to make sure all data is on the media and
would not lost if you had a power cut just after sync/fsync is done.

>  In other words, if I have
> deleted lots of files from an UBIFS volume, will I be ensured that
> their corresponding eraseblocks will actually be freed if I do a sync?

No. You are guaranteed that these files will never come back only. But
on physical flash level, corresponding PEBs will not necessarily be
erased.

> Any other tips regarding how to perform valid write performance
> measurements on UBIFS would be welcome.

Well, not from me, although I am of course interested to see people
using UBIFS :-) FS testing is always tricky, and the best testing is
using the FS with real-life applications. E.g., if you have some apps
with back-end data-bases, or you have some apps doing intensive I/O,
installing removing packages, etc.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
