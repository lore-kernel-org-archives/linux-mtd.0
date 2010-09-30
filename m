Received: from ipmail07.adl2.internode.on.net ([150.101.137.131])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P16yy-00053Z-Ax
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 00:26:49 +0000
Message-ID: <4CA3D92E.9060109@call-direct.com.au>
Date: Thu, 30 Sep 2010 10:26:22 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Mark Mason <mason@postdiluvian.org>
Subject: Re: Scheduler latency problems when using NAND
References: <20100929221401.GA32583@postdiluvian.org>
In-Reply-To: <20100929221401.GA32583@postdiluvian.org>
Content-Type: text/plain; charset=ISO-8859-1
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

Mark Mason wrote:
> Hi all,
> 
> I hope this is the right place for this question.  I'm having some
> problems with scheduler latency when using UBIFS, and I'm hoping for
> some suggestions.
<snip>
> The application is storing streaming video, almost entirely large
> sequential files, roughly 250K to 15M, to a 1.6G filesystem.  There's
> no seeking or rewriting, just creat, write, close, repeat.  No
> compression is used on the filesystem.
> 
> The problem I'm seeing is excessively large scheduler latency when
> data is flushed to NAND.
<snip>
> Does anyone have any suggestions, ideas, hints, advice, etc?

The Linux block cache is optimised for mechanical hard drives,
to minimise seek times. Some of the assumptions don't make much
sense with FLASH and streaming storage.

Maybe try to flush data whenever you have written a few blocks'
worth. Or have a look at the O_DIRECT flag (or madvise), although
I don't know how it interacts with UBIFS.

Have you considered using a different file system? UBIFS is not
exactly optimised for your use case. JFFS2 would be better, but
won't stomach your flash size.

Especially if you only deal with one stream at a time, you could
create a very simple circular file system yourself. Like JFFS2
without the memory cache.

You could use a real filesystem to store the metadata for your
circular storage partition (file name, length, offset).

Maybe use raw UBI so you don't have to worry about bad blocks.

Either way, the time to erase a block and write a single page
is predictable and you can do it as soon as you get the data.


Best regards,

Iwo
