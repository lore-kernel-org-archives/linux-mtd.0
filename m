Received: from mta6.srv.hcvlny.cv.net ([167.206.5.17])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qxs6-0004cM-VG
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jun 2003 00:22:15 +0100
Received: from asv12.srv.hcvlny.cv.net
 (asv12.srv.hcvlny.cv.net [167.206.5.146]) by mta6.srv.hcvlny.cv.net
 (iPlanet Messaging Server 5.2 HotFix 1.14 (built Mar 18 2003))
 with ESMTP id <0HGG00C7F0XWSY@mta6.srv.hcvlny.cv.net> for
 linux-mtd@lists.infradead.org; Fri, 13 Jun 2003 19:22:44 -0400 (EDT)
Date: Fri, 13 Jun 2003 18:54:00 -0400
From: Frank R Callaghan <f.callaghan@ieee.org>
In-reply-to: <200306140052.38541.tglx@linutronix.de>
To: tglx@linutronix.de
Message-id: <200306131854.00636.f.callaghan@ieee.org>
MIME-version: 1.0
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
 <1055531892.3632.183.camel@passion.cambridge.redhat.com>
 <200306140052.38541.tglx@linutronix.de>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: Please Help, problem mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 13 June 2003 18:52, you wrote:
> On Friday 13 June 2003 21:18, David Woodhouse wrote:
> > On Fri, 2003-06-13 at 19:47, Frank R Callaghan wrote:
> > > OK, this sounds bad !  Where can I go from here ?
> >
> > Well, you can start by just commenting out the whole of both the
> > jffs2_{start,stop}_garbage_collect_thread() functions since the thread
> > is an optimisation anyway. But basically you need to find out why
> > kernel_thread() isn't working.
> >
> > It's not a uclibc bug -- it's a kernel bug, and not one in the standard
> > kernel either -- I'm inclined to suspect RTAI at this stage, although
> > you blatantly have other kernel threads running so it's not a simple and
> > obvious breakage.
>
> Maybe it's a RTAI problem. But I have JFFS2 / RTAI running on a couple of
> boards.
>
> Have you tried this with a vanilla kernel without RTAI ? If not, can you do
> that ?
>
> If RTAI is the guilty one, then consider the following:
> kernel_thread () is a syscall. RTAI captures syscalls. Maybe the syscall is
> lost anywhere in RTAI.

I have two userland processes communicating via shared mem to an rtai_module
also using two rtf's.

what I have found is after loading rtai & starting the programs - attempting 
to mount the jffs2 filesystem stops. When I killed the two processes the mount 
resumed and all works perfectly (killing the proceses forces the unload of the
shared memory & forces the closing of the rtf's)
Starting them backup after mounting sees to work fine !

I guess I can try to isolate it futher by not starting the
 fifo's / shared memory,  unless anyone can suggest a better way to locate
the problem.

TIA,
	Frank.
