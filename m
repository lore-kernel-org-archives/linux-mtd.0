Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZU32s-00078M-Pa
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 01:29:03 +0000
Date: Mon, 24 Aug 2015 21:28:31 -0400
From: Chris Mason <clm@fb.com>
To: Dave Chinner <david@fromorbit.com>
CC: Jeff Moyer <jmoyer@redhat.com>, Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>,
 <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
Message-ID: <20150825012831.GC7176@ret.masoncoding.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
 <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
 <20150824161837.GA28975@localhost>
 <x49si78bo4j.fsf@segfault.boston.devel.redhat.com>
 <20150824234611.GV3902@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20150824234611.GV3902@dastard>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 25, 2015 at 09:46:11AM +1000, Dave Chinner wrote:
> On Mon, Aug 24, 2015 at 01:19:24PM -0400, Jeff Moyer wrote:
> > Brian Norris <computersforpeace@gmail.com> writes:
> > 
> > > On Mon, Aug 24, 2015 at 10:13:25AM +0300, Artem Bityutskiy wrote:
> > >> Now, some user-space fails when direct I/O is not supported.
> > >
> > > I think the whole argument rested on what it means when "some user space
> > > fails"; apparently that "user space" is just a test suite (which
> > > can/should be fixed).
> > 
> > Even if it wasn't a test suite it should still fail.  Either the fs
> > supports O_DIRECT or it doesn't.  Right now, the only way an application
> > can figure this out is to try an open and see if it fails.  Don't break
> > that.
> 
> Who cares how a filesystem implements O_DIRECT as long as it does
> not corrupt data? ext3 fell back to buffered IO in many situations,
> yet the only complaints about that were performance. IOWs, it's long been
> true that if the user cares about O_DIRECT *performance* then they
> have to be careful about their choice of filesystem.
> 
> But if it's only 5 lines of code per filesystem to support O_DIRECT
> *correctly* via buffered IO, then exactly why should userspace have
> to jump through hoops to explicitly handle open(O_DIRECT) failure?
> Especially when you consider that all they can do is fall back to
> buffered IO themselves....

This is what btrfs already does for O_DIRECT plus compressed, or other
cases where people don't want their applications to break on top of new
features that aren't quite compatible with it.

-chris
