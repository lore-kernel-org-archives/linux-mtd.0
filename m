Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Uy77-0002t1-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2001 23:17:13 +0100
Message-Id: <5.1.0.14.0.20010809172521.00a683d8@mail.spewey.com>
Date: Thu, 09 Aug 2001 17:36:20 -0500
To: "A. Craig West" <acwest-jffs@mail.bdkw.yi.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: JFFS2 is broken
Cc: David Woodhouse <dwmw2@infradead.org>,jffs-dev <jffs-dev@axis.com>,
 MTD for Linux <linux-mtd@lists.infradead.org>,
 elw_dev_list@embeddedlinuxworks.com
In-Reply-To: <Pine.LNX.4.10.10108091255370.12113-100000@gizmo.bdkw>
References: <3B3BC857.7FB81774@daniel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Yes,

As it stands right now, a task (not reading/writing to JFFS2) marked POSIX 
real time (via the set_sched(2) calls), is blocked for ~50ms on my 133MHz 
486 DX4 while another _non posix_ task is writing to JFFS2.

The blocking time is highly processor performance dependent.

However, any task writing to JFFS2 _can_ be blocked upto 10's of seconds 
(in my test case >40 seconds).
This happens when there is no more free space left on the JFFS2 fs and 
garbage collect needs to be done to make space for the write.

If a POSIX task is writing to JFFS2, then that AND ALL OTHER tasks will get 
blocked as the POSIX task has priority and the GC is done in the context of 
the writing task.

So the moral of the story is that at the very least do not write to JFFS2 
from a POSIX real time task under Linux.

I really haven't done any tests re. blocking times of a _regular_ task not 
writing to JFFS2, when there is another _regular_ task writing to JFFS2.

That should be easy to setup and run with my jitter test program. At this 
time I haven't released that program under GPL, but I have permission from 
my company to release it, so if anyone wants it just ask and I'll send it 
to you/put it in th mtd CVS rep.

Re. why it takes that long for GC to happen on a full JFFS2 fs? David had 
some thoughts that a particular singly linked list should be doubly linked- 
which would help quite a lot. David?

Vipin
P.S. There's been lots of traffic on the MTD list. Are you referring to the 
JFFS list?


At 01:00 PM 8/9/2001 -0400, A. Craig West wrote:
>Is there any more word on this problem? I'm planning on porting jffs2 to the
>Agenda VR3, but have been holding off for a resolution of this issue...
>By the way, has anybody else noticed that there has been no traffic on 
>this list
>in at least a week?
>
>On Thu, 28 Jun 2001, Vipin Malik wrote:
>
> > For all practical purposes, JFFS2, in its present form, IMHO,  is
> > broken.
> >
> > I've been doing a lot of "jitter" or "blocking" time testing for various
> > tasks running on a system where there is JFFS2 activity going on (info
> > for those that have not been following my posts).
>-Snipped, but boils down to kernel blocks for up to 30 seconds-
>
>--
>Craig West         Ph: (416) 213-0300   |  It's not a bug,
>acwest-sig@mail.bdkw.yi.org             |  It's a feature...
