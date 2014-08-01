Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDF3q-0002Yn-15
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 15:48:02 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com> <53D9B1A0.8080300@huawei.com>
 <1406813088.20616.32.camel@sauron.fi.intel.com>
 <53DB0081.1040905@huawei.com>
 <1406878239.20616.65.camel@sauron.fi.intel.com>
Date: Fri, 01 Aug 2014 11:35:04 -0400
In-Reply-To: <1406878239.20616.65.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Fri, 01 Aug 2014 10:30:39 +0300")
Message-ID: <87iomcrzo7.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On  1 Aug 2014, dedekind1@gmail.com wrote:

> On Fri, 2014-08-01 at 10:50 +0800, hujianyang wrote:

>> 1) No UBI stuff and read UBIFS stuff from UBI-driver This is a
>> easiest way and we don't need any ioctl either. We can't get
>> UBI-level stuff right now but we can put this into our design of
>> dumping an image file.

> Yes. That's a good first step.

I agree that this is a good way to partition the functionality.

>> 2) Read data from MTD-driver and find a way to get pnum This way is
>> basing on my v2 work. We can put an ioctl() to kernel and if kernel
>> don't support this ioctl(), this tool will do a full-scan on MTD
>> device. It's transparent to user. But we should take some time to
>> consider how to do this full-scan.

> I guess, I'd need to think some more about the ioctl(), and may be
> someone else suggests something.

Isn't this just more work?  The tool will rely on two things?

>> 3) Re-design this tool about dropping UBI driver based dumping.
>> This way is like the exist ubiformat utility. We don't use UBI driver
>> and just do read/write(maybe we can do some repairing later) with MTD
>> device or image files. It's not small.

> Probably, we'll think about this when we are done with 1) and may be
> 2).

Some of these points I don't understand.  The 'ubiformat' already uses
'libscan.c', which have the basics for creating a static 'PEB->LEB'
mapping.  So while I agree that maintaining two version of UBI is not
good, I think we already have this?

UBI has to deal with writing, especially atomic writes, and concurrency.
I don't think the tool needs either, so the 2nd version of UBI is
significantly simpler.  Just look at 'libscan.c' versus
'driver/mtd/ubi/*.c'.

Also, I think a lot of people will have issues where they can not mount
the device and the only thing they can get is the whole 'nanddump';
which won't be done through Linux, but some other means.  Ie, some ROM
boot code (which doesn't understand either UBI or UbiFS) to read out
NAND, a NAND programmer, etc.

Finally, the separate implementation can be good.  Having two versions
of code use the same data structures will often show issues.  If we want
to debug UBI, then using it is not so helpful.  Having the separate
(simpler) implementation with worse performance is exactly the kind of
thing you want for debugging and repair, isn't it?  Features like
'fastmap' are optional and we should fall back to a linear scan.  I
think that future UBI changes will strive to be backwards compatible
unless there is some really good reason not to be?

The big advantage of doing everything outside the kernel is we can
eventually add lots of extra consistency checks that you would never
want to do in a running file system.  Ie, verify a linear scan and the
fastmap are consistent, etc.

My intent is never to make work for anyone.  Adding a patch to libscan.c
seems easy to me.

 1. Allocate a 'pmap' array and a temporary 'sequence' array.
 2. Initialize 'pmap' to -1.
 3a. For each valid 'eb', get 'lnum' and 'sqnum' from vid header.
  b. if (pmap[lnum] == -1 || sequence[lnum] < sqnum)
      pmap[lnum] = eb, sequence[lnum] = sqnum;

but maybe I don't understand all the complexities.  Isn't it that
simple?

Now if we want to use the tool on live volumes, 'libscan.c' will not
work for that.  I thought that the concepts of a debugger may apply.  It
can look at a core file, or a paused processes memory.  But maybe it is
crazy to 'pause' Ubi/UbiFs.  Someone might want such 'snapshots' to
examine the evolution of storage or some race issues... but I guess that
is not the main reason of using the ioctl().

Fwiw,
Bill Pringlemeir.
