Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUEmw-0005le-0o
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 14:01:23 +0000
From: Jeff Moyer <jmoyer@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
 <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
 <20150824161837.GA28975@localhost>
 <x49si78bo4j.fsf@segfault.boston.devel.redhat.com>
 <20150824234611.GV3902@dastard>
Date: Tue, 25 Aug 2015 10:00:58 -0400
In-Reply-To: <20150824234611.GV3902@dastard> (Dave Chinner's message of "Tue,
 25 Aug 2015 09:46:11 +1000")
Message-ID: <x49wpwjbh7p.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave Chinner <david@fromorbit.com> writes:

> On Mon, Aug 24, 2015 at 01:19:24PM -0400, Jeff Moyer wrote:
>> Brian Norris <computersforpeace@gmail.com> writes:
>> 
>> > On Mon, Aug 24, 2015 at 10:13:25AM +0300, Artem Bityutskiy wrote:
>> >> Now, some user-space fails when direct I/O is not supported.
>> >
>> > I think the whole argument rested on what it means when "some user space
>> > fails"; apparently that "user space" is just a test suite (which
>> > can/should be fixed).
>> 
>> Even if it wasn't a test suite it should still fail.  Either the fs
>> supports O_DIRECT or it doesn't.  Right now, the only way an application
>> can figure this out is to try an open and see if it fails.  Don't break
>> that.
>
> Who cares how a filesystem implements O_DIRECT as long as it does
> not corrupt data? ext3 fell back to buffered IO in many situations,
> yet the only complaints about that were performance. IOWs, it's long been
> true that if the user cares about O_DIRECT *performance* then they
> have to be careful about their choice of filesystem.

> But if it's only 5 lines of code per filesystem to support O_DIRECT
> *correctly* via buffered IO, then exactly why should userspace have
> to jump through hoops to explicitly handle open(O_DIRECT) failure?

> Especially when you consider that all they can do is fall back to
> buffered IO themselves....

I had written counterpoints for all of this, but I thought better of
it.  Old versions of the kernel simply ignore O_DIRECT, so clearly
there's precedent.

I do think we should at least document what file systems appear to be
doing.  Here's a man page patch for open (generated with extra context
for easier reading).  Let me know what you think.

Cheers,
Jeff

p.s. I still think it's the wrong way to go, as it makes it harder for
     an admin to determine what is actually going on.

diff --git a/man2/open.2 b/man2/open.2
index 06c0a29..acc438b 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1471,17 +1471,18 @@ a flag of the same name, but without alignment restrictions.
 .LP
 .B O_DIRECT
 support was added under Linux in kernel version 2.4.10.
 Older Linux kernels simply ignore this flag.
 Some filesystems may not implement the flag and
 .BR open ()
 will fail with
 .B EINVAL
-if it is used.
+if it is used.  Other file systems may implement O_DIRECT via
+buffered I/O, which is essentially the same as ignoring the flag.
 .LP
 Applications should avoid mixing
 .B O_DIRECT
 and normal I/O to the same file,
 and especially to overlapping byte regions in the same file.
 Even when the filesystem correctly handles the coherency issues in
 this situation, overall I/O throughput is likely to be slower than
 using either mode alone.
