Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WiSq-0002pm-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 18:58:52 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4DD0DAE1@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Vipin Malik' <vipin@embeddedlinuxworks.com>,
	"MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 is broken 
Date: Tue, 14 Aug 2001 13:57:04 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

My other program running at the same time is my testcase which fills =
JFFS2
to 80% with various files, deletes them and continue to do on.  The =
Jitter
given by JitterTest is 5 seconds, and my testcase now takes 63 to 65 =
seconds
to complete, compared to 38-43 seconds when it runs alone.  It looks
resonable to me because 2 applications accesses JFFS2 at the same time.

I removed my schedule()'s and I gathered the new erase.c on the MTD =
before
doing my tests.

There is something else that I did and maybe you did'nt.  In my chip =
driver,
I put a "if( current->need_resched ) schedule();" in these fonctions:
atmel_0001_write(), atmel_0001_read() and atmel_0001_erase_varsize(), =
which
are the functions called by mtdblock driver through the mtd_info =
structure.
I put schedule()'s because I though that if an application request a =
write
of 1MB to JFFS2, atmel_0001_write() would not return until that 1MB of =
data
was compressed and written to JFFS2.  Same thing for read and writes.

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Vipin Malik [mailto:vipin@embeddedlinuxworks.com]
Sent: Tuesday, August 14, 2001 1:58 PM
To: Frederic Giasson
Cc: MTD mailing list (E-mail)
Subject: RE: JFFS2 is broken=20


At 01:39 PM 8/14/2001 -0400, Frederic Giasson wrote:
>Good news!
>
>The jitter is now down to 3 seconds.
>In my test I ran JitterTest as a RT task reading I/P from jffs2.
>
>When I run JitterTest with another task running in background which =
writes
>to JFFS2, the jitter is up to 5 seconds.  No more 40 seconds waiting.



But what about this other task _writing_ to JFFS2. How long does it =
block?
Plus is this still your code with liberally sprinkled schedules()?

Vipin




>Fr=E9d=E9ric Giasson
>
>
>
>
>
>-----Original Message-----
>From: Vipin Malik [mailto:vipin@embeddedlinuxworks.com]
>Sent: Monday, August 13, 2001 10:40 PM
>To: David Woodhouse
>Cc: Frederic Giasson; MTD mailing list (E-mail)
>Subject: Re: JFFS2 is broken
>
>
>At 01:00 AM 8/14/2001 +0100, David Woodhouse wrote:
>
> >vipin@embeddedlinuxworks.com said:
> > > David once mentioned that there are some obvious optimizations =
that
> > > can be carried out in the JFFS2 code. Maybe he could list out his
> > > favorite ones  and maybe someone could volunteer to tackle them =
one by
> > > one.
> >
> >I committed the cleanup to jffs2_remove_node_refs_from_ino_list()
>
>Great! Frederic, since you just setup your system to do the jitter =
tests,
>could you pl run them again (with the new code from CVS) and see what
>difference it made (my own system is busy running the mird db power =
fail
>tests).
>
>   Also enable profiling and see what else is on the  "CPU hog" list.
>
>The LTT (Linux Trace Toolkit) seems to be an excellent tool to get =
more
>fine grained performance stats out of the system and
>a new version was just released for 2.4.5 (though it may provide us =
with
>more info that we need/can handle :)
>
>Vipin
